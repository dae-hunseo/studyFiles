f = open("live_ansi.txt", "wt") #UTF-8을 설정하지 않음. #그래서 없던 파일이 생성되는데 파이참에선 깨져서 보임. 메모장으로 파일을 열면 내용이 잘 보임 #파이참은 UTF8만 인식함.
print(f, type(f)) #디폴트 encoding=cp949로 보이는데 fileiotest1.py에서 UTF-8로 생성한 live.txt와 내용은 같지만 코드 값이 다르다. #영문은 utf-8이든 encoding 949든 코드값이 똑같고 깨지지 않는다.
f.write("""삶이 그대를 속일지라도
슬퍼하거나 노하지 말라!
우울한 날들을 견디면
믿으라, 기쁨의 날이 오리니""")
f.close()