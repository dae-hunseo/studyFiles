for x in range(1, 51):
    if x % 10 == 0:
        print('+', end= '')
    else:
        print('-', end = '')
print()
print()

for x in range(1, 6):
    print('-' * 9, end = '')
    print('+', end = '')
print('\n')  # / (슬래쉬), \ (백슬래쉬), 이스케이프문자(기능문자) - \n (개행), \t (탭)

for x in range(1, 51):
    if x % 5 == 0:
        print('+', end= '')
    else:
        print('-', end = '')
print('\n\n')

for x in range(1, 51):
    if x % 10 == 5:
        print('+', end= '')
    else:
        print('-', end = '')

