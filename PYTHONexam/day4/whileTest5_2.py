print("3 + 4 = ?")
while True:
    a = input("정답을 입력하시오 : ")
    if a == "" :
        print("입력된 값이 없어요")
        continue
    if int(a) == 7 :
        break

print("참 잘했어요")