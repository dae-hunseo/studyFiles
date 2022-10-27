# =============== listdir  =============== c:\\Temp 디렉토리 만들고
import os

files = os.listdir("c:\sdh\PYTHONexam")  # \\, \, / 는 디렉토리 구분자 #파일경로에 이니셜명 수정(했음)
print(type(files))
for f in files:
    print(f)

# =============== listdir2  ===============
print("-+"*20)
import os

def dumpdir(path):
    files = os.listdir(path)
    for f in files:
        fullpath = path + "\\" + f
        if os.path.isdir(fullpath):
            print("[" + fullpath + "]")
            dumpdir(fullpath)
        else: # 디렉터리가 아니면 파일명만 출력
            print("\t" + fullpath)

dumpdir("c:\kjh\PYTHONexam")
