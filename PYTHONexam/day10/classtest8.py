class Human:
    def __init__(self, age, name):
        self.age = age #매개변수에서 값을 넘겨받아 멤버 변수를 초기화한다.
        self.name = name #매개변수에서 값을 넘겨받아 멤버 변수를 초기화한다.

    def intro(self):
        print(str(self.age) + "살 " + self.name + "입니다")

    def eat(self):
        print("밥을 먹는다")


class Student(Human):
    def __init__(self, age, name, stunum):
        super().__init__(age, name) #조상에 있는 생성자를 호출함.
        self.stunum = stunum  #이건 Student 클래스에서 새로 만들어진 멤버 변수가 된다.

    def intro(self):   # 메서드 오버라이딩 #부모 클래스의 intro 메소드를 재정의함.
        super().intro() #조상에 있는 intro 함수를 호출함.
        print("학번 : " + str(self.stunum))

    def study(self):
        print("하늘천 따지 검을현 누를황")


kim = Human(29, "김상형")
kim.intro()
kim.eat()
print("-*-"*10)
lee = Student(34, "이승우", 930011)
lee.intro()
lee.study()
lee.eat()

print(lee.stunum)
print(lee.name)
print(lee.age)