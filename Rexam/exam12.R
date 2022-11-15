#11/15 10:30 시작

# 난생처음 교재 소스 : 366 페이지 - 10장 -
install.packages("carData")
library(carData)
str(TitanicSurvival)

# (1) 자료 준비
head(state.x77)
room.class <- TitanicSurvival$passengerClass  # 선실 정보
room.class                

# (2) 도수분포 계산
tbl <- table(room.class)   
tbl
sum(tbl)                                      # 전체 탑승객수 

# (3) 막대그래프 작성
barplot(tbl, main='선실별 탑승객',       
        xlab='선실 등급',
        ylab='탐승객수',
        col=c('blue', 'green', 'yellow'))                    

#(4) 원그래프 작성
tbl/sum(tbl)                                 # 선실별 탑승객 비율
par(mar=c(1,1,4,1))                     
pie(tbl, main='선실별 탑승객',       
    col=c('blue', 'green', 'yellow'))                    
par(mar=c(5.1,4.1,4.1,2.1))



# (1) 자료 준비
grad <- state.x77[,'HS Grad']   # 주별 고등학교 졸업율 #열의 인덱스 앞에 쉼표를 붙이면 데이터프레임이 아닌 벡터형식으로 리턴된다.
grad                #named vector
str(grad)
class(grad)
names(grad)

# (2) 사분위수
summary(grad)
var(grad)                # 분산(표준편차의 제곱)
sd(grad)                 # 표준 편차

sqrt(var(grad))          #제곱근(표준편차가 된다.)
sd(grad) ** 2            #제곱(분산이 된다.)

# 분산(variance)은 관측값에서 평균을 뺀 값을 제곱하고, 그것을 모두 더한 후 전체 개수로 나눠서 구한다. 차이값의 제곱의 평균이다. 
# 관측값에서 평균을 뺀 값인 편차를 모두 더하면 0이 나오므로 제곱해서 더한다.
# 관찰된 자료들이 중심 위치에서 얼마나 넓게 퍼져있는 정도를 나타낸다. - 변동성
# 분산이 적을수록 관측값들이 평균에 모여있다.

# (3) 히스토그램 #구간 개수를 설정하지 않으면 알아서 정해준다.
hist(grad, main='주별 졸업율',
     xlab='졸업율',
     ylab='주의 개수',
     col='orange')


# (4) 상자그림
boxplot(grad, main='주별 졸업율',
        col='orange')

# (5) 졸업율이 가장 낮은 주
idx <- which(grad==min(grad)) #최솟값의 인덱스를 리턴한다.
grad[idx] #인덱스에 해당하는 주가 어딘지 출력한다.

grad[which.min(grad)]

# (6) 졸업율이 가장 높은 주
idx <- which(grad==max(grad))
grad[idx]

grad[which.max(grad)]


# (7) 졸업율이 평균 이하인 주
idx <- which(grad<mean(grad))
grad[idx] 




# (1) 자료 준비
ds <- read.csv('data/fdeaths.csv', row.names='year') #년월별 사망자
ds

#(2) 선그래프 작성
my.col <- c('black', 'blue','red', 'green','purple','dark gray')
my.lty <- 1:6

plot(1:12,                       # x data
     ds[1,],                     # y data(1974년 자료)
     main='월별 사망자 추이',    # 그래프 제목
     type='b',                   # 그래프 종류 #R기본시각화.pdf 3pg
     lty=my.lty[1],              # 선의 종류
     xlab='Month',               # x축 레이블
     ylab='사망자수',            # y축 레이블
     ylim=c(300,1200),           # y축 값의 범위   
     col=my.col[1]               # 선의 색
)

for( i in 2:6) {
  lines(1:12,                      # x data
        ds[i,],                    # y data(1975~1979)
        type='b',                  # 그래프 종류
        lty=my.lty[i],             # 선의 종류
        col=my.col[i]              # 선의 색
  )
}

legend(x='topright',               # 범례의 위치
       lty=my.lty,                 # 선의 종류
       col=my.col,                 # 선의 색
       legend=1974:1979            # 범례의 내용
)


plot(pressure$temperature,     # x축 자료
     pressure$pressure,        # y축 자료
     main='온도와 기압',       # 그래프 제목
     xlab='온도(화씨)',        # x축 레이블
     ylab='기압',              # y축 레이블
) #책 379pg



#(1) 자료의 확인
head(cars)   # speed, dist 50x2 #50개의 행과 2개의 열. #차의 속도와 제동거리 관련 데이터셋

#(2) 산점도의 작성
plot(cars$speed,                        # x축 자료
     cars$dist,                         # y축 자료
     main='자동차 속도와 제동거리',     # 그래프 제목
     xlab='속도',                       # x축 레이블
     ylab='제동거리',                   # y축 레이블
)

#(3) 상관계수  #-1~1 사이의 값을 갖는데 0에 가까울 수록 데이터들이 선 하나로 그을 수 없을 정도로 여기저기 퍼져있다. y=x면 상관계수가 1, y=-x면 상관계수가 -1이다.
cor(cars$speed, cars$dist) #책 381pg 참고 




# (1) 자료 확인 50x8 의 매트릭스 #책 383pg
#  면적(area), 인구(Population), 수입(Income),  문맹률(illiteracy), 
#  기대수명(life.exp), 결빙일수(frost), 살인및과실치사율(murder), 고등학교졸업율(HS grad)
st <- data.frame(state.x77)     # 매트릭스를 데이터프레임으로 변환 
head(st)

# (2) 다중 산점도 작성 #다중 변수는 변수가 3개이상인 데이터를 변수를 2개씩 짝지어서 상관관계 분석하기
plot(st) #변수 8개가 있는데 각각의 상관관계를 변수로 다 보여준다.

