from django.urls import path
from . import views
urlpatterns = [ # https://richone.tistory.com/38 에서 아래 name이 먼지 알 수 있음.
    path("", views.exam1, name='exam1'),
    path('exam2/', views.exam2),
    path('exam3/', views.exam3),
    path('exam4/', views.exam4),
    path('exam5/', views.exam5),
    path('exam6/', views.exam6),
    path('exam7/', views.exam7),
    path('exam8/', views.exam8),
    path('exam9/', views.exam9),
    path('exam10/<name>/', views.exam10), #localhost:8000/secondapp/exam10/내용 을 주면 내용이 화면에 출력된다.
    path('exam11/<name>/<int:age>/', views.exam11), #age를 int형으로 지정했으니 꼭 int형을 줘야한다. #localhost:8000/secondapp/exam10/둘리/999
    path('exam12/<int:num1>/<int:num2>/', views.exam12),
    path('exam13/', views.exam13),
    path('exam14/<word>/<int:num1>/<num2>/', views.exam14), #num1은 int형은 가능하나 float형은 안 된다. #float형을 여기서는 지원하지 않기 때문에 <float:num2>로 할 수가 없다. 실수를 받을때는 변환해서 사용해야 한다.
    path('exam15/', views.exam15),
    path('exam16/', views.exam16, name='unico'), #name이 unico로 설정되어
    path('exam17/', views.exam17),
    path('exam18/', views.exam18, name='exam18'),
    path('exam19/', views.exam19),
    path('formget/', views.query_form_get),
    path('formpost/', views.query_form_post),
    path('querystringproc/', views.querystring_processing, name='qsp'),
    path('exam20/', views.exam20),
    path('exam21/', views.exam21),
    path('exam22/', views.exam22),
    path('exam22_1/', views.exam22_1),
    path('exam23/', views.exam23),
    path('exam24/', views.exam24),
    path('exam25/', views.exam25),
    path('json1/', views.json1),
    path('json2/', views.json2),
    path('ggmap1/', views.ggmap1),
    path('ggmap2/', views.ggmap2),
    path('ggmap3/', views.ggmap3),
    path('ggmap4/', views.ggmap4),
    path('ggmap5/', views.ggmap5),
    path('ggmap6/', views.ggmap6),
    path('kkmap1/', views.kkmap1),
    path('kkmap2/', views.kkmap2),
    path('kkmap3/', views.kkmap3),
    path('kkmap4/', views.kkmap4),
    path('kkmap5/', views.kkmap5),
    path('kkmap6/', views.kkmap6),
    path('kkmap7/', views.kkmap7),
] #http://localhost:8000/secondapp/exam2/이면 exam2/가 실행
#http://localhost:8000/secondapp/exam4/ 면 exam4/가 실행
