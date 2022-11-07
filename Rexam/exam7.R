#78번째 라인부터 동적 API 수집 #R데이터수집_동적.pdf

# [ 예제17 ]

# 고속도로 공공데이터 포털 Open API - XML 응답 처리
library(XML)
API_key <- "4062158448"
sdate <- "20221104" #날짜
stdHour <- "10"
type <- "xml"
url <- paste0("http://data.ex.co.kr/openapi/restinfo/restWeatherList?key=", API_key, "&type=", type, "&sdate=", sdate, "&stdHour=", stdHour)
url #url을 직접 웹브라우저 창에 복붙하면 openapi 데이터를 보여줌.
# case 1
doc <- xmlParse(url)
unitName <- xpathSApply(doc,"//list/unitName", xmlValue) #휴게소 이름
unitCode <- xpathSApply(doc,"//list/unitCode", xmlValue)
routeName <- xpathSApply(doc,"//list/routeName", xmlValue) #고속도로 이름
addr <- xpathSApply(doc,"//list/addr", xmlValue) #휴게소 주소
weatherContents <- xpathSApply(doc,"//list/weatherContents", xmlValue) #날씨
tempValue <- xpathSApply(doc,"//list/tempValue", xmlValue) #평균 기온

df <- data.frame(unitName, unitCode, routeName, addr, weatherContents, tempValue ) #데이터 프레임 생성
View(df) #데이터프레임을 표로 정리해서 보여줌.

# case 2
doc <- xmlParse(url, encoding="UTF-8") #인코딩을 줘도 되고 안 줘도 된다. 현재 R 버전으로는 UTF-8이 디폴트이기 때문.
df2 <- xmlToDataFrame(getNodeSet(doc, "//list")) #xml을 데이터프레임으로 가져오겠따. doc안에는 DOM객체가 들어가있고 그 안에서 //list라는 태그를 찾는다. 이 태그를 기준으로 하여 xml을 데이터프레임으로 변환한다.
df2
View(df2)
names(df2)
df_new2 <- df2[c('unitName', 'unitCode', 'routeName', 'addr', 'weatherContents', 'tempValue')] #원하는 column만 뽑아서 새로운 데이터프레임을 만든다.
View(df_new2)



# [ 예제18 ]
# 고속도로 공공데이터 포털 Open API - JSON 응답 처리

library(jsonlite)
library(httr)
url <- 'https://data.ex.co.kr/openapi/restinfo/restWeatherList?key=4062158448&type=json&sdate=20221006&stdHour=10' #date는 날짜
url #콘솔창에 출력되는 url을 크롬창에 복붙하고, 그 내용들을 http://jsonviewer.stack.hu/ 에 복붙하고 format 키를 누른다. json
res <- GET(url) #GET함수는 응답 형식이 바이너리 형식일 때?? #httr이라는 패키지가 제공함.
json_data <- httr::content(res, type='text', encoding="UTF-8") #json에 대해 필기 놓침. #content()는 R의 기본 내장API로도 있어서 httr::을 붙여줘야 한다. httr 패키지에서 쓰인 함수라는 것을 명확하게 명시하려고 httr::을 붙였다. 반면 GET()은 httr패키지에 있고 R의 기본 내장api에 있어서 httr::을 붙여줄 필요가 없다.
json_obj <- fromJSON(json_data) #필기 필요
class(json_obj) #리턴된 결과가 어떤 형식인지 알 고 싶을때
str(json_obj) #리턴된 결과가 어떤 형식인지 알 고 싶을때
df3 <- data.frame(json_obj) #리스트 객체로 데이터 프레임을 생성한다.
View(df3) # 모든 태그들을 가지고 데이터 프레임을 만든 것을 볼 수 있다.
df_new3 <- df3[c('list.unitName', 'list.unitCode', 'list.routeName', 'list.addr', 'list.weatherContents', 'list.tempValue')] #그래서 필요한 column만 추출해서 본다.
View(df_new3)
#응답이 JSON일때는 http라는 패키지에서 제공하는 GET함수를 이용해서 요청을 보내고 GET^함수로 받아온 다음에 content()를 통해 응답된 개체를 받아오고 그걸 fromJSON()으로~~


