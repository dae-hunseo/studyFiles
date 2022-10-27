INCH = 2.54 #전역변수

def calcsum(n): #함수
    sum = 0
    for num in range(n + 1):
        sum += num
    return sum

#print(__name__)