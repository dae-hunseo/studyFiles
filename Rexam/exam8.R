#############################################################
# 날짜와 시간 관련 기능을 지원하는 함수들
# 날짜정보와 시간정보는 R에서 다른 클래스를 통해 구현된다. 
# 날짜(Date)는 1970-01-01을 기준으로 R 내부적으로 정수형으로 저장되고
# 시간(Time)도 R 내부적으로 1970-01-01을 기준으로 초단위로 저장된다.(1970년 1월 1일 0시부터 지금까지 몇초나 흘렀는지)

#이 문단 출처: http://ds.sumeun.org/?p=1111
#R에서 날짜와 시간을 나타내는 데 쓰이는 클래스는 세 다음의 세 가지이다.
#Date : 날짜를 나타낸다. 내부적으로 1970년 1월 1일 이후 경과된 일 수를 저장한다.
#POSIXct : 날짜-시간을 나타낸다. 내부적으로 1970년 1월 1일에서 경과된 초 수와 타임존을 저장한다.
#POSIXlt : 날짜-시간을 나타낸다. 내부적으로는 1900년에서 경과된 년수, 월, 일, 시간, 분, 초, 타임존 등을 리스트의 형태로 저장한다.

#가장 중요한 건 Date, POSIXct, POSIXlt는 숫자가 아닌 문자열을 받아들인다. 그래서 숫자를 사용하려면 as.character(numeric데이터)로 문자형으로 바꿔줘야 한다.

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
format(today, "%B") #월을 풀로 출력 #%M은 '분'을 뜻한다. 66번째 라인 주석 참고
format(today, "%b") #월을 약어로 숫자만 출력
format(today, "%a") #요일을 약어로 앞에 한 글자만 출력
format(today, "%A") #요일을 풀로 출력
weekdays(today) #요일을 한글로 출력한다.
months(today)  #월을 숫자+"월"로 출력한다.
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

#연습용 코드
x3 <- "202206011050"
as.POSIXlt(x3, tryFormats="%Y%m%d%H%M")

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

as.POSIXlt("2022/11/07")$wday #1은 월요일, 2는 화요일 이런 식으로 요일이 출력된다.
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


#11/09 시작
# 날짜 또는 날짜+시간 데이터 셋 만들기
dd <- seq(Sys.Date(),Sys.Date() + 10, "day") #seq()의 매개변수로 숫자뿐만 아니라 날짜와 시각 데이터도 줄 수 있다. #현재날짜부터 10일후까지 11개의 날짜 데이터를 순차적으로 삽입
dd
weekdays(dd) #요일 출력
seq(Sys.time(),Sys.time() + 60*60*10, "hour") #Sys.time()은 초를 기준으로 연산이 이뤄진다. 60*60은 3600초 = 1시간이다. 이걸 10번 반복하는 거다.
seq(Sys.time(),Sys.time() + 60*10, "min") #3번째 매개변수는 밑에 나오는 by다.


seq(Sys.Date(), as.Date("2050-12-31"), "10 years")

seq(Sys.Date(), length.out=10, by="year") #오늘 날짜를 기준으로 year단위로 커지는 날짜데이터 10개로 커지는 벡터를 만들어라.
seq(Sys.Date(), length.out=10, by="10 year")
seq(Sys.Date(), length.out=10, by="day")
seq(Sys.time(), length.out=10, by="hour")
seq(Sys.time(), length.out=10, by="min")
seq(Sys.time(), length.out=10, by="sec")

data.frame(num=1:9, point=as.POSIXct(c("2022-11-04 09:30:02", "2022-11-04 09:30:04",
                                       "2022-11-04 09:30:06", "2022-11-04 09:30:08", "2022-11-04 09:30:10", 
                                       "2022-11-04 09:30:12", "2022-11-04 09:30:14", "2022-11-04 09:30:16",
                                       "2022-11-04 09:30:18")))

