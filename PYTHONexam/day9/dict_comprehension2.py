score_tuples = [('math', 90), ('history', 80), ('english', 95), ('computer engineering', 100), ('science', 60)] #파이썬 강의교안_6.76pg 코드
score_dict = dict(score_tuples) #튜플을 가지고 딕셔너리 생성.
print(score_dict)

score_dict = {t[0]: t[1] for t in score_tuples} #0번째가 key, 1번째가 value. 딕셔너리는 순서가 없음.
print(score_dict)

score_dict = {k : v for k, v in score_tuples}
print(score_dict)

score_dict = {k : v for k, v in score_tuples if len(k) > 5}
print(score_dict)

score_dict = {k : v for k, v in score_tuples if v >= 90}
print(score_dict)

score_dict = {k : v for k, v in score_tuples if v < 70}
print(score_dict)

score_dict = {v : k for k, v in score_tuples}
print(score_dict)