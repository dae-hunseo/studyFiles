#10/31 mybox에 답 있음
#문제 1
l1 <- list(
  name="scott",
  sal=3000
)
l1
result1 <- l1$sal*2 #다른 방식도 있었음.
result1

#문제 2
l2 <- list("scott",c(100,200,300))
l2

#문제 3
l3 <- list(c(3,5,7), c("A","B","C"))
l3[[2]][1] <- "Alpha"
l3

#문제 4
l4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
l4[[1]] + 10 #문제 틀렸었음. 확인해볼것
l4$alpha +10 #위 코드와 같은 코드인듯 #l4[["alpha"]] +10도 같은 듯 함.
l4[["alpha"]] +10
l4

#문제 5
emp <- read.csv("data/emp.csv") 
l5 <- list(data1=LETTERS, data2=emp[1:3,],data3=l4)
l5
l5$data1[1]
l5$data2$ename
l5$data3$gamma

#답안 코드
#head(myemp,3) #head는 데이터량이 많을때 위에 6행만 보여준다. 값을 지정해서 줄이거나 늘일 수 있다.
#l5<-list(
#  data1 = LETTERS,
#  data2 = myemp[1:3,],
#  data3 = l4
#)
#l5
#l5[["data1"]][1]
#l5$data1[1] #위 코드와 같은 코드

#l5[["data2"]]$ename
#l5$data2$ename #위 코드와 같은 코드

#l5[["data3"]]$gamma
#l5%data3%gamma #위 코드와 같은 코드


#문제 6
l6 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
#밑에 코드들 필요없고 그냥 
#mean(unlist(l6)) #하면 됨
new_math <- unlist(l6[1])
new_writing <- unlist(l6[2])
new_reading <- unlist(l6[3])
new_math
new_writing
new_reading
math_avg <- mean(new_math)
writing_avg <- mean(new_writing)
reading_avg <- mean(new_reading)
math_avg
writing_avg
reading_avg
whole <- c(math_avg, writing_avg, reading_avg)
whole_avg <- mean(whole)
whole_avg
#그냥 mean(unlist(l6)) 하면 됨


#문제 7
grade <- sample(1:6, 1)
#답안 코드
if(grade<=3){
  cat(grade,"학년은 저학년입니다.\n")
}else{
  cat(grade," 학년은 고학년입니다.\n")
}
cat(grade, ifelse(grade<=3, "학년은 저학년입니다.","학년은 고학년입니다."), "\n")#위 두 줄을 하나로 줄인 코드

#내가 제출한 코드
grade <- as.character(grade)
cat(grade,switch(EXPR = grade,"1"=,"2"=,"3"="학년은 저학년입니다.","4"=,"5"=,"6"="학년은 고학년입니다."))


#문제 8
choice <- sample(1:5,1)
cat("결과값:", switch(EXPR = choice,300-50,300+50,300*50,300%/%50,300%%50)) #print는 데이터셋을 출력하는 역할이라 여기서는 cat이 더 적합함.

#문제 9
count <- sample(3:10,1)
deco <- sample(1:3,1)
count
deco
for(n in 1:count){
  #switch(EXPR = deco,"*","$","#")
  cat(switch(EXPR = deco,"*","$","#"))
}
#deco<-switch(EXPR=deco, "*","$","#") 
#cat(rep(deco, count), "\n", sep="") #for문대신 이 두 줄로 할 수도 있음음
print("\n")

#문제 10
score <- sample(0:100,1)
if(score>=90){
  level <- "A등급"
}else if(score>=80){
  level <- "B등급" 
}else if(score>=70){
  level <- "C등급"
}else if(score>=60){
  level <- "D등급"
}else{
  level <- "F등급"
}
#위의 if-elseif-else문 대신 아래 코드를 써도 됨
level <- switch(EXPR=as.character(score%/%10),
                "10"=,"9"="A 등급",
                "8"="B 등급",
                "7"="C 등급",
                "6"="D 등급",
                "F 등급")

cat(score,"점은 ",level,"입니다.", sep="")

#문제 11
length(LETTERS)
for(i in 1:length(LETTERS)){
  cat("\"",LETTERS[i],letters[i], "\"",sep="")
}
#답안 코드
alpha<-paste(LETTERS, letters, sep="")
alpha

