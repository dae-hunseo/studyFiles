# 데이터 전처리 - dplyr 패키지를 학습하자....

install.packages("dplyr") 
library(dplyr) # detach("package:dplyr") 는 패키지에 대해서만 쓰는게 아니라 데이터에 대해서도 쓴다. 로드되어있던 API를 해제하는 기능이다.

install.packages("ggplot2") #mpg 데이터셋을 사용하기 위한 패키지 설치(11/11 mpg 데이터셋정보.png 참고)
str(mpg) #수업진행하면서 만든 mpg
str(ggplot2::mpg) #ggplot2의 mpg를 쓸 경우 패키지를 로드 안하고 쓸 거라면 이렇게 쓰면 된다. #tibble 타입인데 업그레이드된 데이터객체라고 생각하면 된다.
head(ggplot2::mpg) #위에 6개만 데이터를 보여줌. 어떤 컬럼명과 데이터 사이에 어떤 타입인지도 보여준다.
mpg <- as.data.frame(ggplot2::mpg) #tibble 객체인 mpg를 가지고 데이터프레임으로 변환해서  이 환경에서만 사용 가능한 mpg라는 새로운 객체를 만들었다.
head(mpg)
exam <- read.csv("data/csv_exam.csv") #수업에 사용할 csv 파일을 읽어오고 있다.
str(exam)
dim(exam)
head(exam);tail(exam)
View(exam) #데이터셋을 표로 정리해서 보여준다.


# [ filter() ]
# exam에서 class가 1인 경우만 추출하여 출력
filter(exam, class == 1) # dplyr을 로드하지 않고 수행하면 stats 패키지의 filter()가 수행됨 #filter()는 dplyr 패키지에도 있는 내장함수이기 때문에 dplyr을 로드 하지 않으면 stats 패키지의 stats|()가 실행된다.
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력 #위의 코드를 chain() 함수(%>%)로 구현함. #필터함수는 첫번째 매개변수로 데이터프레임을 받아야 하는데 그걸 %>%가 알아서 전달해준다.
# 2반인 경우만 추출
exam %>% filter(class == 2) #filter 함수에는 추출하고 싶은 열의 조건을 준다.
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3) 
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50) # &와 | 기호를 하나만 써야 한다.
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)  # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반에 해당하면 추출(in 연산자 사용)
# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당 #오른쪽 연산 결과를 <- 왼쪽에 대입
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
exam %>% filter(class == 2) -> class2 #오른쪽 화살표 연산자를 사용해도 된다.
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기


head(exam)
head(mpg)
# [ select() ]
exam %>% select(math)  # math 추출 #실행결과를 데이터프레임으로 만듬
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외 #인덱싱을 줄 때 -값을 주면 걔만 빼고라는 뜻이었다. select 함수도 매개변수로 -값을 붙여 주면 제외한다는 뜻이 된다.
exam %>% select(-math, -english)  # math, english 제외

# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english) #왼쪽부터 차례대로 연산
# 가독성 있게 줄 바꾸기
exam %>%  #코드에서 새로운 행에 맨 앞에 '%>%'가 와서는 안되므로 맨 뒤에 나둔다.
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head                # 앞부분 6행까지 추출 #추가로 전달받은 매개변수가 없다. 그럴때는 소괄호도 생략할 수 있다.
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출



