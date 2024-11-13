from pathlib import Path
import os
import dj_database_url
from django.core.management.utils import get_random_secret_key

# Diretório base do projeto
BASE_DIR = Path(__file__).resolve().parent.parent

# Configuração de segurança
SECRET_KEY = os.getenv('SECRET_KEY', default=get_random_secret_key())
DEBUG = True
ALLOWED_HOSTS = ['garoca1-3d0d78d257fa.herokuapp.com', 'localhost', '127.0.0.1']

# Configuração dos apps do Django
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'core',
    'bootstrap5',
    'storages',  # Adicionando o django-storages para integração com o S3
]

# Configuração do middleware
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.middleware.http.ConditionalGetMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
]

# Configuração de URLs e WSGI
ROOT_URLCONF = 'library_manager.urls'
WSGI_APPLICATION = 'library_manager.wsgi.application'

# Configuração de templates
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

# Configuração do banco de dados
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_ALL_TABLES'",
            'charset': 'utf8mb4',
        }
    }
}

ja_database_url = os.getenv('JAWSDB_URL')
if ja_database_url:
    DATABASES['default'] = dj_database_url.config(default=ja_database_url)
elif DEBUG:
    DATABASES['default'].update({
        'NAME': 'DJANGO_G',
        'USER': 'djangoadmin',
        'PASSWORD': '100902',
        'HOST': 'localhost',
        'PORT': '3306',
    })
else:
    raise ValueError("JAWSDB_URL environment variable is not set in production mode")

DATABASES['default']['CONN_MAX_AGE'] = 600

# Configuração de cache
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

SESSION_ENGINE = 'django.contrib.sessions.backends.db'

AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
USE_I18N = True
USE_TZ = True

# Configuração de arquivos estáticos
STATIC_URL = '/static/'

# Diretório onde os arquivos estáticos serão armazenados após o comando `collectstatic`
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

# Usando o WhiteNoise para servir arquivos estáticos em produção
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'
WHITENOISE_MAX_AGE = 31536000  # 1 ano de cache

# Configuração de arquivos de mídia (S3)
MEDIA_URL = 'https://{AWS_S3_CUSTOM_DOMAIN}/media/'  # Usando o domínio customizado S3
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')  # Isso será ignorado em produção se S3 estiver ativo

if not DEBUG:
    # Configuração para armazenar no S3
    DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
    AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')
    AWS_STORAGE_BUCKET_NAME = os.getenv('AWS_STORAGE_BUCKET_NAME')
    AWS_S3_REGION_NAME = os.getenv('AWS_S3_REGION_NAME', 'us-east-1')  # Configuração da região do bucket
    AWS_S3_CUSTOM_DOMAIN = f'{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com'
    AWS_QUERYSTRING_AUTH = False  # Evita URL temporárias para os arquivos

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
DEFAULT_CHARSET = 'utf-8'

# Configuração de usuários e autenticação
AUTH_USER_MODEL = 'core.Leitor'

LOGIN_URL = '/core/login/'
LOGIN_REDIRECT_URL = '/meu_perfil/'
LOGOUT_REDIRECT_URL = '/login/'

# Configuração de cookies para segurança em produção
SESSION_COOKIE_SECURE = not DEBUG
CSRF_COOKIE_SECURE = not DEBUG
SECURE_SSL_REDIRECT = not DEBUG
SECURE_HSTS_SECONDS = 31536000 if not DEBUG else 0
SECURE_HSTS_INCLUDE_SUBDOMAINS = not DEBUG
SECURE_HSTS_PRELOAD = not DEBUG

SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True

# Middleware para controle de cache personalizado
from django.utils.cache import patch_cache_control
from django.utils.deprecation import MiddlewareMixin

class CacheControlMiddleware(MiddlewareMixin):
    def process_response(self, request, response):
        if request.path.startswith('/login/') or request.path.startswith('/perfil/'):
            # Evita cache em páginas dinâmicas de login e perfil
            patch_cache_control(response, no_cache=True, no_store=True, must_revalidate=True)
        elif request.path.startswith('/static/'):
            # Cache prolongado para arquivos estáticos
            patch_cache_control(response, public=True, max_age=WHITENOISE_MAX_AGE, immutable=True)
        else:
            # Cache de longa duração para páginas mais estáticas
            patch_cache_control(response, public=True, max_age=3600)  # Cache para 1 hora ou mais

        return response

MIDDLEWARE.append('library_manager.settings.CacheControlMiddleware')

# Configuração de logging
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'level': 'DEBUG' if DEBUG else 'ERROR',
        },
    },
    'root': {
        'handlers': ['console'],
        'level': 'DEBUG' if DEBUG else 'ERROR',
    },
    'loggers': {
        'django.db.backends': {
            'handlers': ['console'],
            'level': 'DEBUG' if DEBUG else 'ERROR',
            'propagate': False,
        },
        'storages.backends.s3boto3': {
            'handlers': ['console'],
            'level': 'DEBUG' if DEBUG else 'ERROR',
            'propagate': False,
        },
    }
}
