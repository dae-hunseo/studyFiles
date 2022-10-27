import random

count = 0
while True:
    ran_num = random.randint(0, 30)
    #print("ran_num = ",ran_num)
    if ran_num >= 27 or ran_num == 0 :
        break
    else:
        #print("{}({})".format(chr(ran_num+64), ran_num))
        print(chr(ran_num+64),"(",ran_num,")",sep='') #1부터 'A', 26이 'Z'
        count += 1
print("수행횟수는",count,"번입니다")