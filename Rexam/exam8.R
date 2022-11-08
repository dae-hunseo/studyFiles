#############################################################
# 날짜와 시간 관련 기능을 지원하는 함수들
# 날짜정보와 시간정보는 R에서 다른 클래스를 통해 구현된다. 
# 날짜(Date)는 1970-01-01을 기준으로 R 내부적으로 정수형으로 저장되고
# 시간(Time)도 R 내부적으로 1970-01-01을 기준으로 초단위로 저장된다.(1970년 1월 1일 0시부터 지금까지 몇초나 흘렀는지)

# 날짜(Date): Date 클래스
# 시간(time): POSIXct, POSIXlt 클래스
# POSIXct 클래스는 매우 큰 정수로 시간정보를 데이터프레임으로 저장할 때 유용하다.
# POSIXlt 클래스는 리스트 자료형으로 요일, 년, 월, 일 등의 정보를 리스트 내부 원소로 
#                  저장되어 각각의 정보를 구분하여 다루기 좋다. 
#POSIXlt는 리스트라 생각하고 그 안에 년, 월, 일, 시, 분, 초가 멤버로 저장되어있음. csv파일에 저장할때는 POSIXct 클래스로 만들어서 저장하고, 데이터를 꺼내서 다룰 때는 POSIXlt로 다루면 편한다.

# 현재날짜: Sys.Date()          #D가 대문자임에 유의
# 현재날짜 및 시간: Sys.time()
# 미국식 날짜 및 시간: date()

# 년월일 시분초 타입의 문자열을 날짜 또는 날짜+시간으로 변경 : 
# as.Date("년-월-일 시:분:초") 또는 as.Date("년/월/일 시:분:초")
# as.POSIXct("년-월-일 시:분:초") 
# as.POSIXlt("년-월-일 시:분:초") 

# 특정 포맷을 이용한 날짜 및 시간: as.Date("날짜 및 시간 문자열", format="포맷")

# 날짜 데이터끼리 연산 가능 : 
# 날짜끼리 뺄셈가능, 날짜와 정수의 덧셈뺄셈 가능 - 하루를 1로 간주, 소숫점 생략 #하루전, 하루후 이런 식으로 연산 가능
# 날짜 데이터끼리 연산할 때 소숫점을 표현하려면 as.Date() 대신에 as.POSIXct() 함수 사용

(today <- Sys.Date()) #today가 보기에는 문자열이지만 Date객체다.
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년")
format(today, "%y") #년을 약어로 뒤에 2자리만 출력
format(today, "%Y") #년을 풀로 4자리 출력
format(today, "%B") #월을 풀로 출력
format(today, "%b") #월을 약어로 숫자만 출력
format(today, "%a") #요일을 약어로 앞에 한 글자만 출력
format(today, "%A") #요일을 풀로 출력
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.


Sys.Date()
Sys.time()
str(Sys.Date())
str(Sys.time())
Sys.timezone()

as.Date('1/15/2022') # 에러발생
as.Date('2022/1/15') # 잘 인식한다.
as.Date('2022-1-15') # 잘 인식한다.
as.Date('1/15/2022',format='%m/%d/%Y') # format 은 생략 가능
as.Date('1/15/22',format='%m/%d/%Y') #format에서 4자리로 년도를 표현하도록 지정했기 때문(대문자Y)
as.Date('1/15/22',format='%m/%d/%y')
as.Date('1월 15, 2022',format='%B %d, %Y') #날짜가 서로 떨어져있으므로 쉼표와 공백으로 구분
as.Date('20220115',format='%Y%m%d') 
as.Date('22115',format='%y%b%d') #22년1월15일로 인식한다. 만약 b가 아닌 m이었다면 m은 월을 2자리로 인식하기 때문에 기호로 구분을 안 주면 22년 11월 5일이 된다.

x1 <- "2022-11-10 13:30:41" # "%Y-%m-%d %H:%M:%S"
# 문자열을 날짜형으로(시간은 0시 0분 0초로 됨)
(d <- as.Date(x1))
# 문자열을 날짜+시간형으로
(t1 <- as.POSIXct(x1))
(t2 <- as.POSIXlt(x1))
class(d)
class(t1)
class(t2)
(t3 <- strptime(x1, "%Y-%m-%d %H:%M:%S")) #strptime()은 장점이 POSIXct()나 POSIXlt는 포맷을 지정하는데 제한이 있는데, strptime은 조금 더 자유롭다.
class(t3)

