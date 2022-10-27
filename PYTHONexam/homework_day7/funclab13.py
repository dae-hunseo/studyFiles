def mydict(**p):
    dic = {}
    if len(p) == 0:
        return dic
    else:
        for s, t in p.items():
            dic['my'+s] = t
            #print(s, ":", t)
        return dic

new_dic = mydict(name='서대훈', address='대구')
print("변경된 딕셔너리:")
for key, value in new_dic.items():
    print(key,":",value)