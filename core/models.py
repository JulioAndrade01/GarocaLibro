from django.db import models

#Todas as classes vão herdar a classe base
class Base(models.Model):
    criado = models.DateField('Data de Criação', auto_now_add=True)
    modificado = models.DateField('Data de Atualização', auto_now=True)
    ativo = models.BooleanField('Ativo?', default = True)

    class Meta:
        abstract = True


class Categoria(Base):
    nome = models.CharField('Nome', max_length = 30)

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'

    def __str__(self):
        return self.nome 


class Livro(Base):
    STATUS_CHOICE = (
        (True, 'Disponível'),
        (False, 'Indisponível')
    )

    codigo = models.CharField('Codigo', max_length=15, unique=True)
    nome = models.CharField('Nome', max_length=100)
    autor = models.CharField('Autor', max_length=100, default='Desconhecido')
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, default='Geral')
    status = models.BooleanField('Status', default=True, max_length=12, choices=STATUS_CHOICE)

    class Meta:
        verbose_name = 'Livro'
        verbose_name_plural = 'Livros'

    def __str__(self):
        return self.nome


class Leitor(Base):
    STATUS_CHOICE = (
        (True, 'Desbloqueado'),
        (False, 'Bloqueado')
    )

    nome = models.CharField('Nome', max_length=50)
    telefone = models.CharField('Telefone', max_length=13, help_text="Por favor use o seguinte formato: <em>XX XXXXX-XXXX</em>.")
    email = models.EmailField('Email', max_length=50)
    status = models.BooleanField('Status', default=True, max_length=12, choices=STATUS_CHOICE)

    class Meta:
        verbose_name = 'Leitor'
        verbose_name_plural = 'Leitores'

    def __str__(self):
        return self.nome


class Emprestimo(Base):
    STATUS_CHOICE = (
        (True, 'Em andamento'),
        (False, 'Finalizado')
    )

    leitor = models.ForeignKey(Leitor, on_delete=models.CASCADE)
    livro = models.ForeignKey(Livro, on_delete=models.CASCADE)
    devolucao = models.DateField('Data de devolução', help_text="Selecione uma data posterior a atual")
    status = models.BooleanField('Status', default=True, max_length=12, choices=STATUS_CHOICE)

    class Meta:
        verbose_name = 'Empréstimo'
        verbose_name_plural = 'Empréstimos'

    def __str__(self):
        return f'{self.leitor} | {self.livro}'
