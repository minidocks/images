# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import platform
import os
import environ
import ldap #https://stackoverflow.com/questions/38740631/need-to-pre-import-module-to-avoid-error
from logging.handlers import SysLogHandler
from django.core.exceptions import PermissionDenied
from django.http import Http404

env = environ.Env(DEBUG=(bool, False),)

DEBUG = env('DEBUG')
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    'default': env.db(),
    'extra': env.db('SQLITE_URL', default='sqlite:////tmp/my-tmp-sqlite.db')
}

SECRET_KEY = env.str('SECRET_KEY')

CACHES = {
    'default': env.cache(),
    'redis': env.cache('REDIS_URL')
}

EMAIL_CONFIG = env.email_url(
    'EMAIL_URL', default='smtp://user@:password@localhost:25')

vars().update(EMAIL_CONFIG)

ADMINS = (
    (os.environ['WEBLATE_ADMIN_NAME'], os.environ['WEBLATE_ADMIN_EMAIL']),
)

MANAGERS = ADMINS

ALLOWED_HOSTS = env.list('ALLOWED_HOSTS', default=('*',))

SITE_ID = 1

BASE_DIR = '/usr/lib/python3.6/site-packages/'

# Data directory
DATA_DIR = '/app/data'

TIME_ZONE = env.str('WEBLATE_TIME_ZONE', 'UTC')
LANGUAGE_CODE = env.str('WEBLATE_LANGUAGE_CODE', 'en-us')
USE_L10N = True
USE_TZ = True
URL_PREFIX = ''
MEDIA_ROOT = os.path.join(DATA_DIR, 'media')
MEDIA_URL = '{0}/media/'.format(URL_PREFIX)

STATIC_ROOT = os.path.join(DATA_DIR, 'static')
STATIC_URL = '{0}/static/'.format(URL_PREFIX)
STATICFILES_DIRS = (
    '/usr/lib/python3.6/site-packages/weblate/static',
    '/usr/lib/python3.6/site-packages/django/contrib/admin/static',
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder',
)

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR, 'weblate', 'templates'),
        ],
        'OPTIONS': {
            'context_processors': [
                'django.contrib.auth.context_processors.auth',
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.request',
                'django.template.context_processors.csrf',
                'django.contrib.messages.context_processors.messages',
                'weblate.trans.context_processors.weblate_context',
            ],
            'loaders': [
                ('django.template.loaders.cached.Loader', [
                    'django.template.loaders.filesystem.Loader',
                    'django.template.loaders.app_directories.Loader',
                ]),
            ],
        },
    },
]


# GitHub username for sending pull requests.
# Please see the documentation for more details.
GITHUB_USERNAME = env.str('WEBLATE_GITHUB_USERNAME', None)

# Authentication configuration
AUTHENTICATION_BACKENDS = ()

# Custom user model
AUTH_USER_MODEL = 'weblate_auth.User'

if 'WEBLATE_NO_EMAIL_AUTH' not in os.environ:
    AUTHENTICATION_BACKENDS += ('social_core.backends.email.EmailAuth',)

if 'WEBLATE_SOCIAL_AUTH_GITHUB_KEY' in os.environ:
    AUTHENTICATION_BACKENDS += ('social_core.backends.github.GithubOAuth2',)

# Social auth backends setup
SOCIAL_AUTH_GITHUB_KEY = env.str('WEBLATE_SOCIAL_AUTH_GITHUB_KEY', '')
SOCIAL_AUTH_GITHUB_SECRET = env.str('WEBLATE_SOCIAL_AUTH_GITHUB_SECRET', '')
SOCIAL_AUTH_GITHUB_SCOPE = ['user:email']

if 'WEBLATE_SOCIAL_AUTH_BITBUCKET_KEY' in os.environ:
    AUTHENTICATION_BACKENDS += ('social_core.backends.bitbucket.BitbucketOAuth',)

