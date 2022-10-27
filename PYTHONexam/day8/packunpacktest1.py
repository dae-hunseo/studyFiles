# 괄호가 없는 튜플
tuple_test = 10, 20, 30, 40 # 나열된 값을 튜플로 패킹하여 대입함
print("# 괄호가 없는 튜플의 값과 자료형 출력")
print("tuple_test:", tuple_test)
print("type(tuple_test):", type(tuple_test))
print()

a, b, c = 10, 20, 30 # 나열된 값을 튜플로 패킹한 후에 언패킹하여 각각의 변수에 대입함
print("# 괄호가 없는 튜플을 활용한 할당")
print("a:", a)
print("b:", b)
print("c:", c)

'''a, b, c = 10, 20, 30, 40 # 나열된 값을 튜플로 패킹한 후에 언패킹하여 각각의 변수에 대입함
print("a:", a)
print("b:", b)
print("c:", c)'''

a, *b, c = 10, 20, 30, 40 # 나열된 값을 튜플로 패킹한 후에 언패킹하여 각각의 변수에 대입함
print("# 괄호가 없는 튜플을 활용한 할당")
print("a:", a)
print("b:", b)
print("c:", c)
