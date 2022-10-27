class NoNegativeNumberError(Exception) : #Exception이라는 파이썬의 내장 클래스를 상속받아 나만의 클래스를 생성할 수 있다.
    def __init__(self, msg):
        super().__init__("내가 만든 에러당  : " +msg)
         #에러메시지는 에러 메세지를 잘 출력하게만 만들면 된다. #이름만 봐도 예측해볼 수 있게 지어야 한다.
         #파이썬에 원래 있던 것은 builtin 에러클래스
        #사용자가 만드는 것은 personal 에러클래스