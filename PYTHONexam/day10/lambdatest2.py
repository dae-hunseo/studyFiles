func1 = lambda n1, n2 : n1 + n2

print(func1(10, 20))
result = func1(100, 200)
print(result)
print()
func2 = lambda s: len(s)
print(func2('simple'))
print()
func3 = lambda : print("no argument, no return")
print(func3())
print()
func4 = lambda p1, p2, p3 : print(p1, p2, p3)
print(func4(10, 20, 30))
print()
func5 = lambda *p : sum(p)
print(func5(1,2,3,4,5))
print(func5(11,22))


