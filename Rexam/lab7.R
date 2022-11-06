#11/04 실습1
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)

#<h1> 태그의 컨텐츠 
h1_node <- html_nodes(text, "h1") # 태그 선택자
h1 <- html_text(h1_node)
h1

#<a> 태그의 컨텐츠와 href 속성값  
a_node <- html_nodes(text, "a") # 태그 선택자
a <- html_text(a_node, trim=T)
a
anchors <- html_attr(a_node, "href")
anchors

#<img> 태그의 src 속성값
img_node <- html_node(text, "img") # 태그 선택자
img <- html_attr(img_node, "src")
img

#첫 번째 <h2> 태그의 컨텐츠
h2_node1 <- html_nodes(text, "h2:nth-of-type(1)") #첫번째 h2태그를 찾아온다.
html_text(h2_node1) #node1의 컨텐트가 나온다.

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
ul_node <- html_nodes(text, "ul *[style$=green]") # 태그 선택자
html_text(ul_node)

#두 번째 <h2> 태그의 컨텐츠
html_text(html_node(text, "h2:nth-of-type(2)"))

#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol *"))

#<table> 태그의 모든 자손 태그들의 컨텐츠
html_text(html_nodes(text, "table *"))

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "tr.name"))

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠(td#target)
html_text(html_node(text, "td#target"))
