def print_name(num, deco) :
    for i in range(num) :
        print(deco, "유니코", deco)

print("수행시작")
print_name(1, '#')
print("-" * 10)
print_name(3, '*')
print("-" * 10)
print_name(2, '@')
print("-" * 10)
print_name(int(3.14), '%') #int(3.14) == 3
print("-" * 10)
print_name(5, '&') #앞뒤에 & 시호가 붙은 유니코를 5번 출력하게
print("수행종료")