data(iris) # 아규먼트에 지정된 이름의 객체(데이터셋)를 로드하는 기능 #data()는 꼭 필요한건 아니다. 사용하겠다고 지정하지 않아도 된다. 다만 추가로 설치한 API에서 제공하는 함수인 경우 해당~~
str(iris) #data(iris)와 출력 결과가 똑같다.
View(iris) # 추가
iris %>% pull(Species) #벡터로 추출(중요!) #PULL은 select와 비슷한 함수다. #데이터 프레임에서 어떤 column을 추출하겠다.
iris %>% pull(Sepal.Length)
iris %>% pull(Sepal.Length, Species)  #Sepal.Length가 갖고있는 값에 Sepecies 값을 붙여서 named 벡터로 리턴하는 기능이다.
iris %>% pull(-1) #-는 파이썬하고 비슷하게 동작한다. 마지막 열만 꺼내오라는 의미가 된다.
iris %>% pull(-5) #뒤에서 5번째 열만 꺼내오는 듯 하다.
iris %>% pull()
iris %>% select(Species) #88번째와 달리 벡터로 리턴한다.
iris %>% select_if(is.numeric) %>% head #select_if()는 뭔가 어떤 조건에 맞는 애만 꺼내라는 것. 컬럼이 numeric인 애들만 꺼내게 된다.
iris %>% select(-Sepal.Length, -Petal.Length) %>% head #-값을 주게됐을때 얘네들만 제외하고 값을 가져온다.


# Select column whose name starts with "Petal"
iris %>% select(starts_with("Petal")) %>% head(1) # 컬럼명이 Petal로 시작하는 애들중에 맨 위에 하나만 꺼내라.
iris %>% head(1) %>% select(starts_with("Petal")) # 추가 #첫번째 행만 꺼낸 다음에 select를 처리하고 있다. 위 코드와 차이 없다.
iris %>% select(starts_with("petal")) %>% head(1) #Petal이 아닌 petal로 소문자로 줬는데
iris %>% select(starts_with("petal", ignore.case=F)) %>% head(1) #ignore.case=F는 대소문자를 무시하는 것을 하지 말라는 의미다.(대소문자 구분하라는 뜻)

# Select column whose name ends with "Width"
iris %>% select(ends_with("Width")) %>% head(1) #end_with은 끝나는 애

# Select columns whose names contains "etal"
iris %>% select(contains("etal")) %>% head(1) #contains는 포함하는 열을 꺼내서 첫번째 행만 출력한다.

# Select columns whose name maches a regular expression
iris %>% select(matches(".t.")) %>% head(1) #matches()에는 정규표현식을 줘서 원하는 조건의 컬럼식을 줄 수 있다. 컬럼명에 t가 포함되고 앞뒤로 글자가 있을 시.
# 추가
iris %>% select(matches("t")) %>% head(1) #컬럼명에 t가 있으면
iris %>% select(matches("L|W")) %>% head(1) #컬럼명에 대문자L이나 대문자W가 있으면
iris %>% select(matches("\\.")) %>% head(1) #정규표현식에서는 .이 임의의 문자라는 뜻인데 앞에 \\를 주면 그냥 '.'이라는 문자다. 컬럼 이름에 '.'이 들어간 것을 찾겠다는 의미가 된다.  
iris %>% select(matches("^P")) %>% head(1)  #컬럼명이 P로 시작하는 경우

iris %>% select(one_of("aa", "bb", "Petal.Length", "Petal.Width")) %>% head(5) -> imsi #실행해서 결과를 imsi라는 변수에 담아라. one_of는 하나라도 일치하는 애가 있으면 꺼내라는 뜻이다. 만약 one_of를 안 주고 그냥 select안에 값을 주면 에러가 난다. 왜냐하면 iris에는 "aa", "bb"같은 컬럼이 없기 때문이다. 그런데 one_of는 컬럼명이 일치하는 애들이 이 중에 만약 있으면 꺼내라는 게 된다.



#[ arrange() ]
# 오름차순으로 정렬하기
exam %>% arrange(math)  # math를 기준으로 오름차순 정렬
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math를 기준으로 내림차순 정렬 #내림차순은 descending order
# 정렬 기준 변수(column) 여러개 지정
exam %>% arrange(desc(class), desc(math))  # class 및 math 내림차순 정렬 #반 번호를 가지고 1차정렬을 하고 그 안에서 2차로 수학점수를 가지고 정렬을 함.
exam %>% arrange(desc(math)) %>% head(1) #수학을 제일 잘 한 학생 한명만 출력한다.
exam %>% arrange(desc(math)) %>% head(3) #수학을 제일 잘 한 학생 1, 2, 3위만 출력한다.




