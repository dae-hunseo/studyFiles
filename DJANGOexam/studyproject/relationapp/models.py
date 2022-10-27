from django.db import models
#10-11의 모델에릴레이션적용하기실습.pdf 4pg의 그림을 모델 클래스로 구현한 것이다.     # Location, Department, Employee 순으로 데이터를 넣어야 한다.
class Location(models.Model) : #primary_key가 따로 없어서 id속성이 자동으로 만들어짐. #부서의 지역 테이블
    locationname = models.CharField(max_length=30)
    def __str__(self):
        return  f"id={self.id}, locationname={self.locationname}"

class Department(models.Model) : #부서 테이블
    deptid = models.IntegerField(primary_key=True)
    deptname = models.CharField(max_length=30)
    location = models.OneToOneField(Location, on_delete=models.CASCADE) #참고 관계인 1대1관계. Location은 Department 안에 있어도 크게 문제가 되지 않음. #on_delete=models.CASCADE는 Location테이블에서 특정 id값이 삭제된다면 그 값을 참조한 Department 테이블의 데이터도 같이 삭제함.
    def __str__(self):
        return f"deptid={self.deptid}, deptname={self.deptname}, location={self.location}"

class Employee(models.Model) : #직원 테이블
    name = models.CharField(max_length=8)
    addr = models.CharField(max_length=20)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True) #외래키. 1대1은 OnetoOneField()를 쓴다.    #Department 테이블에서 한 것과 달리 on_delete=models.SET_NULL은 외래키가 삭제되면 그냥 null값을 주게 함. #null=True는 null값을 가질 수 있다는 뜻인듯.
    def __str__(self):
        return  f"name={self.name}, addr={self.addr}, department={self.department}"

