import random    # random 모듈을 가져옴
dice_num = random.randint(1, 6)
print("추출된 주사위 값 :", dice_num)
while dice_num > 4 : #만약 4초과(5, 6)가 나오면 무한루프가 발생함.
    print("ㅋㅋ")
print("종료!!")