SOCIAL_AUTH_BITBUCKET_KEY = env.str('WEBLATE_SOCIAL_AUTH_BITBUCKET_KEY', '')
SOCIAL_AUTH_BITBUCKET_SECRET = env.str('WEBLATE_SOCIAL_AUTH_BITBUCKET_SECRET', '')
SOCIAL_AUTH_BITBUCKET_VERIFIED_EMAILS_ONLY = True

if 'WEBLATE_SOCIAL_AUTH_FACEBOOK_KEY' in os.environ:
    AUTHENTICATION_BACKENDS += ('social_core.backends.facebook.FacebookOAuth2',)

SOCIAL_AUTH_FACEBOOK_KEY = env.str('WEBLATE_SOCIAL_AUTH_FACEBOOK_KEY', '')
SOCIAL_AUTH_FACEBOOK_SECRET = env.str('WEBLATE_SOCIAL_AUTH_FACEBOOK_SECRET', '')
SOCIAL_AUTH_FACEBOOK_SCOPE = ['email', 'public_profile']

if 'WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_KEY' in os.environ:
    AUTHENTICATION_BACKENDS += ('social_core.backends.google.GoogleOAuth2',)

SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = env.str('WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_KEY', '')
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = env.str('WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET', '')

if 'WEBLATE_SOCIAL_AUTH_GITLAB_KEY' in env:
    AUTHENTICATION_BACKENDS += ('social_core.backends.gitlab.GitLabOAuth2',)

if 'WEBLATE_SOCIAL_AUTH_GITLAB_API_URL' in env:
    SOCIAL_AUTH_GITLAB_API_URL = env.str('WEBLATE_SOCIAL_AUTH_GITLAB_API_URL')

SOCIAL_AUTH_GITLAB_KEY = env.str('WEBLATE_SOCIAL_AUTH_GITLAB_KEY', '')
SOCIAL_AUTH_GITLAB_SECRET = env.str('WEBLATE_SOCIAL_AUTH_GITLAB_SECRET', '')
SOCIAL_AUTH_GITLAB_SCOPE = ['api']

# Azure
if 'WEBLATE_SOCIAL_AUTH_AZUREAD_OAUTH2_KEY' in env:
    AUTHENTICATION_BACKENDS += ('social_core.backends.azuread.AzureADOAuth2',)

SOCIAL_AUTH_AZUREAD_OAUTH2_KEY = os.environ.get('WEBLATE_SOCIAL_AUTH_AZUREAD_OAUTH2_KEY', '')
SOCIAL_AUTH_AZUREAD_OAUTH2_SECRET = os.environ.get('WEBLATE_SOCIAL_AUTH_AZUREAD_OAUTH2_SECRET', '')

# https://docs.weblate.org/en/latest/admin/auth.html#ldap-authentication
if 'WEBLATE_AUTH_LDAP_SERVER_URI' in env:
    AUTH_LDAP_SERVER_URI = env.str('WEBLATE_AUTH_LDAP_SERVER_URI')
    AUTH_LDAP_USER_DN_TEMPLATE = env.str('WEBLATE_AUTH_LDAP_USER_DN_TEMPLATE', 'cn=%(user)s,o=Example')
    AUTHENTICATION_BACKENDS += ('django_auth_ldap.backend.LDAPBackend',)
    AUTH_LDAP_USER_ATTR_MAP = env.dict('WEBLATE_AUTH_LDAP_USER_ATTR_MAP', { 'first_name': 'name', 'email': 'mail' })

# Always include Weblate backend
AUTHENTICATION_BACKENDS += ('weblate.accounts.auth.WeblateUserBackend',)