# (3) 다중 상관계수
(c_v <- cor(st)) #2차원 구조로 변수끼리의 상관계수를 보여준다. #\모양으로 나열된 1.0은 자기자신과의 관계다.


install.packages("corrplot") #각 변수간의 상관계수를 시각화해서 보여준다.
library(corrplot) 
corrplot(c_v) # method="circle #(원의 크기와 색상으로) 원의 크기가 클수록 높은 거다.  #자기자신과의 관계는 1이니까 크고 진한 남색으로 표현된다. 
corrplot(c_v, method="shade")
corrplot(c_v, method="ellipse") #양의 상관관계는 오른쪽으로, 음의 상관관계는 왼쪽을 향한다.
corrplot(c_v, method="color") #색상으로 보여준다.
corrplot(c_v, method="number") #숫자와 색상, 진하고 옅음으로 표현해준다.
corrplot(c_v, order="hclust") #method가 아닌 order를 썼음에 주의. #아까는 데이터프레임의 column 순서에 맞게 되어 있었는데 이렇게 하면 정렬을 해준다.



#13:00~
# 난생처음 교재 소스 : 385 페이지


# 난생처음 교재 소스 : 394 페이지 - 11장(1절,4절) -
score <- c(90, 70, NA, 40, 60)
sum(score)

z <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z
sum(z)                       # 정상 계산이 되지 않음
is.na(z)                     # NA 여부 확인
sum(is.na(z))                # NA의 개수 확인
sum(z, na.rm=TRUE)           # NA를 제외하고 합계를 계산

z1 <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7)      # 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0            # NA를 0 로 치환 
z1                            
z3 <- as.vector(na.omit(z2))  # NA를 제거하고 새로운 벡터 생성
z3

# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA  
head(x)


# for를 이용한 방법
for (i in 1:ncol(x)) { #ncol을 드래그해서 f1 누르면 어떤 함수인지 나오는데 열의 개수를 리턴한다.
  this.na <- is.na(x[,i]) 
  cat(colnames(x)[i], '\t', sum(this.na), '\n')
}

# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}
na_count <-apply(x, 2, FUN=col_na) #열단위로 NA가 몇 개인가
na_count


rowSums(is.na(x))            # 행별 NA 개수  #rowSums를 드래그 해서 f1 누르면 나오는데 행의 단위로 합을 구하는 R내장함수다.
sum(rowSums(is.na(x))>0)     # NA가 포함된 행의 개수 
sum(is.na(x))                # 데이터셋 전체에서 NA 개수

dim(x)
head(x)
x[!complete.cases(x),]              # NA가 포함된 행들을 나타냄 #complete.cases는 stats 패키지인데 R이 내장하는 기본 패키지다. missing value를 갖고있지 않은 상황에 TRUE를 리턴하고 갖고있으면 FALSE를 리턴한다.
y <- x[complete.cases(x),]          # NA가 포함된 행들을 제거(NA가 없는 행들만 추출함) #complete.cases()에 대해서는 421pg 참고
head(y)                             # 새로운 데이터셋 y의 내용 확인





# [ stats 패키지 : aggreate() ] #책 415pg
# aggregate(data, by = '기준이 되는 컬럼에 대한 list객체', FUN) #FUN은 집계함수를 뜻한다. 이걸 쓰면 지정된 컬럼을 기준으로 데이터를 그룹핑한다음에, 그룹단위로 함수를 처리해서 그 결과를 만들어내는 함수다. 그러다보니 dplyr(이게 맞나?) 패키지를 사용하지 않으면 이 함수를 알아야 좀 더 편하게 할 수 있다.
# 특정 컬럼을 기준으로 데이터들을 그루핑해서 FUN 에 전달된 함수 호출
agg <- aggregate(iris[,-5], by=list(iris$Species), FUN=mean) #-5는 5번째(마지막)열 빼고를 뜻함. 5번째열은 Species임. 품종까지 출력하지 말란 뜻 #품종별로 꽃잎과 꽃받침의 폭과 길이의 평균 출력
agg

agg <- aggregate(iris[,-5], by=list(품종=iris$Species), #그룹핑의 이름을 지정한다.
                 FUN=sd)
agg

data(mtcars) #mtcars라는 객체를 썼었는데 이렇게 해주면 R내장객체를 다시 초기화된 상태로 읽어올 수 있다. 
head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max) #실린더별로 그룹을 나눈 다음에 그 안에서 vs별로 소그룹을 나누겠다. 그리고 그 그룹안에서의 최댓값을 보여준다.
agg #cyl으로 대그룹을 나누고 vs로 소그룹을 나눈 다음에 각각 컬럼의 최댓값을 보여준다.

search() #현재 로드된 라이브러리들을 보여준다.이 중에서는 RStudio가 구동될때 자동으로 로드되는 것들도 있다.

# 난생처음 교재 소스 : 417 페이지



# 난생처음 교재 소스 : 426 페이지 - 12장 -

library(treemap)                     # treemap 패키지 불러오기 #require()도 패키지를 로드하는데 차이점은 리턴값으로 제대로 실행됐는지 안 됐는지를 알려준다.
data(GNI2014)                        # 데이터 불러오기 
head(GNI2014)                        # 데이터 내용 보기 
treemap(GNI2014,
        index=c('continent','iso3'), # 계층 구조 설정(대륙-국가)
        vSize='population',          # 타일의 크기
        vColor='GNI',                # 타일의 컬러
        type='value',                # 타일 컬러링 방법
        bg.labels='yellow',          # 레이블의 배경색
        title="World's GNI")         # 나무지도 제목  

