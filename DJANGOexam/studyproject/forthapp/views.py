from django.shortcuts import render, redirect
from forthapp.models import Meeting #models.py에 있는 Metting 클래스(테이블)을 import 한다.


def c(request) :
    if request.method == 'POST' : #주소창에 입력한 정보가 안 뜸 #POST방식으로 요청하면 DB테이블에 전달된 정보를 저장한다.
        name = request.POST.get('name') #request.POST.get('name')에는 c.html에서 <input type="text" name=name">에 입력된 내용이 저장된다.
        personnel = request.POST.get('personnel')
        title = request.POST.get('title')
        meetingdate = request.POST.get('meetingdate')
        meeting = Meeting(name=name,personnel=int(personnel), title=title, meetingdate=meetingdate)
        meeting.save(); #내용을 저장하고 context 딕셔너리 만들고 return문 실행
        context = { "msg" : "저장 완료되었어용"  }
    else : #GET방식으로 요청하면 None을 전달하면서 c.html에게 렌더링을 시킨다.
        context = None
    return render(request, 'c.html', context)

def r(request, id=0) :
    if id == 0 :
        meetings = Meeting.objects.all() #여기서 모든 데이터를 가져온다.
        context = {"meetings": meetings} #얘는 mettings다. 데이터가 여러개 담겨있는 유사 리스트 객체를 리턴하기 때문에.
    else :
        try:
            meeting = Meeting.objects.get(id = id) #get메소드로 R-Value의 id에 해당하는 id(L-value)값을 하나 받겠다.
            context = {"meeting": meeting} #얘는 metting이다. 데이터가 1개만 담겨있기 때문에 이렇게 명명했다.
        except Meeting.DoesNotExist:
            context = {"msg": str(id) + '번 데이터가 없어용ㅜ'}
    return render(request, 'r.html', context)

def u(request, id) :
    if request.method == 'POST' : #주소창에 입력한 정보가 안 뜸
        meeting = Meeting.objects.get(id=id)    #업데이트할 글의 id를 반드시 받아야 하고
        meeting.name = request.POST.get('name') #업데이트할 글의 이름에 새로 바꾼 글의 이름을 대입한다.
        meeting.personnel = request.POST.get('personnel')
        meeting.title = request.POST.get('title')
        meeting.meetingdate = request.POST.get('meetingdate')
        meeting.save();
        context = { "msg" : "수정 완료되었어용"  }
    else :
        meeting = Meeting.objects.get(id=id)
        context = {"meeting": meeting}
    return render(request, 'u.html', context)

def d(request, id) : #Delete
    try :
        meeting = Meeting.objects.get(id=id) #삭제하고 싶은 모델 객체를 받아와서
        meeting.delete()                    #삭제하면 된다.
        context = {"msg": '삭제 되었어용'}
        #return redirect("R1")
    except Meeting.DoesNotExist :
        context = {"msg": str(id)+'번 데이터가 없어서 삭제하지 못했어용'}
    return render(request, 'd.html', context)