# Social auth settings
SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.auth_allowed',
    'social_core.pipeline.social_auth.social_user',
    'weblate.accounts.pipeline.store_params',
    'weblate.accounts.pipeline.verify_open',
    'social_core.pipeline.user.get_username',
    'weblate.accounts.pipeline.require_email',
    'social_core.pipeline.mail.mail_validation',
    'weblate.accounts.pipeline.revoke_mail_code',
    'weblate.accounts.pipeline.ensure_valid',
    'weblate.accounts.pipeline.remove_account',
    'social_core.pipeline.social_auth.associate_by_email',
    'weblate.accounts.pipeline.reauthenticate',
    'weblate.accounts.pipeline.verify_username',
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'social_core.pipeline.social_auth.load_extra_data',
    'weblate.accounts.pipeline.cleanup_next',
    'weblate.accounts.pipeline.user_full_name',
    'weblate.accounts.pipeline.store_email',
    'weblate.accounts.pipeline.notify_connect',
    'weblate.accounts.pipeline.password_reset',
)
SOCIAL_AUTH_DISCONNECT_PIPELINE = (
    'social_core.pipeline.disconnect.allowed_to_disconnect',
    'social_core.pipeline.disconnect.get_entries',
    'social_core.pipeline.disconnect.revoke_tokens',
    'weblate.accounts.pipeline.cycle_session',
    'weblate.accounts.pipeline.adjust_primary_mail',
    'weblate.accounts.pipeline.notify_disconnect',
    'social_core.pipeline.disconnect.disconnect',
    'weblate.accounts.pipeline.cleanup_next',
)

# Custom authentication strategy
SOCIAL_AUTH_STRATEGY = 'weblate.accounts.strategy.WeblateStrategy'

# Raise exceptions so that we can handle them later
SOCIAL_AUTH_RAISE_EXCEPTIONS = True

SOCIAL_AUTH_EMAIL_VALIDATION_FUNCTION = \
    'weblate.accounts.pipeline.send_validation'
SOCIAL_AUTH_EMAIL_VALIDATION_URL = \
    '{0}/accounts/email-sent/'.format(URL_PREFIX)
SOCIAL_AUTH_LOGIN_ERROR_URL = \
    '{0}/accounts/login/'.format(URL_PREFIX)
SOCIAL_AUTH_EMAIL_FORM_URL = \
    '{0}/accounts/email/'.format(URL_PREFIX)
SOCIAL_AUTH_NEW_ASSOCIATION_REDIRECT_URL = \
    '{0}/accounts/profile/#auth'.format(URL_PREFIX)
SOCIAL_AUTH_PROTECTED_USER_FIELDS = ('email',)
SOCIAL_AUTH_SLUGIFY_USERNAMES = True
SOCIAL_AUTH_SLUGIFY_FUNCTION = 'weblate.accounts.pipeline.slugify_username'

# Password validation configuration
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        'OPTIONS': {
            'min_length': 6,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
    {
        'NAME': 'weblate.accounts.password_validation.CharsPasswordValidator',
    },
    {
        'NAME': 'weblate.accounts.password_validation.PastPasswordsValidator',
    },
    # Optional password strength validation by django-zxcvbn-password
    # {
    #     'NAME': 'zxcvbn_password.ZXCVBNValidator',
    #     'OPTIONS': {
    #         'min_score': 3,
    #         'user_attributes': ('username', 'email', 'full_name')
    #     }
    # },
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'weblate.accounts.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'social_django.middleware.SocialAuthExceptionMiddleware',
    'weblate.accounts.middleware.RequireLoginMiddleware',
    'weblate.middleware.SecurityMiddleware',
    'weblate.wladmin.middleware.ConfigurationErrorsMiddleware',
]

ROOT_URLCONF = 'weblate.urls'

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin.apps.SimpleAdminConfig',
    'django.contrib.admindocs',
    'django.contrib.sitemaps',
    'social_django',
    'crispy_forms',
    'compressor',
    'rest_framework',
    'rest_framework.authtoken',
    'weblate.addons',
    'weblate.auth',
    'weblate.checks',
    'weblate.formats',
    'weblate.machinery',
    'weblate.trans',
    'weblate.lang',
    'weblate.langdata',
    'weblate.memory',
    'weblate.screenshots',
    'weblate.accounts',
    'weblate.utils',
    'weblate.vcs',
    'weblate.wladmin',
    'weblate',

    # Optional: Git exporter
    'weblate.gitexport',
)

LOCALE_PATHS = (os.path.join(BASE_DIR, 'weblate', 'locale'), )

