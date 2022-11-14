#11/11 실습2
library(dplyr)


#문제 1 답안코드
mpg <- as.data.frame(ggplot2::mpg)
str(mpg) #mpg의 구조 확인
dim(mpg) #행의 개수와 열의 개수 출력

mpg %>% head(10) #앞에서 10개 출력
mpg %>% tail(10)

View(mpg)
summary(mpg)

mpg %>% group_by(manufacturer) %>% tally() #manufacturer 변수(열)을 이용해서 그룹핑을 해서
mpg %>%
  group_by(manufacturer, model) %>% #먼저 manufacturer 별로 그룹핑을 하고 그 안에서 model로 나누는 것 같다.
  tally()


#문제2 답안 코드
mpg_new <- mpg %>%
  rename(city = city, highway = hwy)

mpg_new


#문제3 답안 코드
#3-1
mpg %>% filter(displ<=4) %>% summarise(n=mean(hwy))
mpg %>% filter(displ<=5) %>% summarise(n=mean(hwy))
#3-2
mpg %>% filter(manufacturer == "audi") %>% summarise(n=mean(cty))
mpg %>% filter(manufacturer == "toyota") %>% summarise(n=mean(cty))
#3-3
mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>% summarise(n=mean(hwy))


#문제4 답안코드
#4-1
mpg2 <-mpg %>% select(class, cty) #sql에서 select
head(mpg2)
#4-2
mpg2 %>% filter(class == 'suv') %>% summarise(mean_suv = mean(cty)) #filter는 sql에서 where
mp22 %>% filter(class == 'compact') %>% summarise(mean_compact = mean(cty))


#문제5
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)


#문제6
library(tidyr)
grade <- read.csv("data/성적2.csv")
View(grade)

boxplot(grade[,3:4])
boxplot.stats(grade$수학)$out
outliers(boxplot.stats(grade$수학)$stats)

meanmath <- as.integer(mean(grade$수학, na.rm = T)) #결측치가 있어서 na.rm=T는 줘야 한다.
grade$수학 <- ifelse(grade$수학 > 10 , meanmath, grade$수학)

View(grade)
grade %>%
  fill(everything(), .direction = "updown") #updown은 up(밑에것을 위로)를 먼저 우선적으로 하돼, 맨 밑에것은 down(위에 것을 아래로) 