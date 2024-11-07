from pathlib import Path
import os
import dj_database_url
from django.core.management.utils import get_random_secret_key
import logging

# Diretório base do projeto
BASE_DIR = Path(__file__).resolve().parent.parent

# Configuração de segurança
SECRET_KEY = os.getenv('SECRET_KEY', default=get_random_secret_key())
DEBUG = os.getenv('DEBUG', 'False').lower() == 'true'

# Configuração de ALLOWED_HOSTS, preferencialmente via variável de ambiente
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
    'storages',  # django-storages para integração com AWS S3
    'csp',  # Adicionado para Content Security Policy
]

# Configuração do middleware
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # WhiteNoise para arquivos estáticos
    'csp.middleware.CSPMiddleware',  # Adicionado para Content Security Policy
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

# Configuração do banco de dados com JAWSDB_URL (mantendo o dj_database_url)
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

# Se a variável de ambiente JAWSDB_URL estiver configurada (Heroku), use-a
ja_database_url = os.getenv('JAWSDB_URL')
if ja_database_url:
    config = dj_database_url.config(default=ja_database_url)
    DATABASES['default'].update(config)
else:
    # Banco de dados local
    if DEBUG:
        DATABASES['default'] = {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'DJANGO_G',
            'USER': 'djangoadmin',  # Ou outro usuário local
            'PASSWORD': '100902',  # Senha para o banco local
            'HOST': 'localhost',
            'PORT': '3306',
            'OPTIONS': {
                'charset': 'utf8mb4',
                'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
            }
        }

DATABASES['default']['CONN_MAX_AGE'] = 600  # Conexões persistentes para melhor desempenho


# Configuração de cache (em memória para desenvolvimento)
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

# Configuração de sessão para usar banco de dados (ao invés de Redis)
SESSION_ENGINE = 'django.contrib.sessions.backends.db'

# Validação de senha
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# Configurações de internacionalização e fuso horário
LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
USE_I18N = True
USE_TZ = True

# Configuração de arquivos estáticos (WhiteNoise)
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Configuração de arquivos de mídia (AWS S3 para produção)
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')  # Diretório local para DEBUG=True
MEDIA_URL = '/media/'

if not DEBUG:
    # Configuração para Amazon S3
    DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
    AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')
    AWS_STORAGE_BUCKET_NAME = os.getenv('AWS_STORAGE_BUCKET_NAME')
    AWS_QUERYSTRING_AUTH = False  # Para URLs públicas de mídia no S3
    AWS_S3_REGION_NAME = os.getenv('AWS_S3_REGION_NAME', 'us-east-1')
    AWS_S3_CUSTOM_DOMAIN = f'{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com'
    MEDIA_URL = f'https://{AWS_S3_CUSTOM_DOMAIN}/media/'

# Configuração para campo padrão de chaves primárias
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Codificação padrão
DEFAULT_CHARSET = 'utf-8'

# Configuração do usuário personalizado
AUTH_USER_MODEL = 'core.Leitor'

# Configuração de autenticação e redirecionamento
LOGIN_URL = '/login/'  # URL para redirecionar quando não autenticado
LOGIN_REDIRECT_URL = '/perfil/'  # URL para redirecionar após o login
LOGOUT_REDIRECT_URL = '/login/'  # URL para redirecionar após logout

# Segurança dos cookies e HTTPS
SESSION_COOKIE_SECURE = not DEBUG
CSRF_COOKIE_SECURE = not DEBUG
SECURE_SSL_REDIRECT = not DEBUG
SECURE_HSTS_SECONDS = 31536000 if not DEBUG else 0
SECURE_HSTS_INCLUDE_SUBDOMAINS = not DEBUG
SECURE_HSTS_PRELOAD = not DEBUG

# Cabeçalhos de segurança
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True
X_CONTENT_TYPE_OPTIONS = 'nosniff'

# Configuração para Content-Security-Policy (CSP)
CSP_DEFAULT_SRC = ("'self'",)  # Permite carregar recursos apenas da mesma origem
CSP_FRAME_ANCESTORS = ("'self'",)  # Restringe o carregamento do site dentro de iframes da mesma origem

# Logging Configurations
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'level': 'DEBUG'
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