#[ mutate() ] 파생변수 생성 #파생 변수란 새로운 변수라고 생각하면 된다. 데이터프레임안에 새로운 변수(컬럼)를 추가하는 일은 기존 변수(column)들을 가지고 연산해서 새로운 변수(열)을 추가하는 경우가 많기 때문에 기존 변수 값을 가지고 새로 추가했다고 해서 파생변수라고 하는 경우가 많다. 그렇다고 반드시 기존변수의 데이터의 가지고 새로운 변수를 만들어야 하냐면 그건 아니다.
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가 #mutate()안에서 파생변수 = 기존변수들 이렇게 한다.
  head                                          # 일부 추출
#여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,          # 총합 변수(total) 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수(mean) 추가
  head     
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = total/3) %>%   # 총평균 변수 추가 #위에서는 mean = (math + english + science)/3)로 계산했었다. 
  head 

# 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출



# 전체 요약하기
# [ summarise() ] #summerise()는 dplyr 패키지가 제공하는 함수
exam %>% summarise(nnn = n()) #nnn말고 다른 이름 해줘도 된다. #n()은 데이터의 개수를 세준다.(데이터 프레임의 경우 행의 개수를 세준다.) #nnn은 keyword argument로 값을 넘겨줬음
exam %>% tally() #tally()도 행의 개수를 세주는 함수이다. 다만 summarise와 다르게 summarise는 괄호안에 주어지는 함수 호출이 뭐냐에 따라 결과가 달라지는데 평균을 구해서 할거냐, 개수를 구해서 할거냐 등을 아규먼트로 전달하는데 tally()는 무조건 개수세는 기능만 제공하고 있다.
#summarise(nnn = n())를 할때는 tally()를 하는것과 같다.

exam %>% summarise(mean_math = mean(math))  # math 평균 산출 #n()이나 mean()같은 것은 dplyr패키지를활용한데이터전처리.pdf의 12pg 참고
mean(exam$math)


str(exam %>% summarise(mean_math = mean(math),
                       mean_english = mean(english),
                       mean_science = mean(science))) # 모든 과목의 평균 산출 #argument 값을 여러 개 줄 수도 있다.




# 집단별로 요약하기
exam %>%
  group_by(class) %>% summarise(n = n()) #summarise를 하기 전에 먼저 group_by를 거친다. 이걸 거치지 않으면 전체 결과에 대한 summarise()결과가 나타나는데 group_by를 거치면서 주어진 데이터프레임의 내용이 그룹핑하는 결과에 따라 나뉘게 된다.
#summarise는 그냥 사용하는것보다는 group_by와 함께 사용하면 훨씬 더 다양하게 정의할 수 있다. 여기서는 1반, 2반, 3반 ,4반 학생들에 대해 n()을 적용하는 거다.

exam %>%
  group_by(class) %>% tally()     #summarise(n = n())와 tally()는 같다.

exam %>% count(class)         # count() is a short-hand for group_by() + tally() #count()를 호출하면서 아규먼트로 class를 줬다. class라는 컬럼의 각 단위로 데이터를 카운팅해라는 의미가 된다.(반 학생이 몇 명인지 세라) 이 경우 데이터프레임으로 만들어진다. tally()와 summarise()는 tibble객체로 리턴한다.
# add_tally() 와 add_count(..) 도 있음 #add_가 붙으면 tally()나 count()의 결과를 새로운 열로 붙이는 거다.

exam %>%
  group_by(class) %>%                # class별로 분리
  summarise(mean_math = mean(math))  # math 평균 산출 #그룹핑을 하고 요약을 하는데 이러면 tibble 객체로 만들어진다.

exam %>%
  group_by(class) %>%                   # class별로 분리 
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수
 #class별로 요약 실행


#[ 문제 ] #install.packages("ggplot2")와 load("ggplot2") 필요할 것 같다. 
#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 
#1~5위까지 출력하기
#절차	기능	dplyr 함수
#1	회사별로 분리	group_by()
#2	suv 추출	filter()
#3	통합 연비 변수 생성	mutate()
#4	통합 연비 평균 산출	summarise()
#5	내림차순 정렬	arrange()
#6	1~5위까지 출력	head()

