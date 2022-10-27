def myfunc1():
    return 1,10,100  # 튜플로 패킹하여 리턴함

result = myfunc1()
print(result)
print(type(result))

v1, v2, v3 = myfunc1()
print(v1)
print(v2)
print(v3)



def myfunc2():
    return [1,10,100]  # 리스트로 만들어서 리턴함

result = myfunc2()
print(result)
print(type(result))

