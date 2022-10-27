f = open("study.txt", 'at', encoding='UTF8')    #fileiotest4.py에서 참고
list = ['Python', 'HTML', 'CSS', 'JavaScript', 'R']
for i in list:
    f.write(i+'\n')
print('저장이 완료되었습니다.')

f.close()

