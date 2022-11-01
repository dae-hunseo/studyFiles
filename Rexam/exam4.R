# 함수 정의와 활용 # R구문보충.pdf 7, 8pg 반드시 정독

func1 <- function() {
  xx <- 10   # 지역변수 #함수 내에서 선언하면 지역변수가 된다.
  yy <- 20
  return(xx*yy)
}
func1()
#yy # yy는 func1의 지역변수다.
result <- func1()
result
xx  # 오류발생 #xx는 func1의 지역변수다.


func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy)) #sum()은 합을 구하는 내장함수다. 물론 여기서는 그냥 xx+yy를 써도 됐다.
}

func2()
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  #x3 <- x+1
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  return(x+y+z)
}
func4() #각각 실행 시 어떻게 될지 예측해보고 실행해보기. #오류 발생생
func4(10,20,30)   # 60 출력
func4(x=1,y=2,z=3) #6 출력
func4(y=11,z=22,x=33) #66 출력력
func4(z=1000) #각각 실행 시 어떻게 될지 예측해보고 실행해보기. #x=100, y=200, z=1000 으로 계산

# 쉬트에 있는 함수 코드
f1 <- function() print("TEST")
f1()
r <- f1()
r

f2 <- function(num) {print("TEST"); print(num) }
f2(100)
f2()

f3<- function (p="R") print(p)
f3()
f3(p="PYTHON")
f3("java")

f4<- function (p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)
f4(p1="abc", p2=3)
f4("abc", 3) 
#f4(5) #p2에 값이 전달되지 않았다며 에러 발생 
f4(p2=5) 

f5<- function(...) { print("TEST"); data <- c(...); print(length(data))} #c()는 벡터를 만드는 함수인데 벡터는 모든 데이터의 타입이 일치해야 하므로 다른 데이터 타입이 들어오면 형변환이 된다. character>numeric>logical 순이다.
f5(10, 20, 30)
f5("abc", T, 10, 20)

