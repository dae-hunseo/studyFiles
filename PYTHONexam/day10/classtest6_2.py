class SelfTest:
    def __init__(self):
        print("생성자 호출시 self 변수에 전달되는 값 :", self)
    def m1(self):
        print("m1() 호출시 self 변수에 전달되는 값 :", self)
    def m2(self):
        print("m2() 호출시 self 변수에 전달되는 값 :", self)

obj1 = SelfTest()
print("obj1이 참조하는 객체 : " + str(obj1)) #쉼표가 아닌 +연산자를 사용했으므로 str 타입으로 obj1을 바꿔줬다.
obj1.m1()
obj1.m2()
print("-"*70)
obj2 = SelfTest()
print("obj2이 참조하는 객체 : "+str(obj2))
obj2.m1()
obj2.m2()


