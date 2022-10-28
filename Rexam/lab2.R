#문제 1
v <- seq(10, 38, 2)
m1 <- matrix(v, nrow=3, ncol=5, byrow=T)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)
m1; m2; m_max_v; m_min_v; row_max; col_max #값 출력

#문제 2
n1 <- 1:3
n2 <- 4:6
n3 <- 7:9
m2 <- cbind(n1,n2,n3)
colnames(n2) = NULL #놓친 부분임. 문제 사진에 따르면 행의 이름이 벡터가 되어있는걸 해제시켜줘야 했음.
m2

#문제 3
v <- 1:9
m3 <- matrix(v, nrow=3, byrow=T) #nrow가 아닌 ncol을 줘도 되고 둘 다 줘도 됨.
m3

#문제 4
m4 <- matrix(m3, nrow=3, byrow=T)
colnames(m4) <- c('col1', 'col2', 'col3')
rownames(m4) <- c('row1', 'row2', 'row3')
m4

#문제 5
alpha <- matrix(letters[1:6], nrow=2)
alpha2 <- rbind(alpha,c('x','y','z'))
alpha3 <- cbind(alpha,c('s','p'))
alpha; alpha2; alpha3

#문제 6
a <- array(1:24, dim=c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a+100
a[,,4]*100
a[1,2:3,]
a[2,,2]<-a[2,,2]+100
a
a[,,1]<-a[,,1]-2
a
a<-a*10
a
rm(a)
a
