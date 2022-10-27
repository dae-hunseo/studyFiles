from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from time import localtime #exercise1()
from datetime import datetime #basket1()

def exercise1(request):
    tm = localtime()
    context = {'month':tm.tm_mon, 'date':tm.tm_mday}
    return render(request, 'exercise1.html', context)

def exercise2(request): #studyproject\secondapp\views.py의 exam8() 참고
    type = 'type' in request.GET    #URL에 type="~~"이 있으면 True
    memberlist = False #True, False가 아니라 'memberlist', 'number', 'none'으로 할 수도 있음
    membername = ['']
    if type :   #type이 True면 실행
        if request.GET['type'] == 'memberlist':
            result = "우리팀의 팀원을 소개합니다" #이건 그냥 html에서 출력하고 result에 membername의 원소값들을 주는 방법도 있음.
            memberlist = True
            membername = ['서대훈','박민정','박수은']
        elif  request.GET['type'] == 'number':
            result = "우리팀 인원은 3명입니다."
    else:
        result = "type=memberlist 또는 type=number로 쿼리를 전달하세요."
    context = {
        'result' : result,
        'memberlist' : memberlist,
        'membername' : membername
    }
    return render(request, 'exercise2.html', context)

def exercise3(request): #secondapp\views.py의 exam6() 참고함
    if request.method == 'POST':
        name = request.POST['input_name'] #request.POST.get("input_name", "없음")
        opinion = request.POST['opinion'] #request.POST.get("opinion", "없음")
        context = {'input_name': name, 'opinion':opinion} #만약 context = {'info':{'inputname':name, 'opinion':opinion}} 으로 하면 html에서는 info.input_name 이렇게 사용함.
    else:
        context = None #else 대신 if문 위에 먼저 무조건 실행되도록 이 코드를 나둬도 됨.
    return render(request, 'exercise3.html', context)

def product1(request):
    return render(request, 'product1.html')

def basket1(request):   #exercise2 참고함
    links = ["/static/images/1.jpg",
            "/static/images/2.jpg",
            "/static/images/3.jpg",
            "/static/images/4.jpg",
            "/static/images/5.jpg",
            "/static/images/6.jpg",
            "/static/images/7.jpg",
            "/static/images/8.jpg",
            "/static/images/9.jpg",
            "/static/images/10.jpg"] #코드 간단하게 수정해서 안 쓰게 됨.
    dt = datetime.now() #studyproject\secondapp\views.py의 exam19() 참고함
    img_link = request.GET.get('pid') #request.GET['pid']
    context = {
        'image_link':img_link,
        'current_date':dt,
    }#current_date 대신 그냥 date하면 basket1.html에서 에러 발생
    return render(request, 'basket1.html', context)
# Create your views here.