data.frame(num=1:9, point=seq(as.POSIXct("2022-11-04 09:30:02"), length.out=9,by="2 sec")) #2초 간격으로 커지게 함
data.frame(num=1:9, point=seq(as.POSIXct("2022-11-04 09:30:02"), length.out=9,by="sec"))   #1초 간격으로 커지게 함

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
nchar(x) #공백까지 포함한 알파벳 개수를 출력(15) #number of character. argument로 주어진 데이터가 몇 개의 데이터로 주어져있느냐. length()와 비교.
length(x) #데이터의 개수를 출력(1)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y) #벡터가 갖고있는 엘리먼트 개수를 출력(5)
nchar(y) #각각의 엘리먼트가 갖고있는 문자 개수 출력해준다.(2 4 1 5 3)

letters #알파벳 소문자로 구성된 벡터
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says) # 다 소문자로 만든다.
toupper(fox.says) # 다 대문자로 만든다.

substr("Data Analytics", start=1, stop=4) #stop도 포함해서 start번째부터 stop번째까지 데이터를 꺼낸다.(부분문자열을  꺼낸다.)
substr("Data Analytics", 6, 14) #2, 3번째 매개변수는 keyword 아규먼트로 줘도 되고, position 아규먼트로 줘도 된다.
substring("Data Analytics", 6) #stop을 생략할 수 있는 substring 함수. 여기서는6번째부터 시작해서 끝까지.

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")#나라이름과 국가코드
substr(countries, nchar(countries)-1, nchar(countries)) #뒤에 국가코드만 추출한다. 전체개수에서 -1한값부터 전체 개수까지. 예를들면 K부터 R까지 => KR

?islands #대륙 이름들
str(islands)
head(islands)
landmasses <- names(islands) #islands만 출력해보면 대륙이름과 숫자가 있는데 names()를 쓰면 이름만 추출해준다.
landmasses
grep(pattern="New", x=landmasses) #pattern을 준다는 건 일반텍스트도 가능하고 정규표현식이 가능하다. 여기서는 일반넥스트를  썼다. 
#grep()은 2번째 아규먼트인 데이터셋에서 첫번째 아규먼트가 포함된 엘리먼트를 찾는다.
index <- grep("New", landmasses) #3번째 매개변수인 value=T를 안 주면 인덱스가 출력된다.
landmasses[index] #그렇게 받은 인덱스를 여기서 사용한다.
# 동일
grep("New", landmasses, value=T) #실제 엘리먼트 값들이 필요하다면 value=T를 준다. 실제 value값들을 꺼내준다.


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
x <- gsub(".csv", "", x) #.csv를 ""로 대체한다.(.csv문자열을 없애게 된다.)
x

gsub("[ABC]", "@", "123AunicoBC98ABC") #A또는 B또는 C를 @로 바꿔라.
gsub("ABC", "@", "123AunicoBC98ABC") #"ABC"라는 문자열을 찾아서 '@'로 바꿔라.
gsub("(AB)|C", "@", "123AunicoBC98ABC") #"AB"또는 C를 '@'로 바꿔라.
gsub("A|(BC)", "@", "123AunicoBC98ABC") #A또는 "BC"를 '@'로 꿔라.
gsub("A|B|C", "@", "123AunicoBC98ABC") #A또는 B또는 C를 '@'로 바꿔라.(255번째 라인과 같음.)

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T) #che가 포함된
grep("at", words, value=T) #at가 포함된
grep("[ch]", words, value=T) #c또는 h가 포함된
grep("[at]", words, value=T) #a또는 t가 포함된
grep("ch|at", words, value=T) #ch또는 at가 포함된
grep("ch(e|i)ck", words, value=T) #ch와 ck사이에 e또는 i가 들어간
grep("chase", words, value=T)
grep("chas?e", words, value=T) #s가 있을 수도 있고 없을 수도 있다.
grep("chas*e", words, value=T) #s가 0개 이상 있는 경우.
grep("chas+e", words, value=T) #s가 1개 이상 있는 경우
grep("ch(a*|e*)se", words, value=T) #a나 e가 0개이상 있는 경우
grep("^c", words, value=T)  #c로 시작하는 #[^....]  -> 부정(대괄호로 감싸면 부정이라는 뜻인듯?)
grep("t$", words, value=T)  #t로 끝나는
grep("^c.*t$", words, value=T) #c로 시작하고 t로 끝나는

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE) #알파벳이나 숫자를 포함하고 있는 애를 다 꺼내라(word2는 다 해당)(한글도 다 꺼낸다.)
grep("[[:alpha:]]", words2, value=TRUE) #알파벳을 포함한 애들을 다 꺼내라 #한글도 포함하는 것 같음.
grep("[[:digit:]]", words2, value=TRUE) #숫자를 포함한 애를 꺼내라
grep("[[:punct:]]", words2, value=TRUE) #특수문자를 포함하고 있는 애를 꺼내라
grep("[[:space:]]", words2, value=TRUE) #공백을 포함한 애를 꺼내라.
grep("\\w", words2, value=TRUE) #문자를 포함하고 있는 애
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE) #숫자를 포함하고 있는애 #숫자를 포함하고 있지 않은 애
grep("\\s", words2, value=TRUE) #space. 공백을 포함하고 있는 애



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") #문자열을 분리하는 strsplit #공백을 기준으로 문자열을 분리시킨다. 리스트를 리턴한다.
strsplit(x= fox.said, split="") #한글자씩 분리해서 리턴한다.

