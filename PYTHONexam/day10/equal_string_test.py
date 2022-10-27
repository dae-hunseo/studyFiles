# 코드 9-10 : 두 개의 문자열 참조변수와 is, is not 연산
## "으뜸 파이썬", p. 545

a = 'ABC'
b = 'ABC'
if a is b:
    print('a is b')
else:
    print('a is not b')


print('='*20)
c = 'ABc'
if a is c:
    print|('a is c')
else:
    print('a is not C')

if a == c:
    print('a==c')
else:
    print(a!=c)
