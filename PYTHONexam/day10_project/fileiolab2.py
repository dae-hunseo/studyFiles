try:
    f = open("yesterday.txt", "rt", encoding="UTF-8") #fileiotest4.py 참고 #만약 없는 파일을 읽어오려면 값을 가져오지 못함.
except FileNotFoundError:
    print('파일을 읽을 수 없어요')
else:
    text = f.read().lower()
    c = text.count('yesterday') #그냥 if 'yesterday' in text or 'Yesterday' in text: 로 하고 밑에 코드블록으로 c+=1으로 무식하게 해도 됨.
    print("Number of a Word 'Yesterday': {}".format(c))
finally:
    print("수행완료!!")
    try:
        f.close() #만약 f라는 변수가 제대로 만들어지지 못해(없는 파일을 open으로 열려고 했다던지) 닫는동안 에러가 발생한다면
    except NameError: #이렇게 해주기 귀찮으면 코드 맨 처음에 f = None으로 생성하고 try문에서 open으로 데이터를 받는 방법도 가능.
        pass #특별히 줄 게 없는 경우 그냥 지나가게 함.
    # 아니면
    # if f:
        # f.close()로 해주면 f가 값이 없으면 이 코드가 실행되지 않게 됨.