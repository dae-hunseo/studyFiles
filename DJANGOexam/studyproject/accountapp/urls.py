from django.urls import path
from . import views

app_name = "account" #이거 쓰이는 곳이 많다. #이 앱의 고유 이름이라고 보면 된다. 이 앱이름을 정의하는 이유는 서로 다른 앱마다 필요한 path가 각각 있을건데 그 path에 이름을 부여할 수 있다. 그런데 만약에 다른 앱끼리 path의 name이 같다면? INSTALLED_APPS에 먼저 등록된 앱의 path로 가버린다.
# 그래서 path를 다 다르게 해주거나 아니면 앱만의 고유이름을 붙여서 중복된 path끼리 구분을 해줄 수 있게 해줘야 한다. html 파일들에서 {% url 'account:index' %}같은데서 쓰인다.
urlpatterns = [
    path('', views.index, name='index'), #localhost:8000/accountapp/
    path('register/', views.register, name="register"),
    path('login/', views.login, name="login"), #localhost:8000/accountapp/login/
    path('logout/', views.logout, name="logout"),
    path('onlymember/', views.only_member, name="onlymember"),
]
