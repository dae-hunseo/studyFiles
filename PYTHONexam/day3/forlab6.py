even_num=0
odd_num=0

for i in range(1, 101):
    if i % 2 == 0:
        even_num += i
    else:
        odd_num += i

print("1부터 100까지의 숫자들 중에서")
print("짝수의 합은",even_num,"이고")
print("홀수의 합은",odd_num,"이다.")

print("1에서 100까지의 숫자들 중에서 \n짝수의 합은 " + str(even_num) + "이고\n홀수의 합은 " + str(odd_num)+"이다.")