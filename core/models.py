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
        email = self.model.normalize_email(email)  # O normalize_email já é feito aqui
        leitor = self.model(email=email, **extra_fields)
        leitor.set_password(password)
        leitor.save(using=self._db)
        return leitor

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser precisa ter is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser precisa ter is_superuser=True.')

        return self.create_user(email, password, **extra_fields)


class Leitor(Base, AbstractBaseUser, PermissionsMixin):
    nome = models.CharField('Nome', max_length=50)
    telefone = models.CharField('Telefone', max_length=15)  # Ajuste o tamanho conforme necessário
    email = models.EmailField('Email', max_length=50, unique=True)
    endereco = models.CharField('Endereço', max_length=255, blank=True, null=True)
    foto_perfil = models.ImageField('Foto de Perfil', upload_to='perfil/', blank=True, null=True)

    # Campos de controle de acesso
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nome']

    objects = LeitorManager()

    @classmethod
    def normalize_email(cls, email):
        """
        Normalize the email address by lowercasing the domain part of it.
        """
        email = email or ""
        try:
            email_name, domain_part = email.strip().rsplit("@", 1)
        except ValueError:
            pass
        else:
            email = email_name.lower() + "@" + domain_part.lower()
        return email

    def has_perm(self, perm, obj=None):
        return self.is_superuser

    def has_module_perms(self, app_label):
        return self.is_superuser

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
    capa = models.ImageField('Capa do Livro', upload_to='livros/capas/', null=True, blank=True)

    class Meta:
        verbose_name = 'Livro'
        verbose_name_plural = 'Livros'

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
        if self.devolucao <= timezone.now():
            raise ValidationError('A data de devolução deve ser uma data futura.')

    def save(self, *args, **kwargs):
        self.full_clean()  # Garante que a validação seja aplicada ao salvar
        super().save(*args, **kwargs)

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
        if self.data_retirada <= timezone.now():
            raise ValidationError('A data de retirada deve ser uma data futura.')

    def save(self, *args, **kwargs):
        self.full_clean()  # Garante que a validação seja aplicada ao salvar
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Agendamento de Retirada'
        verbose_name_plural = 'Agendamentos de Retirada'

    def __str__(self):
        return f'{self.leitor.nome} | {self.livro.nome} | {self.data_retirada}'
