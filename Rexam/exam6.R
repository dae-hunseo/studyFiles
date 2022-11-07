#R데이터수집_정적.pdf 14pg~

# [ 예제13 ]
# SNS의 Open API 활용
library(httr) #GET 함수를 쓰기 위함.
library(rvest)
library(XML) #응답을 XML로 받아올 것임.
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"  #블로그에서 가져오게ㅐㅆ다는 의미의 쟤네들이 정한 url
Client_ID <- "izGsqP2exeThwwEUVU3x"    #강사가 받은 ID    네이버에 개발자로 등록하면 받을 수 있음.
Client_Secret <- "WrwbQ1l6ZI"          #강사가 받은 Secret. 네이버에 개발자로 등록하면 받을 수 있음.

query <- URLencode("수능") #수능이라는 검색어로 검색
url <- paste0(searchUrl, "?query=", query, "&display=100") #쿼리 문자열로 만들어주고 100개를 받아옴.
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret)) #첫번째 아규먼트로 url객체를 주고, add_headers로 요청하면서 헤더를 추가해댤라고 준다. 첫번째 아규먼트로는 응답받고자 하는 컨텐트 형식을 지정해주고 두 번째 매개변수로는 고객ID, 세 번째 매개변수로는 고객Secret을 전달한다. 
#doc을 실행시켰을때 status:200이 뜨면 성공이다.

# 블로그 내용에 대한 리스트 만들기		
doc2 <- xmlParse(doc, encoding="UTF-8") #htmlParse() 써도 안 되는건 아닌데 파싱한 내용이 html이면 htmlParse를, xml이면 xmlParse를 주는 게 좋다. 각자 고유의 작성 규칙이 있기 때문에.
text<- xpathSApply(doc2, "//item/description", xmlValue) #조상이 누가 있던 간에 item이란 태그를 찾아라. /를 하나만 주면 최상위 태그라는 뜻이다. //를 두 번 쓰면 부모가 누가 있던 간에 이런 뜻이다. 그 id태그 밑에 자식 태그인 description 태그를 찾으라는 뜻이다. 찾아서 세번째 매개변수로 xmlValue라는 함수를 같이 주면 컨텐트를 추출해준다.
text
text1 <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b> #전달받은 10개의 디스크립션중에 </?b>는 정규표현식인데 text객체에서 gsub()함수로 </?b>나 <b>를 없앤 것을 text1에 저장하란 뜻이다.
text1 <- gsub("&apos;|&quot;|&amp;", "", text1) #&apos는 ' #&quot는 " #&amp는 &  #html entity 검색
text1

text[100]
text1[100] #gsub를 한 것과 안 한 것의 차이점을 확인하라.

# [ 예제14 ]
# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100") #paste0은 문자열들을 하나로 묶는 함수인데 붙이면서 붙인 문자열 사이에 공백을 추가로 따로 넣지 않는다.
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))


#11/07 시작

# 네이버 뉴스 내용에 대한 리스트 만들기		
doc2 <- xmlParse(doc)
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text2 <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b> #sub는 pattern이 바로 정규표현식을 의미하는 문자열인데 pattern에 알맞는 문자열을 찾아서 replacement에 알맞는 문자열로 대체하라는 뜻인데 sub는 한 번만 대체한다. 일반문자열인 string문자열에서 pattern에 알맞는 문자열을 찾아서 replacement로 바꿔라. 그런데 sub는 첫번째 매칭되는 애 하나만 바꾸고 gsub는 매칭되는 모든 애들을 바꾼다. RegExCheatsheet.pdf 참고(봐도 모르긴 할듯)
text2 <- gsub("&apos;|&quot;|&amp;", "", text2) #&apos는 ' #&quot는 " #&amp는 &  #aneok.tistory.com/86에서 여기서 사용한 html entity를 볼 수 있음(&apos 제외). 특수문자를 뜻이 있는것이 아닌 출력용으로 쓸 때 사용하는 것임.
text2 <- gsub("&[A-Za-z]{2,4};","",text2) # 대부분 &로 시작하고 ;로 끝나고 그 사이에는 영문자대문자 영문자소문자가 2개에서 4개 온다는 뜻이다. #정규표현식 #정규표현식은 RegExCheatsheet.pdf 참고(봐도 모르긴 할듯)
text2 #gsub는 첫번째 매개변수인

text[95:97]
text2[95:97]



# [ 예제15 ]
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D" #강사한테 제공된 key
bus_No <- "360" #버스 번호
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?serviceKey=", API_key, "&strSrch=", bus_No, sep="") # url 뒤에 쿼리 문자열로 API Key를 붙이고 있다. 그래서 웹브라우저 주소창에 복붙해도 실행된다.
url #360번 버스에 대한 정보
doc <- xmlParse(url) #아까는 GET방식으로 한 반면 여기서는 xmlParse를 함.
top <- xmlRoot(doc) #응답된 xml 내용을 그대로 추출함.
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) #파싱한 doc 객체를 가지고 //itemlist 라고 되어있는데 //는 조상이 누가있던간에 itemlist 태그를 찾으라는 말이다. /를 붙이면 최상위 태그라는 뜻이 된다.
df     #getNodeSet은 //itemList에 대한 노드집합을 가져온다. 그걸 가져와서 xmlToDataFrame()으로 데이터프레임으로 전환해준다.
str(df)
View(df) #데이터프레임을 표로 정리해서 보여준다. #3600번 버스 정보도 보여준다.

