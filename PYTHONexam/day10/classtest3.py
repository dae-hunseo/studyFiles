class Student :
   '''
   학생 객체를 생성할 수 있는 Student 클래스입니다.
   인스턴스 생성시에는 학생의 이름, 나이, 과목명을 전달하세요.
   '''
   def __init__(self, name, age, subject): #self 대신 다른 것 써도 됨. 다만 self라고 하는 계 관례적임
       self.name = name
       self.age = age
       self.subject = subject

   def printStudentInfo(self):  #self 대신 다른 것 써도 됨. #self는 자바의 this
       '''학생 정보 출력'''
       print("{}의 나이는 {}세입니다.".format(self.name, self.age)) # this

   def study(self):             #self 대신 다른 것 써도 됨.
       '''학습하는 과목 출력'''
       print("{} 학생은 {} 과목을 학습합니다.".format(self.name, self.subject))


st1 = Student("둘리", 10, "파이썬") #생성된 객체의 참조값을 st12, st2, st3에 저장함.
st2 = Student("도우너", 12, "자바")
st3 = Student("또치", 10, "자바스크립트")

st1.printStudentInfo()
st2.printStudentInfo()
st3.printStudentInfo()

st1.study()
st2.study()
st3.study()

print("\n[ st2=st1 과 st3=st1 연산 수행 ]")
st2 = st1
st3 = st1

st1.printStudentInfo()
st2.printStudentInfo()
st3.printStudentInfo()

help(Student) #클래스에 대한 도움말이 뜬다. Help on class Student in module __main__:에서 원래는 Python의 classtest3여야 하는데 인터프리터가 언어를 해석하는동안은  main이 메인 모듈로 나온다.
#파이썬은 클래스를 만들 때 class 클래스명(부모클래스명):을 준다. 원래 있었던 부모 클래스를 상속받겠다는 뜻으로. 그런데 이게 생략되면 자동으로 부모 클래스가 ~~~(출력 내용 참고(으로 된다.
# 멤버 변수를 생성자의 인자로 전달해주는 건 init 생성자 함수의 인자로 정해준다. 그리고 객체를 생성할때 넘겨주는 인자는 init 함수의 인자로 전달되는 듯 하다.

