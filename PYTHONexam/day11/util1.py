INCH = 2.54 #전역변수

def calcsum(n): #함수
    sum = 0
    for num in range(n + 1):
        sum += num
    return sum

print("인치 =", INCH)         #다른 애한테 import될때나 단독으로 수행될때 둘 다 수행
print("합계 =", calcsum(10))  #다른 애한테 import될때나 단독으로 수행될때 둘 다 수행