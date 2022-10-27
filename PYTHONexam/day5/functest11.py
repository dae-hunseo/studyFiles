def mul(a, b):
    c = a * b
    return c #c함수를 안 만들고 a*b를 직접 리턴해도 됨.

def add(a, b):
    c = a + b
    print(c)
    d = mul(a, b)
    print(d)

x = 10
y = 20
add(x, y)
print("종료")