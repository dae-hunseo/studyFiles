s1 = "abcdefgh1abcaa234가나다"
print(s1)
print("---in과 not in 연산자---")
print('a' in s1)
print('a' not in s1) #not in은 없어야 True
print('가나' in s1)
print('가다' not in s1)
print("---시퀀스연산---")
s2 = "파이썬"
print(s1+s2)
print(s1)
print(s2)
print(s2 * 3)
print("---인덱싱과 슬라이싱---")
print(s2[0]); print(s2[1]); print(s2[2]); print(s2[-1]) #-1은 자바나 C는 에러가 난다. 파이썬에서는 어떤 시퀀스의 제일 마지막것을 꺼내줌.
print(s1[:])  # print(s1) #슬라이싱. 슬라이싱을 할 때는 변수명[startindex:endindex:stack]
print(s1[::1])#1씩 증가시키면서 모두 꺼내라
print(s1[::2])#2씩 증가시키면서 모두 꺼내라(1,3,5,7... 인덱스만 꺼냄)
print(s1[::-1])#거꾸로 출력
print(s1[0:4:1])
print("---함수들---")
print(len(s1))
print(max(s1)); print(min(s1))
print(s1.count('a'))
print(s1.count('abc'))
print("---for와 함께 사용하는 시퀀스---")
for data in s2 :
    print("#", data, "#")
print("---문자열은 변경불가---")
#s2[0] = "가"
