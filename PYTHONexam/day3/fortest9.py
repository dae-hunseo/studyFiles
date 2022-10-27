munja = 65  # A 의 코드값(10진수)
for y in range(1, 10) :
    for x in range(y) :
        print(chr(munja), end = '')
        munja += 1
    print()
print("-"*10)
munja = 0x41  # A 의 코드값(16진수)
for y in range(1, 10) :
    for x in range(y) :
        print(chr(munja), end = '')
        munja += 1
    print()
print("-"*10)
munja = 0b01000001 # A 의 코드값(2진수)
for y in range(1, 10) :
    for x in range(y) :
        print(chr(munja), end = '')
        munja += 1
    print()

