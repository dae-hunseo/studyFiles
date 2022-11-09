#문제 9 – 함수 문제 아님
#iotest2.txt 파일에 저장된 데이터들을 읽고 다음과 같은 형식으로 결과를 출력하는 R 코드를 구현하고 test2.R 로 저장하여 제출한다.
  #“가장 많이 등장한 단어는 XX 입니다.”

#scan()으로 txt 파일 읽기는 R구문보충.pdf 6pg와 exam3.R https://cceeddcc.tistory.com/105 #https://rbasall.tistory.com/139은 리스트로 저장하는 법 #그 외 https://rbasall.tistory.com/138 https://mingxoxo-record.tistory.com/80 https://linked2ev.github.io/database/2020/05/18/R-R-%EC%99%B8%EB%B6%80-%ED%8C%8C%EC%9D%BC-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0(read.table,-readLines,-scan)/

#CASE1
io <-scan("data/iotest2.txt",what="")
m <- names(which.max(table(io))) #exam1.R에서나온 which.max()는 가장 큰 값을 갖고있는 인덱스를 출력하는 함수다. #exam2.R에서 나온 table()은 중복된 값이 몇 개 인지 종류별로 정리해서 보여준다.
cat("가장 많이 등장한 단어는",m,"입니다.\n")

#CASE2
data<-scan("data/iotest2.txt",what="")
data
most<-names(sort(table(data),decreasing=T)[1])
cat("가장 많이 등장한 단어는",most,"입니다.")