mpg %>%  #mpg 객체는 ggplot2 패키지에 있는 1999~2008년 사이의 38가지 유명한 차들에 대한 객체다. 자세한 내용은 11/11폴더의 "mpg데이터셋정보.png" 참고
  group_by(manufacturer) %>%  #제조사별로 그룹핑
  filter(class=="suv") %>%    #suv 차량만 보이도록 필터링
  mutate(tdis= (cty+hwy)/2) %>% #통합연비는 (cty+hwy)/2를 해줬고 tdis라는 새로운 파생 변수(column)을 만들고
  summarise(mdis=mean(tdis)) %>%  #여러 대의 suv 차량에 tdis라는 도시 및 고속도로 통합 연비의 평균을 더해서 mdis라는 새로운 파생변수를 만들게 되는 거다.
  arrange(desc(mdis)) %>%  #mdis가 큰 순으로 (내림차순)정렬을 하고 있는 거고
  head(5)                 #위에서부터 5개만 출력한다.


mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  mutate(tdis= (cty+hwy)/2) %>% 
  summarise(mdis=mean(tdis)) %>% 
  arrange(desc(mdis)) %>% 
  head(5)


# rename() 과 distinct() 추가

myiris <- iris %>% rename(sl=Sepal.Length, sw=Sepal.Width) %>% head

iris %>% select(Species)
iris %>% distinct(Species)
exam %>% select(class, english)
exam %>% distinct(class, english)




# 여러 데이터프레임 합치기 #11/11폴더의 dplyr패키지를활용한데이터전처리.pdf 16~18pg 참고

# 학생 1~5번 시험 데이터(프레임) 생성
(group_a <- data.frame(id = c(1, 2, 3, 4, 5),  test = c(60, 80, 70, 90, 85)))
# 학생 6~10번 시험 데이터(프레임) 생성
(group_b <- data.frame(id = c(6, 7, 8, 9, 10),  test = c(70, 83, 65, 95, 80)))

bind_rows(group_a, group_b)  #행단위로 합침(새로 행을 만듬) #rbind와 비슷하나 bind_rows가 속도도 빠르고 성능이 좋다.
bind_cols(group_a, group_b)  #열단위로 합침(새로 열을 만듬) #cbind와 비슷하나 bind_cols가 속도도 빠르고 성능이 좋다.

one <- data.frame(c(x = c(1:1000000), y = c(1:1000000))) 
two <- data.frame(c(x = c(1:1000000), y = c(1:1000000)))
system.time(rbind(one, two)) 
system.time(bind_rows(one, two)) 

library(dplyr)

# 중간고사 데이터 생성
(test1 <- data.frame(no = c(1, 2, 3, 4, 5, 6),  
                     midterm = c(60, 80, 70, 90, 85, 100)))
# 기말고사 데이터 생성
(test2 <- data.frame(no = c(1, 5, 3, 4, 2, 7),  
                     final = c(70, 80, 65, 95, 83, 0)))

#by는 동일한 값을 찾는 기준이 되는 열 이름을 지정하는 것 같다.
inner_join(test1, test2, by = "no")  #6번과 7번 데이터는 사라진다. #11/11폴더의 dplyr패키지를활용한데이터전처리.pdf 17~18pg
left_join(test1, test2, by = "no")  #test1의 데이터는 test2와 겹치는 데이터가 없더라도 나둔다. 
right_join(test1, test2, by = "no")  #texst2의 데이터는 test1와 일치하는 데이터가 없더라도 나둔다.
full_join(test1, test2, by = "no")  #둘 사이에 겹치지 않는 데이터도 나둔다.
#join()계열 함수는 dplyr 패키지가 내장하고 있는 함수. join() 계열 함수가 성능이 더 좋다.

#merge 함수는 R이 내장하고 있는 함수
merge(test1, test2)
merge(test1, test2, all.x = T)
merge(test1, test2, all.y = T)
merge(test1, test2, all = T)