#책 428pg
st <- data.frame(state.x77)                 # 매트릭스를 데이터프레임으로 변환
st <- data.frame(st, stname=rownames(st))   # 주의 이름 열 stname을 추가 

treemap(st,
        index=c('stname'),                   # 타일에 주 이름 표기
        vSize='Area',                        # 타일의 크기
        vColor='Income',                     # 타일의 컬러
        type='value',                        # 타일 컬러링 방법
        title='USA states area and income' ) # 나무그림의 제목



#책 431pg
# (1) 자료 확인
ds <- read.csv('data/seoul_temp_2017.csv')
dim(ds) #행과 열의 개수를 출력해준다.
head(ds)

# (2) 서울의 1년 기온 분포 
summary(ds$avg_temp) #수치데이터이기 때문에 최솟값, 최댓값, 1분위, 중간, 평균, 3분위값을 출력한다. 
boxplot(ds$avg_temp, 
        col='green', 
        ylim=c(-20,40), 
        xlab='서울 1년 기온',
        ylab='기온')

# (3) 월별 기온 분포 
# 월별 평균(중간)기온 계산 
month.avg <- aggregate(ds$avg_temp, 
                       by=list(ds$month),median)[2] #meadian은 중간값, mean은 평균값 #mean으로 안 한 이유는 NA의 영향을 받지 않기 위해.
month.avg
#13:50 종료

#14:00 시작
month.avg <- month.avg[,1] #열이 하나밖에 없는데 이렇게 한 이유는 이렇게 꺼내면 데이터프레임 형태가 아닌 벡터로 꺼낸다.
names(month.avg) <- 1:12 #각각의 엘리먼트마다 이름을 붙여줘서 named vector를 만들었다.
month.avg

# 평균기온 순위 계산 
order(month.avg) #정렬한 후 인덱스를 담고있는 벡터를 리턴한다. #젤 작은 값은 인덱스1번째이고 그 다음은 인덱스12번째 데이터 이런 식
order(-month.avg)

rank(month.avg)
odr <- rank(-month.avg) #내림차순(큰->작)으로 랭킹을 정하겠다는 뜻. 기본은 오름차순이다.
odr 

order(c(1,3,1,10,10,2,5,3)) #젤 작은 데이터는 인덱스1, 2번째로 작은 데이터는 인덱스3, 3번째로 작은 데인터는 인덱스6
rank(c(1,3,1,10,10,2,5,3)) #같은 값이 여러 개 있다면 1등과 2등등에 대한 평균을 적용해서 1등과 2등이 1.5등이 된다.
rank(c(1,2,3,4,5,6,7))
rank(c(1,1,3,5,5,5,7))
rank(-c(1,3,1,10,10,2,5,3)) # 
rank(10:7)   # 10 9 8 7  --> 4 3 2 1
order(10:7)  # 10 9 8 7  --> 4 3 2 1  
rank(c(10, 5, 15, 8))   #  3  1  4  2
order(c(10, 5, 15, 8))  #  2  4  1  3
# 월별 기온 분포 
boxplot(avg_temp~month, data=ds,  
        col=heat.colors(12)[odr],   # 상자의 색을 지정 #odr객체를 기준으로 head.colors의 12가지 색상을 적용한다.
        ylim=c(-20,40), 
        ylab='기온',
        xlab='월',
        main='서울시 월별 기온 분포(2017)')



# (1) 자료 확인
head(airquality)
ds <- airquality[complete.cases(airquality),]   # 결측값 제거
unique(ds$Month)                                # 월 확인

# (2) 월별 오존농도 분포 
# 월별 평균(중간값) 오존농도 계산

month.avg <- aggregate(ds$Ozone, 
                       by=list(ds$Month),median)[2]
month.avg

month.avg <- month.avg[,1]
names(month.avg) <- 5:9

# 평균기온 순위 계산(내림차순) 
odr <- rank(-month.avg) 
odr

# 월별 오존농도 분포 
boxplot(Ozone~Month, data=ds,  
        col=heat.colors(5)[odr],   # 상자의 색 지정 
        ylim=c(0,170), 
        ylab='오존농도',
        xlab='월',
        main='여름철 오존농도')


#책 440pg
install.packages('fmsb')
library(fmsb) 

# (1) 자료 준비 #설명놓침
score <- c(80,60,95,85,40)
max.score <- rep(100,5)          # 100을 5회 반복
min.score <- rep(0,5)            # 0을 5회 반복
(ds <- rbind(max.score,min.score, score))
ds <- data.frame(ds)             # 매트릭스를 데이터프레임으로 변환  
colnames(ds) <- c('국어','영어','수학','물리','음악')
ds

# (2) 방사형 차트 #설명놓침
radarchart(ds) #0점과 100점 사이의 과목 점수 #pes에서 선수 능력치 보여줄때가 이 방법임

# [코드 12-5]에 이어 실행 
radarchart(ds,                           # 데이터프레임
           pcol='dark green',            # 다각형 선의 색 
           pfcol=rgb(0.2,0.5,0.5,0.5),   # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=4,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           caxislabels=seq(0,100,25)     # 축의 레이블 값
)


#책 445pg
library(ggplot2)

month <- c(1,2,3,4,5,6)
rain  <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)           # 그래프를 작성할 대상 데이터
df

ggplot(df, aes(x=month,y=rain)) +      # 그래프를 작성할 데이터 지정
  geom_bar(stat='identity',            # 막대그래프의 형태 지정  
           width=0.7,                  # 막대의 폭 지정
           fill='steelblue')           # 막대의 색 지정

