#11/14 10:00~
# wide format 과 long format

library(tidyr) #이미 설치해놓아서 load만 해주면 된다.
library(dplyr) 

data(mtcars) #내장되어있는 mtcars라는 데이터셋을 (다시)읽어오겠다. #만약 이전에 시동해서 값이 바뀌었다면 이걸 출력해서 다시 초기화 상태를 읽어옴.
head(mtcars) #mtcars라는 애의 헤드(상위 6개) #mtcars가 어떤애인지 알고 싶으면 드래그->Help 클릭
mtcars$name = rownames(mtcars) #rownames는 데이터프레임이 갖고있는 행 이름만 추출한다.
rownames(mtcars) = NULL #행 이름이 NULL로 바뀐다.
View(mtcars) #행 이름이 사라진 것을 볼 수 있다.

mtcars %>% select(name, mpg, cyl, disp) -> mtcars01 #select()의 매개변수 순서에 따라 열의 순서가 정해진다. #그리고 mtcars01이라는 변수에 저장한다.
head(mtcars01)                                      #mtcars01이라는 변수의 앞에 6개 값을 출력한다.

mtcars01 %>% gather(key='key', value='value', mpg, cyl, disp) -> mtcarsLong #mtcars가 여러 열으로 구성되어잇"|는데 이 중에서 mpg, cyl, disp 컬럼 이 3개만 gather하겠다. #그리고 mtcarsLong이라는 변수에 담겠다. #gather는 wide형태를 Long 형태로 만들어준다.
View(mtcarsLong) #long포맷으로 바꾼 결과를 보여준다.

mtcarsLong %>% spread(key='key', value='value') -> mtcars02 #spread를 이용해 long 포맷인 mtcarsLong을 다시 원상태인 wide 포맷으로 복귀시킨다.
head(mtcars02) #gather했다가 다시 spread한 mtcars02는 mtcars01과 같다. 다만 열의 순서는 다르다. 그 이유는 바로 밑에 주석 참고


all.equal(mtcars01, mtcars02) #all.equal은 base 패키지에서 제공한다. all.equal이라는 함수를 이용해서 mtcars01과 mtcars02를 처리해보면 뭔가 안 맞는다고 나오는데 그 이유는 spread를 하면 ~~~~~~~~~~ spread를 할 때 key에 들어가있던 애들을 spread한다는 것은 다시 변수로 바꿔줁다는 거다. 그럴때 얘네들을 원래 작성된 순서로 변수(열)로 만들어주면 좋은데 그렇게 안 하고 순서를 알파벳 순서로 바꿔버린다.

all.equal(mtcars01 %>% arrange(name), mtcars02 %>% select(name, mpg, cyl, disp) %>% arrange(name)) #열을 이름순으로 정렬을 하고 그 다음에 mtcars02가 갖고있는 column 순서를 mtcars01과 맞춰주고 name 순서로 정렬을 하고 있다.
#행과 열의 순서를 맞춰주니 둘이 같다고 나온다.

# GOOD

my_data <- USArrests[c(1, 10, 20, 30), ] #USArrests는 미국의 주 별 범죄율과 관련된 데이터셋이다. 거기서 일부행만 꺼내고 있다.
my_data
my_data <- cbind(state = rownames(my_data), my_data) #cbind는 컬럼으로 추가해주는 거다. 이걸 하면 state라는 변수(열)이 새로 추가된다.
my_data


my_data2 <- gather(my_data,
                   key = "arrest_attribute",
                   value = "arrest_estimate") #key에 해당되는 새로운 데이터프레임의 변수명과 value에 해당하는 변수명을 각각 줬다. 이건 원하는 대로 줄 수 있따. 이렇게 주게되면 my_data가 갖고있는 모든 column에 대해서 long포맷으로 바뀌게 되는 결과가 된다.
my_data2 

my_data3 <- gather(my_data,
                   key = "arrest_attribute",
                   value = "arrest_estimate",
                   -state) #state는 제외하고? 
my_data3


my_data4 <- gather(my_data,
                   key = "arrest_attribute",
                   value = "arrest_estimate",
                   Murder, Assault) #Murder, Assault만 가지고 long 형태로 바꾸겠다. 컬럼을 나열해주면 나열된 컬럼들만 key, value 형식으로 변환해서 long 형태로 바꾼다.
my_data4


