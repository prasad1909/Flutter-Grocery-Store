from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="shopHome"),
    path('about/', views.about, name="aboutUs"),
    path('contact/', views.contact, name="contactUs"),
    path('tracker/', views.tracker, name="tracker"),
    path('products/<int:myid>', views.productView, name="productView"),
    path('checkOut/', views.checkOut, name="checkout"),
    path('search/', views.search, name="search"),
    path('fruits/', views.fruits, name="fruits"),
    path('staples/', views.staples, name="staples"),
    path('drinks/', views.drinks, name="drinks"),
    path('snacks/', views.snacks, name="snacks"),
    path('search/', views.search, name="search"),
    path('bestsellers/', views.bestsellers, name="bestsellers"),
]
