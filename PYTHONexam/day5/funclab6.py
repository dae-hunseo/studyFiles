import random


def differtwovalue(n1, n2):
    if n1<n2:
        return n2-n1
    elif n1>n2: #그냥 else로 하고 밑에 else문은 처리 안 해도 됨. 즉 n1>=n2일때 n1-n2해도 0이 나오기 때문.
        return n1-n2
    else:
        return 0

for _ in range(5):
    num1 = random.randint(1, 30)
    num2 = random.randint(1, 30)
    print("X와 Y의 차는", differtwovalue(num1, num2), "입니다")#print("{}와 {}의 차는 {}입니다.".format(num1, num2, differtwovalue1(num1, num2)))