my_data5 <- gather(my_data,
                   key = "arrest_attribute",
                   value = "arrest_estimate",
                   Murder:UrbanPop) #":"를 줘서 범위를 줄 수도 있다.
my_data5


spread(my_data5, 
       key = "arrest_attribute",
       value = "arrest_estimate") #최종적으로 만들어진 애만 spread를 해보면 구성이 변수명(열)의 순서는 원래대로 되돌아온 애(Assault, Murder, UrbanPop)를 알파벳 순으로 변수를 나열해주면서 wide 포맷으로 되돌려준다.


##########################################
### ggplot2 패키지를 활용한 고급시각화 ###
##########################################

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")



#install.packages("ggplot2") # ggplot2 패키지 설치 #이미 설치했음
library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

str(mpg)
ggplot(mpg)
ggplot(mpg,aes(displ, hwy))  #x 축은 displ, y축은 hwy #Grid는 기본적으로 설정됨.
ggplot(mpg,aes(displ, hwy)) + geom_point() #데이터들에 점을 찍는다.
ggplot(mpg,aes(displ, hwy)) + geom_point() + geom_line() #점을 선으로 잇는다.
ggplot(mpg) + geom_point(aes(displ, hwy))
ggplot(mpg) + geom_point(aes(displ, hwy)) + geom_line(aes(displ, hwy))

sketch <- ggplot(data = mpg, aes(x = displ, y = hwy)) #x 축은 displ, y축은 hwy라는 데이터계층을 미리 호출을 해서 밑바탕이 되는 데이터레이어만 그려지는데 이렇게 변수에 담는 경우는 화면(Plots)에 보이지 않는다.(뭔소린지 이해가..)
str(sketch) 

sketch + geom_point() #데이터가 점으로 표시된다.
sketch + geom_line(color="green") #데이터를 점이 아닌 초록선 선으로 이어서 보여준다.
sketch + geom_point() + xlim(3, 6) #x축 범위를 지정해서 범위 밖의 데이터는 잘라낸다.
sketch + geom_point() + ylim(10, 30) #y축 범위를 지정해서 범위 밖의 데이터는 잘라낸다.
sketch + geom_point() + xlim(3, 6) + ylim(10, 30)
sketch + geom_point(size=3) + coord_cartesian(xlim=c(3, 6), ylim=c(10, 30)) #x축과 y축의 범위는 '+' 연산자로 주던가 coord_cartesian()이라는 함수의 argument로 x축과 y축의 범위를 주는 것도 가능하다.
sketch + geom_point(aes(color=drv)) #sketch라는 변수 안에는 리스트 객체가 들어있는데 aes() ~~~
ggplot(data = mpg, aes(x = displ, y = hwy, color = drv)) + geom_point() #x축과 y축의 정보뿐만 아니라 색상 정보도 ggplot()에 줬다. color에 대한 정보를 geom_point()의 argument로 줘도 되는데 이렇게도 줄 수 있다.


(df_mpg <- mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy)))  #그룹핑을 하는데 그룹핑을 하면 tibble 객체로 만들어진다.

# 집계 막대 그래프 - 미리 집계해서 인수로 전달하면 이 값으로 바그래프 그림 #높이만큼 그려짐
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col() #x축은 색의 drv가 되고 y축은 고속도로연비의 평균값(mean_hwy)이 되는 거다. #104번째 라인에서 미리 집계를 냈기 때문에 집계막대그래프라고 한다.

# 빈도 막대 그래프 - 행의 갯수를 그려서 바그래프 그림
ggplot(data = mpg, aes(x = drv)) + geom_bar() #행의 개수를 세서 개수만큼 맞게 높이로 그려준다. #x축은 drv. #geom_bar()은 빈도 막대 그래프를 그려주는데 (ggplot()에서)y축은 따로 지정해주지 않는다.

# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
str(economics) #내장 데이터셋인 economics에 대한 정보 출력