# 다른 데이터 활용해 변수 추가하기
# 반별 담임교사 명단 생성
(exam <- read.csv("data/csv_exam.csv"))
(tname <- data.frame(class = c(1, 2, 3, 4, 5), teacher = c("kim", "lee", "park", "choi", "jung")))
# class 기준 합치기
(exam_new <- left_join(exam, tname, by = "class"))



# 데이터 정제 : 결측치(NA)와 이상치 처리 #11/11폴더의 dplyr패키지를활용한데이터전처리.pdf 19pg
# 먼저 결측치부터~~~~~~

df <- data.frame(sex = c("M", "F", NA, "M", "F"), 
                 score = c(5, 4, 3, 4, NA))
View(df)
# 결측치 확인하기
is.na(df)         # 결측치 확인
table(is.na(df))  # 결측치 빈도 출력
# 변수별로 결측치 확인하기
table(is.na(df$sex))    # sex 결측치 빈도 출력
table(is.na(df$score))  # score 결측치 빈도 출력
# 결측치 포함된 상태로 분석
mean(df$score)  # 평균 산출
sum(df$score)   # 합계 산출



# 결측치 있는 행 제거하기
library(dplyr) # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거
# 결측치 제외한 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거 #score열에서 결측치(NA)를 제거한다.
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출
# 여러 변수 동시에 결측치 없는 데이터 추출하기
# score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss  
# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출 #데이터 프레임 내에 모든 결측치(NA)가 있는 행을 제거한다.
df_nomiss2
#분석에 필요한 데이터까지 손실 될 가능성 유의
# 함수의 결측치 제외 기능 이용하기 - na.rm = T
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출


#summarise()에서 na.rm = T사용하기
# 결측치 생성                         #결측치를 다른 데이터로 채워넣는다.
exam <- read.csv("data/csv_exam.csv")            # 데이터 불러오기
table(is.na(exam))
exam[c(3, 8, 15), "math"] <- NA             # 3, 8, 15행의 math에 NA 할당
table(is.na(exam))


#평균 구하기
exam %>% summarise(mean_math = mean(math))             # 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  # 결측치 제외하고 평균 산출 #na.rm = T은 NA값을 remove하는데 TRUE값을 준 거다.
# 다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출
boxplot(exam$math) # boxplot은 원래 결측치는 제거하고 그려줌(아닐수도있을듯??)
mean(exam$math, na.rm = T)  # 여기선 결측치 제외하고 math 평균 산출하도록 요청해야 한다.


# 평균으로 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
table(is.na(exam$math))                               # 결측치 빈도표 생성
sum(is.na(exam$math))
mean(exam$math)  # math 평균 산출



df <- airquality #airquality는 공기 질을 나타내는 여러가지 column값을 갖고있는 R이 내장한 데이터셋이다.
head(df)
dim(df)
View(df)
is.na(df)
row_na_cnt = apply(df, 1, function(x){sum(is.na(x))}) #행단위로 NA가 얼마나 있는지
table(row_na_cnt) #NA가 하나도 없는 행은 111개, 1개 있는 행은 40개, 2개 있는 행은 2개라고 출력된다.
col_na_cnt = apply(df, 2, function(x){sum(is.na(x))}) #열단위로 NA가 얼마나 있는지
table(col_na_cnt) #결측치(NA)가 하나도 없는 열은 4개, 7개 있는 열은 1개, 37개 있는 열은 1개라고 출력된다.

df[is.na(df$Solar.R), "Solar.R"] = mean(df$Solar.R, na.rm = TRUE) 
df[is.na(df$Ozone), "Ozone"] = mean(df$Ozone, na.rm = TRUE) 



install.packages("tidyr") # 추가 #fill()을 사용하기 위함.
library(tidyr)
library(dplyr)

exam <- read.csv("data/csv_exam.csv")            
exam[c(1, 5, 3, 8, 15, 20), "math"] <- NA 
exam

