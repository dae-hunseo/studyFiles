import sys
sys.path.append("C:/PyStudy") #아래에서 빨간줄이 뜨긴하는데 이 코드 때문에 실행하면서 에러가 나지는 않는다.

from mypack.calc import *   #mypack\calc 폴더에 있는 모든 모듈(파이썬 파일)을 import 하겠다. #*로 다 import하는 게 다 되는건 아니다. 그 패키지에 __init__.py에서 누구를 import할건지 정의하고 있어야 한다.(파일 열어보면 알음) 만약 __init__.py가 없거나 파일안에 그 내용이 없으면 에러가 난다.
add.outadd(1,2)
multi.outmulti(1,2)

# 가능하지만 권장되지는 않는 방법
from mypack.report.table import *
outreport()
a()
b()
c()
