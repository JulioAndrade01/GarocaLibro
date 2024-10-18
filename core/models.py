from django.db import models
from django.utils import timezone
from django.forms import ValidationError
from datetime import datetime
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin


# Classe Base
class Base(models.Model):
    criado = models.DateTimeField('Data de Criação', auto_now_add=True)
    modificado = models.DateTimeField('Data de Atualização', auto_now=True)
    ativo = models.BooleanField('Ativo?', default=True)

    class Meta:
        abstract = True


# Classe LeitorManager (Gerenciador de Leitores)
class LeitorManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('O email deve ser fornecido')
        email = self.normalize_email(email)
        leitor = self.model(email=email, **extra_fields)
        leitor.set_password(password)
        leitor.save(using=self._db)
        return leitor

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)


class Leitor(AbstractBaseUser, PermissionsMixin):
    nome = models.CharField('Nome', max_length=50)
    telefone = models.CharField('Telefone', max_length=13)
    email = models.EmailField('Email', max_length=50, unique=True)
    endereco = models.CharField('Endereço', max_length=255, blank=True, null=True)
    foto_perfil = models.ImageField('Foto de Perfil', upload_to='perfil/', blank=True, null=True)

    # Campos de controle de acesso
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    ativo = models.BooleanField(default=True)  # Campo para ativo/inativo
    criado = models.DateTimeField(auto_now_add=True)  # Data de criação
    modificado = models.DateTimeField(auto_now=True)  # Data de modificação

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nome']

    objects = LeitorManager()  # Assegure-se de que você tenha um gerenciador definido

    def has_perm(self, perm, obj=None):
        """Retorna True se o usuário tiver a permissão especificada."""
        return self.is_superuser  # Ou implemente sua lógica de permissões

    def has_module_perms(self, app_label):
        """Retorna True se o usuário tiver permissão para ver o app."""
        return self.is_superuser  # Ou implemente sua lógica de permissões


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


# Classe Emprestimo (agora após a definição de Leitor e Livro)
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


# Classe Agendamento de Retirada
class Agendamento(Base):
    STATUS_CHOICE = (
        ('scheduled', 'Agendado'),
        ('completed', 'Finalizado')
    )

    leitor = models.ForeignKey(Leitor, on_delete=models.CASCADE)
    livro = models.ForeignKey(Livro, on_delete=models.CASCADE)
    data_retirada = models.DateTimeField('Data de Retirada', help_text="Escolha uma data e hora futuras")
    status = models.CharField('Status', max_length=20, choices=STATUS_CHOICE, default='scheduled')

    def clean(self):
        # Verifica se a data de retirada é futura
        if isinstance(self.data_retirada, datetime) and self.data_retirada <= timezone.now():
            raise ValidationError('A data de retirada deve ser uma data futura.')

    class Meta:
        verbose_name = 'Agendamento de Retirada'
        verbose_name_plural = 'Agendamentos de Retirada'

    def __str__(self):
        return f'{self.leitor.nome} | {self.livro.nome} | {self.data_retirada}'
