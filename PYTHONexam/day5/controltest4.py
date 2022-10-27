while True:
	num1 = int(input("첫 번째 숫자 : "))
	num2 = int(input("두 번째 숫자 : "))
	oper = input("연산자(+,-,*) : ")

	if (oper != "+" and oper != "-" and oper != "*"):
		print("연산자로 +, -, * 만 입력 가능해요... 처음부터 다시 시작합니다~~~~")
		continue

	if oper == "+" :
		result = num1 + num2
	elif oper == "-" :
		result = num1 - num2
	elif oper == "*" :
		result = num1 * num2

	print(num1, oper, num2, "=", result)
	aws = input("계속 처리하겠습니까?(y/n)")
	if aws == 'n':
		break