# 벡터에 새로운 원소(element) 추가하기
# CASE1 
newv1 <- NULL #newv1 <- c() 로 해도 똑같이 비어있는 벡터가 생성된다.
newv1 <- c(newv1, "둘리") #c()를 이용해 기존 벡터 뒤에 원소를 추가해서 벡터를 생성하는 듯 함. c()는 벡터를 생성하는 함수다.
newv1
newv1 <- c(newv1, "또치")
newv1
newv1 <- c(newv1, "도우너")
newv1
newv1 <- c(newv1, c("고길동", "희동이")) #기존에 만들어져있던 벡터에 새로운 엘리먼트들을 추가해나갈 때.
newv1
# CASE2 
newv2 <- NULL
newv2 <- append(newv2, "둘리") #c()가 아닌 append()를 통해 기존의 벡터 뒤에 새로운 원소를 추가한다.
newv2
newv2 <- append(newv2, "또치")
newv2
newv2 <- append(newv2, "도우너")
newv2
newv2 <- append(newv2, c("고길동", "희동이")) #벡터 뒤에 여러가지 원소를 추가할 때때
newv2


?remoteDriver
# 동적 웹 페이지의 수집
install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome") #셀레니움 불러옴 #접속이 성공적으로 일어나면 remoteDriver 객체가 리턴된다.
remDr$open() #셀레니움 서버에 의해 구동되는 크롬 브라우저 창이 열린다
remDr$navigate("http://www.google.com/") #새로 열린 창에서 구글에 접속하도록 렌더링 시킨다. 이런 모든 처리는 셀레니움 서버를 통해서 브라우저가 하도록 한다.
class(remDr) #콘솔창 확인
str(remDr)   #콘솔창 확인

webElem <- remDr$findElement(using = "css", "[name = 'q']") #css를 사용해서 찾는다. #엘리먼트를 찾으라는 의미다. findElements()도 있다. 
#주어진 css 선택자를 가지고 엘리먼트를 하나만 찾을거면 findElement()다. 얘도 태그를 찾을 때 방법은 css 선택자를 주는 방법도 있고 여러가지가 있는데 using = "css"를 줘도 되고 using = "css selector"를 줘도 된다. name 속성의 값이 q인 것을 찾아라. 구글홈페이지에서는 검색창이다.
webElem$sendKeysToElement(list("PYTHON", key = "enter")) #검색 키워드는 PYTHON #엔터키를 누른다. #리스트 객체를 전달한다. "PYTHON"은 value다.

remDr$navigate("http://www.naver.com/") #한 번 기동된 셀레니움에 의해 구동되는 크롬 브라우저를 얼마든지 재활용할 수 있다. 맨 처음 구글 홈페이지에 접속할때도 이 함수를 썼다.

webElem <- remDr$findElement(using = "css selector", "#query") #검색창의 id가 query다. f12 눌러서 찾아보면 나옴.
webElem$sendKeysToElement(list("PYTHON", key = "enter"))
str(webElem)

# 다음에 제시된  URL의 웹 페이지는 정적 방법으로 충분히 가능하지만
# 이해를 돕기 위해 간단한 웹페이지를 크롤링하고 스크래핑 함
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
remDr$navigate(url) #위의 url로 접속함

#단수형으로 노드 추출 using=css selector 
one<-remDr$findElement(using='css selector', 'div') # 노드 한 개 리턴(WebElement 객체)
one$getElementTagName() #태그 이름이 나옴. 리스트로 리턴함. #TagName하고 Name하고 다른 것임. 태그에서 name속성이 아니라 말 그대로 태그명.
one$getElementText() 
one$getElementAttribute("style") #style속성(css)의 속성값(?)이 나온다.

# 단수형으로 없는 노드 추출
one<-NULL # NULL로 초기화를 해주지 않으면 102번째 라인의 값이 그대로 남아있게 된다.
one<-remDr$findElement(using='css selector', 'p') # 없으면 NoSuchElement 오류 발생. #대입연산이 일어나지 않는데 만약 108번째 라인이 실행되지 않았다면 one객체에는 102번째 라인의 값이 그대로 남아있는다.
print(one) #NULL 출력
print(length(one))


