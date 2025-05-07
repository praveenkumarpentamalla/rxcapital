from django.urls import path

from .views import *

urlpatterns = [
    path('',home ,name="home"),
    path('about',about ,name="about"),
    path('account-types',account_type ,name="account_types"),
    path('platform',platform ,name="platform"),





]