#Utilizando Class Based Views

from django.views.generic import TemplateView
from core.forms import LeitorModelForm
from django.urls import reverse_lazy
#from django.contrib import messages
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from core.models import Emprestimo, Leitor, Livro

class IndexView(TemplateView):
    template_name = 'index.html'

'''
View para objeto Leitor
'''
class LeitorListView(TemplateView):
    template_name = 'leitor-list.html'

class LeitorCreateView(CreateView):
    model = Leitor
    fields = ['nome', 'telefone', 'email']
    template_name = 'leitor.html'
    success_url = '/leitor-list/'

class LeitorUpdateView(UpdateView):
    model = Leitor
    fields = ['nome', 'telefone', 'email']

class LeitorDeleteView(DeleteView):
    model = Leitor
    fields = ['nome', 'telefone', 'email']
    success_url = '/leitor-list/'

'''
View para objeto Livro
'''
class LivroListView(TemplateView):
    template_name = 'livro-list.html'

class LivroCreateView(CreateView):
    model = Livro
    fields = ['codigo', 'nome', 'categoria', 'autor']
    template_name = 'livro.html'
    success_url = '/livro-list/'

class LivroUpdateView(UpdateView):
    model = Livro
    fields = ['codigo', 'nome', 'categoria', 'autor']
    template_name = 'livro.html'
    success_url = '/livro-list/'

class LivroDeleteView(DeleteView):
    model = Livro
    fields = ['codigo', 'nome', 'categoria', 'autor']
    template_name = 'livro.html'
    success_url = '/livro-list/'

'''
View para objeto Livro
'''
class EmprestimoListView(TemplateView):
    template_name = 'emprestimo-list.html'

class EmprestimoCreateView(CreateView):
    model = Emprestimo
    fields = ['leitor', 'livro', 'devolucao']
    template_name = 'emprestimo.html'
    success_url = '/emprestimo-list/'