# 만일 오류 발생을 무시하고 싶다면 try() 함수 사용
# 없을 수도 있으면 복수형(findElements()) 사용할것
one<-NULL
try(one<-remDr$findElement(using='css selector', 'p')) #제일 첫번째의 p태그의 컨텐트를 가져온다.
print(one)
print(length(one))


#복수형으로 노드 추출
more<-remDr$findElements(using='css selector', 'div')

# 추출된 노드에서 태그명이나 컨텐트 추출 방법 1
for (node in more) {
  print(node$getElementTagName()) #div 태그명 출력(Name 속성이 아닌 말 그대로 태그명)
}

for (node in more) {
  print(node$getElementText()) #div 태그 컨텐트 출력력
}

# 추출된 노드에서 태그명이나 컨텐트 추출 방법 2
sapply(more, function(x) x$getElementTagName()) #sapply()는 Simple하게 리턴해서 리스트가 리턴될수도, 벡터가 리턴될수도 있다. 여기서는 벡터가 리턴된다.
sapply(more, function(x) x$getElementText())

#복수형으로 없는 추출
more<-remDr$findElements(using='css selector', 'p') # 없으면 오류가 발생하지 않음 비어있는 리스트 리턴
print(more)  
if(length(more) == 0) 
  cat("<p> 태그는 없슈\n")
sapply(more, function(x) x$getElementTagName())
sapply(more, function(x) x$getElementText())



url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)
# 수행1 - 태그 찾기
one<-remDr$findElement(using='css selector', 'a:nth-of-type(4)')
# 수행2 - 태그명 확인
one$getElementTagName()
# 수행3 - 태그 컨텐트(링크텍스트) 확인
one$getElementText()
# 수행4 - 클릭 이벤트 처리 #자동으로 클릭을 하도록 이벤트를 실행한다.(링크로 연결됨)
one$clickElement()


url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)

one<-remDr$findElement(using='css selector', 'a:nth-of-type(3)')
one$getElementTagName()
one$getElementText()
# 클릭 이벤트 처리하는 또 다른 방법 - 자바스크립트 코드 사용
remDr$executeScript("arguments[0].click()",list(one)) #click()은 자바스크립트의 클릭이벤트 코드다. 157번째 라인의 clickElement()가 가끔 실행 안 될때 있는데 그 때 이 코드를 실행하면 된다.


# [ 네이버 웹툰 댓글 읽기 ]
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135' 
remDr$navigate(url) #베스트 댓글을 보여준다. 전체댓글을 보려면 전체댓글을 보여주는 url을 파악해야하는데 url이 그대로다. 전체댓글 url이 따로 있는 게 아니고 AJAX로 끌어와서 전체댓글을 보여주는 것이다.

#단수형으로 노드 추출(전체댓글이라는 링크텍스트를 출력하는 <A> 태그를 찾자)
more<-remDr$findElement(using='css selector', '#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a') #f12에서 해당되는 컨텐트의 코드를 찾아서 마우스우클릭해서 copy selector 해서 전체댓글 버튼의 태그경로를 찾아냄.
more$getElementTagName()
more$getElementText() # 전체댓글 #<a>태그의 컨텐트 내용이 뭔가. "전체내용"임. 댓글의 전체 내용.
#클릭이벤트 처리
more$clickElement() #"전체댓글"을 클릭하도록 이벤트가 발생한다.


# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span") #paste0은 문자열을 이어붙인다. #2~10 페이지를 가도록 링크를 클릭하는 곳의 선택자경로를 copy selector해서 공통점과 차이점들을 알아내서 이렇게 반복문을 적용한다.
  nextPage<-remDr$findElement(using='css selector', nextCss)
  nextPage$clickElement()
  Sys.sleep(2)
}


#베스트 댓글 내용 읽어오기
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents") #ul태그의 class선택자가 u_cbox_list 그리고 그 자손선택자인 span태그의 class선택자가 u_cbox_contents
sapply(bestReviewNodes,function(x){x$getElementText()})

#전체 댓글 링크 클릭후 
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()

#첫 페이지 내용 읽어오기 #삭제된 댓글이나
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})



