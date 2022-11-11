# 데이터 전처리 - 데이터 시각화를 학습하자

install.packages("showtext") #385번째 라인에 install.packages('plotrix')도 있음.
library(showtext)
showtext_auto() #showtext 패키지에게 필요한 상황이 되면 폰트 출력 모드를 켜고 끄는 것을 알아서 하라는 지시
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

rainbow(3) #rainbow()는 무지개 색상을 제공하는 함수 #빨 초 파
rainbow(7) #빨주노초파남보 (R기본시각화.pdf 16pg에서 나옴)

#11/10 시작
par(c("mar","mfrow")) #$mar [1] 5.1 4.1 4.1 2.1   $mfrow [1] 1 1 와 같은 기본값 실행 #R기본시각화.pdf 3pg

국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어) #점 그래프 그림

plot(국어, type="o", col="blue", family="maple")      #type을 통해 점과 선을 다 그리도록 설정 #col을 통해 그래프 색상을 파란색으로 #폰트는 maple체로 
title(main="성적그래프", col.main="red", font.main=4, family="maple") #메인 타이틀:"성적그래프" 메인타이틀라벨색상: 빨강 #폰트 스타일:4(뭘 줘도 딱히 변화가 없다고 함) #폰트는 maple체로

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)


plot(국어, type="o", col="blue") #plot은 고수준 함수라 위에서도 그랬지만 이전의 그래프를 없애고 새로 그래프를 그림.
lines(수학, type="o", pch=16, lty=2, col="red") #lines는 저수준 함수 #기존 그래프 위에 다른 그래프를 그림
title(main="성적그래프", col.main="red", font.main=3) #title도 저수준 함수

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2)) #margin은 par(mar = c(bottom, left, top, right))다. 아래에서부터 시계방향으로 진행된다. 
#mfrow는 4행 2열로 지정해서 그래프를 8개를 그릴 수 있도록 한다.

plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")
par(mar=c(5,5,5,5), mfrow=c(1,1))

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)

plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE)

# x, y 축 추가하기
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10"), family="maple") # x축 추가
axis(2, at=c(0,2,4,6,8,10), family="maple")  # y축 추가

# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=2, col="red")    
box()   # 박스 그리기 #그래프의 top, right쪽도 선이 그려진다.

# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", family="maple") #타이틀 라벨
title(xlab="학번", col.lab=rgb(0,1,0), family="maple")  #x축 라벨
title(ylab="점수", col.lab=rgb(1,0,0), family="maple")  #y축 라벨
legend(8, 3, c("국어","수학"), cex=1.2, col=c("blue","red"), pch=c(21,16), lty=c(1,2))  #cex는 사이즈다. 8,3은 x축8, y축3의 위치에 legend를 그리라는 뜻이다. #pch는 R기본시각화.pdf 1pg 참고. 21은 채워진 빨강동그라미, 16은 채워진 파랑동그라미 #lty는 2는 점선, 1은 실선이다.



(성적 <- read.table("data/성적.txt", header=TRUE))

plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11))  #성적$학번, 성적$국어를 만약 하나만 주면 y축, 2개다 주면 x축과 y축

ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")
png(filename="output/성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정 #이걸 실행하면 그 다음부터는 그래프가 파일로 나가고 Plots  창에 안 나타난다.
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=c(0,2,4,6,8,10), lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3)) #x축은 1, y축은 최대에 맞춘다. 
dev.off() #이걸 실행해줘야 앞으로 그리는 그래프가 파일로 안 나가고 RStudio의 Plots창에 나타난다.

plot(성적$국어, 성적$수학) #x축은 국어점수, y축은 수학(학생들은 국어와 수학 점수가 모두 있음)
plot(수학~국어) # 포뮬러식 #국어 대비 수학 #순서는 반대로 y축~x축 으로 해준다.

?plot


# 막대그래프 그리기
ls() #지금까지 만든 객체들 출력함. 지금 그래프와는 필요없는 코드임;;
barplot(국어) #국어 객체는 22번째 라인에서 만듬

coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터 #seq(from=10, to=100, by=10)는 10부터 100까지 10단위로 값을 증가시키는 벡터생성.
xname <- 성적$학번                                         # X 축 값 설정위한  벡터
barplot(성적$국어, main="성적그래프", xlab="학번", 
        ylab="점수", border="red", col="green", density=coldens,  #density는 밀도로 그래프 색상 밀도를 말한다.
        names.arg=xname, family="dog")

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5] 
str(성적1)
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(as.matrix(성적1), main="성적그래프", beside=T, #beside=T를 줘서 학생별로, 과목별로 점수를 따로 출력한다. 즉 한줄에 출력이 안 되고 옆으로 세워진다. 아니면 국어 점수 막대 하나에 학생들의 점수가 색상별로 구분된다.(상대값(%)이 아닌 절대값이라 보기 흉함.)
        ylab="점수", col=rainbow(10), family="cat")

