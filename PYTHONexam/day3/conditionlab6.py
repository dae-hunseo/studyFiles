import random

score = random.randint(0,100)
#grade = ''
if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
elif score >= 70:
    grade = 'C'
elif score >= 60:
    grade = 'D'
else:
    grade = 'F'
print(score,"점은 ",grade,"등급입니다.",sep = '')
print("{}점은 {}등급입니다.".format(score, grade))
#중괄호 사이를 비워서 출력하겠다. 그걸 뭐로 채우느냐가 format(채워줄 내용)함수다.