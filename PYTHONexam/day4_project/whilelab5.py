while True:
    word = input("문자열 입력>>")
    wordlength = len(word)
    if wordlength == 0:
        break;
    elif wordlength < 5:
        result = "*" + word + "*"
    elif wordlength >8:
        result = "$" + word + "$"
    else: #5 <= wordlength and wordlength<=8 또는 5 <= wordlength <= 8(파이썬에서만 가능한 문법):
        continue #여기서 이게 있어야 밑에 print문을 출력하지 않음. 여기서는 필수임.
    print("유효한 입력 결과 :",result) #print("유효한 입력 결과 : {}".format(result))