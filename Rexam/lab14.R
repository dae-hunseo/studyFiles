#11월 14일 실습1
#exam11.R 관련 내용

library(ggplot2)

library(showtext)
showtext_auto() #showtext 패키지에게 필요한 상황이 되면 폰트 출력 모드를 켜고 끄는 것을 알아서 하라는 지시
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

#showtext_opts(dpi = 300) #글자크기를 지정한다. #기본값은 75
#[문제1]
#score.csv 를 읽고 student 라는 데이터프레임을 생성한다. class 컬럼의 값을 팩터형으로 변환한다. 
#class 컬럼의 값별로 칼라를 지정하여 수학 점수와 과학 점수에 대한 산점도를 그린다.
student <- read.csv("data/score.csv")
student$class <- as.factor(student$class) #팩터형으로 변환
str(student)
ggplot(student,aes(math, science, color=class)) + geom_point() + #x축과 y축을 지정하고 범례를 정한다음 각 데이터의 class에 따라 색상이 달리 나오게 지정 #geom_point()는 그래프에 나오는 모든 데이터를 점으로 표현
  theme(text = element_text(size=15)) #텍스트 사이즈 설정
#ggplot의 첫번째 매개변수로는 데이터프레임을 줘야한다.

ggsave("output/result1.png")
#dev.copy(png, "output/result1.png") 
#dev.off()

#[문제2] mpg 데이터셋을 사용한다.
#자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 한다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 본다.
mpg <- as.data.frame(ggplot2::mpg) #ggplot2::mpg은 tibble 타입이다. #library(ggplot2)를 실행하면 ggplot2:: 생략 가능
ggplot(data = mpg, aes(x = class, fill=drv)) + geom_bar()
ggsave("output/result2.png")

#[문제3] product_click.log 파일에서 클릭된 상품의 수를 적용한 바 그래프를 출력한다.
df <- read.table("data/product_click.log")
#names(click_count)=c('clicktime','pid') #lab10.R 2번문제 참고함 #ggplot패키지에서는 rename이라고 있음.(exam10.R)
table(df["V2"]) #table(df$V2)
ggplot(data=df, aes(x=V2)) + labs(title = "제품당 클릭수", subtitle="제품당 클릭수를 바그래프로 표현", x="상품ID", y="클릭수") + geom_bar(aes(fill=V2)) +theme_bw() + theme(text=element_text(family="dog", size=20))#aes(fill=V2)을 geom_bar에다가 하면 여기에만 적용되는데 ggplot에다가 하면 그 그래프에 오는 모든 geom_시리즈에 적용된다.
#subtitle은 부제목으로 제목 밑에 출력
ggsave("output/result3.png")

#[ 문제4 ]
#다음과 같이 출력되는 treepmap을 그려본다. 데이터는 GNI2014 데이터셋을 사용한다. 
#data(GNI2014) 명령을 실행시켜서 GNI2014 데이터셋을 로드한다.
#영역을 나누는 우선 순위 : 대륙, 나라코드
#영역의 크기를 결정하는 값 : 인구수 
#treemap() 함수의 도큐먼트를 읽어보고 제목폰트의 사이즈를 20으로 하고 보더의 칼라를 green 으로 한다.	
#그려진 그래프는 result4.png 로 저장한다.(기본 그래프의 저장 방법을 사용해야 한다.
library(treemap)
data(GNI2014)
str(GNI2014)

treemap(GNI2014, vSize = "population",
        index = c("continent", "country"),
        title = "전세계 인구 정보",
        fontfamily.title = "maple",
        fontfamily.labels = "maple",
        fontsize.title = 20,
        fontsize.labels = 12,
        border.col = "green")
dev.copy(png, "output/result4.png") 
dev.off()
