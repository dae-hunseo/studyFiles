# 11/04 2번째 실습 #exam5.R 예제5 참고함

library(rvest)
news <- read_html("https://news.daum.net/") #실행할때마다 실시간으로 바뀜

vtitle<-NULL; vcategory<-NULL; 
for (index in 1:20) { #1번째부터 20번째까지  #for문을 안 쓰면 그냥 html_node의 두 번째 매개변수로 제목은 ".item_issue .tit_g a", 카테고리는 ".txt_category"만 줘도 됨. 그럼 같은 클래스를 같는 요소들을 다 끌어옴.
  #제목                     #두 번째 매개변수로 그냥 ".txt_category"만 해도 됨 #아래처럼 된 것은 조상중에 id태그를 가진 게 없어서 body태그까지 올라간 것임.
  node_t <- html_node(news, paste0("body > div.container-doc > main > section > div > div.content-article > div.box_g.box_news_issue > ul > li:nth-child(",index,") > div > div > strong > a"))
  title <- html_text(node_t, trim=TRUE)
  title
  vtitle[index] <- title
  
  #카테고리                 #두 번째 매개변수로 그냥 ".item_issue .tit_g a" 해도 됨 #아래 처럼 된 것은 조상중에 id태그를 가진 게 없어서 body태그까지 올라간 것임.
  node_c <- html_node(news, paste0("body > div.container-doc > main > section > div > div.content-article > div.box_g.box_news_issue > ul > li:nth-child(",index,") > div > div > span > span.txt_category"))
  category <- html_text(node_c)
  vcategory[index] <- category
}
page <- data.frame(vtitle, vcategory)
View(page) #생성한 데이터프레임을 표로 정리해서 보여줌.
write.csv(page, "output/movie_reviews_1page.csv") #미리 생성되어있던 폴더에 새로 파일을 생성함.
