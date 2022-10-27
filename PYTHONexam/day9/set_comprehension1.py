a = {i for i in range(1, 101) if i % 3 == 0} #3의 배수
b = {i for i in range(1, 101) if i % 5 == 0} #5의 배수

print(a)
print(b)
print(a & b)

listv = [dan * num for dan in range(1, 10) for num in range(1, 10)] #dan이 1일때 num이 1~10, dan이 2일때 num이 1~10 이렇게 2중 포문이 실행됨.
setv =  { dan * num for dan in range(1, 10) for num in range(1, 10)} #list와 set의 차이에 의해 element 수가 달라짐.(set은 같은 엘리먼트(중복)은 사라짐.

print(listv)
print(setv)