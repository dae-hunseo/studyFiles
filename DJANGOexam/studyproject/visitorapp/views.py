from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from django.http import  JsonResponse
from .models import Visitor, Reply

def v_create(request) : #방명록 작성 함수
        name = request.POST['name']
        memo = request.POST['memo']
        vdata = Visitor(name=name, memo=memo)
        vdata.save()
        return redirect("vR") #render와 redirect는 차이가 있다. redirect는 다시 요청해라는 뜻이다. #vR이라는 이름으로 등록되어있는 뷰함수한테 리턴해라. urls.py에 가보면 path("visitorR/", views.v_read, name="vR") 라고 되어있음.
#redirect()는 장고강의교안_3.pdf의 11pg 주석을 참고.
def v_read(request) :
    page = request.GET.get('page', 1)
    vlist = Visitor.objects.all()
    paginator = Paginator(vlist, 3)
    #print(paginator)
    vlistpage = paginator.get_page(page)
    #print(type(vlistpage))
    #for d in vlistpage :
    #    print(type(d), d)
    context = {"vlist": vlistpage}
    return render(request, 'visitor_crud.html', context)

def v_update(request):
    if request.method == "POST" :
        pk = request.GET.get("pk") #pk란, 데이터베이스에서 각각의 레코드를 식별하는 기본키 (Primary Key)이다. 다시 말해, 게시물 각각의 고유 번호가 된다. 구글에 "views.py pk 뜻" 검색 #https://iamthejiheee.tistory.com/61
        visitor = Visitor.objects.get(pk=pk)
        visitor.name = request.POST['name']
        visitor.memo = request.POST['memo']
        visitor.save()
        return redirect("vR")
    else : #업데이트 폼을 달라는 요청을 AJAX로 요청함.
        pk = request.GET.get("pk")
        visitor = Visitor.objects.get(pk=pk)
        jsonContent = {"name" : visitor.name, "memo": visitor.memo } #name과 memo를 딕셔너리로 만들어서 JSON으로 응답(요청?)함
        return JsonResponse( jsonContent, json_dumps_params={'ensure_ascii':False})

def v_delete(request) :
    pk = request.GET['pk']
    visitor = Visitor.objects.get(pk=pk)
    visitor.delete()
    return redirect("vR")

def reply_create(request):
    content = request.GET['content']
    pk = request.GET['pk']
    visitor = Visitor.objects.get(pk=pk)  # pk=pk, id=pk
    rdata = Reply(content=content, visitor=visitor)
    rdata.save()
    return JsonResponse({"result":"success"}) #링크나 AJAX 가지고 리턴할수도 있는데 JSon으로 하는건 AJAX로 요청했을 거라는 뜻이다. result 값을 꺼내서 자바스크립트로 출력한다.


def reply_read(request):
    pk = request.GET['pk']
    rlist = []
    reply = Reply.objects.filter(visitor=pk)
    for r in reply :
        print(r)
        rlist.append(r.content)
    if len(rlist) == 0 :
        rlist = ['힝~ 아직 소중한 댓글이 없어용']
    return JsonResponse({"result": rlist})

def search1(request, name) :
    page = request.GET.get('page', 1)
    vlist = Visitor.objects.filter(name = name)
    paginator = Paginator(vlist, 3)
    vlistpage = paginator.get_page(page)
    context = {"vlist": vlistpage}
    return render(request, 'visitor_crud.html', context)

def search2(request, content):
    page = request.GET.get('page', 1)
    vlist = Visitor.objects.filter(memo__contains=content)
    paginator = Paginator(vlist, 3)
    vlistpage = paginator.get_page(page)
    context = {"vlist": vlistpage}
    return render(request, 'visitor_crud.html', context)

