from django.urls import path
from . import views

urlpatterns = [ #http://localhost:8000/forthapp/R/ 같이 하면 됨.
    path('C/', views.c, name='C'),
    path('R/', views.r, name='R1'),
    path('R/<int:id>/', views.r, name='R2'),
    path('U/<int:id>/', views.u, name='U'),
    path('D/<int:id>/', views.d, name='D'),
]