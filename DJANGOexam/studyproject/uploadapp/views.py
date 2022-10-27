from django.shortcuts import render
from .models import Upload


def fileupload(request) : #localhost:8000/uploadapp/upload/
    context = None
    if request.method == 'POST' :
        upload = Upload(title = request.POST['title'], content=request.POST['content'], photo=request.FILES['photo']) #Upload는 models.py에 있는 모델 클래스의 이름이다.
        upload.save() #파일을 저장한다.
        context = {"upload" : upload}

    return render(request, "fileupload.html", context)

def fileuploadmulti(request) : #localhost:8000/uploadapp/uploadmulti/
    context = None
    uploadlist = [] #비어있는 리스트. 이걸 html 파일에 넘겨준다.
    if request.method == 'POST' :
        photolist = request.FILES.getlist("multiphoto") #파일을 여러개 업로드 하기 때문에 리스트로 만들어서 photolist 변수에 저장한다.
        for num, data in enumerate(photolist) :
            upload = Upload(title=f"title{num}", content=f"content{num}", photo=data) #Upload는 models.py에 있는 모델 클래스의 이름이다.
            upload.save()
            uploadlist.append(upload)
        context = {"uploadlist" : uploadlist}

    return render(request, "fileuploadmulti.html", context)
