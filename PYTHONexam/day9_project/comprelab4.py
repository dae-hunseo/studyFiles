import random

list = [random.randint(0,100) for i in range(10)]

dic = {i+1:"pass"if list[i]>=60 else "nopass" for i in range(10)}
dic1 = {n:"pass"if e>=60 else "nopass" for n, e in enumerate(list, 1)} #파이썬강의교안_7.pdf 1pg 내용 적용
print(dic)
print(dic1)

#CASE 2
# num_list = list(random.sample(range(0,101),10)) #randin,sample 함수에 대해 찾아보기. 종북되지 않는 데이터를 뽑아냄.
# print(num_list)
#
# num_dict = {num_list.index(n)+1:"pass" if n<=60 else "nopass" for n in num_list} #index 안에는 n이 몇번째인지 알아냄.(졸음)
# print(num_dict)