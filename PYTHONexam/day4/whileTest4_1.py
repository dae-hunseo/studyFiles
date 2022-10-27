import random    # random 모듈을 가져옴
dice_num = random.randint(1, 6)
print("추출된 주사위 값 :", dice_num)
while dice_num > 4 :
    print("ㅋㅋ")
    dice_num = random.randint(1, 6) #while문 밖에도 같은 코드가 있는데 만약 반복문 밖과 안에 같은 코드가 있는데
    # 그게 길다면 함수호출방식을 통해 할 수도 있음
    print("추출된 주사위 값 :", dice_num)
print("종료!!")