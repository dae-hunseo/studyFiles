# 코드 3-13 : and와 or 조건문의 사용법
## "으뜸 파이썬", p. 135
import random
#a = 10
a = random.randint(1, 20)
#b = 14   # 13으로 수정하면 첫 번째 조건문을 만족하지 않음
b = random.randint(1,20)
print("a =", a)
print("b =", b)
if (a % 2 == 0) and (b % 2 == 0):  # 첫 번째 조건문
    print('두 수 모두 짝수입니다.')

if (a % 2 == 0) or (b % 2 == 0):  # 두 번째 조건문
    print('두 수 중 하나 이상이 짝수입니다.')
