from django.contrib import admin
from django import forms
from django.urls import reverse
from django.utils.html import format_html
from django.db import models
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from .models import Categoria, Leitor, Livro, Emprestimo, Agendamento, Noticia


# =====================================================
# 🔹 FORMULÁRIOS PERSONALIZADOS DO LEITOR
# =====================================================

class LeitorAdminForm(forms.ModelForm):
    """Formulário usado ao editar leitores no Django Admin."""
    password = ReadOnlyPasswordHashField(
        label="Senha",
        help_text="As senhas não são armazenadas em texto puro. "
                  "Use <a href='../password/'>este formulário</a> para alterá-la."
    )

    class Meta:
        model = Leitor
        fields = ('email', 'nome', 'telefone', 'bairro', 'endereco', 'foto_perfil', 'is_staff', 'is_superuser', 'ativo')

    def clean_password(self):
        """Mantém a senha existente ao editar."""
        return self.initial.get("password")


class LeitorCreationForm(forms.ModelForm):
    """Formulário usado ao criar novos leitores no Admin."""
    password1 = forms.CharField(label="Senha", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Confirmação de Senha", widget=forms.PasswordInput)

    class Meta:
        model = Leitor
        fields = ('email', 'nome', 'telefone', 'bairro', 'endereco', 'foto_perfil')

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("As senhas não conferem.")
        return password2

    def save(self, commit=True):
        leitor = super().save(commit=False)
        leitor.set_password(self.cleaned_data["password1"])
        if commit:
            leitor.save()
        return leitor


# =====================================================
# 🔹 CATEGORIA
# =====================================================
@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nome', 'criado', 'modificado', 'ativo')
    search_fields = ('nome',)
    list_filter = ('ativo',)
    ordering = ('nome',)


# =====================================================
# 🔹 LEITOR (AGORA EDITÁVEL NO ADMIN)
# =====================================================
@admin.register(Leitor)
class LeitorAdmin(admin.ModelAdmin):
    form = LeitorAdminForm
    add_form = LeitorCreationForm

    list_display = ('id', 'foto_preview', 'nome', 'email', 'telefone', 'cpf', 'bairro', 'criado', 'ativo')
    search_fields = ('nome', 'email', 'bairro')
    list_filter = ('ativo', 'bairro', 'is_staff', 'is_superuser')
    ordering = ('nome',)
    readonly_fields = ('criado', 'modificado')
    actions = ['editar_leitores'] 

    fieldsets = (
        ('📘 Informações Pessoais', {
            'fields': ('nome', 'email', 'telefone', 'bairro', 'endereco', 'foto_perfil', 'password')
        }),
        ('🔐 Permissões e Acesso', {
            'fields': ('is_staff', 'is_superuser', 'groups', 'user_permissions', 'ativo')
        }),
        ('📅 Controle', {
            'fields': ('criado', 'modificado')
        }),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'nome', 'telefone', 'bairro', 'endereco', 'foto_perfil', 'password1', 'password2'),
        }),
    )

    def foto_preview(self, obj):
      """Exibe uma miniatura da foto de perfil ou padrão."""
      return format_html(
        '<img src="{}" width="40" height="40" style="border-radius:50%;">',
        obj.foto_url
    )
      foto_preview.short_description = "Foto"
    # =====================================================
    # 🔹 AÇÃO PERSONALIZADA: EDITAR LEITORES SELECIONADOS
    # =====================================================
    @admin.action(description="✏️ Editar leitores selecionados")
    def editar_leitores(self, request, queryset):
        """Permite editar rapidamente um leitor da lista."""
        from django.shortcuts import redirect
        if queryset.count() == 1:
            leitor = queryset.first()
            return redirect(f"/admin/core/leitor/{leitor.id}/change/")
        else:
            self.message_user(request, "Selecione apenas um leitor por vez para edição.", level='warning')


