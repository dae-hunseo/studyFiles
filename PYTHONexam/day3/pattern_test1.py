# 코드 3-39 : 4, 3, 2, 1, 0을 순서대로 출력하는 프로그램
## "으뜸 파이썬", p. 167

n = 5
for i in range(n):  # i는 0,1,2,3,4 까지 증가
    print(n - (i + 1), end = ' ')   # n이 5이므로 n-(i+1)은 4,3,2,1,0이 됨
