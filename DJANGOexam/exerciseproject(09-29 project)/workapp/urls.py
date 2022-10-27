from django.urls import path
from . import views
urlpatterns = {
    path("exercise1/", views.exercise1),
    path("exercise2/", views.exercise2),
    path("exercise3/", views.exercise3),
    path("product1/", views.product1), #name="product1"을 활용하는 것은 선택. 없애도 됨.
    path("basket1/", views.basket1), #name='basket1'
}