f6<- function(...) {
  print("수행시작")
  data <- c(...) #c()는 벡터를 만드는 함수인데 벡터는 모든 데이터의 타입이 일치해야 하므로 다른 데이터 타입이 들어오면 형변환이 된다. character>numeric>logical 순이다.
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6()
f6(10)
f6(10,20)
f6(10,20,30)
f6(10,'abc', T, F) #다 문자열로 치환되어 전달된다.

f7<- function(...) {
  data <- c(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f7(10,20,30)
f7(10,20,'test', 30,40) #'text' 때문에 char 벡터가 된다.(숫자가 문자열로 변환된다.)

f8<- function(...) {
  data <- list(...) #리스트는 자동형변환이 일어나지 않는다.
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f8(10,20,30)
f8(10,20,"test", 30,40) #리스트는 자동형변환이 일어나지 않는다.


test1 <- function() {
  print("실험")
  print("test1호출")
}
test1()

r1 <- test1()
r1 #test1()에 리턴값이 없는데도 마지막에 출력된 값이 r1에 리턴된 것을 볼 수 있따.

test2 <- function() {
  print("test2호출")
  return()
}
test2()

r2 <- test2() #이때 NULL이 화면에 나타나지 않고 r2에 삽입된다.
r2 #이때 NULL이 화면에 나타난다.


paste0(c("R"), 1:10) #paste0()는 합친 값 사이에 띄어쓰기를 하지 않고 paste()는 합친 값 사이에 띄어쓰기를 한다. 
paste0(c("A", "B"), 1:10)


makeVector <- function(type, ...) { #맨 앞에 argument만 type 변수에 들어가고 나머지는 ...으로 들어간다.
  return(switch(EXPR=type, paste0("A", c(...)), #type변수 값이 1이면 실행
                paste0("B", c(...)),            #type변수 값이 2면 실행
                paste0("C", c(...)),            #type변수 값이 3이면 실행
                paste0("D", c(...))))           #type변수 값이 4면 실행
}

makeVector(type=1,1,2,3,4,5) #type 변수에 모든 값이 들어간다.
makeVector(2,100,200,300)    #맨 앞에 argument만 type 변수에 들어가고 나머지는 ...으로 들어간다.
makeVector(3,10,20,30,40,50,60,70,80,90) #맨 앞에 argument만 type 변수에 들어가고 나머지는 ...으로 들어간다.
makeVector(4,111,222,333,444,555) #맨 앞에 argument만 type 변수에 들어가고 나머지는 ...으로 들어간다.


#16:00 시작
v <- c(10,11,20,22,30,33)
evenodd1 <- function(p) if(p %% 2 == 0) return("even") else return("odd")
sapply(v, evenodd1) #apply()의 동생계열 함수 #첫번째 argument인 벡터v가 두번째 argument인 함수evenodd1의 매개변수로 들어간다. 결과값은 (거의)벡터로 만들어서 리턴한다.
lapply(v, evenodd1) #apply()의 동생계열 함수 #첫번째 argument인 벡터v가 두번째 argument인 함수evenodd1의 매개변수로 들어간다. 결과값은 리스트로 만들어서 리턴한다.

evenodd2 <- function(p) {
  if(p %% 2 == 0) 
    r <- "even" 
  else 
    r <- "odd"
  return(r)
}
sapply(v, evenodd2) #s는 Simple이라 간단하게 리턴하기 위해 때에 따라서는 리스트로 리턴할 때도 있다.
lapply(v, evenodd2) #l은 List라 무조건 리스트로 리턴한다.

ls() #R에서는 함수도 객체라 ls()를 하면 함수도 변수와 같이 보여준다.


# R에도 전역 변수와 지역 변수가 있당
a<-3;b<-7;c<-11 #전역변수
ft<-function(a){
  b<-a+10     
  c<<-a+10   # 전역대입연산 #함수 내에서 전역변수에 값을 저장하려는 경우 전역대입연산자(<<-)를 사용한다. 
  d<-a
  print(a);print(b);print(c);print(d) #지역변수가 우선적으로 쓰이고 지역변수가 없다면 전역변수를 쓴다. 전역변수에도 없다면 에러가 난다.
  return()  # NULL
}
print(ft(100)) #함수 내에서 print문은 지역변수 a, 지역변수b, 전역변수c, 지역변수d가 출력된다. 
print(a);print(b);print(c);print(d) #함수 밖에서는 함수 내의 지역변수를 쓸 수 없다. 그래서 print(d)는 에러가 난다.


#return() 함수와 invisible() 함수 
ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10) #invisible()이나 return()이나 비슷하다. invisible()은 화면에 내보내겠다면 지원하지 않고 변수에 담겠다고 할 때만 사용된다.
                                    #함수를 호출하고 리턴값을 변수에 담을때만 리턴값이 변수에 들어가게 한다.
ft.1(100) #return이라 화면에 값이 보인다.
ft.2(100) #return이라 화면에 값이 보인다.
ft.3(100) #invisible이라 화면에 값이 보이지 않는다.

r1 <- ft.1(1000);r1 #r1, r2, r3에는 함수의 리턴값이 저장되어 리턴값이 출력된다.
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3 #ft.3은 invisible()이지만 여기서는 변수에 리턴값을 저장해주기 때문에 리턴값을 볼 수 있다.


# sleep() 함수
testSleep <- function(second) {
  for(data in LETTERS[1:5]) { #5번 반복
    cat(data)
    Sys.sleep(second) #매개변수 값 만큼 쉬어라.
  }
}

testSleep(1) #중간중간에 1초 쉰다.
testSleep(0) #쉬는 시간이 없다.
testSleep(3) #하나 출력하고 3초를 쉰다.


# 매개변수에 전달된 데이터의 타입 채크
testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.
testParamType(100) #100은 벡터로 취급된다.
testParamType(LETTERS) #LETTERS도 벡터로 취급된다. 내장벡터이기 때문.
testParamType(data.frame()) #비어있는 데이터프레임 #데이터프레임은 리스트의 성격도 있다.
testParamType(matrix()) #비어있는 행렬 #matrix(행렬)는 2차원구조로 만들어진 배열이다.
testParamType(list())   #비어있는 리스트 #리스트는 특별한 형태의 벡터 모임이라고 보면 된다.
testParamType(array())  #비어있는 배열
testParamType(mean)     #함수 전달

#testParamType1
testParamType1 <- function(x){
  result <- NULL
  if(is.vector(x) && !is.list(x)) result <-"벡터를 전달했군요!" #is.list()는 거짓이면서 is.vector()는 참일때. #이렇게 구현해야 정확하게 벡터만 걸린다.
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!" #else if문이라 여기서 걸리면 밑에 else if문이 실행이 안 된다. 그래서 위에처럼 &&기호로 검사 안 했다.
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.....

testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){}) #function() {}는 코드가 없는 함수로 인식한다.


#testParamType2
testParamType2 <- function(x){
  result <- NULL #NULL은 객체(변수)가 비어있는 경우
  if(is.vector(x)  && !is.list(x) && is.numeric(x)) { #리스트를 걸러내기 위해 !is.list(x)를 해줘야 한다. #is.numeric(x)은 타입을 체크하는 함수다. 어떤 데이터셋이든 그 안의 데이터타입이 숫자냐를 확인하는 함수다.
    result <- sum(x)
  } else {
    stop("숫자 백터만을 원하오!!") #에러를 인위적으로 발생시킴.
  }
  return(result)
}

testParamType2(1:3)
testParamType2(list(1,2,3))
testParamType2(LETTERS)



#stop() 함수도 알고 가자
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..") #인위적으로 에러를 발생시킴.
  return(rep("테스트",x)) #rep()는 벡터를 만들어주는 함수다. 두번째 매개변수 숫자만큼 첫번째 매개변수를 반복해서 벡터를 만든다.
}

testError1(5)
testError1(0)



#warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..") #에러를 인위적으로 발생시킴.
  if(x>5){
    x <- 5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!") #콘솔창에 경고메시지를 출력한다.
  }
  return(rep("테스트",x))
}