# 모든 소스~~~
repl_v = NULL;
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})   #sapply()는 exam4.R에서 최초로 사용됐는데 첫번째 매개변수인 벡터를 2번째 매개변수인 함수의 매개변수로 넣는다는 뜻이다.
class(vest_repl) #내가 추가한 코드인데 리스트인 것을 볼 수 있다.
repl_v <- c(repl_v, unlist(vest_repl)) #vest_repl가 리스트이기 때문에 unlist를 해줘야 한다.

#"전체덧글더보기" 클릭 이벤트 발생시킴
toralReview <- remDr$findElement(using='css selector','span.u_cbox_in_view_comment')
toralReview$clickElement()

#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

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
  nextPage <- NULL   #10 페이지까지 읽었다면
  try(nextPage<-remDr$findElement(using='css selector',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page")) #다음페이지로 가는 버튼객체 정보를 가져옴
  if(length(nextPage) == 0)  break; #만약 다음페이지로 가는 버튼객체가 활성화되어있지 않으면 repeat 반복문 정지지
  nextPage$clickElement() #다음 페이지로 가는 버튼 객체가 활성화되어있다면 클릭이벤트를 발생시킴
  Sys.sleep(1) #1초간 정지
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents") #페이지 내용 읽어옴
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "output/webtoon.txt")


# [ 아고다 페이지에 올려진 신라스테이 호텔에 대한 전체 페이지 댓글 읽기 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome") #새로운 브라우저가 기동된다.
remDr$open() #셀레니움에 의해 구동되는 브라우저가 하나 열린다.
url<-'https://www.agoda.com/ko-kr/shilla-stay-yeoksam/hotel/seoul-kr.html?asq=z91SVm7Yvc0eRE%2FTBXmZWCYGcVeTALbG%2FvMXOYFqqcm2JknkW25Du%2BVdjH%2FesXg8ORIaVs1PaEgwePlsVWfwf3sX%2BVNABRcMMOWSvzQ9BxqOPOsvzl8390%2BEhEylPvEiBp0eoREr2xLYHgqmk0Io4J1HYEzEOqyvdox%2BwS6yxHeonB9lh7mJsBIjSBPoMzBLFW01k%2BU8s2bGO6PcSdsu3T30HwabyNzwNYKiv%2BRDxfs%3D&hotel=699258&tick=637215342272&languageId=9&userId=bcb7ecc6-7719-465f-bf29-951e39733c66&sessionId=uouhnqjisace4freagmzbxxc&pageTypeId=7&origin=KR&locale=ko-KR&cid=-1&aid=130243&currencyCode=KRW&htmlLanguage=ko-kr&cultureInfoName=ko-KR&ckuid=bcb7ecc6-7719-465f-bf29-951e39733c66&prid=0&checkIn=2020-05-30&checkOut=2020-05-31&rooms=1&adults=1&childs=0&priceCur=KRW&los=1&textToSearch=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC%20(Shilla%20Stay%20Yeoksam)&productType=-1&travellerType=0&familyMode=off'
remDr$navigate(url)
Sys.sleep(3)
pageLink <- NULL #이전에 사용한 remDr의 정보를 삭제하기 위함.
reple <- NULL #이전에 사용한 remDr의 정보를 삭제하기 위함.
curr_PageOldNum <- 0
repeat{ #마지막 페이지에 도달할때까지 반복함. while(true)처럼 보면 됨
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  #print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- remDr$findElements(using='css selector',"#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i ")
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)
  curr_PageElem <- remDr$findElement(using='css selector','#reviewSection > div:nth-child(6) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
  if(curr_PageNewNum == curr_PageOldNum)  { #마지막 페이지에 도달했다면 #다음 페이지 버튼이 비활성화되면 마지막 페이지로 보던가 이 코드처럼 현재 읽은 페이지와 새로 읽게될 페이지가 같으면 종료시킴. #아니면 마지막 페이지를 계속해서 반복해서 읽음.
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"output/hotel.txt") #이거 하는데 한참 걸림


# [ 네이버 북 페이지의 베스트 셀러 TOP 20 ]

site <- "https://search.shopping.naver.com/book/home"
remDr$navigate(site)

#bestseller_tab

booksitenodes <- remDr$findElements(using='css selector', '#__next > div > div.home_book_home__5LVmZ > div > div:nth-child(3) > div > div.scrollTab_tab_area__qa0cB > ul > li > a')
length(booksitenodes)
for (booksitenode in booksitenodes) { #책 제목을 뽑아오도록 코드를 바꿔보라고 함.
  print(booksitenode$getElementText())
  booksitenode$clickElement()
  Sys.sleep(2)
  books = remDr$findElements(using='css selector', '#__next > div > div.home_book_home__5LVmZ > div > div:nth-child(16) > div > div.bestSeller_book_area__p2Fwa > div > ul > li> a > div.bestSeller_text_area__oQhay > strong') # Copy Selector를 하면 특정 라인의 코드의 path를 받을 수 있는데 거기서 li:nth-child(1)로 되어있는 것을 li로 바꿔줬다.
  for(bookname in books) 
    print(unlist(bookname$getElementText()))
  print("--------------------------------------")
}
#11/07 종료 




# [ GS25 1+1 상품 첫페이지 스크래핑 ]

site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)


eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li > div > p.tit')
eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li > div > p.price > span')
eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

data.frame(egn = unlist(eventgoodsname), egp = unlist(eventgoodsprice))



# [ YES24의 명견만리 댓글 읽어오기 ]

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("http://www.yes24.com/24/goods/40936880")

repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
  for(index in 3:7) {
    fullContentLinkcss <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.crop > a", sep='')
    fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkcss)
    if (length(fullContentLink) == 0) {
      cat("종료\n")
      endFlag <- TRUE
      break
    }
    remDr$executeScript("arguments[0].click();",fullContentLink);
    Sys.sleep(1)
    fullContentcss <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
    fullContent<-remDr$findElements(using='css selector', fullContentcss)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    cat("---------------------\n")
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;  
  
  if(page == 10){
    page <- 3
    nextPagecss <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
  }
  else{
    page <- page+1;
    nextPagecss <- paste("#infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(",page,")",sep="")
  }
  nextPageLink<-remDr$findElements(using='css selector',nextPagecss) 
  remDr$executeScript("arguments[0].click();",nextPageLink);
  Sys.sleep(2)
  print(page)
}
write(repl_v, "output/yes24.txt")




