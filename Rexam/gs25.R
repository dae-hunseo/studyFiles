#R동적수집 수행평가

#gs25 사이트에서 2+1 행사를 진행하는 모든 상품들의 상품명과 가격을 추출하여 데이터 프레임으로 생성한 다음 gs25_twotoone.csv 에 저장하는 R 코드를 작성하시오. 
#모든 페이지를 처리해야 함!!!
#메일제목 : R동적수집수행평가-XXX 
#파일명 : gs25.R, gs25_twotoone.csv
#저장할 때 상품명의 변수명은 goodsname, 가격의 변수명은 goodsprice 가 되도록 한다. 또한 금액에서는 ',' 와 '원'을 제거하고 숫자만 저장한다.(gsub() 함수 사용)



library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome") #셀레니움 불러옴 #접속이 성공적으로 일어나면 remoteDriver 객체가 리턴된다. #포트번호를 4445로 해주는 이유는 이걸 실행시키기 위해서 cmd창에다가 코드를 입력해야하는데 그 때 포트 번호를 4445로 해줬기 때문.
remDr$open() #셀레니움 서버에 의해 구동되는 크롬 브라우저 창이 열린다
url <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url) #새로 열린 창에서 gs25 홈페이지에 접속하도록 렌더링 시킨다. 이런 모든 처리는 셀레니움 서버를 통해서 브라우저가 하도록 한다.
Sys.sleep(2)

#2+1 행사 버튼 경로
##TWO_TO_ONE
#상품명(li에서 뒤에 :nth-child(숫자)를 없애주면 해당 페이지의 2+1행사 상품명들을 다 가져온다.)
##contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(1) > div > p.tit
##contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(2) > div > p.tit
#가격
##contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(1) > div > p.price > span
##contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(2) > div > p.price > span
#Next 버튼
##contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next

twoPlusOne_link <- '#TWO_TO_ONE' #2+1 행사 path
try(twoPlusOne_contentLink <- remDr$findElement(using='css selector', twoPlusOne_link)) #2+1행사 버튼 객체 정보를 가져옴
twoPlusOne_contentLink$clickElement() #클릭 이벤트 실행
Sys.sleep(2)

#첫번째 페이지 데이터 수집
goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
goodsname <- sapply(goodsnodes, function(x) {x$getElementText()}) #상품정보(이름) 가져옴.


goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
goodsprice <- sapply(goodsnodes, function(x) {x$getElementText()}) #가격을 가져옴.
goodsprice <- gsub("\\D", "", goodsprice) #숫자를 제외하고 없앤다. exam6.R 126번째 라인 참고함

df <- data.frame(name = unlist(goodsname), price = unlist(goodsprice)) #이름과 가격으로 데이터프레임 생성
?findElement
nextBtn <- '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next' #Next버튼 path
repeat{
  try(nextBtn_link <- remDr$findElement(using='css selector', nextBtn)) #Next 버튼 객체 정보를 가져옴

  #if(nextBtn_link$getElementAttribute("onclick") == NULL){ # lat <- sapply(storePage,function(x){x$getElementAttribute("data-lat")}) #exam7.R의 426번째 라인 #정적 수집에서는 html_attr이었음
  #  break
  #}
  
  nextBtn_link$clickElement()
  Sys.sleep(2)
  

  
  goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  goodsname <- NULL
  goodsname <- sapply(goodsnodes, function(x) {x$getElementText()}) #상품정보(이름) 가져옴.
  
  
  goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  goodsprice <- NULL
  goodsprice <- sapply(goodsnodes, function(x) {x$getElementText()}) #가격을 가져옴.
  goodsprice <- gsub("\\D", "", goodsprice) #숫자를 제외하고 없앤다. exam6.R 126번째 라인 참고함
  
  
  df <- rbind(df, data.frame(name = unlist(goodsname), price = unlist(goodsprice))) #rbind 함수 사용하여 기존 데이터프레임에 추가할 데이터프레임을 붙임
  
  if (length(unlist(goodsname)) != 8) { #한 페이지에 상품이 8개가 꽉 채워져있지 않으면 맨 마지막 페이지까지 읽은 것. #exam7.R es24 명견만리코드 참고함.
    break
  }

  # 맨 마지막 페이지에 가면 Next 버튼의 onclick 함수가 없음
  #onclick="goodsPageController.moveControl(1)"
}
View(df)
write.csv(df, "output/gs25_twotoone.csv") #txt 파일로 만드는 경우 write()사용

