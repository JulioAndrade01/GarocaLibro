
from django.urls import path
from core.views import (
    IndexView,
    LeitorListView,
    LeitorCreateView,
    LeitorUpdateView,
    LeitorDeleteView,
    LivroListView,
    LivroCreateView,
    LivroUpdateView,
    LivroDeleteView,
    EmprestimoListView,
    EmprestimoCreateView,
    livros_view,
    login_view,
    perfil_view,
    register,
    agendar_retirada,
    
)

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('', IndexView.as_view(), name='biblioteca_municipal_sao_sebastiao'),
    path('leitores/', LeitorListView.as_view(), name='leitor-list'),
    path('leitor/add/', LeitorCreateView.as_view(), name='leitor-create'),
    path('leitor/edit/<int:pk>/', LeitorUpdateView.as_view(), name='leitor-update'),
    path('leitor/delete/<int:pk>/', LeitorDeleteView.as_view(), name='leitor-delete'),
    path('livros/', LivroListView.as_view(), name='livro-list'),
    path('livro/add/', LivroCreateView.as_view(), name='livro-create'),
    path('livro/edit/<int:pk>/', LivroUpdateView.as_view(), name='livro-update'),
    path('livro/delete/<int:pk>/', LivroDeleteView.as_view(), name='livro-delete'),
    path('emprestimos/', EmprestimoListView.as_view(), name='emprestimo-list'),
    path('emprestimo/add/', EmprestimoCreateView.as_view(), name='emprestimo-create'),
    path('livros/view/', livros_view, name='livros-view'),
    path('perfil/', perfil_view, name='perfil'),
    path('meu_perfil/', perfil_view, name='meu_perfil'),
    path('login/', login_view, name='login'),
    path('register/', register, name='register'),
    path('agendar-retirada/', agendar_retirada, name='agendar_retirada'),
]