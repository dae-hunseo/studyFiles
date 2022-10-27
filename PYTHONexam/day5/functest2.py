def a():
    pass  # 함수엔 수행문장이 하나 이상 있어야 함.. 근데 수행할 문장이 아직 없을 땐 pass 사용

def b():
    return '올라프'

def c(p):
    return p * 3

def d(p):
    if p == 1:
        return True
    else:
        return False

result1 = a()
result2 = b()
result3 = c('올라프')
result4 = c(10)
result5 = d(1)
result6 = d(2)

print(result1)
print(result2)
print(result3)
print(result4)
print(result5)
print(result6)
print('----------------------')
print(a())
print(b())
print(c('둘리'))
print(c(20))
print(c(len('abcdef')))
print(d(1))
print(d(2))

