from pathlib import Path
import os
import dj_database_url
from django.core.management.utils import get_random_secret_key

# Diretório base do projeto
BASE_DIR = Path(__file__).resolve().parent.parent

# Configuração de segurança
SECRET_KEY = os.getenv('SECRET_KEY', default=get_random_secret_key())
#DEBUG = os.getenv('DEBUG', 'False').lower() == 'true'
DEBUG=True
# ALLOWED_HOSTS com os valores para ambiente local e Heroku
ALLOWED_HOSTS = ['*']  # Allow any host - Note: Not recommended for production

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
    'django_extensions',
]

# Configuração do middleware
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # WhiteNoise para arquivos estáticos
    'csp.middleware.CSPMiddleware',  # Adicionado para Content Security Policy
    'django.middleware.http.ConditionalGetMiddleware',  # Middleware condicional para cache
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
        'ENGINE': os.getenv('DB_ENGINE', 'django.db.backends.postgresql'),
        'NAME': os.getenv('POSTGRES_DB', 'postgres'),
        'USER': os.getenv('POSTGRES_USER', 'postgres'),
        'PASSWORD': os.getenv('POSTGRES_PASSWORD', 'postgres'),
        'HOST': os.getenv('DB_HOST', 'db'),
        'PORT': os.getenv('DB_PORT', '5432'),
    }
}

# Configuração do banco de dados no Heroku usando JAWSDB_URL
ja_database_url = os.getenv('JAWSDB_URL')
if ja_database_url:
    DATABASES['default'].update(dj_database_url.config(default=ja_database_url))
else:
    # Banco de dados local
    if DEBUG and os.getenv('DB_ENGINE', '') == 'django.db.backends.mysql':
        DATABASES['default'].update({
            'NAME': 'DJANGO_G',
            'USER': 'djangoadmin',  # ou o usuário correto
            'PASSWORD': '100902',  # a senha correta do banco de dados
            'HOST': 'localhost',
            'PORT': '3306',
            'OPTIONS': {
                'charset': 'utf8mb4',
                'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
            }
        })

DATABASES['default']['CONN_MAX_AGE'] = 600

# Configuração de cache usando apenas LocMemCache
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

# Configuração de sessão
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

# Configuração de arquivos estáticos
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Configuração de arquivos de mídia
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

if not DEBUG:
    # Configuração para Amazon S3
    DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
    AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')
    AWS_STORAGE_BUCKET_NAME = os.getenv('AWS_STORAGE_BUCKET_NAME')
    AWS_QUERYSTRING_AUTH = False
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
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/perfil/'
LOGOUT_REDIRECT_URL = '/login/'

# Segurança dos cookies e HTTPS
SESSION_COOKIE_SECURE = not DEBUG
SESSION_COOKIE_HTTPONLY = True
CSRF_COOKIE_SECURE = not DEBUG
SECURE_SSL_REDIRECT = not DEBUG
SECURE_HSTS_SECONDS = 31536000 if not DEBUG else 0
SECURE_HSTS_INCLUDE_SUBDOMAINS = not DEBUG
SECURE_HSTS_PRELOAD = not DEBUG

# Cabeçalhos de segurança
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True

# Configuração para Content-Security-Policy (CSP)
CSP_DEFAULT_SRC = ("'self'",)
CSP_SCRIPT_SRC = (
    "'self'",
    'https://stackpath.bootstrapcdn.com',
    'https://code.jquery.com',
    'https://cdn.jsdelivr.net',
    'https://cdnjs.cloudflare.com',
    "'unsafe-inline'",  # Permite scripts inline (necessário para <script>...</script>)
)
CSP_STYLE_SRC = (
    "'self'",
    'https://stackpath.bootstrapcdn.com',
    'https://cdnjs.cloudflare.com',
    'https://cdn.jsdelivr.net',
    "'unsafe-inline'",  # Permite estilos inline
)
CSP_FRAME_ANCESTORS = ("'self'",)
CSP_FONT_SRC = (
    "'self'",
    'https://cdnjs.cloudflare.com',
    'https://cdn.jsdelivr.net',
    'https://stackpath.bootstrapcdn.com',
    'data:',
)
CSP_IMG_SRC = (
    "'self'",
    'blob:',
    'data:',
)

# Middleware para adicionar cabeçalho Cache-Control simplificado
from django.utils.cache import patch_cache_control
from django.utils.deprecation import MiddlewareMixin

class CacheControlMiddleware(MiddlewareMixin):
    def process_response(self, request, response):
        patch_cache_control(response, public=True, max_age=86400)  # 1 dia de cache
        return response

# Adicione CacheControlMiddleware ao final da lista de middlewares
MIDDLEWARE.append('library_manager.settings.CacheControlMiddleware')

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
