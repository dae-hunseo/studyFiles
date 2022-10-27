import random

#CASE 1
set = set()
while len(set)<=6: # len(set) != 6
    set.add(random.randint(1, 45))
print(set)

#CASE 2
lan = set(random.sample(range(1,46),6))
print(f"행운의 로또번호 : {lan}")