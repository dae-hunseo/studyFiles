def myprint(*p1, **p2):
    if len(p1) == 0 and len(p2) == 0:
        print("Hello Python")
    elif p2.get('sep') != None and p2.get('deco')!=None:
        print(p2.get('deco'), end='')
        print(*p1, sep=p2.get('sep'), end='')
        print(p2.get('deco'))
    elif p2.get('sep') == None and p2.get('deco') != None :
        print(p2.get('deco'), end='')
        print(*p1, sep=',', end='')
        print(p2.get('deco'))
    elif p2.get('sep') != None and p2.get('deco') == None:
        print("**", end='')
        print(*p1, sep=p2.get('sep'), end='')
        print("**")
    elif p2.get('sep') == None and p2.get('deco') == None:
        print("**", end='')
        print(*p1, sep=',', end='')
        print("**")
    #혹은
    #deco = p2.get('deco', '**') #deco로 전달된 게 없으면 '**'이 전달될거다.
    #sep = p2.get('sep', ',')   #sep로 전달된 게 없으면 ','이 전달될거다.
    #if len(p1) == 0:
        #print("Hello Python")
    #else:
        #print(deco, end="")
        #print(*p1, sep=sep, end="") #p1을 언패킹
        #print(deco)


myprint(10, 20, 30, deco="@", sep="-")  # @10-20-30@ 출력
myprint("python", "javascript", "R", deco="$")  # $python,javascript,R$ 출력
myprint("가가", "나나", "다다")  # **가가,나나,다다** 출력
myprint(100)  # **100** 출력
myprint(True, 111, False, "abc", deco="&", sep="")  # &True111Falseabc& 출력
myprint()