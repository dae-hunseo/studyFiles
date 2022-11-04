#정적크롤링수행평가-서대훈
library(rvest)

#예제7 참고함
webtoon<- "https://comic.naver.com/genre/bestChallenge?&page="
comicName<-NULL; comicSummary<-NULL; comicGrade<-NULL
comic <- NULL
comics <- NULL
for(i in 1: 20) {
  url <- paste0(webtoon, i)
  html <- read_html(url) #실행할때마다 바뀜
  #만화 제목
  node_name <- html_nodes(html, "#content div.challengeInfo > h6.challengeTitle > a")
  comicName <- html_text(node_name, trim=TRUE)
  
  #만화 요약
  node_summary <- html_nodes(html, "#content div.challengeInfo > div.summary")
  comicSummary <- html_text(node_summary, trim=TRUE)
  
  #만화 평점
  node_grade <- html_nodes(html, "#content div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(node_grade)
  
  #exam5.R 예제6 코드 참고함
  comic <- data.frame(comicName, comicSummary, comicGrade)
  comics <- rbind(comics, comic)
  
}
View(comics)
write.csv(comics, "output/navercomic.csv") 
