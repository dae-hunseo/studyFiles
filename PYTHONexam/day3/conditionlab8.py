import random

oper_num = random.randint(1,10)%5
if oper_num == 1:
    result = 300 + 50
elif oper_num == 2:
    result = 300 - 50
elif oper_num == 3:
    result = 300 * 50
elif oper_num == 4:
    result = 300 / 50
else: #oper_num == 0:
    result = 300 % 50
#print("oper_num: ",oper_num)
print("결과값:",result)