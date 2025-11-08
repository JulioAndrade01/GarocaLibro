from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from core import views

urlpatterns = [
    # ======================
    # 🔹 PÁGINAS PRINCIPAIS
    # ======================
    path('', views.home, name='home'),
    path('appgaroca/', views.AppGarocaView.as_view(), name='appgaroca'),

    # ======================
    # 🔹 LEITORES (CRUD)
    # ======================
    path('leitores/', views.LeitorListView.as_view(), name='leitor-list'),
    path('leitor/add/', views.LeitorCreateView.as_view(), name='leitor-create'),
    path('leitor/edit/<int:pk>/', views.LeitorUpdateView.as_view(), name='leitor-update'),
    path('leitor/delete/<int:pk>/', views.LeitorDeleteView.as_view(), name='leitor-delete'),

    # ======================
    # 🔹 LIVROS (CRUD)
    # ======================
    path('livros/', views.LivroListView.as_view(), name='livro-list'),
    path('livro/add/', views.LivroCreateView.as_view(), name='livro-create'),
    path('livro/edit/<int:pk>/', views.LivroUpdateView.as_view(), name='livro-update'),
    path('livro/delete/<int:pk>/', views.LivroDeleteView.as_view(), name='livro-delete'),
    path('livros/view/', views.livros_view, name='livros-view'),

    # ======================
    # 🔹 EMPRÉSTIMOS
    # ======================
    path('emprestimos/', views.EmprestimoListView.as_view(), name='emprestimo-list'),
    path('emprestimo/add/', views.EmprestimoCreateView.as_view(), name='emprestimo-create'),
    path('meus-emprestimos/', views.meus_emprestimos, name='meus_emprestimos'),
    path('emprestimo/edit/<int:pk>/', views.EmprestimoUpdateView.as_view(), name='emprestimo-edit'),
    path('emprestimo/delete/<int:pk>/', views.EmprestimoDeleteView.as_view(), name='emprestimo-delete'),
    # ======================
    # 🔹 LOGIN / CADASTRO / PERFIL
    # ======================
    path('login/', views.login_view, name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='home'), name='logout'),
    path('register/', views.register, name='register'),
    path('perfil/', views.perfil_view, name='perfil'),
    path('perfil/editar/', views.editar_perfil_view, name='editar_perfil'),
    path('perfil/editar/ajax/', views.editar_perfil_ajax, name='editar_perfil_ajax'),

    # ======================
    # 🔹 AGENDAMENTOS E DEVOLUÇÃO
    # ======================
    path('agendar-retirada/', views.agendar_retirada, name='agendar_retirada'),
    path('agendamento/<int:agendamento_id>/cancelar/', views.cancelar_agendamento, name='cancelar_agendamento'),
    path('devolver-livro/', views.devolver_livro_view, name='devolver_livro'),
    path('api/devolver-livro/<int:emprestimo_id>/', views.api_devolver_livro, name='api_devolver_livro'),

    # ======================
    # 🔹 DASHBOARD LEITOR
    # ======================
    path('dashboard/', views.dashboard_leitor, name='dashboard_leitor'),

    # ======================
    # 🔹 ANALYTICS (ADMIN)
    # ======================
    # Painel administrativo de gráficos e relatórios
    path('analytics/', views.analytics_dashboard, name='analytics_dashboard'),
    path('analytics/insights/', views.insights_dashboard, name='insights_dashboard'),
    path('analytics/report/', views.analytics_report, name='analytics_report'),
    path('analytics/filtrar/', views.filtrar_emprestimos, name='filtrar_emprestimos'),
    path('analytics/exportar/excel/', views.exportar_relatorio_excel, name='exportar_excel'), # type: ignore


]

# ======================
# 🔹 MÍDIA EM DEBUG
# ======================
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
