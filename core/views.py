import logging
from datetime import datetime, date
from django.views.generic import TemplateView, CreateView, DeleteView, UpdateView
from django.urls import reverse_lazy
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.utils.timezone import make_aware
from core.forms import LoginForm, LeitorModelForm, AgendamentoForm
from core.models import Emprestimo, Leitor, Livro, Agendamento

# Configura o logger
logger = logging.getLogger(__name__)

# Página principal - Home
def home_view(request):
    return render(request, 'home.html')

# Página adicional renomeada - AppGaroca
class AppGarocaView(TemplateView):
    template_name = 'appgaroca.html'

# Visualizações relacionadas ao Leitor
class LeitorListView(TemplateView):
    template_name = 'leitor-list.html'

class LeitorCreateView(CreateView):
    model = Leitor
    form_class = LeitorModelForm
    template_name = 'leitor.html'
    success_url = reverse_lazy('leitor-list')

class LeitorUpdateView(UpdateView):
    model = Leitor
    form_class = LeitorModelForm
    template_name = 'leitor.html'
    success_url = reverse_lazy('leitor-list')

class LeitorDeleteView(DeleteView):
    model = Leitor
    template_name = 'leitor_confirm_delete.html'
    success_url = reverse_lazy('leitor-list')

# Visualizações relacionadas ao Livro
class LivroListView(TemplateView):
    template_name = 'livro-list.html'
    context_object_name = 'livros'

class LivroCreateView(CreateView):
    model = Livro
    fields = ['codigo', 'nome', 'categoria', 'autor']
    template_name = 'livro.html'
    success_url = reverse_lazy('livro-list')

class LivroUpdateView(UpdateView):
    model = Livro
    fields = ['codigo', 'nome', 'categoria', 'autor']
    template_name = 'livro.html'
    success_url = reverse_lazy('livro-list')

class LivroDeleteView(DeleteView):
    model = Livro
    template_name = 'livro_confirm_delete.html'
    success_url = reverse_lazy('livro-list')

# Visualizações relacionadas ao Emprestimo
class EmprestimoListView(TemplateView):
    template_name = 'emprestimo-list.html'

class EmprestimoCreateView(CreateView):
    model = Emprestimo
    fields = ['livro', 'devolucao']
    template_name = 'emprestimo.html'
    success_url = reverse_lazy('emprestimo-list')

    def form_valid(self, form):
        devolucao = form.cleaned_data['devolucao']
        if isinstance(devolucao, date) and not isinstance(devolucao, datetime):
            form.instance.devolucao = make_aware(datetime.combine(devolucao, datetime.min.time()))
        return super().form_valid(form)

# Visualização de reservas
@login_required
def reservas_view(request):
    reservas = Emprestimo.objects.filter(leitor=request.user.leitor)
    return render(request, 'reservas.html', {'reservas': reservas})

# Listagem de livros
def livros_view(request):
    livros = Livro.objects.all()
    return render(request, 'livros.html', {'livros': livros})

# Função de registro de novo leitor
def register(request):
    if request.method == 'POST':
        form = LeitorModelForm(request.POST)
        if form.is_valid():
            leitor = form.save(commit=False)
            leitor.telefone = 'Desconhecido'
            leitor.set_password(form.cleaned_data['password'])
            leitor.save()
            login(request, leitor)
            return redirect('home')
    else:
        form = LeitorModelForm()
    return render(request, 'register.html', {'form': form})

# Função de login
def login_view(request):
    form = LoginForm(request.POST or None)
    if request.method == "POST" and form.is_valid():
        email = form.cleaned_data['email']
        password = form.cleaned_data['password']
        user = authenticate(request, email=email, password=password)
        if user is not None:
            login(request, user)
            return redirect('meu_perfil')  # Alterado para redirecionar para meu_perfil
        else:
            messages.error(request, "Credenciais inválidas.")
    
    response = render(request, 'login.html', {'form': form})
    response['Cache-Control'] = 'no-store, no-cache, must-revalidate, proxy-revalidate'
    return response

# Função para exibir perfil do usuário logado
@login_required
def meu_perfil_view(request):
    try:
        leitor = get_object_or_404(Leitor, email=request.user.email)
        return render(request, 'meu_perfil.html', {'leitor': leitor})  # Alterado para usar meu_perfil.html
    except Exception as e:
        logger.error(f"Erro ao carregar o perfil: {str(e)}")
        return render(request, 'erro.html', {'mensagem': 'Erro ao carregar o perfil.'})

# Função para editar perfil
@login_required
def editar_perfil_view(request):
    leitor = get_object_or_404(Leitor, email=request.user.email)
    if request.method == 'POST':
        form = LeitorModelForm(request.POST, request.FILES, instance=leitor)
        if form.is_valid():
            form.save()
            messages.success(request, 'Perfil atualizado com sucesso!')
            return redirect('meu_perfil')  # Alterado para redirecionar para meu_perfil
    else:
        form = LeitorModelForm(instance=leitor)
    return render(request, 'editar_perfil.html', {'form': form})

# API para retornar dados do leitor
@login_required
def api_leitor(request):
    try:
        leitor = get_object_or_404(Leitor, email=request.user.email)
        dados_leitor = {
            'nome': leitor.nome,
            'email': leitor.email,
            'telefone': leitor.telefone,
            'foto': leitor.foto.url if leitor.foto else '/static/images/default-profile.png'
        }
        return JsonResponse(dados_leitor)
    except Exception as e:
        logger.error(f"Erro ao retornar dados do leitor: {str(e)}")
        return JsonResponse({'error': 'Erro ao recuperar dados.'}, status=500)

# Função para agendar retirada de livros
@login_required
def agendar_retirada(request):
    livros_list = Livro.objects.filter(status=True)
    if request.method == 'POST':
        form = AgendamentoForm(request.POST)
        if form.is_valid():
            livro_selecionado = form.cleaned_data['livro']
            if livro_selecionado.status:
                agendamento = form.save(commit=False)
                agendamento.leitor = request.user
                agendamento.save()
                livro_selecionado.status = False
                livro_selecionado.save()
                return redirect('perfil')  # Alterado para redirecionar para meu_perfil
            else:
                form.add_error('livro', 'Este livro já foi reservado.')
    else:
        form = AgendamentoForm()
    return render(request, 'agendar_retirada.html', {'form': form, 'livros_list': livros_list})

# Função de sucesso ao agendar retirada
def success(request):
    return render(request, 'success.html')
