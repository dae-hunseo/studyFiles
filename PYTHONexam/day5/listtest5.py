surname = ['김', '이', '박', '최', '강', '윤', '장', '임', '오']
import random
for x in range(20):
    print(random.choice(surname) + '서방')

newlist = []
for _ in range(10):
    newlist.append(random.choice(surname) + '서방')
print(newlist)



