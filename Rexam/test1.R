#문제 8
#답안 코드
io <- scan("data/iotest1.txt")
cat("오름차순:", sort(io),"\n")
cat("내림차순:",sort(io, decreasing=T), "\n")
cat("합:", sum(io),"\n")
## 뒤에 놓침.

#문제 9
#답안 코드(test2.R로 따로 생성해야함.)
io <-scan("data/iotest2.txt",what="")
m <- names(which.max(table(io)))
cat("가장 많이 등장한 단어는",m,"입니다.\n")

#답안코드2
data<-scan("data/iotest2.txt",what="")
data

#답안코드3
most<-names(sort(table(data),decreasing=T)[1])

cat("가장 많이 등장한 단어는",most,"입니다.")