# 코드 9-13 : __add__, __sub__, __str__ 특수 메소드와 연산자의 관계
## "으뜸 파이썬", p. 548

class Vector2D:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, other): #vector_add.py에서는 이걸 일반 인스턴스 메서드로 구현했는데, 그걸 연산자 함수를 오버로딩하여 구현함.
        return Vector2D(self.x + other.x, self.y + other.y)

    def __sub__(self, other):
        return Vector2D(self.x - other.x, self.y - other.y)

    def __str__(self):
        return '({}, {})'.format(self.x, self.y)

v1 = Vector2D(30, 40)
v2 = Vector2D(10, 20)

v3 = v1 + v2
print('v1 + v2 =', v3)
v4 = v1 - v2
print('v1 - v2 =', v4)
