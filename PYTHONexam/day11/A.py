import time
import datetime
print(__name__ +"모듈 : "+ str(datetime.datetime.now())) #name은 main(어떤 파이썬 소스든간에 파이썬 인터프리터에게 직접 전달해 수행하면 수행하는 동안은 main이라는 이름으로 바뀐다.)
time.sleep(3) #3초 delay
import B    #B.py를 import
time.sleep(3) #3초 delay
import C    #C.py를 import
time.sleep(3) #3초 delay
import D    #D.py를 import
time.sleep(3)
print(__name__ +"모듈 : "+ str(datetime.datetime.now())) #하지만 다른 소스파일을 import해서 쓰면 그 파일의 name이 나온다.

