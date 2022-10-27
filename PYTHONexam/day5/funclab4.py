def print_triangle1(n):
    if n<1 or n>10:
        return
    else: #그냥 if n>=1 and n <= 10으로 하고 1미만 10초과일때에 대해서는 코드가 없게 할 수도 있음(else문을 안 할 수도 있음)
        for i in range(0,n):
            print('*'*(i+1))

num = int(input("1부터 10사이를 입력하시오:"))
print_triangle1(num)