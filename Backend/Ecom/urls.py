"""Ecom URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
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
from django.conf import settings
from django.conf.urls.static import static
from shop.models import *
from . import views

from django.contrib.auth.models import User
from rest_framework import routers, serializers, viewsets


# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email', 'password']

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'   

class FruitViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(category='Fruits & Vegetables')
    serializer_class = ProductSerializer

class SnacksViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(category='Snacks & Munchies')
    serializer_class = ProductSerializer

class DrinksViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(category='Drinks & Beverages')
    serializer_class = ProductSerializer

class StaplesViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(category='Daily Staples')
    serializer_class = ProductSerializer

# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


router = routers.DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'fruits', FruitViewSet)
router.register(r'snacks', SnacksViewSet)
router.register(r'drinks', DrinksViewSet)
router.register(r'staples', StaplesViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('shop/', include('shop.urls')),
    path('', views.register),
    path('login/', views.loginPage),
    path('logout/', views.logOutUser),
    path('api-auth/', include('rest_framework.urls')),
    path('', include(router.urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