par(mar=c(5,5,5,5), mfrow=c(1,2)) #마진값 상하좌우5, 1행2열로 그래프를 한 공간에 나란히 2개를 그린다.
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", 
        col=rainbow(10))
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3)) #t()는 전치한다는 뜻이다. 원래 행렬(matrix)에 적용하는 함수다. 드래그해서 성적1만 출력해보고 t(성적1)만 출력해보면 이해하기가 좀 더 쉬움.

par(mar=c(5,5,5,5), mfrow=c(1,1))  #마진값 상하좌우5, 1행1열로 그래프를 한 공간에 나란히 2개를 그린다.
# 학생의 각 과목에 대한 합계 점수에 대한 그래프
xname <- 성적$학번;    #  x축 레이블용 벡터
par(xpd=T, mar=par()$mar+c(0,0,0,4));   # 우측에 범례가 들어갈 여백을 확보 #xpd=T는 기본 마진이 있고 그래프가 출력되는데, 그 그래프를 벗어나서 마진 공간에 확장을 해서 뭔가를 나타내는 처리를 허용한다는 설정이다. #기존에 오른쪽 마진이 5였는데 거기다가 4를 더해준 것이다. legend가 그래프 밖에 그려지는 것을 허용하기 위함인듯 하다.
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8) #names.arg=xname는 막대 밑에 붙여주는 이름(막대그래프는 x축 범위가 따로 없이 각 막대가 다른 객체를 표현하므로)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

par(xpd=T, mar=c(5,5,5,2));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8) #cex.axis는 y축 범위 수치 글자 크기, cex.names는 x축 범위 수치 글자 크기
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));


# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="학번", 
        col=rainbow(3), space=0.1, cex.axis=2.0, #col은 color
        names.arg=xname,cex.lab=3.0, horiz=T); #라벨 사이즈를 조정할 수 있다는 것을 보여주기 위함. cex.lab=3.0인데 2.0이 기본 값이다. cex.axis는 x축 범위수치 출력크기인것 같다.
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3))

?barplot


# 파이그래프
(성적 <- read.table("data/성적.txt", header=TRUE)); #괄호로 감싸고 세미콜론을 주면 출력이 바로 된다.(아니면 객체명을 따로 드래그해서 실행해봐야 함)
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어),col=terrain.colors(10))
pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), 
    col=rainbow(10)) #clockwise =T면 시계방향으로 그래프가 도는데 12시 위치부터 시계방향으로 그래프가 돈다. 이게 설정되어있지 않으면 3시방향부터 반시계방향으로 그래프가 돈다.
pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10)) #density로 그래프의 색을 10%만 채운다.
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10) #edges=10으로 그래프의 둥근부분을 자른다.
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10)) #라벨을 지정할 때 paste함수로 지정하는데 여기서는 이름 밑에 점수가 나오도록 했다.
pie(rep(1, 24), col = rainbow(24), radius = 1.2, main="파이그래프", col.main="green", cex.main=3, family="dog") #rep 함수는 1이 24개가 있는 벡터를 만든다. #col는 color, cex는 size
#radius는 기본값은 1이다. 반지름의 비율을 지정하는 것으로 1보다 크게 주면 그래프가 커지고, 1보다 작게주면 그래프가 작아진다.
#cex.main은 타이틀 글자 크기를 조정한다. 1이 디폴트다.


ls()
# 히스토그램
hist(성적$국어, main="성적분포-국어", 
     xlab="점수", breaks=5, #breaks=5를 적용시킬 수 있으면 해주지만, 여의치 않으면 1개정도 더 늘어난다. 구간을 5개로 나눠달라는 뜻이다.
     col = "lightblue", border = "pink", family='dog')
hist(성적$수학, main="성적분포-수학", 
     xlab="점수", col = "lightblue", 
     breaks=2, border = "pink") #breaks=2로 인해 구간이 2개로 나뉜다. 0~5점는 4명, 5~10점은 6명