testWarn(3) #함수를 호출해야 실행이 된다. 
testWarn(10)

test1 <-function(p){
  cat("난 수행함\n")
  testError1(-1) #267번째 라인의 함수 호출 #콘솔창에서 Show Traceback을 선택하면 stop 함수가 에러를 발생시키기전까지 어떤 경로로 흘러왔는지 보여준다.
  cat("나 수행할 까요? \n")
}
test1()

#try() 함수를 알아야 데이터 수집을 편하게 할 수 있다.
test2 <- function(p){
  cat("난 수행함\n")
  try(testError1(-1)) #예외가 발생하더라도 그건 그거대로 무시하고 계속 진행한다. 
  cat("나 수행할 까요? \n") #위 코드에서 에러가 나더라도 try()처리되어있기 때문에 이 명령도 정상적으로 실행된다.
}
test2()

testAll <-function(p){
  tryCatch({ #첫번째 중괄호는 에러나 경고가 발생할 가능성이 있는 코드 블록을 준다.
    if(p=="오류테스트"){
      testError1(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError1(2))
      print(testWarn(3))
    }
  },warning = function(w){ #그 외에 warning이라는 매개변수, #warning이 발생하면 이 블록을 실행하고
    print(w)
    cat("-.-;;\n")
  },error = function(e){ #error이라는 매개변수에 함수나 코드블록을 등록할 수 있다. #error가 발생하면 이 블록을 실행한다.
    print(e)
    cat("ㅠㅠ \n")
  },finally ={ #그리고 에러나 경고 발생 여부와 상관없이 수행된다.
    cat("오류, 경고 발생 여부에 관계없이 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")

v <- c(10, 5, 20, NA, 30) #NA는 객체는 있는데 그 안의 엘리먼트 값이 없는 거다. 반면 NULL은 객체가 비어있는 거다.
sum(v)
sum(v, na.rm=T) #NA가 있으면 NA를 없애고 연산을 한다.

f.case1 <- function(x) {
  if(is.na(x)) #x는 하나의 값인데 객체를 줬을때는 에러가 난다. 
               #for문과 같은 반복문을 써서 엘리먼트 하나하나 확인하거나 any()라는 도우미 함수를 쓴다. 353번째 라인 참고
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case1(100)
f.case1(NA)
f.case1(1:6) #에러 발생
f.case1(c(10,20,30)) #에러 발생
f.case1(c(NA, 20))   #에러 발생
f.case1(c(10, NA, 20)) #에러 발생

f.case2 <- function(x) {
  if(any(is.na(x)))  #any()는 is.na()의 매개변수가 변수든 데이터셋이든 데이터셋인 경우 그 안에 엘리먼트 값으로 NA가 있는지 확인해준다.
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA, 20))
f.case2(c(10, NA, 20))

f.case3 <- function(x) {
  if(all(is.na(x))) 
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}
f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))


#Sys.sleep(초시간) 함수
testSleep1 <- function(x) {
  for(data in 6:10) {       
    cat(data,"\n")
    if(x)
      Sys.sleep(1)
  }
  return()
}
testSleep1(FALSE)
testSleep1(TRUE)

# 가변형 인자 테스트
funcArgs1 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  for(opt in p) {
    switch(EXPR=opt,
           SUM=, Sum=, sum= print(sum(data)),
           MEAN=, Mean=, mean= print(mean(data)),
           DIFF=, Diff=, diff= print(max(data) - min(data)),
           MAX=, Max=, max= print(max(data)),
           MIN=, Min=, min= print(min(data)),
           SORT=, Sort=, sort= print(sort(data))
    )
  }
}

funcArgs1()
funcArgs1("SUM", "mean", "Min")
funcArgs1("SORT", "Sort", "sort")





# 가변형 인자 테스트
funcArgs2 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  if(is.null(p))
    print(data)
  else 
    for(opt in p) {
      switch(EXPR=opt,
             SUM=, Sum=, sum= print(sum(data)),
             MEAN=, Mean=, mean= print(mean(data)),
             DIFF=, Diff=, diff= print(max(data) - min(data)),
             MAX=, Max=, max= print(max(data)),
             MIN=, Min=, min= print(min(data)),
             SORT=, Sort=, sort= print(sort(data))
      )
    }
}

funcArgs2()
funcArgs2("SUM", "mean", "Min")
funcArgs2("SORT", "Sort", "sort")

