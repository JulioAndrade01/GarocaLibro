from django.urls import path
from core.views import EmprestimoCreateView, EmprestimoListView, IndexView, LeitorListView, LivroCreateView, LivroDeleteView, LivroListView, LivroUpdateView
from core.views import LeitorCreateView, LeitorUpdateView, LeitorDeleteView

urlpatterns = [
    path('', IndexView.as_view(), name = 'index'),
    #Leitor urls
    path('leitor-list/', LeitorListView.as_view(), name='leitor-list'),
    path('leitor/', LeitorCreateView.as_view(), name='leitor'),
    path('leitor/<int:pk>/', LeitorUpdateView.as_view(), name='leitor-update'),
    path('leitor/<int:pk>/delete/', LeitorDeleteView.as_view(), name='leitor-delete'),
    #Livros urls
    path('livro-list/', LivroListView.as_view(), name='livro-list'),
    path('livro/', LivroCreateView.as_view(), name='livro'),
    path('livro/<int:pk>/', LivroUpdateView.as_view(), name='livro-update'),
    path('livro/<int:pk>/delete/', LivroDeleteView.as_view(), name='livro-delete'),
    #Livros urls
    path('emprestimo-list/', EmprestimoListView.as_view(), name='emprestimo-list'),
    path('emprestimo/', EmprestimoCreateView.as_view(), name='emprestimo'),
]