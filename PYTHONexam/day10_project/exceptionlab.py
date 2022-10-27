while True:
    try:
        num = int(input('숫자를 입력하시오:'))
    except ValueError:
        print('숫자만 입력해주세요~~~')
        continue #무한 루프라 필요없음.
    else:
        break

s = 0
for i in range(1, num+1):
    s += i

print(f"1부터 {num}까지의 합은 {s}입니다") #{s}대신 10~12라인 없애고 sum([i for i in range(num+1)])을 넣어도 됨.