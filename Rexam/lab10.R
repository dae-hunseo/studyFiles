#11/09 실습1
#[ 문제 1 ]
#1부터 26사이의 값들 중에서 10개를 추출하여 v라는 변수에 저장한다.
#추출된 숫자에 해당하는 알파벳 대문자를 원소값으로 구성된 벡터를 생성하여 리턴하는 코드를 작성하시오.
#단, 숫자 벡터의 엘리먼트를 가지고 알파벳 대문자로 구성된 벡터를 리턴하는 기능을 반드시 sapply() 함수로 해결해야 한다.
v <- sample(1:26,10)
sapply(v, function(x) return(LETTERS[x]))

#[ 문제 2 ]
#product_click.log 파일을 읽어서 다음 문제들을 해결해 본다.
#(1) product_click.log 파일을 read.table() 함수를 사용하여 데이터프레임 df 를 생성한다.
#(2) df의  첫번째 컬럼은 clicktime, 두번째 컬럼은 pid 라는 컬럼명을 부여한다.
#(3) df 의 clicktime 열을 가지고 각각 요일 정보를 추출하여 clickday 라는 컬럼을 추가한다.
#(4) 고객들은 어떤 요일에 클릭을 가장 많이 하였는가?
df <- read.table("data/product_click.log")
names(df)=c('clicktime','pid')

dates <- as.POSIXlt(as.character(df$clicktime), tryFormats="%Y%m%d%H%M") #dates <- strptime(df$clicktime, "%Y%m%d)도 가능. #as.Date(as.character(df$clicktime), format="%Y%m%d") 도 됨

df$clickday <- weekdays(dates) #없는 열을 지정하면 새로 추가해준다.
df
#방법1
names(which.max(table(df$clickday))) #table()은 중복된 데이터의 개수를 종류별로 보여주고, which.max()는 가장 큰 값의 인덱스를 보여준다.
#방법2
names(sort(tapply(df$clickday,df$clickday,length),decreasing=T)[1]) #(계산할 것, factor로 구분지을 것, 함수) #factor종류별로 함수로 계산을 한다.

#[ 문제 3 ]
#제시된 memo.txt 파일을 행 단위로 읽어서 벡터를 리턴한다.(행단위로 읽는 함수는 R구문보충.pdf 6pg참조)
#벡터를 구성하고 있는 각 원소들의 내용을 확인한 후에 아래에 제시된 결과로 변경되도록 문자 또는 문자열 변경을 시도한다. (gsub() 사용)
#원소마다 변경해야 하는 룰이 다르므로 원소마다 처리한다.
#처리된 결과를 memo_new.txt 파일에 저장한다. (write() 함수 사용)
#생성된 memo_new.txt 파일과 함께 제출한다.
t <- readLines("data/memo.txt")
t
t[1] <- gsub("[[:punct:]]","",t[1]) #exam6.R 참고
t[2] <- toupper(t[2]) #exam8.R
t[3] <- gsub("\\d","",t[3])
t[4] <- gsub("[a-zA-Z]","",t[4])
t[5] <- gsub("[[:punct:][:digit:]]","",t[5])
t[6] <- gsub(" ", "", t[6])
t
write(t, "data/memo_new.txt") #write는 벡터를 쓴다. write를 블록해서 f1누르면 매개변수 타입이 나오는데 atomic vector라고 나온다.

