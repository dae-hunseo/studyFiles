import datetime
if __name__ == "__main__":  #C.py가 다른 파일에서 import 되어 쓰이는게 아닌 직접적으로 파이썬 인터프리터에 의해 수행되면
    print(__name__ +"모듈 : "+ str(datetime.datetime.now()))