busRouteId <- df[df$busRouteNm == 360, "busRouteId"]
busRouteId

url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="") #여기서는 대문자 ServiceKey이고 56번째 라인에서는 소문자serviceKey이다.
doc <- xmlParse(url)
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
View(df)
str(df)

# [ 예제16 ]
# 서울시 빅데이터(열린데이터광장)- XML 응답 처리 #인증키 받으려면 회원가입하고 데이터셋 신청하면 됨.
# http://openapi.seoul.go.kr:8088/796143536a756e69313134667752417a/xml/LampScpgmtb/1/100/ #xml로 전달받는지, json으로 전달받는지에 따라 중간에 url이 달라진다.

library(XML)
key = '796143536a756e69313134667752417a'
contentType = 'xml'
startIndex = '1'
endIndex = '200'
url = paste0('http://openapi.seoul.go.kr:8088/',key,'/',contentType,'/LampScpgmtb/',startIndex,'/',endIndex,'/')

t <- xmlParse(url)
upNm<- xpathSApply(t,"//row/UP_NM", xmlValue) 
pgmNm<- xpathSApply(t,"//row/PGM_NM", xmlValue)
targetNm<- xpathSApply(t,"//row/TARGET_NM", xmlValue)
price<- xpathSApply(t,"//row/U_PRICE", xmlValue)
#close(t) #warning 에러가 자꾸 떠서 넣어봤다고 함.

df <- data.frame(upNm, pgmNm, targetNm, price)
View(df)
write.csv(df, "output/seoul_stedu.csv")


# 정규표현식 사용 #정규표현식은 gsub()의 첫번째 매개변수로 들어간다. 11/02의 RegExCheatsheet.pdf에 있다.
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word) #gsub()와 sub()의 첫번째 매개변수로는 정규표현식이나 일반문자열을 줄 수 있다.
sub(" ", "@", word) #sub()는 처음 해당하는 값만 적용한다. gsub()는 global으로 모든 해당하는 값에 적용한다.
gsub("A", "", word) #대문자 A를 없앤다.(대체할 2번째 매개변수 값이 없기 때문)
gsub("a", "", word) #sub와 gsub는 3번째 매개변수의 내용 중에 첫번째 매개변수값을을 두번째 매개변수 값으로 바꾼다.
gsub("[Aa]", "", word) #대문자A와 소문자a를 없앤다.
gsub("A|a", "", word) #대문자A 또는 소문자a를 없앤다.
gsub("Aa", "", word)  #대문자A소문자a가 붙어있는(Aa) 값을 없앤다.
gsub("(Aa)", "", word) #소괄호를 붙여도 결과는 같다. 밑에 코드처럼 쓸 때 ()가 의미가 있다.
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word) #Aa를 하나의 그룹으로 만들고 {2}를 지정해줬는데 Aa가 2번 반복될때만 없애라는 뜻이다. #Aa{2}는 바로 앞에있는 a에만 적용된다. a가 2번 반복된 즉 'aa'를 찾아서 없애는데 text변수에는 그런 값이 없다.
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*" #word객체 값
gsub("[Aa]", "", word) #대문자A와 소문자a를 없앤다.
gsub("[가-힣]", "", word) #'-'를 주목해야 한다. 모든 한글을 없앤다.(대체할 2번째 매개변수 값이 없기 때문)
gsub("[^가-힣]", "", word) #'^'은 NOT의 의미다. 한글이 아닌 애를 없애라는 명령이다. #공백이나 특수문자도 다 사라져서 일이 커질 수도 있음에 주의해야 한다.
gsub("[&^%*]", "", word) #'^'가 제일 앞에 있어야 NOT의 이미가 된다. 즉 여기서는 특수문자 &^%*를 없애라는 명령이다.
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) #한글영문숫자를 없애라
gsub("[1234567890]", "", word) #숫자를 없앤다.(대체할 2번째 매개변수 값이 없기 때문)
gsub("[0-9]", "", word) #0부터 9까지 즉 숫자를 없앤다.
gsub("\\d", "", word)  #숫자를 없앤다.
gsub("\\D", "", word) #숫자를 제외하고 없앤다.
gsub("[[:digit:]]", "", word) #숫자를 없앤다.
gsub("[^[:alnum:]]", "", word) #'^'가 붙었기 때문에 한글영문숫자가 아닌 애들을 없앤다(공백 포함해서 없어진다.)
gsub("[[:space:]]", "", word) #공백만 없앤다.
gsub("[[:punct:][:digit:]]", "", word) #특수문자와 숫자를 없앤다(영문,공백,한글만 남는다)
gsub("[[:punct:][:digit:][:space:]]", "", word) #특수문자, 숫자, 공백을 없앤다.


