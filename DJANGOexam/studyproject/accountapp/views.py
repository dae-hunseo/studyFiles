from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import auth

def index(request) : #첫 페이지 화면
    context = None
    print(request.user.is_authenticated) #is_authenticated는 로그인 했으면 True, 아니면 False
    print(request.user) #로그인을 안했다면 request.user은 anonymous
    if request.user.is_authenticated:
        context = {'logineduser': request.user} #로그인을 안했다면 request.user은 none
    return render(request, 'index.html', context)

def register(request):
    res_data = None
    if request.method =='POST': 
        useremail = request.POST.get('useremail') #useremail은 register.html에서 input 태그의 name 속성의 속성값으로 보인다.
        firstname = request.POST.get('firstname') #POST 방식으로 전달된 커리 문자열들을 추출하고 있음.
        lastname = request.POST.get('lastname')
        password = request.POST.get('password')
        re_password = request.POST.get('re-password')
        res_data = {}
        if User.objects.filter(username=useremail):
            res_data['error']='이미 가입된 아이디(이메일주소)입니다.'
        elif password != re_password:
            res_data['error']='비밀번호가 다릅니다.'
        else:
            user = User.objects.create_user(username = useremail, #USer 라는 클래스의 객체 생성하듯이 user라는 함수만 호출하는게 아니라 create_user()라는 함수를 호출하고 있고 여기서는 username~~~
                            first_name = firstname,
                            last_name = lastname,
                            password = password) #create_user는 save까지 한번에 해준다.
            auth.login(request, user) #로그아웃 할때까지 로그인상태 유지. 세션이란 기술이 쓰이는데 login()함수는 그것까지 알아서 해준다. user는 로그인한 유저가 누구인지 정보를 보관한다. 바로 위에 27번째 라인에서 생성한 변수다.
            return redirect("account:index")
    return render(request, 'register.html', res_data)


def login(request):
    if request.method == "POST":
        useremail = request.POST.get('useremail', None)
        password = request.POST.get('password', None)
        user = auth.authenticate(username=useremail, password=password) #여기서 왼쪽의 빨간색으로 되어있는 username, password가 HeidiSQL에서 auth_user 테이블의 속성명이고 오른쪽의 useremail, password는 바로 위에 38, 39번째 라인에서 생성한 것으로 보인다.
        #print("***", user.date_joined)
        if user is not None :
            auth.login(request, user) #로그아웃 할때까지 로그인상태 유지. user는 로그인한 유저가 누구인지 정보를 보관한다. 바로 위에 40번째 라인에서 생성한 변수다.
            return redirect("account:index")
        else :
            return render(request, 'login.html', {'error': '사용자 아이디 또는 패스워드가 틀립니다.'})
    else :
        return render(request, 'login.html')

def logout(request):
    if request.user.is_authenticated:
        auth.logout(request)
    return redirect("account:index")

def only_member(request) :
    context = None
    if request.user.is_authenticated:
        context = {'logineduser': request.user.last_name+request.user.first_name}
    return render(request, 'member.html', context)

