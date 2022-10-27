def print_triangle2(n):
    if n<1 or n>10:
        return
    else:
        for i in range(n,0,-1):
            print('*'*i)

num = int(input("1부터 10사이를 입력하시오:"))
print_triangle2(num)