from django import forms
from core.models import Categoria, Leitor, Livro, Emprestimo

class CategoriaModelForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nome']


class LeitorModelForm(forms.ModelForm):
    class Meta:
        model = Leitor
        fields = ('nome', 'telefone', 'email')

    widgets = {
        'nome' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'telefone' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'email' : forms.TextInput(attrs = {'class' : 'form-label'}),
    }

class LivroModelForm(forms.ModelForm):
    class Meta:
        model = Livro
        fields = ('codigo', 'nome', 'categoria', 'autor')
    widgets = {
        'codigo' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'nome' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'categoria' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'autor' : forms.TextInput(attrs = {'class' : 'form-label'}),
    }


class EmprestimoModelForm(forms.ModelForm):
    class Meta:
        model = Emprestimo
        fields = ('leitor', 'livro', 'devolucao',)
    widgets = {
        'leitor' : forms.TextInput(attrs = {'class' : 'form-label'}), 
        'livro' : forms.TextInput(attrs = {'class' : 'form-label'}),
    }