# Custom exception reporter to include some details
DEFAULT_EXCEPTION_REPORTER_FILTER = \
    'weblate.trans.debug.WeblateExceptionReporterFilter'

# List of machine translations
MT_SERVICES = (
#     'weblate.machinery.apertium.ApertiumAPYTranslation',
#     'weblate.machinery.deepl.DeepLTranslation',
#     'weblate.machinery.glosbe.GlosbeTranslation',
#     'weblate.machinery.google.GoogleTranslation',
#     'weblate.machinery.microsoft.MicrosoftCognitiveTranslation',
#     'weblate.machinery.mymemory.MyMemoryTranslation',
#     'weblate.machinery.tmserver.AmagamaTranslation',
#     'weblate.machinery.tmserver.TMServerTranslation',
#     'weblate.machinery.yandex.YandexTranslation',
    'weblate.machinery.weblatetm.WeblateTranslation',
#     'weblate.machinery.saptranslationhub.SAPTranslationHub',
    'weblate.memory.machine.WeblateMemory',
)

# Machine translation API keys

# URL of the Apertium APy server
MT_APERTIUM_APY = None

# DeepL API key
MT_DEEPL_KEY = os.environ.get('WEBLATE_MT_DEEPL_KEY', None)
if MT_DEEPL_KEY:
    MT_SERVICES += ('weblate.machinery.deepl.DeepLTranslation',)

# Microsoft Cognitive Services Translator API, register at
# https://portal.azure.com/
MT_MICROSOFT_COGNITIVE_KEY = os.environ.get('WEBLATE_MT_MICROSOFT_COGNITIVE_KEY', None)

if 'WEBLATE_MT_MICROSOFT_COGNITIVE_KEY' in os.environ:
    MT_SERVICES += ('weblate.machinery.microsoft.MicrosoftCognitiveTranslation',)

# MyMemory identification email, see
# http://mymemory.translated.net/doc/spec.php
MT_MYMEMORY_EMAIL = os.environ['WEBLATE_ADMIN_EMAIL']

# Optional MyMemory credentials to access private translation memory
MT_MYMEMORY_USER = None
MT_MYMEMORY_KEY = None

if 'WEBLATE_MT_MYMEMORY_ENABLED' in os.environ:
    MT_SERVICES += ('weblate.machinery.mymemory.MyMemoryTranslation',)

if 'WEBLATE_MT_GLOSBE_ENABLED' in os.environ:
    MT_SERVICES += ('weblateweblate.trans.machine.glosbe.GlosbeTranslation',)

# Google API key for Google Translate API
MT_GOOGLE_KEY = os.environ.get('WEBLATE_MT_GOOGLE_KEY', None)

if 'WEBLATE_MT_GOOGLE_KEY' in os.environ:
    MT_SERVICES += ('weblate.machinery.google.GoogleTranslation',)

# API key for Yandex Translate API
MT_YANDEX_KEY = None

# tmserver URL
MT_TMSERVER = None

# SAP Translation Hub
MT_SAP_BASE_URL = None
MT_SAP_SANDBOX_APIKEY = None
MT_SAP_USERNAME = None
MT_SAP_PASSWORD = None
MT_SAP_USE_MT = True

# Title of site to use
SITE_TITLE = os.environ.get('WEBLATE_SITE_TITLE', 'Weblate')

# Whether site uses https
ENABLE_HTTPS = env.bool('WEBLATE_ENABLE_HTTPS', False)

# Use HTTPS when creating redirect URLs for social authentication, see
# documentation for more details:
# http://python-social-auth-docs.readthedocs.io/en/latest/configuration/settings.html#processing-redirects-and-urlopen
SOCIAL_AUTH_REDIRECT_IS_HTTPS = ENABLE_HTTPS

# Make CSRF cookie HttpOnly, see documentation for more details:
# https://docs.djangoproject.com/en/1.11/ref/settings/#csrf-cookie-httponly
CSRF_COOKIE_HTTPONLY = True
CSRF_COOKIE_SECURE = ENABLE_HTTPS
# Store CSRF token in session (since Django 1.11)
CSRF_USE_SESSIONS = True
SESSION_COOKIE_SECURE = ENABLE_HTTPS
# Session cookie age (in seconds)
SESSION_COOKIE_AGE = 1209600

