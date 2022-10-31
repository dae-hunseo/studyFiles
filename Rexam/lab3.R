#10/31 mybox에 답 있음
#문제 1
str(iris)

#문제 2
x <- c(1, 2, 3, 4, 5) #x<-1:5
y <- c(2, 4, 6, 8, 10) #y<-seq(2,10,2)
df1 <- data.frame(x, y)
df1 #두 줄을 묶어서 "(df1<-data.frame(x,y))"로 해도 같음.

#문제 3
col1 <- c(1, 2, 3, 4, 5) #col1<-1:5
col2 <- c('a', 'b', 'c', 'd', 'e') #col2<-letters[1:5]
col3 <- c(6, 7, 8, 9, 10) #col3<-6:10
df2 <- data.frame(col1, col2, col3)
df2

#문제 4
col4 = c(1800, 1500, 3000)
col5 = c(24, 38, 13)
col6 = c('사과', '딸기', '수박') #혹은 3줄을 묶어서 df3<-data.frame("제품명"=c("사과","딸기","수박"), "가격"=c(1800,1500,3000), "판매량"=c(24,38,13))
df3 <- data.frame(제품명=col6, 가격=col4, 판매량=col5)#'제품명'이 아니라 제품명으로 해도 되는데 찾아봐야 할듯
df3

#문제 5
mean(df3$가격)
mean(df3$판매량)

#문제 6
name <- c("Potter","Elsa","Gates","Wendy","Ben")
gender <- factor(c("M","F","M","F","M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math); df4; str(df4)
df4$stat <- c(76,73,95,85,35)
df4$score <- math + df4$stat
df4$grade <-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B", 
                           ifelse(df4$score >=70,"C","D"))) #ifelse문을 중첩해서 사용했음. 
df4


myemp <- read.csv("data/emp.csv") # 상대패스
#문제 7
str(myemp)

#문제 8
myemp[3:5,]

#문제 9
names(myemp) #colnames(), rownames()
myemp[-1] #df[행인덱스, 열인덱스] df[열인덱스]
myemp[2:8]

#문제 10
myemp$ename #무조건 벡터로 출력
myemp['ename'] #데이터프레임 구조로 출력
myemp[,'ename'] #벡터 방식으로 출력

#문제 11
myemp[c("ename","sal")] #데이터프레임 구조로 출력
myemp[,c("ename", "sal")] #데이터프레임 구조로 출력

#문제 12 myemp 에서 직무가 SALESMAN 인 사원의 이름, 월급, 직업을 출력한다. subset(df, select=컬럼명들컬럼명들, subset=(조건조건))
subset(myemp, myemp$job == 'SALESMAN', c(ename, sal, job)) #myemp[myemp$job=="SALESMAN", c("ename","sal","job")] #열 이름인 경우 따옴표 불필요한듯

#문제 13 myemp 에서 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.
subset(myemp, select = c(ename,sal,deptno), subset = (sal>=1000 & sal<=3000)) #벡터화 연산을 할 경우 &를 하나만 사용

#문제 14 myemp 에서 직무가 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
subset(myemp, sal !='ANALYST', c(ename, job, sal))

#문제 15 myemp 에서 직무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
subset(myemp, job == c('SALESMAN', "ANALYST"), c(ename, job)) #myemp[myemp$job=="SALESMAN"|myemp$job=="ANALYST",c("ename", "job")] #열 이름인 경우 따옴표 불필요한듯

#문제 16 myemp 에서 커미션이 정해지지 않은 직원의 이름과 월급 정보를 출력한다.
#(NA 값을 채크하는 것은 제공된 교육자료(워드문서)의 1 페이지를 참고한다.)
subset(myemp, is.na(comm), c(ename, sal))

#문제 17 myemp 에서 월급이 적은 순으로 모든 직원 정보를 출력한다. #https://rfriend.tistory.com/50
myemp <- myemp[order(myemp$sal),] #order(myemp$sal)를 하면 오름차순으로(월급이 적은 순서대로) 정렬한 후 인덱스를 리턴하는데 인덱스란 행의 값이다. 그래서 myemp[order(myemp$sal),]에서 뒤에 쉼표를 해주는 이유가 바로 행의 인덱스를 가져온 순서대로 출력하기 위함이다.
myemp

#문제 18 myemp의 행과 열의 갯수를 점검한다.
dim(myemp)

#문제 19 myemp 에서 부서별 직원이 몇 명인지 출력한다. 
table(myemp$deptno)
summary(as.factor(myemp$deptno)) #summary를 쓸 때는 팩터형으로 변환해서 써야 우리가 원하는 값으로 처리해줌. 아니면 숫자 데이터에 대한 summary가 일어난다. 최솟값, 최댓값, 평균, 25%, 75% 수치로. 해보면 알음.

#문제 20 myemp 에서 직무별 직원이 몇 명인지 출력한다.
table(myemp$job)
summary(as.factor(myemp$job))


