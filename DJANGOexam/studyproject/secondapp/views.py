from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
import random
from datetime import datetime
#10-5
from django.http import JsonResponse

def exam1(request):
    template = loader.get_template('exam1.html')
    return HttpResponse(template.render(None, request)) #render()로 리턴하는 것과 거의 같음.

def exam2(request) :    #아래 10번째 코드는 name이라는 변수(혹은 key?)가 없으면 '유니코'를 리턴. #HttpRequest 객체를 request라는 변수에 담아서 가져오겠다. 즉 변수이름은 다른걸로 해도 됨. #장고 강의교안_2.pdf 참고
    name = request.GET.get('name', "유니코") #request라는 변수에는 HTTPREQUEST 변수가 전달된다. 그 안에 GET이라는 속성이 있는데 그게 뭐냐하면 딕셔너리다. 그 딕셔너리 안에 뭐가 들어가있냐하면 클라이언트에서 전송된 name=value가 있다.
    context = {'result' : name}             #우리가 전달하는 쿼리 문자열은 몇 쌍을 전달하든 다 딕셔너리로 전달된다. URL문자열?n1=v1&n2=v2이렇게 있을때 key=value쌍으로 들어간다.
    return render(request, 'exam2.html', context) #HttpResponse()로 리턴하는 것과 거의 같음. HttpResponse를 리턴하는 것보다 render 함수를 리턴하는 것이 더 일반적임.
    #exam2.html에게 전달하고자 하는 것을 3번째 arugment로 넘겨주면 exam2.html에게 전달된다. context의 key가 'result'인 것을 exam2.html에서 사용한다.
def exam3(request) :
    context = {'number' : 5, "food" : "샌드위치"}
    return render(request, 'exam3.html', context)   #context를 render의 3번째 인자로 줘서 exam3.html에게 넘겨준다. #exam3.html 열어볼 것.

def exam4(request) :
    context = {'numbers':[1,2,3,4,5,6]}
    return render(request, 'exam4.html', context)
    #return render(request, 'exam4_1.html', context)

def exam5(request) :
    name = request.GET.get('name', "게스트")
    address = request.GET.get('address', "작성안함")
    context = { 'name':name, 'address':address }
    return render(request, 'exam5.html', context)

def exam6(request) :
    if request.method == 'POST':
        num = int(request.POST['number'])
        context = { 'num' : num*num }
    else :
        context = None
    return render(request, 'exam6.html', context)

# 테스트 전에 dir 설정할것
def exam7(request):
    foods = ['족발', '햄버거', '치킨', '초밥']
    pick = random.choice(foods)
    context = {
        'pick': pick,
    }
    return render(request, 'exam7.html', context)

def exam8(request) :
    query = 'q' in request.GET #만약 q = ***이런 방식을 해줬다면 query에는 True가 들어감.
    if query :  #query 가 True면 실행
        result = request.GET['q']   # GET과 POST 차이를 생각하자.
    else:
        result = 'q=xxx 형식으로 쿼리를 보내지 않았슈'
    context = {
        'result': result,
    }
    return render(request, 'exam8.html', context)

def exam9(request):
    context = None
    foodstr = ""
    if request.method == 'POST': #요청방식이 POST이면 수행
        foods = request.POST.getlist("food", "없음") #getlist는 여러개의 데이터를 받을 때 리스트로 만들어서 리턴한다. #exam9.html의 name이 food인 체크박스들은 여러개를 동시에 선택할 수 있기 때문
        for f in foods :
            foodstr += f+" "
        fcolor = request.POST.get("fcolor", "없음")
        year = request.POST.get("year", "없음")
        memo = request.POST.get("memo", "없음")
        birth = request.POST.get("birth", "없음")
        context = {
            'info': {
                'info1' : foodstr,
                'info2': fcolor,
                'info3': year,
                'info4': memo,
                'info5': birth,
            }
        } # 요청방식이 POST가 아니면 바로 return문 수행.
    return render(request, 'exam9.html', context) # 만약 위의 if문이 수행되지 않았다면 context의 값은 None

def exam10(request, name):
    context = {
        'name': name,
    }
    return render(request, 'exam10.html', context)


def exam11(request, name, age):
    context = {
        'name': name,
        'age': age,
    }
    return render(request, 'exam11.html', context)


def exam12(request, num1, num2):
    result = num1 * num2
    context = {
        'num1': num1,
        'num2': num2,
        'result': result,
    }
    return render(request, 'exam12.html', context)


def exam13(request):
    foods = ['짜장면', '초밥', '차돌짬뽕', '콩국수']
    empty_list = []
    messages = 'Life is short, You need Python'
    datetime_now = datetime.now()
    #print("datetime_now 변수에 할당된 객체의 타입 : ", type(datetime_now())) #이건 브라우저에 출력되는게 아닌 파이참의 Terminal에 출력된다.
    context = {
        'foods': foods,
        'empty_list': empty_list,
        'messages': messages,
        'datetime_now': datetime_now,
    }
    return render(request, 'exam13.html', context)


def exam14(request, word, num1, num2): #word, num1, num2는 주소창에서 전달받는다.
    if word == '올라프1':
        result = True
    else:
        result = False
    context = {
        'result': result,
        'num1' : num1,
        'num2' : float(num2),   #float로 형변환을 해준다.
    }
    return render(request, 'exam14.html', context)  #exam14.html을 호출
    #return render(request, 'exam14_1.html', context) #exam14_1.html을 호출