# [코드 12-7]에 이어서
ggplot(df, aes(x=month,y=rain)) +      # 그래프를 그릴 데이터 지정
  geom_bar(stat='identity',            # 막대 높이는 y축에 해당하는 열의 값  
           width=0.7,                  # 막대의 폭 지정
           fill='steelblue') +         # 막대의 색 지정
  ggtitle('월별 강수량') +              # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face='bold', colour='steelblue')) +
  labs(x='월',y='강수량') +            # 그래프의 x, y축 레이블 지정
  coord_flip()                         # 그래프를 가로 방향으로 출력


ggplot(iris, aes(x=Petal.Length)) +    # 그래프를 그릴 데이터 지정
  geom_histogram(binwidth = 0.5)        # 히스토그램 작성 



ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position='dodge') +
  theme(legend.position='top')          #범례가 위에 표시되고 있음.



ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()



ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species)) + 
  geom_point(size=3) +
  ggtitle('꽃잎의 길이와 폭') +              # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face='bold', colour='steelblue')) 


ggplot(data=iris, aes(y=Petal.Length)) + 
  geom_boxplot(fill='yellow') 



ggplot(data=iris, aes(x=Species, y=Petal.Length, fill=Species)) + 
  geom_boxplot() 



year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)              # 데이터 준비
head(df)

ggplot(data=df, aes(x=year,y=cnt)) +    # 선그래프 작성
  geom_line(col='red') 

# 난생처음 교재 소스 : 455 페이지


#15:00 시작
# 난생처음 교재 소스 : 466 페이지 - 13장 -

install.packages("HSAUR")

library(HSAUR)
data("Forbes2000") #따옴표는 줘도 되고 안 줘도 된다. #포브스 선정 세계 2000대 기업
ds <- Forbes2000 
ds[!complete.cases(ds),]          # 결측값 확인

str(ds)
head(ds)

table(ds$country)
(tmp <- sort(table(ds$country), decreasing=T))
top.10.contry <- tmp[1:10]
top.10.contry                     # 상위 10개국

par(mar=c(8,4,4,2))               # 그래프 여백 조정
barplot(top.10.contry,
        main='기업수 상위 10개국',
        col=rainbow(10),          # 레인보우 팔레트
        las=2
)
par(mar=c(5,4,4,2))

# 업종별 기업 분포
table(ds$category)
tmp <- sort(table(ds$category), decreasing=T) #내림차순으로 정렬
top.10.category <- tmp[1:10]
top.10.category                    # 상위 10개 업종

par(mar=c(10,4,4,2))               # 그래프 여백 조정
barplot(top.10.category,
        main='기업수 상위 10개 업종',
        col='pink',
        las=2)
par(mar=c(5,4,4,2))

# 업종별 기업자산 분포
tmp <- ds[ds$category %in% names(top.10.category),]
levels(tmp$category)
tmp$category <- factor(tmp$category) # 그룹 정보가 포함된 값들만으로 레벨을 재구성하기 위해
levels(tmp$category)

par(mar=c(10,4,4,2))               # 그래프 여백 조정
boxplot(assets~category, data=tmp,
        ylim=c(0,100),
        xlab='',
        las=2)
par(mar=c(5,4,4,2))


tmp <- ds[order(ds$marketvalue, decreasing=T),]
tmp[1:10,c('name', 'country','category','marketvalue')]


korea <- subset(ds, country=='South Korea') #한국 기업정보
korea[,c('rank','name','category','marketvalue')]


tmp <- ds[,5:8]
tmp <- tmp[complete.cases(tmp),]  # 결측값 제거
plot(tmp, lower.panel=NULL)       # 산점도 #lower.panel=NULL을 줘서 아랫쪽 패널은 그리지 않는다. 어차피 윗쪽패널과 대칭으로 그리기 때문이다.
cor(tmp)                          # 상관계수


#책 477pg
files <- c('data/ds.2015.csv', 'data/ds.2016.csv','data/ds.2017.csv',
           'data/ds.2018.csv','data/ds.2019.csv')

ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header=T)
  ds <- rbind(ds, tmp) #기존 데이터프레임 밑에 새로운 데이터프레임을 새로운 행으로 추가시킨다.
  print(f)
}

str(ds)
head(ds)
unique(ds$loc)                             # 관측 장소
range(ds$mdate)                            # 측정 기간

# 열별 결측값 확인
for (i in 3:8) {
  cat(names(ds)[i], sum(is.na(ds[,i])), sum(is.na(ds[,i]))/nrow(ds), '\n')   
}
ds <- ds[,-8]                              # PM25 열 제거
ds <- ds[complete.cases(ds),]              # 결측값이 포함된 행 제거
#15:45 종료

mdate <- as.character(ds$mdate)
head(mdate)
ds$year  <- as.numeric(substr(mdate, 1,4))  # 연도
ds$month <- as.numeric(substr(mdate, 5,6))  # 월
ds$hour  <- as.numeric(substr(mdate, 9,10)) # 시간
ds$locname <- NA                            # locname 열을 추가
ds$locname[ds$loc==111123] <- '서울'        # 도시
ds$locname[ds$loc==336111] <- '목포'        # 도시  
ds$locname[ds$loc==632132] <- '강릉'        # 도시

head(ds)


boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포')

boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100)) #y축의 범위를 1~100으로 지정해준다.

library(ggplot2)

tmp.year <- aggregate(ds[,7], by=list(year=ds$year,loc=ds$locname), FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc) #일부 열을 팩터형으로 변환
head(tmp.year) #위에서 6개 행만 보여준다.