fox.said.words <- unlist(strsplit(fox.said, " ")) #strsplit은 리스트를 리턴하는데 이걸 벡터로 리턴한다.
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]] #unlist를 안 하고 그냥 벡터만 꺼내고 싶다면 겹대괄호안에 숫자를 넣어서 주면 된다. 그냥 대괄호를 쓰면 리스트에 담아서 꺼낸다.
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy" #엘리먼트 하나짜리 벡터
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3) #벡터상태임
class(littleprince)
str(littleprince)
strsplit(littleprince, " ") #strsplit은 원래 리스트로 리턴함
strsplit(littleprince, " ")[[3]] #strsplit 연산해서 3번째 엘리먼트(p3)를 리턴
strsplit(littleprince, " ")[[3]][5] #strsplit 연산해서 3번째 엘리먼트의 5번째 값을 리턴

#############################################################
# 데이터 전처리시 자주 사용되는 apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply #2번째 매개변수는 margin으로 1이면 행단위, 2면 열단위의 함수의 결과를 처리한다.
?lapply
?sum #sum은 R이 내장하고 있는 함수 이름이다. 
apply(df, 1, sum, na.rm=TRUE) #2번째 매개변수가 1이므로 행단위 연산 #4번째 아규먼트는 바로 앞의 함수한테 전달하는 거다. 선택적인 아규먼트로서 3번째 아규먼트인 함수한테 전달된다고 ?apply 실행했을때 나와있다.
apply(df, 2, sum, na.rm=TRUE) #2번째 매개변수가 2이므로 열단위 연산 #3번째 아규먼트인 sum함수는 na.rm=FALSE로 되어있다. ?sum해보면 나온다. na.rm=FALSE면 더하는 데이터 중에 하나라도 NA가 있으면 연산결과는 NA가 된다. 그걸 막기위해 na.rm=TRUE를 준 거다.
lapply(df, sum, na.rm=TRUE) #열단위로 연산한다. #sapply, lapply. 다 열단위로 연산한다.
sapply(df, sum, na.rm=TRUE) #열단위로 연산한다. #sapply는 전달된 데이터셋이나 수행한 결과에 따라 벡터나 리스트로 리턴한다.
tapply(1:6, gender, sum) # rm(sum) #sum은 R이 내장하고 있는 함수 이름이다. 만약 직접 만든 sum이 있다면 rm(sum)으로 삭제하거나 sum{base}로 사용한다.
#F: 2+5+6=13 M:#1+3+4 
#첫번째 아규먼트로 c(1,2,3,4,5,6)이라는 벡터로 줬고 2번째 아규먼트로 gender라는 벡터를 줬다. 범주형 데이터를 줘야 한다. 3번째 아규먼트로는 sum이라는 R내장함수를 줬다. 
#tapply()는 그룹을 나눠서 연산을 실행한다. gender는 M과 F로 나눠져있으니 M인 (1,3,4)와 F인 (2,5,6)이 각각 그룹으로 묶인다. 이걸 sum()연산을 해서 각각 엘리먼트의 값을 더한다. 각각 8과 13.
tapply(df$w, gender, mean, na.rm=TRUE) 
#gender 벡터의 M그룹과 F그룹으로 나눠서 몸무게의 평균(mean)을 구한다. na.rm=TRUE는 na값이 와도 허용한다는 뜻이다. FALSE면 NA가 오면 무조건 연산 값이 NA가 된다.
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5]) #맨 처음에 함수가 오고 그 뒤에는 가면 argument다. 각각의 벡터가 갖고있는 엘리먼트 값들을 paste()함수의 매개변수로 전달해줘서 하나의 character vector로 묶는다.

