num = 1
sum = 0 #새로운 변수를 만듦(초기화 했다)
#이렇게 sum을 변수명으로 만들어버리면 내장함수 sum()을 호출하지 못한다.
# 즉 내장함수와 똑같은 이름으로 변수명으로 사용하면 같은 이름의 내장함수를 호출하지 못한다.
# 내장함수명칭을 식별자, for, while같은 것들을 예악어라 부른다.
while num <= 100:
    sum += num
    num += 1
print ("sum =", sum)
print()
print()
sum = 0 #이미 있는 변수에 값을 할당함.
for num in range(1, 101) :
    sum += num
print ("sum =", sum)