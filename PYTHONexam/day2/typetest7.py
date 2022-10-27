su1 = input('숫자 1 : ') #첨부터 문자열이 아닌 int형으로 받으려면 su1 = int(input('숫자1: '))
su2 = input('숫자 2 : ') #첨부터 문자열이 아닌 int형으로 받으려면 su2 = int(input('숫자2: '))
print('변환 전....')
print(type(su1)) #문자열
print(type(su2)) #문자열
print('변환 후....')
su1 = int(su1) #문자열을 정수타입으로 변환
su2 = int(su2) #문자열을 정수타입으로 변환
print(type(su1)) #정수(int)
print(type(su2)) #정수(int)
print("\n\n\n") #줄바꿈을 4번함(빈 줄 4개)
print(su1+su2)
print(su1-su2)
print(su1*su2)
print(su1/su2)
print(su1//su2)
print(su1%su2)