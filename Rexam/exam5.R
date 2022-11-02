#R데이터수집_정적.pdf에 관련된 코드
library() #사용가능한 R패키지들을 보여준다.
installed.packages #설치된 패키지들을 보여준다.
search() #이미 로딩되어있는 패키지들의 리스트를 보여줌. #R이 내장한 게 아니면 설치한 패키지는 로딩해야 쓸 수 있음.

install.packages("rvest")  #주석을 해제하고 실행을 하면 패키지를 설치한다. #패키지를 설치하면서 에러가 나면 RGui에서 이 코드를 복붙해서 Korea(Seoul)을 누르면 된다.
install.packages("XML")    #주석을 해제하고 실행을 하면 패키지를 설치한다. #RGui에서 패키지를 설치하고 library(rvest)를 작동시키면 정상 작동한다.
install.packages("httr")   #주석을 해제하고 실행을 하면 패키지를 설치한다.


# [ 예제1 ]
library(rvest) #이걸 해줘야 쓸 수 있다. 패키지는 설치됐다고 무조건 쓸 수 있는게 아니라 메모리에 로드해놓고 써야한다.

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

str(text)
text$doc

nodes <- html_nodes(text, "div") # 태그 선택자
nodes

title <- html_text(nodes) #div태그들의 node 객체들을 ~~
title

node1 <- html_nodes(text, "div:nth-of-type(1)") #첫번째 div태그를 찾아온다.
node1 
html_text(node1) #node1의 컨텐트가 나온다.
html_attr(node1, "style") #첫번째 매개변수인 node1(첫번째 div태그)에 적용된 style 속성을을 꺼내고 있다.

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style") #style 속성이 없어서 NA라고 나온다.

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)

# [ 예제2 ]
# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do" #직접 들어가서 오픈 API (9,501건) 리스트를 흝어보자. 게시글이 하나의 컨텐트다.
html <- read_html(url)
html

# 목록 아이템 추출
title <- html_text(html_nodes(html, "#apiDataList .title")) #만약 함수 매개변수 맨 뒤에 trim=T를 주면 공백이나 탭문자를 다 없애줘서 출력한다. 다만 문자열 중간에 있는 \r\n은 지워지지 않는다. 그건 56번째 라인 참고.
title

# 목록 아이템 설명 추출
desc <- html_text(html_nodes(html, "#apiDataList .ellipsis"))
desc

# 데이터 정제: 제어문자를 공백으로 대체
title <- gsub("[[:cntrl:]]", "", title) #\t, \r, \n 같은 것을 공백으로 대체해준다. #마지막 매개변수 title은 49번째 라인에서 이미 사용됐다. 여기서 새로 생성한 게 아니다.
title

desc <- gsub("[[:cntrl:]]", "", desc) #\t, \r, \n 같은 것을 공백으로 대체해준다. #마지막 매개변수 desc는 52번째 라인에서 이미 사용됐다. 여기서 새로 생성한 게 아니다.
desc

# 데이터 출력
openapidf <- data.frame(title, desc)
openapidf
View(openapidf) #데이터를 표로 정리해서 보여준다. 
write.csv(openapidf, "output/openapidf.csv") #output이란 폴더를 만들어줘야 한다. 파일이 존재하지 않으면 파일은 만들어주지만 폴더까지 만들어주지는 않는다.
#csv 파일은 메모장으로 열면 보인다. 엑셀로 열면 글씨가 다 깨진다.


