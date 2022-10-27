from MyError import NoNegativeNumberError   #NoNegativeNumberError를 쓰기 위한 코드

def set_age(age):
    if age < 0:  #나이가 음의 값이면 에러 발생
        raise NoNegativeNumberError("노노") #여기오는 객체는 에러 클래스여야 함.
    else:
        print(f"당신의 나이는 {age}이군요!!")

try:
    set_age(int(input("나이를 입력하세요 : "))) #함수 호출을 중첩해서 3개를 하고 있음.
except NoNegativeNumberError as e:
    print(e)
except :
    print("숫자만!!")
finally:
    print("종료합니다.")