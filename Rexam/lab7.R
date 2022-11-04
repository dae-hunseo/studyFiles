#11/04
#완성 못함.
library(rvest)


url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)

h1_node <- html_nodes(text, "h1") # 태그 선택자
h1 <- html_text(h1_node)
h1

a_node <- html_nodes(text, "a") # 태그 선택자
a <- html_text(a_node, trim=T)
a
anchors <- html_attr(a_node, "href")
anchors

img_node <- html_node(text, "img") # 태그 선택자
img <- html_attr(img_node, "src")
img

h2_node1 <- html_nodes(text, "h2:nth-of-type(1)") #첫번째 h2태그를 찾아온다.
h2_node1 
html_text(h2_node1) #node1의 컨텐트가 나온다.

ul_node <- html_nodes(text, "ul *[style$=green]") # 태그 선택자
html_text(ul_node)
