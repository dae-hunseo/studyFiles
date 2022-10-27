score = [ 88, 95, 70, 100, 99 ]
no = 1
for s in score:
    print(str(no) + "번 학생의 성적 :", s)
    no += 1
print("-"*50)

for no, s in enumerate(score, 1):
    print(str(no) + "번 학생의 성적 :", s)
print("-"*50)

for data in enumerate(score, 1): #score 원소와 넘버링이 튜플(data)로 묶인다. 넘버링값 1을 줘서 맨 처음을 1번째로 센다.
    print(data)
print("-"*50)

names = "둘리,고길동,희동이,마이콜,또치,도우너"
namelist = names.split(",") #split() 함수는문자열을 분리하여 리스트로 반환함.
print("정렬 전 :", namelist)
namelist.sort() #가나다 순으로 정렬됨.
print("정렬 후 :", namelist)

for num, name in enumerate(namelist) : #2번째 argument를 주지 않아 넘버링이 0부터 시작되는데 출력할때 num+1을 해줘서 1부터 출력되게 해줌.
    print(f"이름순으로 {name}는 {num+1}번입니다.")

for data in enumerate(namelist) :
    print(f"enumerate를 적용한 결과 : {data}") #namelist가 넘버링과 튜플(data)로 묶인다. 넘버링값을 주지 않아 0번째부터 시작된다.

for num, name in enumerate(namelist, 100) :
    print(f"이름순으로 {name}는 {num}번입니다.")



