import os

path = "c:\sdh\WEBCLIENTexam\images" #파일 경로명 sdh로 바꿔야함.
files = os.listdir(path)
for f in files:
    if (f.find("_") != -1 and f.endswith(".png")):
        name = f[0:-4]
        ext = f[-4:]
        part = name.split("_") #이름에 '_'가 있으면 쪼갠다.
        newname = part[1].strip() + "_" + part[0].strip()+"_new" + ext
        print(newname)
