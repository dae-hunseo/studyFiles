while True:
    month = int(input("1~12 사이의 값을 입력하세요:"))
    if month == 12 or month == 1 or month == 2: #if month in [12, 1, 2]
        print(month,"월은 겨울",sep='')
    elif month == 3 or month == 4 or month == 5: #if month in [3, 4, 5]
        print(month, "월은 봄", sep='')
    elif month == 6 or month == 7 or month == 8: #if month in [6, 7, 8]
        print(month, "월은 여름", sep='')
    elif month == 9 or month == 10 or month == 11: #if month in [9, 10, 11]
        print(month, "월은 가을", sep='')
    else:
        print("1~12사이의 값을 입력하세요!")
        break