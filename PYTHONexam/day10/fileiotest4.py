# =============== append  ===============
f = open("live.txt", "at", encoding="UTF-8") #at: Append Text
f.write("\n\n[추가]푸쉬킨 형님의 말씀이었습니다.")
f.close()

# =============== withas  ===============
with open("live.txt", "rt", encoding="UTF-8") as f: #rt: Read Text
   text = f.read()
print(text)


help(open)
