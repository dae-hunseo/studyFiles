class Student:
    # 클래스 변수
    count = 0
    students = []

    # 클래스 메서드
    @classmethod
    def print(cls):
        print("------ 학생 목록 ------")
        print("이름\t\t총점\t평균")
        for student in cls.students:
            print(str(student))
        print("------- ------- -------")

    # 초기화 메서드
    def __init__(self, name, korean, math, english, science):
        self.name = name
        self.korean = korean
        self.math = math
        self.english = english
        self.science = science
        Student.count += 1
        Student.students.append(self) #클래스 멤버 변수에다가 클래스이름.클래스멤버변수.내장함수(self)로 값을 준다.

    # 인스턴스 메서드
    def get_sum(self):
        return self.korean + self.math + \
               self.english + self.science

    # 인스턴스 메서드
    def get_average(self):
        return self.get_sum() / 4

    # 인스턴스 메서드 : 오버라이딩
    def __str__(self):
        return "{}\t\t{}\t\t{}".format(\
            self.name,\
            self.get_sum(),\
            self.get_average()) #포맷함수에다가 1열로 나란히 나열해놓으면 가독성이 좋지않아 엔터키로 떨어트려 놓음.

Student.print()

# 학생 객체들 생성
Student("윤인성", 87, 98, 88, 95)
Student("연하진", 92, 98, 96, 98)
Student("구지연", 76, 96, 94, 90)
Student("나선주", 98, 92, 96, 92)
Student("윤아린", 95, 98, 98, 98)
Student("윤명월", 64, 88, 92, 92)
Student("김미화", 82, 86, 98, 88)
Student("김연화", 88, 74, 78, 92)
Student("박아현", 97, 92, 88, 95)
Student("서준서", 45, 52, 72, 78)

# 현재 생성된 학생을 모두 출력
Student.print()
