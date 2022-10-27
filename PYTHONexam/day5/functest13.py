def find_type(p) :
    if type(p) == int :
        result = "정수를 전달했네요"
    elif type(p) == float :
        result = "실수를 전달했네요"
    elif type(p) == str :
        result = "문자열을 전달했네요"
    elif type(p) == bool :
        result = "논리값을 전달했네요"
    else :
        result = "몰라용^^"
    return result #밑에 print문에서 출력되는 것은 모두 이 result 변수 값임.

print(find_type(100))
print(find_type(3.14))
print(find_type("100"))
print(find_type("aaa"))
print(find_type(True))
print(find_type([])) #리스트