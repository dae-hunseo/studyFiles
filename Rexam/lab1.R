# 문제 1
v1 <-c(1:10) #v1 <- 1:10 으로 해도 같다.
v2 <- v1*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1  #print(v1)로 해도 같음
v2
v3
max_v
min_v
avg_v
sum_v

# 문제2
v4 <- seq(1,9, 2) 
v5 <- rep(1, 5)
v6 <- rep(1:3, 3) #v6 <- rep(1:3, times=3) 으로 해도 같다.
v7 <- rep(1:4, each=2)
v4
v5
v6
v7

# 문제3
nums <- sample(1:100, 10)
sort(nums)
sort(nums, decreasing = TRUE)
nums[nums > 5]
which(nums <= 50)
which.max(nums)
which.min(nums)

# 문제 4
v8 <- seq(1,10, 3)
names(v8) <- LETTERS[1:4]

# 문제5
score <- sample(1:20, 5)
myfriend <- c("둘리", "또치", "도우너", "희동", "듀크")
paste(score, myfriend, sep="-")
myfriend[which.max(score)]
myfriend[which.min(score)]
myfriend[which(score>10)]

# 문제6
count <- sample(1:100, 7)
week.korname <- c("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일")
paste(week.korname, count, sep=":")
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count>50)]

# 문제7
v9 <- sample(1:30, 10) #v9 <- sample(1:30, 10, replace=T)
v10 <- v9
names(v10) <- c("z", "y", "x", "w", "v", "u", "t", "s", "r", "q") #names10 <- letters[26:17]와 같음
v9; v10
# v9에 이름을 붙여주고 v10에 v9를 대입한 다음, names(v9)<-NULL로 해도 됨.