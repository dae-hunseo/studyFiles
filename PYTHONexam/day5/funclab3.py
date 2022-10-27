def expr(operand1, operator, operand2):
    result = None
    if operator == '+':
        result = operand1+operand2
    elif operator == '-':
        result = operand1 - operand2
    elif operator == '*':
        result = operand1 * operand2
    elif operator == '/':
        result = operand1 / operand2
    return result;

# 구분자 여러개일때 split 함수 사용 방법:
# https://codingdog.tistory.com/entry/%ED%8C%8C%EC%9D%B4%EC%8D%AC-split-%EA%B5%AC%EB%B6%84%EC%9E%90-%EC%97%AC%EB%9F%AC%EA%B0%9C-%EC%9E%88%EC%9D%84-%EB%95%8C-%EC%9E%98-%EB%B6%84%EB%A6%AC%ED%95%B4-%EB%B4%85%EC%8B%9C%EB%8B%A4
str = input("수식을 입력하시오(띄어쓰기 필수):")
str_list = str.split()
return_value = expr(int(str_list[0]),str_list[1],int(str_list[2]))
if  return_value == None: #if not return_value and return_value != 0 #0도 not 연산자를 하면 True가 되므로
    print("수행 불가")
else:
    print("연산결과:", return_value)

# num1 = int(input("첫번째 피연산자:"))
# op = input("연산자:")
# num2 = int(input("두번째 피연산자:"))
#expr(num1, op, num2)