# [ 예제3 ]
# 영화 제목과 평점 읽기
url<- "http://movie.naver.com/movie/point/af/list.nhn?" #테스트 하는 중간중간에 계속 새로 내용이 올라온다는 특징이 있다.
html <- read_html(url)
html
# 영화제목
nodes <- html_nodes(html, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(html, ".title em") #조상중에 title이란 클래스 태그를 갖는 em태그(꺽새괄호를 주면 부모 자식관계, 공백이면 조상후손 관계계)
point <- html_text(nodes)
point
onepagedf1 <- data.frame(title, point)
print(onepagedf1)

# [ 예제4 ]
# 영화 제목, 평점, 리뷰글 읽기(1)
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
html <- read_html(url)
html
# 영화제목
nodes <- html_nodes(html, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(html, ".title em")
point <- html_text(nodes)
point
# 영화 리뷰글 #CSS선택자 방식
nodes <- html_nodes(html, ".title")
review <- html_text(nodes, trim=TRUE)
review #직접 홈페이지에서 f12를 눌러보면 알겠지만 리뷰글만의 태그가 따로 없다. 그래서 영화제목, 평점, 신고까지 다 뽑아냈다. 이럴때는 CSS 선택자가 아닌 XPath를 써야 한다.

# 영화 리뷰글 #XPath 방식 #태그로 감싸지지 않은 내용을 꺼내겠다면 CSS 선택자로 못하고 이렇게 XPath 방식을 이용해야 한다. CSS는 태그만 노드로 인정하는 반면 XPAth는 태그뿐만 아니라 텍스트도 노드로 인정한다.
nodes <- html_nodes(html, xpath='//*[@id="old_content"]/table/tbody/tr/td[2]/text()') #//*는 조상이 누가 있던간에 #[@id="old_content"] id가 old_content인 자식 태그 중에 table 태그의 tbody 태그의 tr 태그 밑에 2번째 td태그에 대해 ~~~인데
                                                                                      #xPath는 크롬기준 f12 누르고 Ctrl+Shift+C 눌러서 해당하는 코드블록 위치를 찾은 다음 
                                                                                      #마우스 우클릭 -> Copy -> Copy XPath를 누르면 된다. 
                                                                                      #만약 태그가 감싸고 있다면 Copy Selector을 해서 CSS 선택자 방식에서 사용할 수 있다. 그런데 그걸 다 쓸 필요는 없고(특히 여러개에 동시 적용하고 싶은 경우) 카피한 CSS 선택자경로 중에서 필요한 조상과 후손 선택자만 고르면 된다.
review <- html_text(nodes, trim=TRUE)
review
review <- review[seq(4,50,5)] #리뷰글만 태그로 묶지 않았기 때문에 엔터문자도 자식 텍스트 노드로 파악하기 때문에 그걸 분석해서 4번째부터 5개씩 건너뛰게 해서 딱 리뷰글만 10개가 나오도록 했다.
review  #엔터문자 같은 것도 하나하나 자식 DOM객체로 인식하고 있어서 빈 문자열이 많이 나온다.

onepagedf2 <- data.frame(title, point, review)
print(onepagedf2)
View(onepagedf2)


# [ 예제5 ]
# 영화 제목, 평점, 리뷰글 읽기(2)
vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
html <- read_html(url)
html

for (index in 1:10) {
  # 영화제목
  node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 
  node <- html_nodes(html, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  print(node)
  review = node[4] 
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
View(page)
write.csv(page, "output/movie_reviews_1page.csv")

# [ 예제6 ]
# 영화 제목, 평점, 리뷰글 읽기(3)
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
html <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste0(site, i)
  html <- read_html(url)
  nodes <- html_nodes(html, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(html, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(html, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
View(movie.review)

rm(list=ls())

# [ 예제7 ]
# 영화 제목, 평점, 리뷰글 읽기(4)
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
html <- NULL
vtitle <- NULL
vpoint <- NULL
vreview <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  cat(i, "페이지\n")
  url <- paste0(site, i)
  html <- read_html(url)
  for (index in 1:10) {
    # 영화제목
    node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    title <- html_text(node)
    vtitle[index] <- title
    # 영화평점
    node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    point <- html_text(node)
    vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(html, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    review = node[4] 
    vreview <- append(vreview, review)
  }
}
movie.allreview <- data.frame(vtitle, vpoint, vreview)
View(movie.allreview)
write.csv(movie.allreview, "output/movie_reviews_100page.csv")


# [ 예제8 ]
# 한겨레 페이지(XML 패키지 사용)
library(XML)
library(rvest)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)
t
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue); 
content

# [ 예제9 ]
# W3C의 HTTP 프로토콜 스팩에서 Table of Contents 읽기
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), 'div.toc h2')
title2 = html_text(title2)
title2

# [ 예제10 ]
# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
htxt = read_html("https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001")
link = html_nodes(htxt, 'div.list_body a'); 
length(link)
article.href = unique(html_attr(link, 'href'))
article.href

# [ 예제11 ]
# 이미지, 첨부파일 다운 받기 
# pdf
library(httr)
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')

# [ 예제10 ]
# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 