hist(성적$국어, main="성적분포-국어", 
     xlab="점수", ylab="도수", 
     col=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
hist(nums, family='maple')
hist(nums, breaks=c(0,10,20,30,40,50,60,70,80,90,100))
hist(nums, breaks=10) #데이터를 10개로 나눠라 #바로 위에 코드에서 이미 10개로 나눴음
hist(nums, breaks=2) #데이터를 2개 구간으로 나눠라. 0~50, 50~100으로 나눈다.
hist(nums, breaks=c(0,50,100), probability = T) #위에랑 똑같이 구간을 0~50, 50~100으로 나눴는데 probability=T를 주면 y축을 %로 나타내서 보여준다.
hist(nums, breaks=c(0,50,100))
hist(nums, breaks=c(0,30,100)) #자동으로 probability=T로 설정되었다. 경우에 따라서 이렇게 되기도 한다고 한다.
hist(nums, breaks=c(0,33,66,100))
hist(nums, breaks=c(0,33,66,100), freq=T) #freq=T를 주면 warning 에러가 나긴 하는데 Frequency를 도수(정수 수치)로 나타낸다는데 뭔 소리지..

# 적당한 구간수 구하기
5 * log10(30)
5 * log(30, 10)
nclass.Sturges(nums)# 구간수(구간의 개수) 구하는 함수, Sturges 공식 #Sturges 공식은 강사도 잘 모른다고 함. #R은 Struges 공식을 이용한다.#위에서 받은 난수를 이용할때는 6개 구간을 정하는 게 적당하다고 출력해준다.
nclass.scott(nums) # 구간수 구하는 함수, 편차값 적용
nclass.FD(nums) # 구간수 구하는 함수, 사분위 범위 이용


# 박스플롯
summary(성적$국어) #summary는 수치데이터인 경우 최솟값, 1사분위, 중간값, 평균, 3사분위, 최댓값을 보여준다.
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적", family='dog') #ylim을 따로 지정하지 않으면 y축은 데이터의 최솟값, 최댓값만큼 범위를 적용한다. #폰트를 전체적으로 적용하려면 전역변수로 적용해야 한다고 했던것 같은데 물어봐야 함.


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("data/온도.txt", header=TRUE, sep=",") #read.csv로 읽는다면 header=TRUE, sep=","가 기본값임 #header는 맨 위에 행을 헤더로 읽는다는 뜻임.
head(data, n=5) #맨 위에 5개만 출력해준다.
dim(data)
str(data)
boxplot(data)
boxplot(data, las = 2) #lax=2는 x축라벨을 세로로 출력하겠다는 뜻이다. 1인 가로가 디폴트값이다. las로 지정가능한 값은 가로, 세로밖에 없다.
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14)) #5, 10을 주지 않아서 5번째와 10번째를 빈공간으로 나두고 그 다음 위치에 그래프가 나타나도록 한다.(5, 10번째 데이터를 출력 안 한다는 뜻이 아님)
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3) #3번 반복해서 벡터를 만들도록 하고 있음. 색깔 이름들임.
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1) #그래프 뒷쪽의 격자무늬
#old <- par(family = "maple") #폰트를 전역적으로 수행한다. #이후 그려지는 모든 그래프들은 폰트가 maple로 지정된다. #리턴값으로는 이전폰트 설정을 주므로 old 변수에는 maple 폰트가 아닌 이전 폰트설정이 저장되어있다.
#par(old) #maple이 아닌 이전 폰트(원래 상태)가 적용되도록 한다.
boxplot(data, family='maple')  # 안됨!! 다른 아이들은 다 되는데!! #폰트설정이 안 된다는 뜻 같음. #박스플롯만 안에서 매개변수로 폰트 지정을 하는 게 안 된다.
#여기까지 11/10 오전수업 내용용

boxplot(data, axes=F)
axis(1, at=1:12, lab=names(data), family="maple") # 1은 x축 추가
axis(2, at=seq(-5, 15, 5), family="cat")          # 2는 y축 추가
title("다양하게 폰트를 지정한 박스플롯", family="dog", cex.main=2)
box()

dev.copy(png, "output/mytest.png") 
dev.off()

rainbow(10)
heat.colors(10)
terrain.colors(10)
topo.colors(10)
cm.colors(10)
gray.colors(10)
colors()

########################################################################
# 난생처음 교재 소스 : 282 페이지
# 8장 : 기본그래프 작성하기 1

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
favorite                            # favorite의 내용 출력
table(favorite)                     # 도수분포 계산


ds <- table(favorite)                      # 도수분포표 저장
ds       

# 도수분포표 내용 확인     
barplot(ds, main='favorite season')        # 막대그래프 작성



barplot(ds, main='favorite season', 
        col='blue')                   # 막대의 색 지정


barplot(ds, main='favorite season', 
        col=c('blue','red','green','yellow'))     # 막대의 색을 각각 지정

