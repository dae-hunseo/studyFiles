"""studyproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
import firstapp.views
from django.conf import settings    #static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)를 위한 것
from django.conf.urls.static import static  #static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)를 위한 것

urlpatterns = [
    path('admin/', admin.site.urls),
    path('welcome/', firstapp.views.welcome),
    path('secondapp/',include('secondapp.urls')),
    # path('thirdapp/',include('thirdapp.urls')),
    path('forthapp/',include('forthapp.urls')),
    path('visitorapp/',include('visitorapp.urls')),
    path('uploadapp/', include('uploadapp.urls')),
    path('accountapp/', include('accountapp.urls')),
    path('relationapp/', include('relationapp.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