str(mtcars) #내장 데이터셋
View(mtcars)
table(mtcars$cyl) #데이터값마다 몇 개의 데이터가 있는지 빈도수를 세준다. 실린더 4개짜리, 6개짜리, 8개짜리가 몇개씩 있는지
summary(mtcars$cyl) #summary함수는 numeric 함수면 최솟값, 1분위, 중간, 평균, 3분위, 최댓값을 출력한다.
summary(factor(mtcars$cyl)) #mtcars$cyl가 숫자이지만 factor()를 이용해서 범주형으로 바꾼다. 이 때는 as.factor하나 factor하나 결과는 같다고 한다.
ggplot(mtcars, aes(x=cyl)) + geom_bar() #geom_bar는 카운트해서 바 그래프 그려주는 거다. #x축값이 3초과5미만으로 표현된 첫번째 그래프는 실린더 4개짜리인 것 같다.  
ggplot(mtcars, aes(x=cyl)) + geom_bar(width=0.5) #width는 너비값인가?
ggplot(mtcars, aes(x=cyl, fill=factor(gear))) + geom_bar(alpha=0.5) #fill=factor(gear)은 gear 데이터값으로 채우는데 그 값을 numeric으로 인식하지말고 factor로 인식하라는 것이다.
ggplot(mtcars, aes(x=cyl)) + geom_bar(aes(fill=factor(gear)), alpha=1.0) #alpha는 투명도를 의미한다. 0.0은 완전투명, 1.0은 완전 불투명 #fill=factor(gear)를 geom_bar의 매개변수로 줬다.

# 다양한 내장 테마  #labs()로 표 제목과 x축이름, y축 이름을 따로 설정할 수 있다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_gray() #앞에는 똑같이 출력하고(코드내용은 다 같게 하고) 마지막에 값만 다르게 준다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_bw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_linedraw() #배경에 출력되는 그리드가 진하게 출력된다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_light() #배경색이 밝아진다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_dark() #배경색이 어두워진다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_minimal() #겉에 x, y축 테두리 선이 없다.
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_classic() #고전테마
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_void()


imsi <- ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") #객체에다가 값을 담고
str(imsi)
imsi + theme_gray() #뒤에 테마 값을 더해준다.(132~139번째 라인과 결과는 같음.)
imsi + theme_bw()
imsi + theme_linedraw()
imsi + theme_light()
imsi + theme_dark()
imsi + theme_minimal()
imsi + theme_classic()
imsi + theme_void()


str(airquality) #내장객체인 airquality는 앞에서 한 번 정도 접해봤다. 1973년 뉴욕의 공기질을 측정한 것이다.
View(airquality) #한 눈에 보기 표로 쉽게 정리해줌.
ggplot(airquality, aes(x=Day, y=Temp)) #y축은 airquality의 Temp에 맞춰서 알아서 해주고 있음.
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=3, color="red") #원하는 색상을 넣을때는 꼭 aes()에 안 넣어도 된다.
ggplot(airquality, aes(x=Day, y=Temp, col=factor(Month))) + geom_point(size=2) #다만 이렇게 색상을 다르게 적용할때는 aes()에 넣어줘야 한다. #만약 factor(Month)가 아닌 그냥 col=Month를 하면 다양한 유채색이 아닌 진한 색상과 흐린 색상으로 데이터를 구분한다. #연속적인 수치데이터를 가지고 색상으로 구분하겠다면 factor(Month)처럼 해줘야 한다. 그럼 개별적인 수치 데이터라는 뜻으로 완전 다른 색상으로 데이터 종류를 구분한다. #geom_point로 점의 크기를 2로 지정한다.
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=2, aes(color=factor(Month)))
ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot() #일별로 그룹을 묶어서 boxplot을 각각 묶고있다. boxplot은 그러면 31개다. 월 중에 제일 많은 날이 31일이니까. #이렇게 그룹을 묶어서 사용하려면 group이라는 매개변수를 사용할 수 있다.
ggplot(airquality, aes(Temp)) + geom_histogram() #x축에 온도인 Temp를 줬는데 Temp 데이터가 153개가 있을 것 아닌가. 153개의 Temp 데이터를 가지고 히스토그램을 그린다. #구간 개수를 따로 지정해주지 않으면 30개다. bins를 주면 구간 개수를 지정해줄 수 있다.


install.packages("xlsx") #엑셀 문서
library(xlsx)
classDF <- read.xlsx("data/data.xlsx", 1, encoding="UTF-8") #1은 첫번째 시트를 읽어라. #엑셀은 MS949가 기본인데 그걸 UTF-8로 읽으라고 지정해준 것. #첫번째 시트는 이름, 성별, 혈액형 #두번째 시트는 트리맵 테스트할때 사용하게 되는 데이터셋으로 "판매상품"과 "어느 지역"에서 "얼만큼 팔렸는지"
str(classDF)
View(classDF)