ggplot(tmp.year, aes(x=year,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+ #alpha는 투명도를 의미한다. 0.0은 완전투명, 1.0은 완전 불투명
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

tmp.month <- aggregate(ds[,7], by=list(month=ds$month,loc=ds$locname), 
                       FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')


tmp.hour <- aggregate(ds[,7], by=list(hour=ds$hour,loc=ds$locname), FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour,y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('시간별 PM10 농도 변화')+
  ylab('농도')

str(ds)
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])


tmp.yml <- aggregate(ds[,7], by=list(year=ds$year,month=ds$month,
                                     loc=ds$locname), FUN='mean')

# 가장 미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

# 가장 미세먼지가 적었던 달
idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]

# 난생처음 교재 소스 : 486 페이지 
####################################### 여기까지가 난생처음의 소스



install.packages("corrplot")

############################## 회귀 분석 ###############################
# 독립 변수와 종속 변수 간의 관계를 가장 잘 나타내는 함수를 만드는 것
# 회귀분석을 통해 적절한 함수를 만들 수 있다면,
# 1) 독립 변수만으로도 종속변수를 예측할 수 있고,
# 2) 독립 변수가 종속 변수에 어떤(얼마나) 영향을 끼치는지 설명할 수 있다.
########################################################################
## 단순 선형 회귀 분석

height=c(158, 163, 142, 198, 172, 155, 165, 168, 175, 182, 180, 160)
weight=c(53, 77, 55, 101, 73, 58, 78, 71, 68, 79, 75, 65)

# 사전 작업
plot(height, weight) #키, #몸무게
(c_v<- cor(height, weight)) #상관계수를 구하고 있다. #0.5보다 작다.
cor.test(height, weight)  # p값이 0.05 보다 작으면 상관관계가 있다.

# 단순 선형 회귀분석
model = lm(weight~height) #linear model의 약어 #~뒤에는 독립변수, 앞에는 종속변수를 준다.
abline(model, col='red') #회쉬분석을 한다는 것은 이 데이터셋에 제일 잘 맞는 회귀식을 구한거다.
# 회귀 분석의 결과 해석
summary(model) #R-squared는 이 회귀모델은 이 데이터셋에 대하여 약 75%만큼의 설명력을 갖는다는 얘기다.

# 예측
df <- data.frame(height = c(160, 170, 180))

(coef_r <- coef(model))  # 회귀 계수 추출
coef_r[1] # 절편   - 편향
coef_r[2] # 기울기 - 가중치
round(coef_r[2] * df + coef_r[1], 1) #round(기울기&독립변수 + 절편)
round(0.7705 * df  -58.4859, 1)
# 회귀식 : 0.7705 * height  -58.4859

p_h_w <- predict.lm(model, newdata = df) #newdata에는 독립변수에 대한 데이터프레임 객체를 지정하고 있다.
round(p_h_w, 1)

####################################################
## 다중회귀분석 (multiple linear regression)

## 다중회귀분석 예제 1
# 엄마와 아빠 키로 아들의 키를 예측하는 다중선형회귀모델 생성 
height_father <- c(180, 172, 150, 180, 177, 160, 170, 165, 179, 159) # 아버지 키 #샘플 데이터라고 가정
height_mohter <- c(160, 164, 166, 188, 160, 160, 171, 158, 169, 159) # 어머니 키 #샘플 데이터라고 가정
height_son <- c(180, 173, 163, 184, 165, 165, 175, 168, 179, 160) # 아들 키      #샘플 데이터라고 가정
heightdf <- data.frame(height_father, height_mohter, height_son) #데이터프레임으로 생성
head(heightdf) 
library(corrplot)
(c_v <- cor(heightdf)) #상관계수 체크해서 c_v 변수에 저장
corrplot(c_v)#, type="r", order="hclust", tl.srt=45, diag=F)


model <-lm (height_son ~ height_father + height_mohter, data = heightdf) #종속변수~독립변수+독립변수
model 


# 결정계수와 수정된 결정계수
summary(model) # 상수항에 대한 검정은 하지 않는 것이 일반적 #단순히 회귀분석을 해서 만들어진 결과를 출력만하면 그 때는 주어진 데이터셋을 해서 ~~~ summary()를 수행하면 Coefficients 부분이다. Intercept는 상수부분이라 상관쓰지 않아도 된다(가 아닌것 같은데). 회귀계수는 유의미한지는 Pr(>|t|)값이 0.05보다 작으면 된다. 맨 마지막에 p-value도 0.05보다 작은지 봐야 한다.
#다중선형회귀일때는 Multiple R-squared보다는 Adjusted-R-squared 값을 본다. 여기서는 75%의 설득력을 가진다고 나온다.
#summary함수를 이용해서 회귀분석한 결과를 해석할 수 있는 결과를 출력한다.

(coef_r <- coef(model))
coef_r[1]
coef_r[2]
coef_r[3]

# 예측 
predict.lm(model, newdata = data.frame(height_father = 170, height_mohter = 160))
#11/15 종료


###################################################################
## 상관분석과 회귀분석 응용
## 통계분석과 기본 그래프
## 김 대표의 양계장에는 7개의 부화장이 있고 부화장마다 최대 30개의 알을 부화시킬 수 있다.
## 병아리는 부화하는데 걸리는 기간이 약 21일이다.
## 어제까지 딱 21일이 지났다. 총 몇마리의 병아리가 부화했는지 알아보자.
## (1) 어제까지 몇 마리의 병아리가 부화했을까? (기초통계량)

# 데이터 파일 읽어오기
hat <- read.csv("data/data1.csv")
hat

str(hat)

# 합계 구하기
sum(hat$chick)

# 평균 구하기
mean(hat$chick)

# 표준편차 구하기
sd(hat$chick)

# 중앙값 구하기
median(hat$chick)

# 최소값 구하기
min(hat$chick)

# 최대값 구하기
max(hat$chick)

# 데이터 정렬하기
hat_asc <- hat[order(hat$chick),] # chick 열을 기준으로 오름차순 정렬
hat_asc

# 간단한 그래프를 그려서 보자
# 막대그래프
barplot(hat$chick)

# 다양한 옵션을 통해 막대그래프 정보를 추가하자
barplot(hat$chick, names.arg = hat$hatchery,
        col = c("red","orange","yellow","green", "blue", "navy", "violet"), 
        main = "부화장별 병아리 부화현황", xlab = "부화장", ylab = "병아리수",
        ylim = c(0,35), family="dog")


library(RColorBrewer) # RColorBrewer 패키지 현재 작업 환경으로 불러오기
display.brewer.all()

col7 <- brewer.pal(7, "Pastel2")  # col7이라는 변수에 "Pastel2"라는 팔레트에서 7개의 색상을 집어넣음
col7

barplot(hat$chick, names.arg = hat$hatchery,
        col = col7, 
        main = "부화장별 병아리 부화현황", xlab = "부화장", ylab = "병아리수",
        ylim = c(0,35), family="dog")


bar_x <- barplot(hat$chick)  # bar_x 변수에 barplot의 x좌표 집어넣음

# 위에 bar_x 라는 변수를 만들어주는 이유는 x좌표를 알아내기 위함임
bar_x

# 다시 예쁜 그래프 기리기
barplot(hat$chick, names.arg = hat$hatchery,
        col = col7, 
        main = "부화장별 병아리 부화현황", xlab = "부화장", ylab = "병아리수",
        ylim = c(0,35), family="dog")
# 막대그래프에 text 추가, pos는 라벨의 위치
text(x = bar_x, y = hat$chick, labels = hat$chick, pos = 3, , family="dog")
# 막대그래프에 30기준으로 빨간색 점선 추가
abline(h = max(hat$chick), col = "red", lty = 2, lwd = 1)

# 파이차트 그리기
# 파이차트 그리기에 앞서 Percentage 열 만들어줌
hat$pct <- round(hat$chick/sum(hat$chick)*100, 1)
hat

# 파이차트 그리기
pie(hat$chick, labels = paste(hat$hatchery, hat$pct, "%"), 
    col = col7, clockwise = TRUE, 
    main = "부화장별 병아리 부화 비율", family="dog")


## 체계적인 사육을 위해 김대표는 부화된 병아리 모두에 GPS 위치추적기가 탑재된 Tag를 부착해
## 병아리 개별 데이터를 수집하기로 했다. 먼저 병아리들의 몸무게를 측정한다.

## 정규분포 : 수집된 데이터들의 평균 근처에 값이 모여 있는 연속 확률분포
## 평균값과 표준편차에 의해 모양이 결정되는 연속확률분포
##            주변에서 흔히 볼 수 있는 데이터들의 분포는 대부분 정규분포
## 중심극한정리 : 데이터가 적당히 많을 경우(일반적으로 30이상) 정규분포에 가까워 진다.
##                평균값과 표준편차만 알아도 대략적인 데이터의 분포를 알아낼 수 있다.

## (2) 부화한 병아리들의 체중은 얼마일까? (정규분포와 중심극한정리)

# 샘플 병아리 데이터를 불러오기
b <- read.csv("data/data2.csv")

head(b)
str(b)
summary(b)

# B 부화장 병아리 무게 표준편차
sd(b$weight)

## (참고)정규분포 그래프 설명용 그리기
## 확률변수 X가 정규분포를 따르면 평균값에 대해 좌우 대칭이고, 
## 분산값이 크면 더 크게 흩어진 분포를 갖는다.
## 확률변수(random variable)란 랜덤한 실험결과에 따라 생성되는 실수이다.
X <- seq(-5, 5, length = 500)
y1 <- dnorm(X, mean = 0, sd = 1) 
y2 <- dnorm(X, mean = 0, sd = 2)

plot(X, y1, type = "l", col = "blue", ylabel = NULL, xlabel = NULL, main = "표준편차(1, 2)에 따른 정규분포 비교")
lines(X, y2, type = "l", col = "red")
legend("topright", c("X~N(0,1)","X~N(0,4)"), text.col = c("blue", "red"))
##########################################################################

# Histogram으로 분포 확인
hist(b$weight, col = "sky blue", xlab = "병아리 무게(g)", main = "B 부화장 병아리 무게 분포 현황")

# Box-Plot으로 분포 확인
boxplot(b$weight, col = "sky blue", main = "B 부화장 병아리 무게 상자그림")

# 히스토그램과 Box-Plot을 같이 그리기
par(mfrow=c(2,1))  # 행 2개, 열 1개
hist(b$weight, col = "sky blue", xlab = "병아리 무게(g)", , main = "B 부화장 병아리 무게 분포 현황")
boxplot(b$weight, horizontal = TRUE, col = "sky blue")
par(mfrow=c(1,1)) 

## 히스토그램과 상자그림을 통해 병아리의 몸무게가 어느 정도인지 확인한 결과 30마리의 체중이
## 30~45g 사이에 분포하며 그중 절반은 36.25(1사분위 수)~40.75(3사분위 수) 사이에 분포한다는
## 것을 파악할 수 있다.

## 병아리가 부화한지 5일이 지났다. 그런데 이상한 점을 발견했다. 부화장 A에서 태어난 병아리 
## 대비 부화장 B에서 태어난 병아리의 덩치가 더 작아 보인다. 서로 다른 사료를 먹이고 있기는
## 한데 기분 탓인지, 아니면 정말 작인지 검정해 보자.

## (3) 사료 제조사별 성능차이가 있을까? (가설검정)

# 파일의 데이터 불러오기
test <- read.csv("data/data3.csv")
test

# 상자그림을 2개 그려서 비교해봄
boxplot(weight ~ hatchery, data = test, 
        horizontal = TRUE, col = c("light green", "sky blue"),
        ylab= "부화장", xlab = "몸무게 분포",
        main = "부화장 A vs. B 몸무게 분포 비교")

## 통계적으로 두 집단의 몸무게가 같은지 다른지는 어떻게 설명할 수 있을까?
## 이럴 때 사용하는 것이 바로 가설검정이다.
## 가설검정이란 통계추론의 영역으로 "비교하는 값과 차이가 없다"는 가정의 귀무가설과
## 반대인 대립가설을 설정해서 검정 통계량으로 가설의 진위를 판단하는 방법이다.

## 두 집단의 평균(몸무게)이 같은지 다른지 가설검정의 방법론인 t-test를 통해 진행한다.
## t-test는 데이터가 정규분포를 한다는 가정하에 평균이 데이터의 대푯값을 한다고 전제한다.
## 따라서 t-test를 수행하기 전에 데이터가 정규분포를 따르는지 검정한다.
## 데이터의 정규성 검정 : 샤피로 월크 검정 
##    귀무가설 : 정규 분포한다. 대립가설 : 정규분포하지 않는다.
##    95% 신뢰수준을 적용하여 계산되는 유의확률(p값)이 0.05 보다 작으면 귀무가설을 기각하고
##    0.05 보다 크면 귀무가설을 채택한다. 유의확률(p값)이란 귀무가설을 지지하는 정도이다.
# 두 집단이 우선 정규분포를 따르고 있는지 샤피로 월크 검정 실시한다.

a <- subset(test$weight, test$hatchery == 'A')
b <- subset(test$weight, test$hatchery == 'B')
shapiro.test(a) # p값이 0.05 크면 정규분포하는 것으로 판정
shapiro.test(b)

## 부화 후 일주일 뒤 각각 다른 사료를 먹고 키운 병아리의 성장에 차이가 있을까?
## 두 집단의 평균이 다르다고 할 수 있을까? -> t-test 를 통해서 검정 - 계산되는 유의확률 p 값으로 결정
##    귀무가설 : 두 집단의 평균에 차이가 없다.  대립가설 : 두 집단의 평균에 차이가 있다.                             

t.test(data = test, weight ~ hatchery) 

# 결과해석 : p값이 0.01094로 0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택함, 
# 즉 두 집단의 평균은 다름


## 상관분석과 회귀분석
## 상관분석과 회귀분석은 데이터 분석 모델을 만들기 위한 가장 기초적인 관문이다. 
## 상관분석은 변수와 변수의 관계가 서로 비례 또는 반비례 관계인지 + 와 - 부호로 표현하고
## 회귀분석은 서로 상관관계가 있는 연속형 변수들의 관계를 수식으로 나타낸다.

## 병아리의 성장(체중)에 영향을 미치는 인자는 무엇일까? (상관분석)
## 유전적인 요소? 사료의 양?

# 데이터 불러오기
w <- read.csv("data/data4.csv")

head(w)
tail(w)
str(w)

# w 데이터 셋에서 2~5열 데이터만 가져오기(첫열은 character이므로)
w_n <- w[,2:5]
head(w_n)

# 위와 동일
w_n <- subset(w, select = -c(chick_nm))

head(w_n)

## 상관분석을 실시하면 두 변수 간의 관계를 상관 계수로 나타낸다.
## 상관계수는 두 변수 간에 연관된 정도만 나타낼 뿐 인과관계(원인-결과)를 설명하는 것은 아니다.
## 상관계수는 -1~1사이의 값을 갖는다. 

w_cor <- cor(w_n)  # w_n 데이터 셋으로 상관분석한 결과를 w_cor변수에 넣음
w_cor  # w_cor 상관분석 결과 확인

## 상관분석을 통하여 얻은 상관계수가 과연 통계적으로도 유의한가?
## 유의성 검정의 귀무가설 : 두 변수는 선형관계가 없어 상관계수가 0이다. 
## 유의성 검정의 연구가설 : 두 변수 간에는 선형관계가 존재하여 상관계수가 0이 아니다.
## p값이 0.05 보다 작으면 귀무가설 기각
cor.test(w_n$weight, w_n$egg_weight)
cor.test(w_n$weight, w_n$movement)
cor.test(w_n$weight, w_n$food)

plot(w_n)  # w_n 데이터 셋 산점도로 표현

# 그냥 한번 실행해보기(주의할 점은 데이터셋이 아닌 상관분석결과를 넣어야함)
corrplot(w_cor)  # 상관분석 결과인 w_cor을 corrplot 패키지로 실행해보기

# 원을 타원으로 표시하고, 하단에만 표시하고, 상관계수 표시
corrplot(w_cor, method = "ellipse", 
         type = "lower", addCoef.col = "white")



## 상관분석을 통해 병아리 몸무게에 영향을 미치는 인자를 찾을 수 있었고 그중에서도 병아리가 태어난 
## 달걀인 종란의 무게가 가장 큰 양의 상관 관계를 갖고 있음을 확인할 수 있었다.
## 그렇다면 종란의 무게로 병아리의 몸무게를 예측하는 것이 가능할까? 회귀분석을 통해 해결해 본다.
## 선형회귀분석 : 연속형 변수들에 대해 두 변수 간의 관계를 수식으로 나타내는 분석 방법이다.
##                영향을 주는 변수 - 독립변수(x), 영향을 받는 변수 - 종속변수(y)
##                회귀식 - y = ax + b


## 종란의 무게로 병아리의 무게를 예측할 수 있을까? (회귀분석)

w <- read.csv("data/data4.csv")
# w 데이터 셋에서 2~5열 데이터만 가져오기(첫열은 factor이므로)
w_n <- w[,2:5]
head(w_n)

# 단순선형 회귀분석 실시
w_lm <- lm(weight ~ egg_weight, data = w_n)

w_lm

## - 회귀모델 F 통계량의 p-값(유의확률)을 확인하여 0.05 보다 작으면 95% 신뢰수준에서 
##   통계적으로 유의하다고 판단함
## - 독립 변수의 p-값(유의확률)을 확인하여 0.05 보다 작으면 95% 신뢰수준에서 
##   통계적으로 유의(영향력이 있다고)하다고 판단함 또한 * 기호가 많을 수록 유의성이 높아짐
## - 결정계수(R-squared)가 높은지 확인하여 1에 가까울수록 회귀모델의 성능이 뛰어남을 뜻함.
##   독립변수가 2개이상인 다중회귀모델은 Adjusted R-squared 값으로 확인
## - 상수항은 유의성 검정을 하지 않는 것이 일반적
## - 회귀모델의 y절편(상수)과 독립변수의 계수는 Estimate 값으로 확인 가능. 회귀분석 결과를
##   저장한 변수의 coefficient로도 확인 가능.
# 회귀모델 결과 확인
summary(w_lm)

# 산점도에 회귀직선을 표시해 모델이 데이터를 잘 대표하는지 확인
plot(w_n$egg_weight, w_n$weight)  # 산점도 그리기
lines(w_n$egg_weight, w_lm$fitted.values, col = "blue")  # 회귀직선 추가
text(x = 66, y = 132, label = 'Y = 2.3371X - 14.5475')  # 회귀직선 라벨로 표시

names(w_lm)  # w_lm 변수에 어떤 항목들이 있는지 확인

w_lm$coefficients
w_lm$model
w_lm$residuals # 잔차 : 실제 종속변수 값과 회귀 모델로 추정된 값의 편차 -> 머신러닝에서는 오차라고 함

hist(w_lm$residuals, col = "skyblue", xlab = "residuals",
     main = "병아리 무게 잔차 히스토그램")

## 잔차에 대한 히스토그램을 확인한 결과 정규분포를 이루고 있지 않는다.
## 잔차가 높게 나왔다는 결과... --> 영향을 주는 변수인 독립 변수를 좀더 늘려보자. - 다중회귀분석
## 다중회귀분석 : 독립 변수가 2개 이상 - y = ax1 + bx2 + c

# 다중회귀분석 실시
w_mlm <- lm(weight ~ egg_weight + movement + food, data = w_n)

summary(w_mlm)


# p값이 높은 movement 변수를 제외한 열만 다시 회귀분석 실시 
w_mlm2 <- lm(weight ~ egg_weight + food, data = w_n)

summary(w_mlm2)

## 다중회귀분석에서 변수 선택 방법
## 전진선택법 : y 절편만 있는 상수부터 시작해서 독립 변수들을 추가해 나가는 방법
## 후진소거법 : 독립 변수를 모두 포함한 상태에서 가장 적은 영향을 주는 변수를 하나씩 제거해 나감
# (참고)후진소거법을 적용해 자동으로 실행
step_mlm <- step(w_mlm, direction = "backward")



#leaflet을 이용한 지도 그리기

install.packages("leaflet")
library(leaflet)
library(dplyr)


lon <- 126.97797  
lat <- 37.5662
seoul_lonlat <- data.frame(lon, lat)

# 지도 배경 그리기 
leaflet()

# 지도 배경에 타일깔기
leaflet() %>% addTiles() 

# 지도 배경에 센터 설정하기
map0 <- leaflet() %>% setView(lng = seoul_lonlat$lon, lat = seoul_lonlat$lat, zoom = 12)  
map0

# 지도 배경에 센터 설정하고 타일깔기
map1 <- map0 %>% addTiles() 
map1

lon <- 127.055642
lat <- 37.5096
multi_lonlat <- data.frame(lon, lat)
mk <- multi_lonlat
msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >멀티캠퍼스</a></strong><hr>우리가 공부하는 곳 ㅎㅎ'
map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 18) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 5) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 1) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='green', popup = msg )
map2