barplot(ds, main='favorite season', 
        col=rainbow(4))       # 레인보우 팔레트에서 4개의 색을 선택


barplot(ds, main='favorite season', 
        col='green',                           # 막대의 색을 지정
        xlab='계절',                           # x축 설명
        ylab='빈도수' )                        # y축 설명


barplot(ds, main='favorite season', 
        col='yellow',                          # 막대의 색을 지정
        horiz=TRUE)                            # 세로 방향 출력    



barplot(ds, main='favorite season', 
        col='yellow',                          # 막대의 색을 지정
        names=c('FA','SP','SU','WI'))          # 그룹 이름을 바꾸어 출력    


barplot(ds, main='favorite season', 
        col='green',                          # 막대의 색을 지정
        las=2)                                # 그룹 이름을 수직 방향으로    


#책(난생처음) 292pg
age.A <- c(13709, 10974, 7979, 5000, 4250)
age.B <- c(17540, 29701, 36209, 33947, 24487)
age.C <- c(991, 2195, 5366, 12980, 19007)

ds <- rbind(age.A, age.B, age.C)
colnames(ds) <- c('1970','1990','2010','2030','2050')  
ds
str(ds)
class(ds)

# 그래프의 작성
barplot(ds, main='인구 추정')    


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'))


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE) #beside=TRUE는 상하로 붙은 막대들을 좌우로 붙게 한다.


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=T) #legend.text=T를 주면 막대 그래프에 범례를 추가한다. 함수로 추가할수도 있지만 이렇게 간단하게 추가할 수도 있다.

par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))
barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=T,
        args.legend = list(x='topright', bty='n', inset=c(-0.25,0))) #책 296pg. 범례를 그래프 밖에 표시한다. #inset은 책298pg에 설명이 나온다. -1~1 사이의 값을 준다. 

par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))        # 그래프 윈도우 설정
barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=c('0~14세','15~64세','65세 이상'),
        args.legend = list(x='topright', bty='n', inset=c(-0.25,0)))
par(mfrow=c(1, 1), mar=c(5,4,4,2)+0.1)      # 그래프창 설정 해제


head(cars)                    
dist <- cars[,2]              # 자동차 제동거리
dist
hist(dist,                    # data
     main='Histogram for 제동거리',   # 제목
     xlab ='제동거리',        # x축 레이블              
     ylab='빈도수',           # y축 레이블                     
     border='blue',           # 막대 테두리색  
     col='green',             # 막대 색
     las=2,                   # x축 글씨 방향(0~3) 
     breaks=2)                # 막대 개수 조절


result <- hist(dist,                    # data
               main='Histogram for 제동거리',    # 제목
               breaks=5)                # 막대 개수 조절
result
freq <- result$counts                   # 구간별 빈도수 저장
names(freq) <- result$breaks[-1]        # 구간값을 이름으로 지정
freq                                    # 구간별 빈도수 출력


#책 310pg 8-3장
par(mfrow=c(2,2), mar=c(3,3,4,2))     # 화면 분할(2x2)               

hist(iris$Sepal.Length,               # 그래프 1
     main='Sepal.Length',
     col='orange')             

barplot(table(mtcars$cyl),            # 그래프 2
        main='mtcars',
        col=c('red','green','blue'))              

barplot(table(mtcars$gear),           # 그래프 3
        main='mtcars',
        col=rainbow(3),               # 레인보우 팔레트 사용
        horiz=TRUE)              

pie(table(mtcars$cyl),                # 그래프 4
    main='mtcars',
    col=topo.colors(3),           # topo 팔레트 사용
    radius=2)              

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 분할 취소 #기본값으로 돌려놓는다.


par(mfrow = c(2,2), mar = c(6,6,3,3))

barplot(table(chickwts$feed), main = 'distribution by Feed Type',
        horiz = T, las = 1, col = 'green')

hist(Orange$age, main = 'the age of orange',
     breaks = 4, xlab = 'day', col = 'yellow', border = 'blue')

barplot(table(chickwts$feed), main = 'distribution by Feed Type',
        las = 2, col = 'green')

hist(Orange$age, main = 'the age of orange',
     breaks = 6, xlab = 'day', col = 'yellow', border = 'blue')

par(mfrow = c(1,1), mar = c(5,4,4,2)+.1)



# 9장 : 기본그래프 작성하기 2
# 책328pg~

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
ds <- table(favorite)                                         # 도수분포 계산
ds                
pie(ds, main='선호 계절',                                     # 원그래프 작성
    radius=1) 

pie(ds, main='선호 계절',
    col=c('brown','green','red','black'),    # 파이의 색 지정
    radius=1 )                               # 파이의 크기 지정 

