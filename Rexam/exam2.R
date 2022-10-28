# matrix 실습
x1 <-matrix(1:8, nrow = 2) # ncol 매개변수의 값을 생략
x1
x1<-x1*3
x1

sum(x1); min(x1);max(x1);mean(x1)

x2 <-matrix(1:8, nrow =3) #에러가 나긴 하는데 실행은 해줌. 칸은 9개인데 데이터는 8개니까 9번째에는 1 번째 데이터를 채운다.
x2

chars <- letters[1:10]; print(chars)
(chars <- letters[1:10])

mat1 <-matrix(chars)
mat1; dim(mat1) #몇행 몇열 인지 출력해준다.
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T) #기본값은 byrow=F이며 True로 하면 행을 먼저 다 채우고 다음행으로 넘어간다. https://didalsgur.tistory.com/entry/R-R%EC%97%90%EC%84%9C-%ED%96%89%EB%A0%ACmatrix-%EC%83%9D%EC%84%B1-%EC%8B%9C-byrow-%EC%98%B5%EC%85%98-%EC%84%A4%EB%AA%85
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5) #3행 5열을 채우기 위해 남는 칸은 char의 1번째 인덱스부터 값을 반복한다.
matrix(chars, nrow=3) #3행짜리 행렬을 생성해주는데 1행1열, 2행1열, 3행1열, 1행2열 순으로 데이터를 우고 남는 칸은 역시 char의 1번째 인덱스부터 값을 반복한다.

m <- matrix(chars, nrow=3)
m[1,1]
m[3,4]
m[3,4] <- 'w'
colnames(m)
rownames(m)
#10-28 시작
colnames(m) <- c('c1', 'c2', 'c3', 'c4') #열의 이름 지정 #함수 호출식이 왼쪽에 있음. 매개변수 m에 R-value값이 들어감.
rownames(m) <- c('r1', 'r2', 'r3')       #행의 이름 지정
#10-27 종료
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)        #rbind와 cbind는 https://r-book.tistory.com/34 참고. 행이나 열을 맨 앞이나 맨 뒤에 추가할 수도 있다.
mat1 <- rbind(vec1,vec2,vec3); mat1 #벡터들을 행단위로 만들어서 매트릭스를 만든다. 그리고 매개변수로는 여러개를 줄 수 있다.(실행시켜보면 알음) 이름에 해당되는 벡터명을 없애겠다면 rownames()를 주면 됨
mat2 <- cbind(vec1,vec2,vec3); mat2 #벡터들을 열단위로 묶어서 매트릭스를 만든다. 그리고 매개변수로는 여러개를 줄 수 있다.(실행시켜보면 알음) 이름에 해당되는 벡터명을 없애겠다면 colnames()를 주면 됨
mat1[1,1]
mat1[2,];mat1[,3] # mat1[,3]은 2차원 구조를 유지할 필요가 없으니 2차원 구조를 깨트리고 1차원 구조로 추출해준다. namedVector라고 이름이 부여된 벡터임.
mat1[1,1,drop=F] #drop=F를 주면 매트릭스 구조를 깨트리지 않고 추출해준다.
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1;mat2 #위의 2줄 실행 후 행과 열의 이름이 사라짐
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1 #위의 두 줄 실행 후 행과 열의 이름이 부여되어 있음
ls()
mean(x2) #평균
sum(x2) #합
min(x2) #최솟값
max(x2) #최댓값
summary(x2) #요약. 데이터의 구조와 종류에 따라 달라짐. exam1 91번째 라인에서처럼 수치형 벡터의 경우 전체 데이터의 Min. 1st Qu.(25%)  Median(중간값)    Mean(평균) 3rd Qu.(75%)    Max로, 2차원인 경우 열단위로.

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2) #행의 합과 열의 합

apply(x2, 1, sum); apply(x2, 2, sum)  #apply(x2, 1, sum);는 rowSums(x2)와 결과가 같다고 함. 1일때는 row단위로 전달함. #apply(x2, 2, sum)는 colSums(x2)와 결과가 같다. 2일때는 col단위로 전달함. #sum은 함수다.
?apply #오른쪽 메뉴의 Help 확인 #3번째 argument인 함수에 따라 값이 달라진다는데 검색필요. 2번째 argument인 margin은 1이나 2를 줄 수 있다고 함.
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean) 

#Array 실습 #array는 R구문보충.pdf 2pg 맨 밑 참고. 3차원 벡터고 동일타입만 저장 가능하다. n행 m열 k층 이렇게 부른다.
a1 <- array(1:30, dim=c(2,3,5)) # 3차원
a1

a1[1,3,4]  # 23
a1[,,3]
a1[,2,]
a1[1,,]
a1 * 100

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score)

f_score <- factor(score)
class(f_score)
f_score
summary(f_score) #f_score 객체에 Levels 범주값인 1이 몇개인지, 2가 몇개인지, 3이 몇개인지, 4가 몇개인지, 5가 몇개인지 세어준다.
levels(f_score) #범주값 출력


