import random

#CASE 1
s1 = set()
s2 = set()
while len(s1)<=10: #len(set1) != 10
    s1.add(random.randint(1, 20))
while len(s2)<=10:
    s2.add(random.randint(1, 20))
print("집합1: ", s1)
print("집합2: ", s2)
print("두 집합에 모두 있는 데이터: ", s1.intersection(s2)) # s1&s2
print("집합 1 또는 집합2에 있는 데이터:", s1.symmetric_difference(s2) )
print("집합 1에는 있고 집합2에는 없는 데이터: ", s1.difference(s2))
print("집합 2에는 있고 집합1에는 없는 데이터:", s2.difference(s1))
print("집합1과 집합2가 각자 가지고 있는 데이터", s1.symmetric_difference(s2))

#CASE 2
set1 = set(random.sample(range(1, 21),10)) #range함수는 end값은 비포함
set2 = set(random.sample(range(1, 21),10))

print(set1)
print(set2)

print(set | set2)