content1 <- paste(sep = '<br/>',"<b><a href='https://www.seoul.go.kr/main/index.jsp'>서울시청</a></b>",'아름다운 서울','코로나 이겨냅시다!!')
map3<-leaflet() %>% addTiles() %>%  addPopups(126.97797, 37.56654, content1)
map3

content2 <- paste(sep = '<br/>',"<b><a href='http://www.snmb.mil.kr/mbshome/mbs/snmb/'>국립서울현충원</a></b>",'1955년에 개장', '2013년 ‘서울 미래유산’으로 등재')
map3<-leaflet() %>% addTiles() %>%  addPopups(c(126.97797, 126.97797),  c(37.56654, 37.50124) , c(content1, content2), options = popupOptions(closeButton = FALSE) )
map3

leaflet() %>%
  addTiles() %>%
  setView( lng=lon, lat=lat, zoom = 16) %>%
  addProviderTiles("Esri.WorldImagery")


leaflet() %>%
  addTiles() %>%
  setView( lng=lon, lat=lat, zoom = 6) %>%
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")



# 지도 응용
wifi_data = read.csv('data/wifi_data.csv')
View(wifi_data)
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], 
          lat = seoul_lonlat[2], 
          zoom = 11) %>% 
  addTiles() %>% 
  addCircles(lng = ~lon, lat = ~lat)


leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat)


leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addCircles(lng = ~lon, lat = ~lat)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat, popup = ~div)

?colorFactor
telecom_color = colorFactor('Set1', wifi_data$div)
class(telecom_color)
telecom_color(wifi_data$div)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat=~lat, popup = ~div, color = ~telecom_color(div)) -> mymap

mymap