def exam15(request):
    return render(request, 'exam15.html')   #수행하는 코드가 없더라도 어떤 html이 랜더링 되도록 하겠다는 뷰 함수를 정의해야한다.


def exam16(request):
    print(request.GET.get('message'))
    msg_list = ['안녕', '방가방가', '하이']
    message = request.GET.get('message')
    context = {
        'message': message,
        'msg_list': msg_list,
    }
    return render(request, 'exam16.html', context)


def exam17(request):
    return render(request, 'exam17.html')


def exam18(request):
    name = request.GET.get('name')
    numbers = range(1, 46)
    pick = sorted(random.sample(numbers, 6))
    context = {
        'name': name,
        'pick': pick,
    }
    return render(request, 'exam18.html', context)

def exam19(request) :
    dt = datetime.now()
    context = {'current_date' : dt}
    return render(request, 'exam19.html', context)

#10-5
def query_form_get(request):
    return render(request, "queryinput.html", {"mymethod" : "GET"})     #딕셔너리 객체를 보내지말고 그냥 바로 딕셔너리를 리턴함

def query_form_post(request):
    return render(request, "queryinput.html", {"mymethod" : "POST"})    #2개의 뷰 함수가 같은 html 파일을 공유하고 있다.

def querystring_processing(request):
    context = None
    if request.method == 'POST':    #요청방식이 뭔지 체크. GET인가 POST인가
        queryinput = request.POST
    else :
        queryinput = request.GET
    gname =  queryinput.get("guestname") if queryinput.get("guestname") != "" else "이름이 입력되지 않음" #이게 한 줄에 다 작성된 이유가 있을 것이다. 만약 null이 아니면 else문이 gname 변수에 대입되는 것으로 보인다.
    ghobby = queryinput.getlist("guesthobby", []) #getlist를 해줘야 전달된 모든 데이터를 리스트로 전달받게함.
    gcolor = queryinput.get("guestcolor", "yellow")
    gmemo = queryinput.get("guestmemo") if queryinput.get("guestmemo") != "" else "입력된 메모가 없음" #이게 한 줄에 다 작성된 이유가 있을 것이다. 만약 null이 아니면 else문이 gmemo 변수에 대입되는 것으로 보인다.
    context = {
      'gname' : gname,
      'ghobby': ghobby,
      'gcolor': gcolor,
      'gmemo': gmemo,
    }
    return render(request, 'queryoutput.html', context)


def exam20(request):
    return render(request, 'exam20.html')

def exam21(request):
    return render(request, 'exam21.html')

def exam22(request):
    return render(request, 'exam22.html')


from django.http import HttpResponse
import urllib.request
def exam22_1(request):
    httpres = urllib.request.urlopen("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D&strSrch=360")
    content = httpres.read().decode("utf-8")
    print(content)
    return HttpResponse(content, "text/plain")

def exam23(request):
    return render(request, 'exam23.html')

def exam24(request):
    return render(request, 'exam24.html')

def exam25(request):
    return render(request, 'exam25.html')

def json1(request): #exam20에서 호출함
    return JsonResponse({
        'message' : '안녕 파이썬 장고',
        'items' : ['가나다', '파이썬', '장고', '자바스크립트', 'CSS3'],
        'num' : 100
    }, json_dumps_params={'ensure_ascii':False})    #json_dumps_params={'ensure_ascii':False}는 한글이 들어갔을때 아스키코드만 리턴된다고 생각하지 말라는 코드를 넣어줘야 한다.

def json2(request): #exam21에서 호출함
    return JsonResponse({ "time" : datetime.now().strftime('%H시 %M분 %S초') },
                        json_dumps_params={'ensure_ascii':False})

def ggmap1(request) :
    return render(request, "ggmap1.html", None)

def ggmap2(request) :
    return render(request, "ggmap2.html", None)

def ggmap3(request) :
    return render(request, "ggmap3.html", None)

def ggmap4(request) :
    return render(request, "ggmap4.html", None)

def ggmap5(request) :
    return render(request, "ggmap5.html", None)

def ggmap6(request) :
    lat = [37.5115, 37.5094, 37.5080, 37.5110, 37.5088]
    lng = [127.0500, 127.0503, 127.0600, 127.0590, 127.0560];
    hname = ['듀크1', '듀크2', '듀크3', '듀크4', '듀크5'];
    address = ['aaa', 'bbb', 'ccc', 'ddd', 'eee'];
    context = {
                'lat' : lat, 'lng' : lng, 'hname' : hname, 'address' : address
    }
    return render(request, "ggmap6.html", context)

def kkmap1(request) :
    return render(request, "kkmap1.html", None)

def kkmap2(request) :
    return render(request, "kkmap2.html", None)

def kkmap3(request) :
    return render(request, "kkmap3.html", None)

def kkmap4(request) :
    return render(request, "kkmap4.html", None)

def kkmap5(request) :
    return render(request, "kkmap5.html", None)

def kkmap6(request) :
    return render(request, "kkmap6.html", None)

def kkmap7(request) :
    return render(request, "kkmap7.html", None)

# Create your views here.
