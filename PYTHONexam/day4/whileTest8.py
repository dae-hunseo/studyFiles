import random
money = 1000
print("<<<현재 용돈은 ", money, "원입니다.~~ 소비시작>>>")
while True :
    pay = random.randint(100, 300)
    if money > pay:
        money -= pay
        print(pay, "를 소비합니다.(ㅎㅎ)")
    else:
        print("현재 용돈은 ", money, "원이므로", pay, "원 만큼의 소비는 불가합니다.(ㅜㅜ)")
    if money < 100:
        print("현재 용돈은 ", money, "원이라서 더이상 소비는 불가합니다.(ㅜㅜ)")
        break
    print("현재 용돈은 ", money, "원입니다.")