# =====================================================
# 🔹 LIVRO (com campo de capa e miniatura)
# =====================================================
@admin.register(Livro)
class LivroAdmin(admin.ModelAdmin):
    list_display = ('codigo', 'nome', 'categoria', 'autor', 'status', 'exibir_capa', 'criado', 'ativo')
    search_fields = ('nome', 'autor', 'codigo', 'isbn')
    list_filter = ('status', 'categoria')
    ordering = ('nome',)
    readonly_fields = ('criado', 'modificado')
    actions = ['editar_livros']  

    fieldsets = (
        ('📘 Informações Básicas', {
            'fields': ('codigo', 'nome', 'autor', 'categoria', 'isbn', 'ano_publicacao', 'capa')
        }),
        ('📖 Status', {
            'fields': ('status',)
        }),
        ('📅 Controle', {
            'fields': ('criado', 'modificado')
        }),
    )

    def exibir_capa(self, obj):
     """Mostra miniatura da capa (ou padrão se não existir)."""
     return format_html(
        '<img src="{}" width="45" height="60" style="border-radius:5px; object-fit:cover;">',
        obj.capa_url
    )
     exibir_capa.short_description = "Capa"


    # =====================================================
    # 🔹 AÇÃO PERSONALIZADA: EDITAR LIVROS SELECIONADOS
    # =====================================================
    @admin.action(description="✏️ Editar livros selecionados")
    def editar_livros(self, request, queryset):
        """Permite editar rapidamente um livro selecionado."""
        from django.shortcuts import redirect
        if queryset.count() == 1:
            livro = queryset.first()
            return redirect(f"/admin/core/livro/{livro.id}/change/")
        else:
            self.message_user(request, "Selecione apenas um livro por vez para edição.", level='warning')


# =====================================================
# 🔹 EMPRÉSTIMO
# =====================================================
@admin.register(Emprestimo)
class EmprestimoAdmin(admin.ModelAdmin):
    list_display = ('leitor', 'livro', 'devolucao', 'status', 'criado', 'ativo')
    search_fields = ('livro__nome', 'leitor__nome')
    list_filter = ('status', 'criado')
    ordering = ('-criado',)


# =====================================================
# 🔹 AGENDAMENTO
# =====================================================
@admin.register(Agendamento)
class AgendamentoAdmin(admin.ModelAdmin):
    list_display = ('leitor', 'livro', 'data_retirada', 'status', 'criado', 'ativo')
    search_fields = ('leitor__nome', 'livro__nome')
    list_filter = ('status',)
    ordering = ('-data_retirada',)


# =====================================================
# 🔹 MODELO FICTÍCIO: PAINEL ANALÍTICO
# =====================================================
class PainelAnalitico(models.Model):
    """Modelo simbólico para exibir atalhos de dashboards no Django Admin."""

    class Meta:
        managed = False
        app_label = 'core'
        verbose_name = "📈 Painel Analítico"
        verbose_name_plural = "📈 Painéis Analíticos"

    def __str__(self):
        return "Painel Analítico"


# =====================================================
# 🔹 ADMIN PERSONALIZADO DO PAINEL ANALÍTICO
# =====================================================
@admin.register(PainelAnalitico)
class PainelAnaliticoAdmin(admin.ModelAdmin):
    """Admin que exibe atalhos visuais para dashboards analíticos."""
    change_list_template = "admin/analytics_dashboard.html"

    def get_queryset(self, request):
        return self.model.objects.none()

    def changelist_view(self, request, extra_context=None):
        extra_context = extra_context or {}
        extra_context['dashboards'] = [ # type: ignore
            {
                'icon': '📊',
                'title': 'Painel de Análises',
                'url': reverse('analytics_dashboard'),
                'desc': 'Visualize estatísticas e gráficos de empréstimos e leitores.'
            },
            {
                'icon': '💡',
                'title': 'Insights Inteligentes',
                'url': reverse('insights_dashboard'),
                'desc': 'Descubra padrões de leitura e comportamento dos usuários.'
            },
            {
                'icon': '📑',
                'title': 'Relatórios Interativos',
                'url': reverse('analytics_report'),
                'desc': 'Filtre e explore dados em tempo real com relatórios dinâmicos.'
            },
            {
                'icon': '📤',
                'title': 'Exportar Relatório Excel',
                'url': reverse('exportar_excel'),
                'desc': 'Baixe os relatórios de empréstimos no formato Excel.'
            },
        ]
        return super().changelist_view(request, extra_context=extra_context)

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def get_model_perms(self, request):
        return {'change': True}


# =====================================================
# 🔹 PERSONALIZAÇÃO GLOBAL DO DJANGO ADMIN
# =====================================================
admin.site.site_header = "Garoca Libro — Administração"
admin.site.site_title = "Garoca Libro"
admin.site.index_title = "Painel Administrativo"
admin.site.site_url = "/"


# =====================================================
# 🔹 NOTICIAS
# =====================================================

@admin.register(Noticia)
class NoticiaAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'criado_em', 'ativo')
    search_fields = ('titulo', 'descricao')
    list_filter = ('ativo', 'criado_em')
    ordering = ('-criado_em',)
    readonly_fields = ('criado_em', 'atualizado_em')

    fieldsets = (
        ('📰 Informações da Notícia', {
            'fields': ('titulo', 'descricao', 'imagem', 'link', 'ativo')
        }),
        ('📅 Datas', {
            'fields': ('criado_em', 'atualizado_em')
        }),
    )
