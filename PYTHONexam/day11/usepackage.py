import sys
sys.path.append("C:/PyStudy") #9월 20일에 PyStudy 폴더를 C드라이브에 갖다놓았음.
print(sys.path)

import mypack.calc.add #에러가 나지는 않음. mypack이 현재 디렉터리에도 없고 상위 디렉터리에도 없어서 빨간줄이 출력되긴 하는데 sys.path.append("C:/PyStudy")를 미리 등록해놓았다면 빨간줄이 뜨지 않았을 것임. 프로그램 실행하면서 sys.path.append("C:/PyStudy")가 실행되어 에러가 나지는 않음.
mypack.calc.add.outadd(1,2)

import mypack.report.table #C:\PyStudy\mypack\report\table.py
mypack.report.table.outreport()


import mypack.calc.add as my1
my1.outadd(1,2)

import mypack.report.table as my2
my2.outreport()

from mypack.calc import add #mypack.calc라는 패키지에 있는 add 모듈(add.py)을 import하겠다.
add.outadd(1,2)

from mypack.calc import add as unico    #add라는 모듈만 import할건데 add를 unico로 이름을 바꿔서 import해서 쓰겠다.
unico.outadd(1,2)
'''
from mypack.calc import *
add.outadd(1,2)
multi.outmulti(10,20)
'''
