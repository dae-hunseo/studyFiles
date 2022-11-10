# 11월 07일 실습1 (동적 수집) #exam7.R 210~ 참고함

#install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome") #셀레니움 불러옴 #접속이 성공적으로 일어나면 remoteDriver 객체가 리턴된다. #포트번호를 4445로 해주는 이유는 이걸 실행시키기 위해서 cmd창에다가 코드를 입력해야하는데 그 때 포트 번호를 4445로 해줬기 때문.
remDr$open() #셀레니움 서버에 의해 구동되는 크롬 브라우저 창이 열린다
url <- 'https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700'
remDr$navigate(url) #새로 열린 창에서 메가박스 홈페이지에 접속하도록 렌더링 시킨다. 이런 모든 처리는 셀레니움 서버를 통해서 브라우저가 하도록 한다.

#평점(li:nth-child(숫자)를 li로 바꾸면 그 페이지의 내용들을 다 긁어온다.)
##contentData > div > div.movie-idv-story > ul > li:nth-child(2) > div.story-area > div.story-box > div > div.story-cont > div.story-point > span

#추천 이유
##contentData > div > div.movie-idv-story > ul > li:nth-child(2) > div.story-area > div.story-box > div > div.story-cont > div.story-recommend

#관람 후기
##contentData > div > div.movie-idv-story > ul > li:nth-child(2) > div.story-area > div.story-box > div > div.story-cont > div.story-txt

#2번 페이지 버튼
##contentData > div > div.movie-idv-story > nav > a:nth-child(2)


score <- '#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-point > span' #평점
reason <- '#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-recommend'   #이유
comments <- '#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-txt'       #후기

replScore_v <- NULL #평점 전체를 담는 벡터
replReason_v <- NULL #추천 이유 전체를 담는 벡터
replComments_v <- NULL #후기 전체를 담는 벡터
Sys.sleep(1) #1초간 멈춘다. #빨리 렌더링이 되지 않아서 시간을 줘야함.

#첫 페이지 평점 읽어오기
dom_s <- remDr$findElements(using ="css selector",score)
replScore <-sapply(dom_s,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
class(replScore)#리스트인 것을 볼 수 있음
replScore_v <- c(replScore_v, unlist(replScore)) #리스트를 해제해서 벡터로 만들고 다른 객체안에 집어 넣음
replScore_v


#첫 페이지 추천 이유 읽어오기
dom_r <- remDr$findElements(using ="css selector", reason)
replReason <-sapply(dom_r,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
class(replReason)#리스트인 것을 볼 수 있음
replReason_v <- c(replReason_v, unlist(replReason)) #매개변수 똑같이 c() 대신 append()로 해도 됨.
replReason_v


#첫  페이지 후기 읽어오기
dom_c <- remDr$findElements(using ="css selector", comments)
replComments <-sapply(dom_c,function(x){x$getElementText()})
class(replComments) #리스트인 것을 확인
replComments_v <- c(replComments_v, unlist(replComments))
replComments_v



#repeat{
  for(i in 2:10){ #1부터 시작하면 위에 코드와 합치면 됨.
    # 버튼 찾기
    nextCss <- paste0("#contentData > div > div.movie-idv-story > nav > a:nth-child(",i,")") #다음페이지에 해당하는 path
    nextListLink <- NULL #다음페이지에 해당하는 버튼
    try(nextListLink <- remDr$findElement(using='css selector',nextCss)) #다음페이지로 가는 버튼객체(숫자버튼)를 찾는다. #try에 넣은 이유는 findElements는 찾는게 없으면 비어있는 리스트를 리턴하지만, findElement는 찾는 게 없으면 에러를 발생시키기 때문.
    
    #if(length(nextListLink) == 0)   break; #다음 페이지로 넘어가는 게 직접 숫자버튼을 누르는 게 아닌 화살표모양 버튼을 누르는 경우 다음페이지버튼이 비활성화되면 멈추도록 함. #이 홈페이지는 다음페이지 버튼(화살표)을 누르면 그 다음 10페이지를 보여준다.
    
    nextListLink$clickElement() #클릭 이벤트를 발생시킨다.
    Sys.sleep(1) #1초간 멈춘다. #빨리 렌더링이 되지 않아서 시간을 줘야함.
    
    #평점 읽어오기
    dom_s <- remDr$findElements(using ="css selector",score)
    replScore <- NULL
    replScore <-sapply(dom_s,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
    replScore_v <- c(replScore_v, unlist(replScore))
    
    
    #추천 이유 읽어오기
    dom_r <- remDr$findElements(using ="css selector", reason)
    replReason <- NULL
    replReason <-sapply(dom_r,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
    replReason_v <- c(replReason_v, unlist(replReason))
   
    
    #후기 읽어오기
    dom_c <- remDr$findElements(using ="css selector", comments)
    replComments <- NULL
    replComments <-sapply(dom_c,function(x){x$getElementText()})
    replComments_v <- c(replComments_v, unlist(replComments))
  }
#}
print(replScore_v) #평점 전체 출력
print(replReason_v) #추천 이유 전체 출력
print(replComments_v) #후기 전체 출력
df <- data.frame(replScore_v, replReason_v, replComments_v) #데이터 프레임 생성
View(df) #데이터프레임을 표로 정리해서 보여줌.
write.csv(df, "output/movie.csv") #94번째 줄에서 여러 벡터들을 데이터프레임으로 만들어서 데이터프레임 df를 파일에다가 쓴다.(txt 파일인 경우 write()사용)
