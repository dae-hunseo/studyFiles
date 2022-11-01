#11/01

#문제 1
exam1 <- function ()
  return(paste(LETTERS, letters, sep="")) #여기서 sep=""를 해주지 않으면 디폴트값인 sep=" "가 적용되어 LETTERS와 letters 사이에 띄어쓰기가 적용된다.

exam1()

#문제 2
exam2 <- function(num){
  s <- 0
  for(i in 1:num) 
    s <- s+i
  return(s) #return(sum(1:num)) 한 줄이면 됨.
}
exam2(10)
exam2(5)

#문제 3
exam3 <- function(n1, n2){ 
  if(n1>n2)
    return(n1-n2)
  else 
    return(n2-n1)
} #위의 코드 필요없고 abs(num1-num2)하면 됨.
exam3(10, 20)
exam3(20, 5)
exam3(5, 30)
exam3(6, 3)
exam3(3, 3)

#문제 4
exam4 <- function(n1, operand, n2){
  if(operand != '+'&& operand != '-' && operand != '*' && operand != '%/%' && operand !='%%')
    return("규칙의 연산자만 전달하세요")
  else if(operand == '%/%' || operand == '%%'){
    if(n1 == 0)
      return("오류1")
    else if(n2 == 0)
      return("오류2")
    else if(operand == '%/%')
      return(n1%/%n2)
    else
      return(n1%%n2)
  }else if(operand == '+')
    return(n1+n2)
  else if(operand == '-')
    return(n1-n2)
  else if(operand == '*')
    return(n1*n2)
}

#답안 코드
result <- switch(EXPR=operand,
                 "+"=num1+num2,
                 "-"=num1-num2,
                 "*"=num*num2,
                 "%/%"=ifelse(num1==0,"오류1",
                              ifelse(num2==0, "오류2",
                                     num1%/%num2)),
                 "%%"=ifelse(num1==0,"오류1",
                             ifelse(num2==0, "오류2",
                                    num1%%num2)))

exam4(20,"+",6)
exam4(20,"^",6)
exam4(0,"%%",6)
exam4(20,"%/%",0)
exam4(20,"%%",6)

#문제 5
exam5 <- function(num, ch='#'){
  if(num<=0) return()
  for(i in 1:num)
    cat(ch)
  cat("\n")
  return()
}
exam5(4)
exam5(-4)
exam5(7, "&")

#문제 6
exam6 <- function(...){
  data<-c(...)
  for(j in data){
    if(is.na(j)){ #이걸 제일 위에 올려줘야 하는게 NA를 크다작다 비교연산을 하면 안 된다. 값을 읽어서 확인할 때 무조건 is.na()를 제일 먼저 해주는 게 좋아보인다.
      cat("NA는 처리불가 \n") #NA는 객체 안에 데이터가 없는 경우. #NULL은 객체가 없는 경우
      next
    }
    else if(j>=85 && j<=100) grade <- "상"
    else if(j>=70 && j<85) grade <- "중"
    else if(j<70 && j>0) grade <- "하"
    cat(j, "점은", grade, "등급입니다.\n")
  }
  
  #답안 코드
  if(is.na(j)){
    cat("NA는 처리 불가\n")
  }else{
    grade <- ifelse(score>=85, "상",
                    ifelse(score>=70,"중","하"))
    cat(score,"점은",grade,"등급입니다.\n")
  }
}
exam6(c(NA))
exam6(c(80, 50, 70, 66, NA, 35))
exam6(c(100, 85, 84, NA, 70, 69))
t <- NA
if(is.na(t)) print("NA입니다.")