bar_data <- classDF[3] #3번째 데이터(3번째 열인 혈액형)만 추출 #이렇게 꺼내면 데이터프레임 형태를 유지하면서 꺼낸다. #만약 classDF[,3]으로 했으면 벡터형으로 꺼내진다.
bar_data #열이 하나짜리인 데이터프레임 생성
str(bar_data)
table(bar_data$bloodType) #혈액형이 각각 몇개인지 세서 출력해준다.
ggplot(bar_data, aes(x=bloodType)) + geom_bar()
ggplot(classDF, aes(x=bloodType)) + geom_bar(aes(fill=gender)) #혈액형으로 x축을 정하고(aes(x=bloodType)), 각각의 막대를 성별로 채운다(geom_bar(aes(fill=gender)).


# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales) #데이터 프레임 생성


# 생성된 coSalesDF 확인
View(coSalesDF)
str(coSalesDF)
# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line() #회사를 구분하지 않고 각 년도에 매출량이 얼마인지 끝과 끝으로 보여준다. 별 도움이 안 되는 상태.
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company)) #회사별로 그룹핑해서 라인 그래프를 그린다.
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company)) #회사별로 그룹핑을 하고 색상에다가 company를 준다. 색상은 'color', 'col', 'colour' 다 된다.
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(linewidth=2, aes(group=company,colour=company))+scale_colour_grey()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(linewidth=2, aes(group=company,colour=company))+scale_colour_hue()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(linewidth=2, aes(group=company,colour=company))+scale_colour_manual(values = c("orange", "green")) #지정하고싶은 색상을 벡터로 만든다.
# 선의 종류 :  0 = blank, 1 = solid, 2 = dashed, 3 = dotted, 4 = dotdash, 5 = longdash, 6 = twodash
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(linewidth=2, aes(group=company,colour=company), linetype = 3) #3이면 dotted
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(linewidth=2, aes(group=company,colour=company), linetype = "dotdash") #숫자 대신 실제 값으로 줘도 된다.
# 점의 종류와 색상
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = 5) #3.4.0부터 size대신 linewidth 쓰라고 에러떴는데 여기서는 왜인지 안 바꿔도 됨
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가')
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가', colour = "Red")

library(MASS)
str(Cars93) #(library()로) 로드하고 나니까 이게 보인다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6) #만약 로드를 안 했다면 Cars93마다 MASS를 붙여야 한다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, colour="blue") #테두리 색은 파랑 #colour대신 color, col도 가능
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue")   #안에 파랑색으로 채움(테두리선 색은 디폴트로 검정)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue", colour="pink") #파랑색으로 채우고 테두리선은 분홍색
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) + geom_point(colour="grey", shape=21, size=6) # aes(x=Weight, y=MPG.highway, fill=Price)은 가격에 따라 색상을 다르게 채우겠다는 의미. 그런데 price가 numeric형이라 채도만 다르게 된다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) #위와 같은 코드. fill부분을 따로 뗐다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  geom_point(colour="grey", shape=21, size=6) #aes(x=Weight, y=MPG.highway, fill=Cylinders)인데 Cylinders는 팩터형이다. 그래서 완전 다른 색상으로 Cylinder 종류에 따라 다르게 칠해진다. #Character도 팩터형으로 취급한다.(numeric은 팩터형으로 취급 안 한다.)

Cars93$Cylinders #중간에 rotary가 있는데 팩터형이라 숫자가 아닌 값이 들어갈 수 있다는 걸 알 수 있음. 219번째 라인 실행하면 factor로 나온다.
Cars93$Price 

class(Cars93$Cylinders) #factor형
class(Cars93$Price) #numeric형


ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Oranges") # Oranges   #Cylinders가 factor형이지만 scale_fill_brewer(palette="Oranges")를 통해 다양한 색이 아닌 오렌지 색의 채도로 구분되게 했다.

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"), 
                weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar() #geom_bar()는 빈도막대 그래프인데 년도별로 데이터가 여러개 있는게 아니라 각 년도마다 모든 데이터가 하나라 다 100%로 나온다.(의미없는 그래프)
