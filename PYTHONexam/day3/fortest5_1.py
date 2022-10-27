# 버전 2
startNum = int(input("시작 숫자 : "))
endNum = int(input("종료 숫자 : "))
incNum = int(input("증가치 숫자 : "))

if incNum == 0 :
    print("증가치는 0을 입력할 수 없으므로 기본값인 1로 처리함...")
    incNum = 1
# 시작값부터 종료값까지 감소치로 감소하는 경우 종료값을 포함하여 처리하기 위해 2를
# 종료값을 2 감소시킴
if startNum > endNum and incNum < 0 :
    endNum -= 2
for num in range(startNum, endNum+1, incNum) :
    print(num, end=" ")


