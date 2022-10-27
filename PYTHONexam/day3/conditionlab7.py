num = int(input("1부터 10사이의 숫자를 입력하세요:"))
if num < 1 or num > 10:
    print("1부터 10사이의 값이 아닙니다")
elif num % 2 == 0:
    print(num,": 짝수",sep='')
else:
    print(num,": 홀수", sep='')

#if num < 1 or num > 10:
#    print("1부터 10사이의 값이 아닙니다")
#else:
#    if num % 2 == 0:
#        print(num,": 짝수",sep='')
#    else:
#         print(num,": 홀수", sep='')