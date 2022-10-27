oddeven= { d : '홀수'   if d % 2  else  '짝수' for d in range(1, 16)  } #'홀수' if d%2가 한 묶음, else '짝수'가 한 묶음이다.
print(oddeven)

scores = {'길동': 90, '순희': 60, '영희': 80, '철수': 50}
grades = { name: 'PASS' if value > 70 else 'No-PASS' for name, value in scores.items()} #score 딕셔너리를 활용해 새 딕셔너리 생성
print(grades)

member = { 'name'+str(i) : i*10 if i > 5 else  i + 100 for i in range(1,11) } #기존의 딕셔너리를 이용해 새 딕셔너리를 만드는 것이 아닌 아예 아무것도 없는 상태에서 이 구문만을 이용해 만듬
print(member)

fruits = ['apple', 'mango', 'banana','cherry']
dic_fruits = {f:len(f) for f in fruits}

print(dic_fruits)

print( {v : k for k, v in member.items()})

print( {v : k for k, v in dic_fruits.items()}) #14번째 라인 출력문과 비교. 14번째 라인의 value값이 겹치는데 key값은 겹칠 수 없으므로 18번째 라인에서 key와 value를 바꾸면서 apple과 banana가 사라진다.