# URL of login
LOGIN_URL = '{0}/accounts/login/'.format(URL_PREFIX)

# URL of logout
LOGOUT_URL = '{0}/accounts/logout/'.format(URL_PREFIX)

# Default location for login
LOGIN_REDIRECT_URL = '{0}/'.format(URL_PREFIX)

# Anonymous user name
ANONYMOUS_USER_NAME = 'anonymous'

# Reverse proxy settings
IP_PROXY_HEADER = os.environ.get('WEBLATE_IP_PROXY_HEADER', '')
IP_BEHIND_REVERSE_PROXY = bool(IP_PROXY_HEADER)
IP_PROXY_OFFSET = 0

# Sending HTML in mails
EMAIL_SEND_HTML = True

# Subject of emails includes site title
EMAIL_SUBJECT_PREFIX = '[{0}] '.format(SITE_TITLE)

# Enable remote hooks
ENABLE_HOOKS = True

# Whether to run hooks in background
BACKGROUND_HOOKS = True

# Number of nearby messages to show in each direction
NEARBY_MESSAGES = 5

# Offload indexing
OFFLOAD_INDEXING = env.bool('WEBLATE_OFFLOAD_INDEXING', True)

# Use simple language codes for default language/country combinations
SIMPLIFY_LANGUAGES = env.bool('WEBLATE_SIMPLIFY_LANGUAGES', True)

# Render forms using bootstrap
CRISPY_TEMPLATE_PACK = 'bootstrap3'

# List of quality checks
# CHECK_LIST = (
#     'weblate.checks.same.SameCheck',
#     'weblate.checks.chars.BeginNewlineCheck',
#     'weblate.checks.chars.EndNewlineCheck',
#     'weblate.checks.chars.BeginSpaceCheck',
#     'weblate.checks.chars.EndSpaceCheck',
#     'weblate.checks.chars.EndStopCheck',
#     'weblate.checks.chars.EndColonCheck',
#     'weblate.checks.chars.EndQuestionCheck',
#     'weblate.checks.chars.EndExclamationCheck',
#     'weblate.checks.chars.EndEllipsisCheck',
#     'weblate.checks.chars.EndSemicolonCheck',
#     'weblate.checks.chars.MaxLengthCheck',
#     'weblate.checks.format.PythonFormatCheck',
#     'weblate.checks.format.PythonBraceFormatCheck',
#     'weblate.checks.format.PHPFormatCheck',
#     'weblate.checks.format.CFormatCheck',
#     'weblate.checks.format.PerlFormatCheck',
#     'weblate.checks.format.JavascriptFormatCheck',
#     'weblate.checks.consistency.PluralsCheck',
#     'weblate.checks.consistency.SamePluralsCheck',
#     'weblate.checks.consistency.ConsistencyCheck',
#     'weblate.checks.consistency.TranslatedCheck',
#     'weblate.checks.chars.NewlineCountingCheck',
#     'weblate.checks.markup.BBCodeCheck',
#     'weblate.checks.chars.ZeroWidthSpaceCheck',
#     'weblate.checks.markup.XMLValidityCheck',
#     'weblate.checks.markup.XMLTagsCheck',
#     'weblate.checks.source.OptionalPluralCheck',
#     'weblate.checks.source.EllipsisCheck',
#     'weblate.checks.source.MultipleFailingCheck',
# )

# List of automatic fixups
# AUTOFIX_LIST = (
#     'weblate.trans.autofixes.whitespace.SameBookendingWhitespace',
#     'weblate.trans.autofixes.chars.ReplaceTrailingDotsWithEllipsis',
#     'weblate.trans.autofixes.chars.RemoveZeroSpace',
#     'weblate.trans.autofixes.chars.RemoveControlChars',
# )

