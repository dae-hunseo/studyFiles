from django.urls import path
from . import views

urlpatterns = [
    path("visitorC/", views.v_create, name="vC"),
    path("visitorR/", views.v_read, name="vR"), #방명록 글 읽기. http://localhost:8000/visitorapp/visitorR/
    path("visitorU/", views.v_update, name="vU"),
    path("visitorD/", views.v_delete, name="vD"),
    path("replyC/", views.reply_create, name="rC"), #앞에 r이 붙은건 댓글처리하는 기능이고 앞에 v가 붙은건 forthapp의 crud랑 같음.
    path("replyR/", views.reply_read, name="rR"), #reply와 관련된 애들은 댓글 관련 애들이다.
    path("search1/<name>", views.search1, name="search1"), #검색. 조건을 줘서 읽는다.
    path("search2/<content>", views.search2, name="search2"), #검색 조건은 이름가지고 search와 컨텐트가지고 search하는 게 있다.
]