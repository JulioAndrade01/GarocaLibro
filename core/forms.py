from django import forms
from django.contrib.auth.hashers import make_password
from .models import Categoria, Leitor, Livro, Emprestimo, Agendamento
from .admin import LeitorAdmin


class CategoriaModelForm(forms.ModelForm):
    """Formulário para criar ou editar uma Categoria."""
    
    class Meta:
        model = Categoria
        fields = ['nome']
        widgets = {
            'nome': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Nome da Categoria'
            }),
        }

class LeitorModelForm(forms.ModelForm):
    """Formulário para criar ou editar um Leitor."""
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Senha'
        }),
        required=True
    )
    
    class Meta:
        model = Leitor
        fields = ['nome', 'telefone', 'email', 'password']  # Adicionando 'password'
        widgets = {
            'nome': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Nome do Leitor'
            }),
            'telefone': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Telefone do Leitor'
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'Email do Leitor'
            }),
        }

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if not email:
            raise forms.ValidationError("Este campo é obrigatório.")
        if not isinstance(email, str) or email.strip() == '':
            raise forms.ValidationError("O email não pode ser vazio.")
        if Leitor.objects.filter(email=email).exists():
            raise forms.ValidationError("Este email já está cadastrado.")
        return email

    def save(self, commit=True):
        leitor = super().save(commit=False)
        leitor.set_password(self.cleaned_data['password'])  # Armazenar a senha de forma segura
        if commit:
            leitor.save()
        return leitor

class LivroModelForm(forms.ModelForm):
    """Formulário para criar ou editar um Livro."""
    
    class Meta:
        model = Livro
        fields = ['codigo', 'nome', 'categoria', 'autor']
        widgets = {
            'codigo': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Código do Livro'
            }),
            'nome': forms.TextInput(attrs={
         
                'class': 'form-control',
                'placeholder': 'Nome do Livro'
            }),
            'categoria': forms.Select(attrs={
                'class': 'form-control'
            }),
            'autor': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Autor do Livro'
            }),
        }

class EmprestimoModelForm(forms.ModelForm):
    """Formulário para criar ou editar um Empréstimo."""
    
    class Meta:
        model = Emprestimo
        fields = ['leitor', 'livro', 'devolucao']
        widgets = {
            'leitor': forms.Select(attrs={
                'class': 'form-control'
            }),
            'livro': forms.Select(attrs={
                'class': 'form-control'
            }),
            'devolucao': forms.DateTimeInput(attrs={
                'class': 'form-control',
                'placeholder': 'Data e Hora de Devolução',
                'type': 'datetime-local'  # Suporte para data e hora
            }),
        }

class LoginForm(forms.Form):
    email = forms.EmailField(
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'placeholder': 'Email'
        })
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Senha'
        })
    )

class AgendamentoForm(forms.ModelForm):
    class Meta:
        model = Agendamento
        fields = ['livro', 'data_retirada']
        widgets = {
            'livro': forms.Select(attrs={'class': 'form-control'}),
            'data_retirada': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)