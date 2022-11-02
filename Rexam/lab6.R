#11/02 실습1

#문제 1
countEvenOdd <- function(numV) {
  evenNum <- 0 #짝수
  oddNum <- 0 #홀수
  if(is.vector(numV) && !is.list(numV) && is.numeric(numV)){
    for(i in numV){ #ifelse(i%%2==0, even<-even+1, odd<-odd+1)
      if(i%%2)
        oddNum <- oddNum+1
      else
        evenNum <- evenNum+1
    }
    return(list(evenNum=evenNum, oddNum=oddNum))
  }
  else
    return()
}
countEvenOdd(c(1,3,4,6,8))
countEvenOdd(1:10)
countEvenOdd(LETTERS)
countEvenOdd(list(1,2,3,4,5))
countEvenOdd(matrix(1:9, nrow=3))

#문제 2
vmSum <- function(v){
  if(is.vector(v) && !is.list(v)){
    if(all(is.numeric(v))){ #is.numveric()의 매개변수가 데이터셋인 경우 all()이나 any() 필요.
      sum <- 0
      for(i in v){
        sum <- sum+i
      }
      return(sum) #위에 코드 필요없고 sum(v)만 해도 됨.
    }
    else{
      cat("숫자 벡터를 전달하숑!\n")
      return(0)
    }
  }
  else{
    cat("벡터만 전달하숑!\n")
  }
}
vmSum(c(1,2,3,4,5))
vmSum(c("1","2"))
vmSum(5)
vmSum(list())

#문제 3
vmSum2 <- function(v){
  if(is.vector(v) && !is.list(v)){
    if(all(is.numeric(v))){ #is.numveric()의 매개변수가 데이터셋인 경우 all()이나 any() 필요.
      sum <- 0
      for(i in v){
        sum <- sum+i
      }
      return(sum)
    }
    else{
      warning("숫자 벡터를 전달하숑!") #stop()과 달리 warning()은 경고메시지를 내보낼 뿐 함수를 종료하지 않는다.
      return(0)
    }
  }
  else{
    stop("벡터만 전달하숑!")
  }
}

vmSum2(c(1,2,3,4,5))
vmSum2(c("1","2"))
vmSum2(5)
vmSum2(list())

#문제4
mySum <- function(v){
  oddSum <- 0 #홀수
  evenSum <- 0 #짝수
  if(is.null(v)){
    #print("NULL값 리턴")
    return()
  }
  if(is.vector(v) && !is.list(v)){ #벡터이면서 리스트가 아닐때
    if(any(is.na(v))){ #데이터셋의 엘리먼트 중에 NA가 있는지 확인하려면 any()를 써야 한다.
      warning("NA를 최저값으로 변경하여 처리함!!");
      v[is.na(v)] = min(v, na.rm=T) #na.rm=T를 해주지 않으면 NA를 최솟값으로 인식한다. 
    } #https://statools.tistory.com/134 참고함
    for(i in 1:length(v)){
      if(i%%2){ #홀수
        oddSum <- oddSum + v[i]
      }
      else{
        evenSum <- evenSum + v[i]
      }
    }
    #oddS = sum(v[seq(1,length(v),1)]) #위에 for문 대신 사용 #1,3,5,7
    #evenSum = sum(v[seq(2, length(v),2)]) #위에 for문 대신 사용#2,4,6,8
    return(list(oddS = oddSum, evenS = evenSum))
  }else{
    stop("벡터만 처리 가능!")
    return()
  }
  
}
mySum(c())
mySum(8)
mySum(c(2,5,8, 10))
mySum(c(1,NA,8))
mySum(list(1,3,5))

#문제 5
myExpr <- function(f){
  if(is.function(f)){
    stop("수행 안 할꺼임!!")
  }else{
    sample(1:45, 6)
  }
}

#답안 코드
myExpr <- function(p){
  if(!is.function(p))
    stop("수행 안할꺼임!!")
  else{
    imsi <<-sample(1:45, 6) #꺽새괄호가 2개이면 전역변수라는 뜻.
    return(p(imsi))
  }
}

myExpr(cat) 
imsi
myExpr(max)
imsi
myExpr(sum)
imsi
myExpr(mySum)
imsi

#문제 6
#답안 코드
createVector1 <- function(...){
  v<-c(...)
  if(is.null(v))
    return(NULL)
  else if(any(is.na(v)))
    return(NA)
  else
    return(v)
}
createVector1(1,2,3,4,5)
createVector1(1,2,3,4,NA)
createVector1(1,2,3,T)
createVector1(1,2,F,3,4,5,"A")
createVector1()

#문제 7
#답안코드1
createVector2<-function(...){
  num<-c()
  cha<-c()
  logi<-c()
  datas<-list(...)
  if(length(datas)==0)
    return()
  else{
    for(data in datas){
      if(is.numeric(data))
        num<-c(num,data)
      else if(is.character(data))
        cha<-c(cha,data)
      else if(is.logical(data))
        logi<-c(logi,data)
    }
    return(list(numeric=num,character=cha,logical=logi))
  }
}
createVector2(1,2,3,4,'가','나',TRUE,FALSE,'다',5)
createVector2()

#답안코드2
createVector2<-function(...){
  num<-c()
  cha<-c()
  logi<-c()
  datas<-list(...)
  if(length(datas)==0) #is.null()을 하면 안된다고 함.
    return()
  else{
    for(data in datas){
      if(is.numeric(data))
        num<-append(num,data)
      else if(is.character(data))
        cha<-append(cha,data)
      else if(is.logical(data))
        logi<-append(logi,data)
    }
    return(list(numeric=num,character=cha,logical=logi))
  }
}

#답안코드3
createVector2 <- function(...){
  p <- list(...)
  if(is.null(unlist(p))){ #length(p) == 0으로 하던가 이렇게 unlist 해줘야 null을 체크할 수 있음.
    return(NULL)
  }else{
    result <- list(character=c(), numeric=c(), logical=c())
    
    for(i in 1:length(p)){
      item <- unlist(p[i])
      switch(EXPR=class(item),
             "character"=result$character <- c(result$character, item),
             "numeric" = result$numeric <- )
    }
    return(result)
  }
}

#문제 8
#test1.R 파일로 따로 생성 해야함.

#문제 9
#test2.R 파일로 따로 생성 해야함.