# List of enabled addons
# WEBLATE_ADDONS = (
#     'weblate.addons.gettext.GenerateMoAddon',
#     'weblate.addons.gettext.UpdateLinguasAddon',
#     'weblate.addons.gettext.UpdateConfigureAddon',
#     'weblate.addons.gettext.MsgmergeAddon',
#     'weblate.addons.gettext.GettextCustomizeAddon',
#     'weblate.addons.gettext.GettextAuthorComments',
#     'weblate.addons.cleanup.CleanupAddon',
#     'weblate.addons.consistency.LangaugeConsistencyAddon',
#     'weblate.addons.discovery.DiscoveryAddon',
#     'weblate.addons.flags.SourceEditAddon',
#     'weblate.addons.flags.TargetEditAddon',
#     'weblate.addons.generate.GenerateFileAddon',
#     'weblate.addons.json.JSONCustomizeAddon',
#     'weblate.addons.properties.PropertiesSortAddon',
# )

# E-mail address that error messages come from.
SERVER_EMAIL = os.environ['WEBLATE_SERVER_EMAIL']

# Default email address to use for various automated correspondence from
# the site managers. Used for registration emails.
DEFAULT_FROM_EMAIL = os.environ['WEBLATE_DEFAULT_FROM_EMAIL']


SESSION_ENGINE = 'django.contrib.sessions.backends.cache'

# REST framework settings for API
REST_FRAMEWORK = {
    # Use Django's standard `django.contrib.auth` permissions,
    # or allow read-only access for unauthenticated users.
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticatedOrReadOnly'
    ],
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
        'weblate.api.authentication.BearerAuthentication',
        'rest_framework.authentication.SessionAuthentication',
    ),
    'DEFAULT_THROTTLE_CLASSES': (
        'rest_framework.throttling.AnonRateThrottle',
        'rest_framework.throttling.UserRateThrottle'
    ),
    'DEFAULT_THROTTLE_RATES': {
        'anon': '100/day',
        'user': '1000/day'
    },
    'DEFAULT_PAGINATION_CLASS': (
        'rest_framework.pagination.PageNumberPagination'
    ),
    'PAGE_SIZE': 20,
    'VIEW_DESCRIPTION_FUNCTION': 'weblate.api.views.get_view_description',
    'UNAUTHENTICATED_USER': 'weblate.auth.models.get_anonymous',
}

if env.bool('WEBLATE_REQUIRE_LOGIN', False):
    # Example for restricting access to logged in users
    LOGIN_REQUIRED_URLS = (
        r'/(.*)$',
    )

    # In such case you will want to include some of the exceptions
    LOGIN_REQUIRED_URLS_EXCEPTIONS = env.list(
        'WEBLATE_LOGIN_REQUIRED_URLS_EXCEPTIONS',
        default=(
           r'/accounts/(.*)$',      # Required for login
           r'/admin/login/(.*)$',   # Required for admin login
           r'/static/(.*)$',        # Required for development mode
           r'/widgets/(.*)$',       # Allowing public access to widgets
           r'/data/(.*)$',          # Allowing public access to data exports
           r'/hooks/(.*)$',         # Allowing public access to notification hooks
           r'/healthz/$',           # Allowing public access to health check
           r'/api/(.*)$',           # Allowing access to API
           r'/js/i18n/$',           # Javascript localization
           r'/contact/$',           # Optional for contact form
           r'/legal/(.*)$',         # Optional for legal app
        ),
    )

REGISTRATION_OPEN = env.bool('WEBLATE_REGISTRATION_OPEN', True)

GOOGLE_ANALYTICS_ID = env.str('WEBLATE_GOOGLE_ANALYTICS_ID', '')

AKISMET_API_KEY = env.str('WEBLATE_AKISMET_API_KEY', None)

ADDITIONAL_CONFIG = '/app/settings-override.py'
if os.path.exists(ADDITIONAL_CONFIG):
    with open(ADDITIONAL_CONFIG) as handle:
        code = compile(handle.read(), ADDITIONAL_CONFIG, 'exec')
        exec(code)