f_score1 <- as.factor(score) #88~92번째 라인과 같은 코드다.
class(f_score1)
f_score1
summary(f_score1)
levels(f_score1)


plot(score)
plot(f_score)


data1 <- c("월","수","토","월", "수", "화", "수", "수",
           "목","화")
data1
class(data1)
summary(data1)

day1 <- factor(data1)
day1
class(day1)
summary(day1) #빈도수를 출력해준다. "월"이 몇개인지, "화"가 몇 개인지...
levels(day1) #데이터에 없으므로 금, 일요일이 안 나온다.

week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토") #그래서 일요일과 금요일이 포함된 요일벡터를 만들어놓고
day2 <- factor(data1, 
               levels=week.korabbname) #levels로 요일 벡터를 지정해준다.
day2
summary(day2) #일, 금요일의 개수가 0으로 표현된다.
levels(day2)



btype <- factor(
  c("A", "O", "AB", "B", "O", "A", "O"), 
  levels=c("A", "B", "O")) #"AB"형은 levels로 지정되지 않았으므로 결측치(NA)로 처리된다.
btype
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성")) #남성을 1, 여성을 2로 처리함.
gender
summary(gender)
levels(gender)

?plot #plot은 base 패키지와 graphics 패키지에 내장된 함수라고 나옴
?iris #datasets패키지에 있다. 이것도 search()에서 이미 로드된 패키지라고 나온다.
search() #내장된 패키지와 툴 같은게 나오는데 package:base가 나온다. 아까 사용한 plot()은 base패키지와 graphics 패키지에 들어있던 함수다.

# 내장 데이터셋
data() #이걸 실행시키면 새 창이 열리면서 R이 내장하고있는 데이터셋들이 나온다. iris도 있다. iris가 뭔지는 검색좀 해봐야 겠다.  2차원 데이터셋이다. 부꽃이라는 꽃을 데이터로 분류한 것 같다.
iris; head(iris);tail(iris)  #head함수는 앞에서부터 6개행을 보여준다. 왜 6개인지는 모르겠다고 함. #tail은 뒤에서부터 6개를 보여준다.
View(iris) #호출할 때 첫글자가 대문자임에 주의해야 한다. 표로 만들어서 데이터를 보여준다.
str(iris) #문자열로 데이터를 분석해서 보여준다.
summary(iris)



#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500) #no와 name과 qty와 price는 같은 개수의 데이터를 갖고있따.
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit) #창을 새로 띄워서 비주얼적으로 보여준다. #함수의 첫글자가 대문자임에 주의해야 한다.

fruit[1,] #1행만 출력
fruit[-1,] #1행만 빼고 다 출력
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지하려는 성격을 갖고있다. 위에 세 코드는 벡터로 출력한다. # 다 세번째 열인 qty를 추출하게 된다. 다만 fruit[3]은 출력방식이 조금 다르다.
#167번째 코드 주석처럼 drop=F를 줘도 데이터프레임 형식을 유지한다.

str(fruit$qty)
str(fruit[3])

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm)#열 이름 출력
rownames(df_midterm)#행 이름을 지정하지 않았으나 자동으로 1, 2, 3, 4로 출력
names(df_midterm) #열 이름을 출력한다.
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2) #열의 이름이 이상하게 출력된다. 지정되지 데이터프레임을 생성할때 벡터를 넣은 것이 아니기 때문이다.
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류 #원소개수가 다른 둘을 넣어서 에러가 난다.
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1)) #원소 개수가 같아서 정상 작동함.
str(df)
df
df$var_sum <- df$var1 + df$var2 #각각의 엘리먼트들을 더해서 새로운 벡터를 만든다. 그걸 df데이터프레임의 var_sum이라는 열에다가 넣어주는데 이런 이름의 열은 없었기 때문에 새로 추가해서 넣어준다.(수정이 아닌 추가)
df$var_mean <- df$var_sum/2 #위 코드에서 생성한 var_sum이라는 column을 2로 나눠서 var_mean이라는 열에다가 넣는데 var_mean이라는 열도 없기 때문에 새로 생성해서 값을 추가해줌.
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다") #R구문보충.pdf 6pg 참고 #var1이 크면 "var1이 크다" 출력, 아니면 "var1이 작다" 출력

getwd() # get working directory setwd('xxx') #현재 워킹 디렉토리가 어딘지 확인. C:\sdh\Rexam 이어야 함.

#csv파일열기
score <- read.csv("data/score.csv") # 상대패스
score <- read.csv("c:/sdh/Rexam/data/score.csv") # 절대패스
score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail") #위의 코드에서 추가된 score객체의 sum열이 200보다 크면 "pass"를 result열에 저장하고, 아니면 "pass"를 저장한다.
score #값을 출력해서 결과를 확인해봄

