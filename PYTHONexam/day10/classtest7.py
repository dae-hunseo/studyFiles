class Human:
    def __init__(self, age, name):
        self.age = age
        self.name = name
    def intro(self):
        print(str(self.age) + "살 " + self.name + "입니다.")

kim = Human(29, "김상형")
kim.intro()
kim.name = '김정현' #name변수 값이 김상형에서 김정현으로 바뀌는 순간
print(kim.name)
kim.intro()
lee = Human(45, "이승우")
lee.intro()
