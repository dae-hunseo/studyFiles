from django.db import models

class Upload(models.Model):
    title = models.CharField(max_length=100) #저장되는 데이터 길이가 최대 100글자. CharField는 최대길이를 반드시 지정해줘야 한다.
    content = models.TextField()            #저장되는 데이터 길이 제한이 없는 텍스트필드
    photo = models.FileField(blank=True, upload_to="photo_%Y_%m_%d") #텍스트 파일, 이미지 파일, 압축 파일 등 파일필드는 업로드하는 파일의 타입에 제한이 없다.
    #파일필드 객체로 줬다는건 photo필드에는 파일이 저장된다는 것을 의미하는데 실제 업로드한 파일 자체가 저장되진 않고 업로드한 파일은 upload_to 정보를 기반으로 mediafiles에 저장이 된다.
    # %Y_%m_%d 형식으로 줬기 때문에 "photo_년_월_일" 형식으로 폴더가 생성되고 그 안에 파일이 저장된다.
    # 파일은 mediafiles에 저장하고 파일에 대한 path만 DB에 저장된다.