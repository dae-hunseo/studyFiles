f = open("live.txt", "wt", encoding="UTF-8")  #없던 live.txt 파일을 생성해서 내용을 삽입함.
print(f, type(f))
f.write("""삶이 그대를 속일지라도
슬퍼하거나 노하지 말라!
우울한 날들을 견디면
믿으라, 기쁨의 날이 오리니""")
f.close()




