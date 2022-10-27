# =============== filter : 조건에 알맞는 데이터 추리기 ===============
def flunk(s):
    return s < 60

score = [ 45, 89, 72, 53, 94 ]
for s in filter(flunk, score): #flunk 함수에  score 리스트를 전달함. #filter는 어떤 조건을 만족하는 것만 추리는 개념
    print(s)

# =============== map : 모든 데이터들을 일정하게 변환하기 ===============
def half(s):
    return s / 2

score = [ 45, 89, 72, 53, 94 ]
for s in map(half, score): #map은 모든 element 값들을 내가 원하는 식으로 바꾼다. #score 원소 하나씩 half()함수에 전달되고, 리턴받는대로 map 유사 리스트 객체가 만들어진다.
    print(s, end = ', ')
print()
# =============== map2  ===============
def total(s, b):
    return s + b

score = [ 45, 89, 72, 53, 94 ]
bonus = [ 2, 3, 0, 0, 5 ]
for s in map(total, score, bonus): #total 함수의 매개변수가 2개라 score, bonus 리스트 2개를 map 함수를 통해 전달하고 리턴값을 받아 map 유사 리스트 객체가 만들어진다.
    print(s, end=", ")

help(map) #map 함수에 대한 설명 출력
