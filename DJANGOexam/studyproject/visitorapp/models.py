from django.db import models

class Visitor(models.Model) : #필드는 총 3개 #방명록 글을 저장하는 모델 클래스
    name = models.CharField(max_length=6) #이름은 최대 4극자
    memo = models.TextField()
    writedate = models.DateTimeField(auto_now_add=True) # auto_now  #auto_now_add=True는 새로운 데이터를 추가할 때 유저가 작성한 방명록을 실제 테이블에 추가할 때 현재 시점의 시간정보를 자동으로 넣어라는 뜻이다. insert 명령을 시험하는 시점에서 시간대가 자동으로 채워진다.

    def __str__(self):
        return "main {}-{}-{}".format(self.id, self.name, self.memo)


class Reply(models.Model):  #댓글을 저장하는 모델 클래스
    content = models.CharField(max_length=80)
    visitor = models.ForeignKey(Visitor, on_delete=models.CASCADE)

    def __str__(self):
        return "replay {}-{}-{}".format(self.id, self.content, self.visitor_id)