install.packages('plotrix')

library(plotrix)
pie3D(ds, main='선호 계절',
      labels=names(ds),                              # 파이별 레이블 지정
      labelcex=1.0,                                  # 레이블의 폰트 크기
      explode=0.1,                                   # 파이 간 간격
      radius=1.5,                                    # 파이의 크기 
      col=c('brown','green','red','yellow'))         # 파이의 색 지정

month = 1:12                             # 자료 입력
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 자료 입력      
plot(month,                              # x data
     late,                               # y data
     main='지각생 통계',                 # 제목 
     type='l',                           # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab='Month',                       # x축 레이블
     ylab='Late cnt'                     # y축 레이블
)

#책 332pg
month = 1:12
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                                # x 데이터
     late1,                                # y 데이터
     main='Late students',
     type='b',                             # 그래프의 종류 선택(알파벳)
     lty=1,                                # 선의 종류(line type) 선택
     col='red',                            # 선의 색깔 선택          
     xlab='Month',                         # x축 레이블
     ylab='Late cnt'                       # y축 레이블
) #plot이 있어야 lines가 실행된다. plot이 주인공, lines는 조연이다.
lines(month,                               # x 데이터
      late2,                                # y 데이터
      type='b',                             # 선의 종류(line type) 선택
      col='blue')                           # 선의 색깔 선택
#11/10 종료


#11/11 시작
#9-2장 339pg #cars[2]로 하면 데이터프레임 구조로 꺼냄
dist <- cars[,2]                      # 자동차 제동거리 (단위: 피트) #벡터로 꺼냄
boxplot(dist, main='자동차 제동거리')

boxplot.stats(dist)

boxplot(Petal.Length~Species,            # 자료와 그룹 정보 # ~Species를 주지 않으면 (데이터개수)150개를 petal.Length 하나로 그리게 될 거다. ~Species라는 column을 물결표시와 함께 지정했다. 그럼 이렇게 해석한다. sepecies별로 Petal.length를 가지고 boxplot을 그려라. 지금 species가 3개니까 각각 boxplot을 그린다고 보면 되겠다. y축~x축 이렇게 보면 된다.
        data=iris,                       # 자료가 저장된 자료구조
        main='품종별 꽃잎의 길이',       # 그래프의 제목    
        col=c('green','yellow','blue'))  # 상자들의 색 
#데이터값들을 일정한 기준으로 그룹핑해서 나눠서 박스플롯이 각각 그려지게끔 할 수 있다. 이 때는 data라는 매개변수를 통해서 어떤 data를 가지고 할 것인지를 지정하기 때문에 앞에 포물러식을 가지고 할 때는 컬럼명만 가지고 지정할 수 있다(뭔소리야) 342pg에 하나 더 알기라는~~~~~~~~~ 

wt <-mtcars$wt                   # 중량 자료 #mtcars 드래그해서 f1 누르면 R이 내장하고 있는 데이터셋이란 것을 알 수 있음.
mpg <- mtcars$mpg                # 연비 자료
plot(wt, mpg,                    # 2개 변수(x축, y축)     
     main='중량-연비 그래프',    # 제목
     xlab='중량',                # x축 레이블
     ylab='연비(MPG)',           # y축 레이블
     col='red',                  # point의 color
     pch=19)                     # point의 종류 #pch로 문자를 지정하면 문자가 출력된다.

vars <- c('mpg','disp','drat','wt')    # 대상 변수 
target <- mtcars[,vars]                # 대상 자료 생성  
head(target)
pairs(target,                          # 대상 자료     
      main='Multi plots') 

iris.2 <- iris[,3:4]                # 데이터 준비
levels(iris$Species)                # 그룹 확인 #iris$Species는 범주형데이터인 팩터 타입이므로 levels()를 사용하면 범주를 보여준다.
group <- as.numeric(iris$Species)   # 점의 모양과 색  #as.numeric을 써서 수치형 데이터로 변환했다. 팩터형이라 가능한건가?
group                               # group 내용 출력
color <- c('red','green','blue')    # 점의 컬러
plot(iris.2, 
     main='Iris plot',
     pch=c(group),
     col=color[group]) 

plot(iris.2, 
     main='Iris plot',
     pch=c(group),
     col=color[group]) 

legend(x='bottomright',               # 범례의 위치  
       legend=levels(iris$Species),   # 범례의 내용
       col=c('red','green','blue'),   # 색 지정
       pch=c(1:3))                    # 점의 모양 

# 난생처음 교재 소스 : 351 페이지

