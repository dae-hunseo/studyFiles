INCH = 2.54

def calcsum(n):
    sum = 0
    for num in range(n + 1):
        sum += num
    return sum

if __name__ == "__main__":  #다른 파일에서 import될때는 수행되지 않음.
    print("인치 =", INCH)
    print("합계 =", calcsum(10))