fill(exam, math, .direction = "down") # 바로 위의 데이터를 내려서 결측치(NA)를 채운다.#fill()은 tidyr패키지에서 제공한다. #이렇게 하면 맨 위의 행은 NA를 다른 값으로 채우지 못한다.
fill(exam, math, .direction = "up") # 바로 아래의 데이터를 올려서 결측치(NA)를 채운다. #이렇게 하면 맨 아래의 행은 NA를 다른 값으로 채우지 못한다.
fill(exam, math, .direction = "updown") #바로 아래 것을 우선적으로 올리되 맨 밑에 있는 데이터인 경우 위에 것을 내린다.(up우선,down차선)(up은 아래 있는 것을 올리는 것)

exam[c(1, 5, 6, 7, 20), "english"] <- NA 
exam

fill(exam, math, english, .direction = "updown")
fill(exam, everything(), .direction = "updown")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%        #그룹핑을 하면 같은 그룹 내에서만 fill()이 적용된다. 같은 그룹 안에 NA를 채우기 위해 가져올 데이터가 없으면 NA가 그대로 남아있는다.
  fill(math2, .direction = "down")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%
  fill(math2, .direction = "up")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%
  fill(math2, .direction = "downup") #downup은 down우선, up 차선. down은 위에 있는 것을 아래로 내리는 것이다.

exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(math2, english2, .direction = "downup") #math2와 english2 열만 NA를 다른 값으로 채움.

exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(everything(), .direction = "downup") #전체 다 적용(NA를 다른 값으로 채움)


exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(ends_with("2"), .direction = "downup") #column 이름이 "2"로 끝나는 애들만 NA값을 다른 값으로 채운다.



# 이젠 이상치를 처리해 보자~~~~

# 이상치 포함된 데이터 생성 - sex 3, score 6
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),  score = c(5, 4, 3, 4, 2, 6)) 
# 이상치 확인하기
table(outlier$sex) #set 열의 값이 1이 몇개인지 2가 몇개인지 3이 몇개인지 확인해서 이 column에 잘못된 값이 들어가있는지 판단을 한다.
table(outlier$score) #예를 들어 1점에서 5점까지만 들어가야 하는데 6점이 들어가있다면 이상치가 들어가있다고 판단하는 거다.(427번째 라인에서 멀쩡히 6점 줬지만 저게 잘못된 값이라는 것 같음.)

# 결측 처리하기 - sex
# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

#결측 처리하기 - score
# sex가 1~5 아니면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)

# 결측치 제외하고 분석
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
boxplot(mpg$hwy, notch=T) # , notch=T
boxplot(mpg$hwy, range=0)
summary(mpg$hwy)
#상자그림 통계치 출력
boxplot(mpg$hwy)$stats  # 상자그림 통계치 출력

# 결측 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
# 결측치 제외하고 분석하기
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))


# 이상치 판단의 상한값과 하한값

outliers <- function(qnum) { #이상치를 판단하는 기준(사용자가 임의로 정한게 아니라 이게 표준인 것 같음)
  Q1 <- qnum[2] #1사분위
  Q3 <- qnum[4] #3사분위
  lower <- Q1 - 1.5 * (Q3 - Q1) # 아래 울타리
  upper <- Q3 + 1.5 * (Q3 - Q1) # 위 울타리
  return(c(lower, upper))
}

nums1 <- 1:10
boxplot(nums1)
boxplot.stats(nums1) #stats는 최솟값, 2사분위, 3사분위, 최댓값, 중간값, 평균 등
lu1 <- outliers(boxplot.stats(nums1)$stats)
lu1

nums2 <- c(nums1, 20)
boxplot(nums2)
boxplot.stats(nums2) #boxplot은 이 상황에서 20을 최댓값으로 처리하지 않고 이상치로 판단하고 10을 최댓값으로 본다. 
lu2 <- outliers(boxplot.stats(nums2)$stats) #이상치로 판단하는 기준은 설명해줬는데 복잡해서 찾아봐야 할듯
lu2



