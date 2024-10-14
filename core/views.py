# core/views.py

import logging
from django.views.generic import TemplateView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.urls import reverse_lazy
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import  authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from core.forms import LoginForm, LeitorModelForm
from core.models import Emprestimo, Leitor, Livro
from django.utils import timezone
from datetime import datetime, date
from django.db import IntegrityError
from django.utils.timezone import make_aware
from django.http import JsonResponse


class IndexView(TemplateView):
    template_name = 'index.html'


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


class LivroListView(TemplateView):
    template_name = 'livro-list.html'


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
            form.instance.devolucao = make_aware(datetime.combine(
                devolucao,
                datetime.min.time()
            ))
        return super().form_valid(form)


# Adicionando a função livros_view
def livros_view(request):
    livros = Livro.objects.all()  # Obtendo todos os livros do banco de dados
    return render(request, 'livros.html', {'livros': livros})  # Certifique-se de ter um template chamado 'livros.html'

def register(request):
    if request.method == 'POST':
        form = LeitorModelForm(request.POST)
        if form.is_valid():
            leitor = form.save(commit=False)
            leitor.telefone = 'Desconhecido'  # Defina um telefone padrão, se necessário
            leitor.set_password(form.cleaned_data['password'])  # Salve a senha de forma segura
            leitor.save()
            login(request, leitor.user)  # Login após registro
            return redirect('home')  # Altere 'home' para a URL desejada após o registro
    else:
        form = LeitorModelForm()
    return render(request, 'register.html', {'form': form})


def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            leitor = authenticate(request, email=email, password=password)  # Use authenticate

            if leitor is not None:
                login(request, leitor)  # Logar o leitor
                return redirect('perfil')  # Redirecionar para a página de perfil
            else:
                messages.error(request, "Email ou senha inválidos.")

    else:
        form = LoginForm()
    
    return render(request, 'login.html', {'form': form})


@login_required
def perfil_view(request):
    try:
        leitor = get_object_or_404(Leitor, email=request.user.email)
        return render(request, 'perfil.html', {'leitor': leitor})
    except Exception as e:
        logging.error(f"Erro ao carregar o perfil: {str(e)}")
        return render(request, 'erro.html', {'mensagem': 'Erro ao carregar o perfil.'})


@login_required
def editar_perfil_view(request):
    leitor = get_object_or_404(Leitor, email=request.user.email)
    if request.method == 'POST':
        form = LeitorModelForm(request.POST, request.FILES, instance=leitor)
        if form.is_valid():
            form.save()
            messages.success(request, 'Perfil atualizado com sucesso!')
            return redirect('perfil')
    else:
        form = LeitorModelForm(instance=leitor)
    return render(request, 'editar_perfil.html', {'form': form})


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
        logging.error(f"Erro ao retornar dados do leitor: {str(e)}")
        return JsonResponse({'error': 'Erro ao recuperar dados.'}, status=500)

def reservas_view(request):
    return render(request, 'reservas.html') 