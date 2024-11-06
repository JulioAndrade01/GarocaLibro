# library_manager/settings.py

from pathlib import Path
import os
import dj_database_url  # Para simplificar a conexão com o banco de dados em produção
from django.core.management.utils import get_random_secret_key

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Segurança em Produção
SECRET_KEY = os.getenv('SECRET_KEY', default=get_random_secret_key())  # Pega do ambiente ou gera uma nova
DEBUG = os.getenv('DEBUG', 'False') == 'True'  # Define False em produção, com variável de ambiente

# Definir ALLOWED_HOSTS conforme necessário para produção
ALLOWED_HOSTS = os.getenv('ALLOWED_HOSTS', 'localhost,127.0.0.1,garoca1-3d0d78d257fa.herokuapp.com').split(',')

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'core',
    'bootstrap5',
    'whitenoise.runserver_nostatic',  # Para servir arquivos estáticos de forma otimizada
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # Configuração de arquivos estáticos para produção
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'library_manager.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'core/templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'library_manager.wsgi.application'

# Configuração do banco de dados MySQL para produção
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'kzrfbl6fu7qc4uhm',  # Nome do banco de dados
        'USER': 'gng7j5d6xu5ivwql',  # Usuário do banco de dados
        'PASSWORD': 'xa0a5n94mqdpy2zt',  # Senha do banco de dados
        'HOST': 'gk90usy5ik2otcvi.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',  # Host do banco de dados
        'PORT': '3306',  # Porta do MySQL
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_ALL_TABLES'",
            'charset': 'utf8mb4',
        },
        'CONN_MAX_AGE': 600,  # Idade máxima da conexão
    }
}

# Adicionar suporte para DATABASE_URL em caso de fallback (opcional para configurações dinâmicas no Heroku)
DATABASES['default'].update(dj_database_url.config(conn_max_age=600, ssl_require=True))

# Password validation
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# Internationalization
LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
USE_I18N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images)
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]

# Configuração do WhiteNoise para servir arquivos estáticos em produção
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Media files
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Default primary key field type
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Codificação padrão
DEFAULT_CHARSET = 'utf-8'

# Configuração do usuário personalizado
AUTH_USER_MODEL = 'core.Leitor'

# Redirecionamento após login
LOGIN_REDIRECT_URL = 'perfil'

# Configuração do Redis para sessões e cache (recomendado para produção no Heroku)
SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
SESSION_CACHE_ALIAS = 'default'
CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': os.getenv('REDIS_URL'),  # Defina REDIS_URL no ambiente do Heroku
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
        }
    }
}

# Segurança dos cookies
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_SSL_REDIRECT = True  # Redireciona HTTP para HTTPS em produção
