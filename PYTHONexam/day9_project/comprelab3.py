def mycompredict(**kwargs):
    dic = {}
    if len(kwargs) == 0:
        return dic
    else:
        dic = {'my'+k:v for k, v in kwargs.items()}
        return dic #혹은 6, 7번째 라인을 합쳐서 return {'my'+k:v for k, v in kwargs.items()} 가능

print(mycompredict(name='서대훈', address='대구'))
print(mycompredict(apple=6, student = 'Seo', data = ['06/14', '08/30'])) #value로 숫자, 문자열, 리스트를 줌
print(mycompredict()) #빈 딕셔너리 리턴