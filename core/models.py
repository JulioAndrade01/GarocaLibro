from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.forms import ValidationError
from datetime import datetime

# Classe base que será herdada
class Base(models.Model):
    criado = models.DateTimeField('Data de Criação', auto_now_add=True)
    modificado = models.DateTimeField('Data de Atualização', auto_now=True)
    ativo = models.BooleanField('Ativo?', default=True)

    class Meta:
        abstract = True


# Gerenciador de Leitores
class LeitorManager(BaseUserManager):
    """Gerenciador de Leitores."""

    def create_user(self, email, password=None, **extra_fields):
        """Cria e retorna um leitor com um email e senha."""
        if not email:
            raise ValueError('O email deve ser fornecido')
        email = self.normalize_email(email)
        leitor = self.model(email=email, **extra_fields)
        leitor.set_password(password)  # Armazena a senha de forma segura
        leitor.save(using=self._db)
        return leitor

    def create_superuser(self, email, password=None, **extra_fields):
        """Cria e retorna um superusuário com um email e senha."""
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(email, password, **extra_fields)


# Classe Categoria
class Categoria(Base):
    nome = models.CharField('Nome', max_length=30)

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'

    def __str__(self):
        return self.nome


# Classe Livro
class Livro(Base):
    STATUS_CHOICE = (
        (True, 'Disponível'),
        (False, 'Indisponível')
    )

    codigo = models.CharField('Código', max_length=15, unique=True)
    nome = models.CharField('Nome', max_length=100)
    autor = models.CharField('Autor', max_length=100, default='Desconhecido')
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    status = models.BooleanField('Status', choices=STATUS_CHOICE, default=True)

    class Meta:
        verbose_name = 'Livro'
        verbose_name_plural = 'Livros'

    def __str__(self):
        return self.nome


# Classe Leitor
class Leitor(AbstractBaseUser, Base):
    """Modelo de Leitor."""
    nome = models.CharField('Nome', max_length=50)
    telefone = models.CharField('Telefone', max_length=13)
    email = models.EmailField('Email', max_length=50, unique=True)
    endereco = models.CharField('Endereço', max_length=255, blank=True, null=True)
    foto_perfil = models.ImageField('Foto de Perfil', upload_to='perfil/', blank=True, null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nome']  # Campos obrigatórios na criação de usuários

    objects = LeitorManager()

    class Meta:
        verbose_name = 'Leitor'
        verbose_name_plural = 'Leitores'

    def __str__(self):
        return self.nome


# Classe Emprestimo
class Emprestimo(Base):
    STATUS_CHOICE = (
        ('in_progress', 'Em andamento'),
        ('completed', 'Finalizado')
    )

    devolucao = models.DateTimeField('Data de devolução', help_text="Selecione uma data e hora posterior à atual")
    status = models.CharField('Status', max_length=20, choices=STATUS_CHOICE, default='in_progress')
    leitor = models.ForeignKey(Leitor, on_delete=models.CASCADE)
    livro = models.ForeignKey(Livro, on_delete=models.CASCADE)

    def clean(self):
        if isinstance(self.devolucao, datetime) and self.devolucao <= timezone.now():
            raise ValidationError('A data de devolução deve ser uma data futura.')

    class Meta:
        verbose_name = 'Empréstimo'
        verbose_name_plural = 'Empréstimos'

    def __str__(self):
        return f'{self.leitor} | {self.livro}'
