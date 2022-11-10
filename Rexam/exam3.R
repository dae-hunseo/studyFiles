#R의 비교 연산자
y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)와 y의 원소값들이 같은지 각각 계산
y > 50

#R의 나눗셈 연산자
num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2
num1 %% num2
num1 %/% num2

#R의 대입 연산자
num <- 1:10 #왼쪽 대입 연산자자
num
num = 10:1
num
100:200 -> num #오른쪽 대입 연산자
num

#LIST
v<-c(1,2,3)
l<-list(1,2,3) 
class(v)
class(l)
v * 10 #벡터화 연산을 해서 각 원소마다 10을 곱함.
l * 10  #Error in l * 10 : 이항연산자에 수치가 아닌 인수입니다 #리스트는 벡터화 연산을 하지 못 한다. 벡터화연산을 하려면 unlist()함수 사용 필요함.
v
l
v[1] 
l[1] 
l[[1]] 

lds <- list(1,2,3)#아직 네임드리스트가 아닌 상태
lds
lds+100 #벡터화 연산을 지원하지 않는다.
unlist(lds) #리스트 상태를 해제하면 벡터화 연산 가능
unlist(lds)+100 #lds의 리스트 상태를 해제하고 계속 유지하는 게 아닌 1회성임.
lds[1]
lds[1]+10
lds[[1]]+10

names(lds) <- LETTERS[1:3] 
lds 
lds[[2]]
lds[["B"]]
lds$B


a<-list( # 각 엘리먼트의 이름을 부여한 namedlist.
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5)
)
a
a[1]
a[[1]] # a[["a"]]
a$a #엘리먼트들의 이름이 정해진 namedlist라 $연산자 이용 가능 
a[[1]][1]
a$a[1] #1 추출. $다음의 a는 리스트a의 엘리먼트a이다.
a[1]+1 
a[[1]]+1
a[[1]][2] <- 100 #첫번째 원소의 2번째 값에 100을 넣어라.
new_a <- unlist(a[1]) #리스트를 벡터로 해제한다. 보통 벡터화 연산을 하기 위해 사용한다.
a[1]; new_a
names(a) <- NULL #각각의 에리먼트에 대한 이름을 추출해주는데 그걸 NULL로 넣어주면 이름이 사라진다. 결국 이렇게 해서 a라는 리스트에 각각의 element마다 부여되는 이름을 해지하는 결과가 된다.
names(new_a) <- NULL #namedlist인 경우 이름을 해제시켜주고 그러면 $연산자를 사용할 수 없다.

print(100)
print(pi) #pi는 내장벡터터
data <- "가나다"
print(data)
print(data, quote=FALSE) #quoate=FALSE를 주면 문자열을 출력할 때 인용부호를 생략하고 출력한다.
v1 <- c("사과", "바나나", "포도")
print(v1)
print(v1, print.gap=10) #print.gap옵션은 내용을 출력할 때 데이터셋의 엘리먼트들 간에 띄어쓰기 얼만큼 줄 지 설정한다.
?print #print()에 대해 도움말 오른쪽 Help에 출력 #print함수는 수행 후 \n도 알아서 해준다. base 패키지에 있는 내장함수다.
#12:00 종료

#13:00 시작
cat(100) #cat은 자동줄바꿈 기능이 없어서 "\n"을 넣어줘야 한다.
cat(100,200)
cat(100,200,"\n")
cat("aaa", "bbb", "ccc", "ddd", "\n")
cat(v1, "\n")
cat(v1, sep="-", "\n") #구분자는 sep변수로 지정한다.

print(paste("R", "은 통계분석", "전용 언어입니다.")) #cat과 paste는 2개 이상의 변수를 출력할 수 있다. 반면 print()는 1개 변수만 출력 가능
cat("R", "은 통계분석", "전용 언어입니다.", "\n")

ls()
length(ls())
save(list=ls(),file="all.RData") # "all.rda" 로도 가능 #save()는 객체들을 보관하는 함수다. 벡터든 리스트든 함수든.#파일 확장자로 rda나 RData를 쓴다. #save()로 저장한 것은 바이너리 데이터로 저장된다. 즉 사람이 읽을 수 없다.
rm(list=ls()) #rm()에 삭제하고자 하는 객체정보를 지정하면 삭제한다. list라는 매개변수에 ls()를 저장하면 지금까지 저장한 모든 객체들을 전달하고 전달한 객체들은 삭제된다.
ls()
load("all.RData") #save()에서 저장된 객체의 내용들을 다시 읽어들이는 함수는 load()함수다.
ls() #rm에서 삭제했던 객체들이 save()한 객체들을 불러옴으로써 다시 나타난다. #RStudio가 종료될때는 save, 시작할때는 load를 자동으로 처리한다.

#read file data
nums <- scan("data/sample_num.txt") #scan()은 공백이나 개행문자를 기준으로 데이터를 읽어온다. 
word_ansi <- scan("data/sample_ansi.txt",what="") #what=""는 숫자도 문자로 읽을 수 있도록 설정한다. 없으면 숫자만 읽을 수 있다. #이 파일은 매개변수 encoding의 값으로 euc-kr이나 cp949를 주면 한글도 읽힌다.
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8") #encoding을 설정하면 한글도 읽을 수 있게 설정한다. 글자가 깨질 경우 encoding 값을 설정해준다.
words_utf8_new <- scan("data/sample_utf8.txt", what="") #encoding이 기본값이 점점 CP949에서 UTF-8로 되고 있다고 한다. 작년 10월만 해도 CP949가 기본값이었다고 함. #data/sample_utf8.txt는 utf-8로 작성된 문서다.
lines_ansi <- readLines("data/sample_ansi.txt") #readLines는 내용을 텍스트 벡터로 읽는다. 그런데 행 단위로 읽는다. #data/sample_ansi.txt는 ansi로 작성된 코드다.
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8") #endcoding대신 fileEncoding으로 줘도 똑같다. 