x2 <- "20220601"
as.Date(x2, "%Y%m%d")
as.POSIXct(x2, tryFormats="%Y%m%d") #POSIXlt나 POSIXct는 (시분초를 안 주면 )반드시 tryFormats라는 매개변수값을 줘야 한다. 그리고 시분초를 지정 안 하면 0시 0분 0초로 자동 초기화가 일어난다.
as.POSIXlt(x2, tryFormats="%Y%m%d")
strptime(x2, "%Y%m%d")

# 날짜 데이터 연산
as.Date("2022/01/01 08:00:00") - as.Date("2022/01/01 05:00:00") #시간 차이는 있지만 날짜 차이는 없기 때문에 Time Difference of 0 days가 출력된다. Date는 날짜를 기준으로 한다.
as.POSIXct("2022/01/01 08:00:00") - as.POSIXct("2022/01/01 05:00:00")
as.POSIXlt("2022/01/01 08:00:00") - as.POSIXlt("2022/01/01 05:00:00")
Sys.Date() - 1 #오늘날짜로부터 하루 전
Sys.Date() + 2 #오늘날짜로부터 이틀 후

ct <- Sys.time() #Sys.time()은 현재 날짜와 시간을 POSIXct로 리턴해준다.
lt <- as.POSIXlt(ct)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) #날짜와 시간이 리스트로 출력된다.(년, 월, 일, 시, 분, 초 등이 따로). 여기서 볼 수 있는 게 월이 0부터 시작되므로 월을 추출할거면 1을 추가해서 써야 한다. 그리고 년은 1900을 더해서 써야한다. yday는 올해에서 며칠째 되는지, mday는 이번달에서 며칠째 됐는지, wday는 이번주에서.
lt$mon+1 #0부터 시작이기 때문에 1을 더해서 써야한다.
lt$hour 
lt$year+1900 #1900을 더해서 사용해야 한다.

as.POSIXct(1449894438,origin="1970-01-01") #첫번째 매개변수만큼 초시간이 흐르면 언제냐를 출력한다.
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2022/11/07")$wday
as.POSIXlt("2022/11/08")$wday
as.POSIXlt("2022/11/09")$wday
as.POSIXlt("2022/11/10")$wday
as.POSIXlt("2022/11/11")$wday
as.POSIXlt("2022/11/12")$wday

#내가 태어난 요일 출력하기
myday <- as.Date("1997-04-20")
weekdays(myday)

#내가 태어난지 며칠(오늘 날짜에서 빼기 연산 실행)
Sys.Date() - myday

#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas<-as.POSIXlt("2022-12-25")
weekdays(christmas)
christmas$wday

#2023년 1월 1일 어떤 요일
tmp<-as.Date("2023-01-01")
weekdays(tmp)

tmp<-as.POSIXct("2023-01-01")
weekdays(tmp)

tmp<-as.POSIXlt("2023-01-01")
weekdays(tmp)

#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste0("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday,"입니다.")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다') #tmp객체가 가진 값을 가지고 년, 월, 일, 요일이 자동으로 추출되어 문자열과 함께 출력된다.

# 정규표현식
word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:space:][:punct:]]", "", word)


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word); sub(" ", "@", word)
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word) 
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word); gsub("\\D", "", word)
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:punct:][:digit:]]", "", word) 
gsub("[[:punct:][:digit:][:space:]]", "", word) 
#11/08 종료

#############################################################
#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6)

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

str(islands)
head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses)

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
x <- gsub(".csv", "", x)
x

gsub("[ABC]", "@", "123AunicoBC98ABC")
gsub("ABC", "@", "123AunicoBC98ABC")
gsub("(AB)|C", "@", "123AunicoBC98ABC")
gsub("A|(BC)", "@", "123AunicoBC98ABC")
gsub("A|B|C", "@", "123AunicoBC98ABC")

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T)
grep("chas*e", words, value=T)
grep("chas+e", words, value=T)
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T)  #[^....]  -> 부정
grep("t$", words, value=T)
grep("^c.*t$", words, value=T)

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ")
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]

#############################################################
# 데이터 전처리시 자주 사용되는 apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply
?lapply
apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(1:6, gender, sum) # rm(sum)
tapply(df$w, gender, mean, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])



v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d))
sapply(flower, function(d) if(nchar(d) > 5) d)
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA))
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3)
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4)

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
