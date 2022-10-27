print("[ 영문 대문자의 코드값 ]")
for munja in range(65, 91) : #아스키코드 'A'부터 'Z까지
    print(munja, hex(munja), bin(munja), chr(munja)) #아스키코드값10진수, 16진수, 2진수, 문자

print("[ 영문 소문자의 코드값 ]") #아스키 코드 'a'부터 'z까지
for munja in range(97, 123) :
    print(munja, hex(munja), bin(munja), chr(munja))

print("[ 일부 한글 문자들의 코드값 ]")
for munja in range(44032, 44040) : #한글은 아스키코드에서 가~힣까지 되어있고 여기서는 갇에서 끊음
    print(munja, hex(munja), bin(munja), chr(munja)) #한글은 3byte라 바이트값이 좀 큼
