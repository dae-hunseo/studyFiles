def myemail_info(email):
    if '@' not in email:
        return None
    else:
        tup = tuple(email.split('@')) #split()은 리스트를 리턴해서 tuple로 치환해줘야 함.
        return tup


print(myemail_info('0420sdh@naver.com'))

#CASE 2
def myemail_info(p):
    if '@' not in p:
        return None
    else:
        p_index = p.index('@') #index()는 @가 전달된 문자열의 어느 위치에 있는지 인덱스 정보 리턴
        tup = (p[0:p_index], p[p_index+1:len(p)]) #end값은 생략가능하다. 즉 p[p_index:]로 하면 끝까지.
        return tup
        #혹은 그냥 16, 17번째 라인을 합쳐서 return p[0:p_index], p[p_index+1:len(p)]해도 됨.