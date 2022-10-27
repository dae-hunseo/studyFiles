# 코드 8-10 : 파일 열기와 쓰기, 파일 닫기의 표현
## "으뜸 파이썬", p. 488

f = open('hello.txt', 'w')  # 1) 파일을 연다. #현재 day9 디렉터리에 hello.txt 파일이 생성됨 #w는 기존 내용을 삭제하고 새로 염
f.write('Hello World!\n')     # 2) hello.txt 파일에 문자를 쓴다.
f.write('안녕 파이썬!!') #파이참에서 hello.txt를 열면 한글이 깨짐
f.close()                   # 3) 파일을 닫는다.