# [스타벅스 서울 전체 매장 정보 크롤링&스크래핑]

library(RSelenium)

#remDr <- remoteDriver(remoteServerAddr = "localhost", port=4445, browserName="chrome")
#remDr$open()

site <- paste("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
remDr$navigate(site)

Sys.sleep(3)

#서울 클릭
btn1css <- "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a"
btn1Page <- remDr$findElements(using='css selector',btn1css)
sapply(btn1Page,function(x){x$clickElement()})
Sys.sleep(3)

#전체 클릭
btn2css <- "#mCSB_2_container > ul > li:nth-child(1) > a"
btn2Page <- remDr$findElements(using='css selector',btn2css)
sapply(btn2Page,function(x){x$clickElement()})
Sys.sleep(3)

index <- 0
starbucks <- NULL
total <- sapply(remDr$findElements(using='css selector',"#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span"),function(x){x$getElementText()})

repeat{
  index <- index + 1
  print(index)
  
  storecss <- paste0("#mCSB_3_container > ul > li:nth-child(",index,")")
  storePage <- remDr$findElements(using='css selector',storecss)
  if(length(storePage) == 0) 
    break
  storeContent <- sapply(storePage,function(x){x$getElementText()})
  
  #스타벅스 정보 추출
  #strsplit(storeContent, split="\n")
  storeList <- strsplit(unlist(storeContent), split="\n")
  shopname <- storeList[[1]][1]
  addr <- storeList[[1]][2]
  addr <- gsub(",", "", addr)
  telephone <- storeList[[1]][3]
  
  #스타벅스 위도 경도 추출
  lat <- sapply(storePage,function(x){x$getElementAttribute("data-lat")})
  lng <- sapply(storePage,function(x){x$getElementAttribute("data-long")})
  
  #병합
  starbucks <- rbind(starbucks ,cbind(shopname, addr, telephone, lat, lng))
  
  #스크롤 다운
  if(index %% 3 == 0 && index != total)
    remDr$executeScript("var dom=document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]]; dom.scrollIntoView();", list(index))
}
write.csv(starbucks, "output/starbucks.csv")