summary(score$result)
table(score$result)
summary(factor(score$result)) #팩터형으로 바꿔서 summary() 실행. 위에 위에 코드와 비교.
score$result = factor(score$result) #score객체의 result열은 "pass"나 "fail"이므로 팩터형으로 변환해서 저장해준다.
str(score)
summary(score) #result열이 팩터형이 되었기 때문에 "pass"가 몇 개인지, "fail"이 몇 개인지 출력해준다.
score$id = as.character(score$id) #id를 연산할 게 아니기 때문에 character형으로 변환해서 대입
score$class = factor(score$class) #팩터형으로 바꿔서 몇 반이 몇 명인지 체크할 수 있도록 한다.

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D"))) #ifelse문을 중첩해서 사용했음. 약간 switch-case 문 같은 듯. 230보다 크거나 같으면 'A', 아니면 그 다음 ifelse문 실행. 215보다 크다면 B리턴. 그것도 아니라면 그 다음 ifelse문 실행. 마지막으로 그렇다면 200보다 크다면 C를 리턴하고 그렇지 않으면 D를 리턴한다. ifelse문의 조건이 맞으면 2번째 매개변수, 아니면 3번째 매개변수를 실행하는 듯. 잘 보면 콤마로 함수가 한 줄로 이어져있음
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose()) #read.csv로 읽고자 하는 파일의 path명을 준다. 만약 같은 디렉터리에 있다면 파일의 명만 줘도 된다. 이번에는 읽어오고자 하는 파일을 선택하도록 다이얼로그를 띄워준다.(실행해보면 무조건 알음)
emp
str(emp) #column이 뭐가 있는지, 그리고 column마다 데이터가 뭔지 문자열로 출력해줌.

summary(emp) #요약정보를 출력해줌. 수치형, char형에 따라 다르게 출력해줌.

emp$job <- as.factor(emp$job) #그냥 factor()함수랑 같은걸로 기억함. 팩터형으로 바꿔줌.
emp$deptno <- as.factor(emp$deptno)
emp$mgr <- as.factor(emp$mgr)

summary(emp)
View(emp) #새창을 띄워서 데이터 프레임의 내용을 비주얼하게 표로 보여준다.

# emp에서 직원 이름 # 이 부부는 설명 안했고 예측해보고 직접 실행해보라고 함. drop=F는 1줄짜리를 데이터프레임 구조를 유지하면서 꺼내게 된다.
emp$ename #emp 데이터프레임의 ename 열을 출력력
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] #행의 이름이 ename인 것을 출력

# emp에서 직원이름, 직무, 급여
emp[,c(2,3,6)] #2번째열, 3번째열, 6번째열 추출
emp[,c("ename","job","sal")] #위에 코드와 결과가 같다.
subset(emp,select = c(ename, job, sal)) #R구문보충.pdf 3pg 참고. subset은 안 줬음.
?subset
# emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),] #emp[1:3,]와 똑같다.
?head
head(emp)
head(emp, n=3) # n의 기본값 6 #emp[c(1,2,3),]와 같다.
# ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),] #9번째 행만 T라 9번째 행만 출력됨
emp[emp$ename=="KING",] #위에 코드처럼 하면 너무 기니까 열의 이름이 "KING"인 것이 출력됨
subset(emp, subset=emp$ename=="KING") #subset이라는 매개변수로 대신할 수도 있다. 키워드 아규먼트 형식으로 subset 변수에 값을 주는 것이다. 
subset(emp, emp$ename=="KING") #위에 코드가 키워드 아규먼트였다면 여기서는 포지션 아규먼트 방식으로 매개변수에 값을 준다. 

is.na(emp$ename) #is.na는 NA(결측치)값이 있는지 보고 있으면 TRUE를 리턴한다.
is.na(emp$comm)

# 커미션이 정해지지 않은(NA) 직원들의 모든 정보 출력
emp[is.na(emp$comm),]
# 커미션을 받는 직원들의 모든 정보 출력
emp[!is.na(emp$comm),]
subset(emp,!is.na(emp$comm)) 
View(emp)
# select ename,sal from emp where sal>=2000
subset(emp, emp$sal>= 2000, 
       c("ename","sal"))    #급여가 2000이상인 직원들의 급여와 이름만 출력함.
subset(emp, select=c("ename","sal"), 
       subset= emp$sal>= 2000) #위의 코드를 키워드 아규먼트로 값을 넘겨준다.
emp[emp$sal>=2000,c("ename","sal")]

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, sal>=2000 & sal<=3000, c("ename","sal")) #급여가 2000이상 3000이하인 경우 ename열과 sal열을 출력함 #벡터화 연산을 할 경우 &를 하나만 써야함. #subset 함수의 장점은 비교식을 줄 때 열의 이름을 그냥 쓸 수 있다는 거다.
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")] #하지만 subset 함수를 쓰지 않는 경우 앞에 emp객체 이름을 붙여야 한다.
#10-28 종료(리스트를 제외하고 책 299pg까지의 내용들)


y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)
y > 50
# 내일
num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2
num1 %% num2
num1 %/% num2