#apply계열 함수들은 11/09의 "apply 계열 함수들.hwp" 참고


v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep="")) #이번에는 직접 function을 만들어서 실행해본다. Argument로 전달된 변수 d앞뒤로 '-'를 붙인다.
#named벡터로 리턴

l<-list("abc", "DEF", "TwT") #리스트로 만듬
sapply(l, function(d) paste("-",d,"-", sep="")) #벡터로 리턴함(sapply는 상황에 따라 리스트나 벡터로 리턴함)
lapply(l, function(d) paste("-",d,"-", sep="")) #리스트로 리턴함(lapply는 무조건 리스트로 리턴)

flower <- c("rose", "iris", "sunflower", "anemone", "tulip") #꽃이름을 갖는 벡터
length(flower) #벡터가 갖고있는 엘리먼트 개수가 리턴
nchar(flower) #각각의 엘리먼트가 몇 개의 문자로 구성되어있는지 추출해서 숫자벡터로 리턴
sapply(flower, function(d) if(nchar(d) > 5) return(d)) #함수 매개변수로 flower 벡터롤 전달함. 만약 글자수가 5개를 초과하지 않으면 NULL을 리턴하는 식으로 named리스트를 리턴함. NULL은 NULL자체가 하나의 객체다. 그래서 벡터안에 못 넣기 때문에 이 sapply()는 리스트로 리턴했다.
sapply(flower, function(d) if(nchar(d) > 5) d) #그냥 d변수값을 출력하라고 했는데 그래도 똑같다. 왜냐하면 리턴함수가 없다면 마지막으로 출력된 게 리턴값이 되기 때문이다.
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA)) #조건을 만족하면 꽃이름을 리턴하고 그렇지 않으면 NA를 리턴한다. NA를 리턴하게 되자 named 벡터로 리턴하게 됐다. NULL은 벡터안에 들어갈 수 없고 NA는 벡터 안에 들어갈 수 있다.
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d)) #flower라는 벡터를 d에 전달한다. n은 기본값 5를 갖고있다. #NULL이 있어서 named 리스트가 리턴된다.
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3) #3은 n한테 전달되고 flower가 전달된다. #NULL이 없어서 named vector로 리턴된다.
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4) #NULL이 있어서 named list가 리턴된다.

count <- 1 #전역변수로 만듬. #지역변수면 함수를 호출할때마다 변수를 초기화함.
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) #wt가 TRUE면
    r <- paste("*", x, "*")
  else #wt가 FALSE면
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf) #함수 myf에게 매개변수로 df$w를 넘겨준다. 함수의 리턴값은 result에 저장된다.
length(result)
result
sapply(df$w, myf, F) #myf함수의 2번째 매개변수 wt의 값으로 F가 전달된다.
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F) #벡터로 리턴된다.
str(rr1) #벡터의 엘리먼트 값을 보여준다.

count <- 1
sapply(df, myf) #데이터프레임을 myf함수의 매개변수로 넘겨준다. #데이터프레임을 구성하고 있는 열단위로 데이터를 벡터로 전달한다. 
#myf함수의 print()문을 출력하고 리턴값을 콘솔창에 보여준다.
rr2 <- sapply(df, myf) #리턴값은 rr2 변수에 담고, print()문은 콘솔창에 출력한다.
str(rr2)
rr2[1,1]
rr2[1,"w"]
