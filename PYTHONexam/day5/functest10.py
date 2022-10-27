def add(num1, num2) : # 명시적으로 리턴값이 없음 --> 암시적인 리턴값은 있음 (None)
    print(num1 + num2)

# 아규먼트 : 함수를 호출할 때 소괄호에 담아서 전달하는 데이터
r1 = add(10, 20)  # 리터럴
v1 = 100; v2 = 200
r2 = add(v1, v2)  # 이미 값을 가지고 있는 변수(이미 정의(선언)된 변수
print(r1) # None
print(r2) # None
print(add(1000, 2000))  # 함수 호출식 #add함수내의 print함수(3000출력)가 실행되고 None인 리턴값을 받아 print(None)이 실행되어 3000\nNone이 실행된다.
#print(1+add(1000, 2000))  # 1 + None #add함수가 리턴값이 지정되어 있지않으므로 None 리턴
print(bool(add(1000, 2000)))  # False
print(1+bool(add(1000, 2000))) # bool(None) -> False, int(False) -> 0
#print(1+"bool") # 에러 #문자열과 숫자 덧셈은 에러남
print("1"+"bool")