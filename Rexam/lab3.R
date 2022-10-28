#문제 1
str(iris)

#문제 2
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
df1 <- data.frame(x, y)
df1

#문제 3
col1 <- c(1, 2, 3, 4, 5)
col2 <- c('a', 'b', 'c', 'd', 'e')
col3 <- c(6, 7, 8, 9, 10)
df2 <- data.frame(col1, col2, col3)
df2

#문제 4
col4 = c(1800, 1500, 3000)
col5 = c(24, 38, 13)
col6 = c('사과', '딸기', '수박')
df3 <- data.frame(제품명=col6, 가격=col4, 판매량=col5)#'제품명'이 아니라 제품명으로 해도 되는데 찾아봐야 할듯
df3

#문제 5
mean(df3$가격)
mean(df3$판매량)

#문제 6
name <- c("Potter","Elsa","Gates","Wendy","Ben")
gender <- factor(c("M","F","M","F","M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
df4$stat <- c(76,73,95,85,35)
df4$score <- math + df4$stat
df4
grade <-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B", 
                           ifelse(df4$score >=70,"C","D"))) #ifelse문을 중첩해서 사용했음. 
grade

#문제 7