ggplot(data=w, aes(x=year, y=weight)) + geom_bar() # 갯수를 세서 막대를 그리는게 기본이라.. 에러난다!! #y축을 주면 안 된다.
ggplot(data=w, aes(x=year, y=weight)) + geom_col() #집계막대그래프 #geom_col()은 (컴퓨터가?)집계를 먼저 내서 지정을 하면 그 값만큼 막대를 그려준다. 
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") #geom_bar()를 가지고 geom_col()처럼 쓸 수 있다. 매개변수 stat에다가 "identity"를 주면 된다. 그럼 y에 전달된 값 만큼 그래프를 그려준다. 즉 geom_Col()과 같아진다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75)) #coord_cartesian()로 x축이나 y축의 범위를 지정할 수 있다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75)) #colour="blue"로 테두리색이 파랑색으로 지정된다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight))+coord_cartesian(ylim=c(60, 75)) #geom_label()를 통해 막대마다 얼만큼의 값인지 나타낸다. 이렇게 ggplot2가 편해서 파이썬에서도 갖다쓰는거다. 
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1)+coord_cartesian(ylim=c(60, 75)) #nudge_y=1 은 1만큼 띄워서 #0이 기본값이다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=2)+coord_cartesian(ylim=c(60, 75)) #nudge_y=2 는 2만큼 띄워서
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게") #nudge_y=-1 은 -1만큼 들여서 #subtitle은 타이틀보다 조금 더 작게 아래에 표시된다.
ggsave("output/ggplot_test.png") #Plots에 그린 것을 파일에 저장한다.


ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() #x축은 displ, y축은 hwy, 색상구분은 제조사(manufacturer 행)별로 하고, 데이터를 점을 찍는다.
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + 
  scale_color_manual(values = rainbow(15)) #색상을 직접 벡터로 매개변수 values에 전달할 수 있다.
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + 
  scale_color_manual(values = topo.colors(15))
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + 
  scale_color_brewer(palette = 'Set3') #색상이 부족해 몇개는 보여주지 못한다.
# 범례 행 갯수 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(nrow = 6)) #범례에서 행의 개수를 6개로 가져간다.

# 범례 열 갯수 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+ scale_color_brewer(palette="Reds")+ guides(color = guide_legend(ncol = 2))  #범례를 2개 열로 나눠서 표현한다. #빨강색 계열의 색이 부족해서 절반가까이 색이 안 나온다.

# 범례 항목들 역순으로
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(reverse = TRUE)) #reverse = TRUE를 줘서 범례 항목을 역순으로 나타낸다.

# 범례 없애기
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color="none") #color에 'none'를 주면 범례를 나타내지 않는다.


p1 <- ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point() #iris는 R의 내장 데이터셋
p2 <- ggplot(data = iris, aes(x = Sepal.Width, y= Sepal.Length, col=Species)) + geom_point() 
install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, p1, p2, nrow = 2) #p1과 p2가 갖고있는 그래프를 2번씩 내보낸다. nrow=2를 주면 2행2열이 된다. 즉 여러개의 그래프를 2행2열로 레이아웃을 나눠서 그래프를 그린다.
grid.arrange(p1, p2, nrow = 2)
grid.arrange(p1, p2, ncol = 2)

# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p
str(mpg)
# 인터랙티브 그래프 만들기
ggplotly(p) #점에 마우스를 갖다대면 정보가 나타난다. #범례에 클릭을 하면 해당 데이터가 그래프에서 사라지고, 더블클릭을 하면 

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar() #diamonds$clarity로 색상을 구분해서 그래프 색상을 구분한다.
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge") #position = "dodge"를 주면 옆으로 세워지는 막대그래프를 그린다.
ggplotly(p)

p <- ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point()
ggplotly(p)


p <- ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
ggplotly(p)



# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)

sales_df <- read.xlsx("data/data.xlsx", 2, encoding="UTF-8") #엑셀파일의 sheet2
# 트리맵 그리기  #영역을 나눠서 값의 크기를 표현하는게 트리맵이다.
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 
# product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황", fontfamily.title="maple", fontfamily.labels="maple") #maple은 폰트이름이다. #제품(product열)별 지역(region열) 판매량 #제품별로 크기가 다르고 지역별로도 크기가 다르다.

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황", fontfamily.title="dog", fontfamily.labels="dog") #위 코드와 반대로 region이 나누는 첫번째 기준이고 그 다음이 product다. #dog는 폰트명

dev.copy(png, "output/test.png")
dev.off() #이걸 안 해주면 그래프를 그릴때 계속 Plots에 안 그리고 파일로 저장한다.
