from django.db import models
# 회원가입, 로그인, 로그아웃 기능을 테스트하기 위한 앱.(10-12)
# 회원가입한 정보는 어디에 있는가?
    # => 회원가입, 로그인 같은 기능을 직접 구현한게 아니고 장고가 제공하는 기능을 이용해 처리하고 있다.
    # HeidiSQL에서 auth_user을 보자.
    # HeidiSQL에서 auth_user에서 username이 빨간색 키로 되어있는데 중요하다는 의미다. username은 중복될 수 없고 동일한 값이 왔을 때 에러가 나게 된다.
    # HeidiSQL에서 first_name도 있고 last_name도 있는데 이건 외국에서 만든거라 그런거고 내 의도대로 쓸 수 있다. fisrt_name에 닉네임을 저장하고 last_name에 이름을 저장한다던지..
    # HeidiSQL의 auth_user를 안 쓰고 내가 직접 구현해도 되는데 그럼 많은 것을 익혀야 된다. 그래서 가급적이면 장고에서 제공하는 auth_user 테이블의 필드들 중에서 적당히 골라서 사용하면 된다.
# Create your models here.