df2 <- read.table("data/product_click.log", stringsAsFactors = T) #첫번째 열을 v1, 두 번째 열을 v2로 자동으로 이름 붙인다. #data\product_click.log처럼 공백으로 데이터가 구분되어있으면 read.table을 사용한다고 하는데 sep="구분문자"를 통해 다른 것으로 데이터를 구분할 수도 있다.
str(df2)  #R구문보충.pdf 6pg에 따르면 read.table과 read.csv가 대비되는듯. csv파일은은 공백이 아닌 쉼표로 데이터를 구분했다.
head(df2)
summary(df2$V2)




#제어문 #R구문보충.pdf 6pg (6)제어문 읽어봐야 함.
#if else
randomNum <-sample(1:10,1) #sample은 난수 추출 함수. exam1.R 참고
if(randomNum>5){ #if문의 조건을 괄호로 묶는 것을 유의.
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2 == 1){ #%%는 R구문보충.pdf의 5pg (4) R의 연산자에 행렬의 나머지 연산자
  cat(randomNum,";홀수\n")
}else{
  cat(randomNum,";짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수","\n")
  cat("종료")
}else{
  cat(randomNum,";짝수","\n")
  cat("종료")
}

if(randomNum%%2 == 1){
  cat(randomNum,";홀수")
  cat("종료")
}else{
  cat(randomNum,";짝수")
  cat("종료")
}

score <- sample(0:100, 1)  # 0~100 숫자 한 개를 무작위로 뽑아서
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month,"월",sep="") # "3월"  "3 월" #paste는 아규먼트로 여러개의 값을 주면 하나로 묶어주는 함수다. 변수 간에 뭘 채워줄 것이냐를 sep로 설정한다. 기본은 공백이다. sep에 null문자를 주면 공백이다. "3월"이나 "3 월" 이라고 나올 수 있다. 이건 랜덤이다.
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울", #12, 1, 2월은 "겨울"을 #if
                 "3월"=,"4월"=,"5월"="봄",    #3, 4, 5월은 "봄"을    #else if
                 "6월"=,"7월"=,"8월"="여름",  #6, 7, 8월은 "여름"을  #else if
                 "가을")                      #나머지는 "가을"을 result 객체에 대입한다. #else
cat(month,"은 ",result,"입니다\n",sep="") #cat함수는 단순한 메세지를 출력할때 사용한다. print와 달리 \n을 직접 삽입해줘야 한다.

num <- sample(1:10,1)
num
switch(EXPR = num,"A","B","C","D") #식의 타입이 numeric(수치형)일때는 비교값이 정해져있다. 사용자가 따로 설정하지 못한다. 1인 경우 A, 2인 경우 B, 3인경우 C, 4인경우 D 이런 방식이다.
#위의 switch문은 R구문보충.pdf의 6pg 맨 밑을 볼 것.

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  num <- as.character(num) #수치형 데이터를 switch로 처리해서 비교값을 사용자가 직접 설정하고 싶을때는 수치형 데이터를 문자형 데이터로 변환해줘야 한다.
  cat(num,":",switch(EXPR = num,
                     "7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n") #"ㅋ"는 else문의 처리결과라고 보면 된다. 
}


#11/01 시작
#for문
#for 실습
for(data in month.name) #12번 반복된다.
  print(data)
for(data in month.name)print(data);print("hello") #수행할 내용을 for문 밑이 아닌 옆에 뒀다. 파이썬이었으면 에러가 발생한다. 세미콜론(;)에 의해 명령어를 구분지어줘서 반복문에선 print(data);만 수행된다.(그게 아니라 중괄호가 없으면 코드 하나만 자동 출력 아닌가?)
#뒤의 print("hello")는 반복문과 별개로 한 번만 수행된다.

for(data in month.name){print(data);print("hello")} #여기선 뒤의 print("hello")도 같이 수행된다.

for(n in 1:5)
  cat("hello?","\n") #5번 반복

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n") #25번 반복
  }
}
# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t") # \n : 개행문자, \t : 탭문자
  }
  cat("\n")
}


bb <- F #플래그 변수 설정. 플래그는 ON/OFF의 의미를 가진다.
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T #맨 바깥의 for문도 종료되도록 bb를 TRUE로 설정
      break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면 바깥의 for문도 종료
    break
}


for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}

#while문
i <- 1
while(i <= 10){
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i <- 1
while (i<=10) { #무한 루프(i값 변경X)
  cat(i,"\n")
}

i <- 1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1 #-1아님. 위에도 이렇게 되어있는거 다 띄어쓰기 함.
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}




for(data in month.name) 
  print(data) #print는 데이터로 처리

for(data in month.name) 
  cat(data) #cat은 메시지로 처리. 그리고 행바꿈도 자동으로 X

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  print(paste(i,":",sum))
}

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  cat(i,":",sum,"\n") #위의 print문을 cat으로 바꾼 코드. "\n"을 붙여서 실행결과가 똑같이 된다.
}

sum <-0
for(i in 5:15){ #위의 break문을 continue문으로 바꾼 코드. break일때와 달리 i가 10일때만 제외하고 반복문이 끝까지 실행된다.
  if(i%%10==0){
    next;  #continue
  }
  sum <- sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0
while(sumNumber <= 20) { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
} 

repeat {
  cat("ㅋㅋㅋ\n")
}

sumNumber <- 0
repeat { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break;
}

