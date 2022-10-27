def add(num1, num2) :
    return num1 + num2

r1 = add(10, 20)
v1 = 100; v2 = 200 #2개의 코드를 한 줄에 작성할때 세미콜론 삽입
r2 = add(v1, v2)
print(r1)
print(r2)
print(add(10, 30))
print(bool(add(1000, 2000)))#bool()은 0이 아니면 True
# case1
print(1+add(1000, 2000))
print(2+add(1000, 2000))
print(3+add(1000, 2000)) #Fase는 0이고, True는 1가 됨.
# case2 #case1보다 case2가 더 나음(자주 쓰는 코드는 함수로 등록해서 함수를 호출만함.)
r3 = add(1000, 2000)
print(1+r3)
print(2+r3)
print(3+r3)
print()
print(add(1000, 2000))
print(bool(add(1000, 2000)))
print(1+bool(add(1000, 2000)))

print(bool(True())) #리턴값이 True나 False가 아니먼
print(bool("1bc"))
print("abc")
