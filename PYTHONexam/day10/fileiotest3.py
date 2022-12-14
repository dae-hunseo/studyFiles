f = open("live.txt", "rt", encoding="UTF-8")
while True:
    text = f.read(10) # 10문자씩 읽기
    if len(text) == 0: break
    print(text, end = '$')
f.close()
print("\n"+"-"*20)

f = open("live.txt", "rt", encoding="UTF-8")
text = ""
line = 1
while True:
    print(f.tell()) #tell은 현재 위치
    row = f.readline() # 한 행씩 읽기
    if not row: break
    text += str(line) + " : " + row
    line += 1
f.close()
print(text)
print("\n"+"-"*20)

f = open("live.txt", "rt", encoding="UTF-8")
rows = f.readlines()  # 모든 행을 읽어서 리스트로 리턴
print(type(rows))
for row in rows:
    print(row, end = '')
f.close()

print("\n"+"-"*20)
f = open("live.txt", "rt", encoding="UTF-8")
for line in f:        # _io.TextIOWrapper 객체도 이터러블함.  그래서 f를 in 뒤에 올 수 있따다.
    print(line, end = '')
f.close()
