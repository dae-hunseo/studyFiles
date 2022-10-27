while True:
    sum = 1
    num = int(input("입력값:"))
    if num == 0 :
        print("종료")
        break
    elif num<-10 or num>10 :
        continue
    elif num>0 :
        print("입력값 :",num)
        # for i in range(1, num):
        #     sum *= i
        # print(sum)
    else: #num<0
        num *= -1
        print("입력값(부호변경):",num)
    for i in range(1, num): #elif num>0이나 else문 실행 후 실행하는 구문
        sum *= i
    print(sum)
