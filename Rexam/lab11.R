#11월 10일 실습1(R기본시각화.pdf와 exam9.R 관련)

#install.packages("showtext") 
library(showtext)
showtext_auto()

par(c("mar","mfrow"))
#par(mar=c(5.1, 4.1, 4.1, 2.1), mfrow=c(1,1)) #잘못 건드렸을 시 초기상태로 되돌리는 코드

#문제 1
클릭 <- read.table("data/product_click.log", sep=" ")
횟수 <- table(클릭[2]) #table()은 exam2.R에서 최초로 나옴. 중복된 값이 몇개나 나왔는지 보여준다.
barplot(횟수, main="세로바 그래프 실습", col.main= "red", xlab="상품ID", beside = T,
        ylab="클릭수", col=terrain.colors(10))
dev.copy(png, "output/clicklog1.png") 
dev.off()


#문제 2 #lab10.R 2번문제 참고함
df <- read.table("data/product_click.log")
names(df)=c('clicktime','pid')
dates <- as.POSIXlt(as.character(df$clicktime), tryFormats="%Y%m%d%H%M")
#dates$hour #exam8.R 참고함
시간대<-table(dates$hour)
pie(시간대, main="파이그래프 실습", col.main = "blue", col=colors(10), labels=paste(names(시간대), "~", as.numeric(names(시간대))+1))
dev.copy(png, "output/clicklog2.png") 
dev.off()

#문제 3
성적 <- read.table("data/성적.txt", header=TRUE, sep="\t")
boxplot(성적[3:5], main="과목별 성적 분포", col.main = "orange", col=rainbow(3),  ylim=c(0,10), cex.main=1.5) #첫번째와 두번째는 학번과 성명이다. 
dev.copy(png, "output/clicklog3.png") 
dev.off()

#문제 4
xname <- c("길동", "둘리", "또치", "도우너", "희동", "듀크", "턱시", "토토로", "올라프", "우디")
barplot(t(성적[3:5]), main="학생별 점수", col.main = "magenta", col=rainbow(3),  ylim=c(0,25),  names.arg=xname, cex.names = 0.8, cex.main=1.0, space=0.5) #첫번째와 두번째는 학번과 성명이다.
legend(x="topright", c("국어","수학", "영어"), fill=rainbow(3))
dev.copy(png, "output/clicklog4.png",height=400, width=700) #여기서 크기값을 지정해줘서 legend의 글씨가 잘리는 것을 막는다.
dev.off()
  
