# 코드 10-15 : 맵과 람다 함수를 이용한 리스트의 제곱 구하기
## "으뜸 파이썬", p. 592

a = [1, 2, 3, 4, 5, 6, 7]  # 연속된 값을 가지는 리스트
a = list(map(lambda x: x**2, a))  # 리스트의 각 요소에 대하여 람다 함수 적용
print(a)
