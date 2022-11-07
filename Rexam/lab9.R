# 11월 07일 실습1 (동적 수집) #exam7.R 210~ 참고함

#install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome") #셀레니움 불러옴 #접속이 성공적으로 일어나면 remoteDriver 객체가 리턴된다.
remDr$open() #셀레니움 서버에 의해 구동되는 크롬 브라우저 창이 열린다
url <- 'https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700'
remDr$navigate(url) #새로 열린 창에서 구글에 접속하도록 렌더링 시킨다. 이런 모든 처리는 셀레니움 서버를 통해서 브라우저가 하도록 한다.

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
replComments_v <- NULL

#첫 페이지 평점 읽어오기
dom_s <- remDr$findElements(using ="css selector",score)
replScore <-sapply(dom_s,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
class(replScore)#리스트인 것을 볼 수 있음
replScore_v <- c(replScore_v, unlist(replScore))
replScore_v

#첫 페이지 추천 이유 읽어오기
dom_r <- remDr$findElements(using ="css selector", reason)
replReason <-sapply(dom_r,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
class(replReason)#리스트인 것을 볼 수 있음
replReason_v <- c(replReason_v, unlist(replReason))
replReason_v

#첫  페이지 후기 읽어오기
dom_c <- remDr$findElements(using ="css selector", comments)
replComments <-sapply(dom_c,function(x){x$getElementText()})
class(replComments) #리스트인 것을 확인
replComments_v <- c(replComments_v, unlist(replComments))
replComments_v


repeat{
  for(i in 2:10){
    # 버튼 찾기
    nextCss <- paste0("#contentData > div > div.movie-idv-story > nav > a:nth-child(",i,")")
    nextListLink <- NULL
    try(nextListLink<-remDr$findElement(using='css selector',nextCss)) #try에 넣은 이유는 findElements는 찾는게 없으면 비어있는 리스트를 리턴하지만, findElement는 찾는 게 없으면 에러를 발생시키기 때문.
    if(length(nextListLink) == 0)   break; #더 이상 다음 페이지 버튼이 없을 경우 정지
    nextListLink$clickElement() #클릭 이벤트를 발생시킨다.
    Sys.sleep(1) #1초간 멈춘다.
    
    #평점 읽어오기
    dom_s <- remDr$findElements(using ="css selector",score)
    replScore <-sapply(dom_s,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
    replScore_v <- c(replScore_v, unlist(replScore))
    
    #추천 이유 읽어오기
    dom_r <- remDr$findElements(using ="css selector", reason)
    replReason <-sapply(dom_r,function(x){x$getElementText()}) #sapply()는 첫번째 매개변수를 두번째 매개변수인 함수의 인자로 넘겨주고 벡터나 리스트로 리턴한다. #getElementText()는 컨텐트를 읽어옴
    replReason_v <- c(replReason_v, unlist(replReason))
    
    #후기 읽어오기
    dom_c <- remDr$findElements(using ="css selector", comments)
    replComments <-sapply(dom_c,function(x){x$getElementText()})
    replComments_v <- c(replComments_v, unlist(replComments))
  }
}
print(replScore_v)
print(replReason_v)
print(replComments_v)
write(repl_v, "output/webtoon.txt") #여러 벡터들을 데이터프레임으로 만들어서 파일에다가 써야함.



repeat { #자동으로 2~10페이지까지 모든 댓글을 읽어오도록 실행시킴. #183~188번째 라인은 자동으로 넘어오기만 하고 댓글을 읽어오지는 않았음.
  for (i in 4:12) {               #양이 많아서 읽어오는데 30분 넘게 걸린다.
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="") #2~10pg 버튼(?)의 노드객체 path를 가져온다. (브라우저에서 f12눌러서 해당되는 코드의 Copy Selector)
    nextListLink <- NULL
    try(nextListLink<-remDr$findElement(using='css selector',nextCss)) #try에 넣은 이유는 findElements는 찾는게 없으면 비어있는 리스트를 리턴하지만, findElement는 찾는 게 없으면 에러를 발생시키기 때문.
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  nextPage <- NULL
  try(nextPage<-remDr$findElement(using='css selector',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "output/webtoon.txt")