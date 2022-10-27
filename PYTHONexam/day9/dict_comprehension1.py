students = dict(둘리=90, 또치=85, 도우너=95, 희동이=75, 마이콜=80)
print(students)

pass_students = { k : v for k, v in students.items()}
print(pass_students)

pass_students = { k : v for k, v in students.items() if v > 80}
print(pass_students)

pass_students = { k : v for k, v in students.items() if len(k) > 2} #둘리, 또치는 if문의 조건을 만족시키지 못 함. 도우너, 희동이, 마이콜만 통과
print(pass_students)

pass_students = { k : v for k, v in students.items() if len(k) > 2 and v > 80} #key의 글자수가 2글자 초과면서 value값이 80초과인 경우. 즉 도우너만 통과
print(pass_students)

swap_students = { v : k for k, v in students.items() } #4번째 라인과 같아 보이지만 v:k으로 되어있음. 기존의 value를 가지고 key로 하고 기존의 key를 가지고 value로 함.
print(swap_students)

