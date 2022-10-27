yoil = ["월", "화", "수", "목","금", "토", "일"]
food = ["갈비탕", "순대국", "칼국수", "삼겹살"]
menu = zip(yoil, food)
print(menu, type(menu))
for y, f in menu:
    print("%s요일 메뉴 : %s" % (y, f))
print("*"*20)

print("이거는 왜 비어있을까?") #zip객체로 만든 것(menu)은 일회성이다. 첨부터 끝까지 한 번 다 읽으면 재사용 불가능하다.
for data in menu:
    print(data)
print("*"*20)

for data in zip(yoil, food):
    print(data)
print("*"*20)

print("이거는 왜 비어있을까?")
for data in menu:
    print(data)
print("*"*20)

menu = zip(yoil, food)
d2 = dict(menu) #dict()는 딕셔너리 생성함수
for y, f in d2.items():
    print("%s요일 메뉴 : %s" % (y, f))
print(d2)

print("*"*20)

zip1 = zip([1, 2, 3], [4, 5, 6])
zip2 = zip([1, 2, 3], [4, 5, 6], [7, 8, 9])
zip3 = zip("abc", "def")

print(type(zip1)) #type 함수는 첨부터 끝까지 안 읽어서 밑에서 list()로 사용 가능
print(list(zip1))
print(list(zip2))
print(list(zip3))
print("이거는 왜 비어있을까?") #zip객체는 일회성이라 재사용 불가능하다
print(dict(zip1))
print(dict(zip3))
