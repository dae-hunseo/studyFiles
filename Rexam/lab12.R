#11/11 실습1
#exam10.R(dplyr 패키지) 관련

#다음 문제들을 최대한 dplyr 패키지의 함수들과 %>% 기호(체인 함수)를 사용해서 해결하시오.
#data/emp.csv 의 내용을 읽어서 emp 변수를 생성한다.
emp <- read.csv("data/emp.csv")

#[문제1] 직무가 MANAGER 인 직원들의 정보를 출력한다.
emp %>% filter(job == "MANAGER")

#[문제2] emp 에서 사번, 이름, 월급을 출력한다.
emp %>% select(사번 = empno, 이름 = ename, 월급 = sal) #해봤는데 됨

#[문제3] emp 에서 사번만 빼고 출력한다.
emp %>% select(-empno)

#[문제4] emp 에서 ename 과 sal컬럼만 출력한다.
emp %>% select(ename, sal)

#[문제5] 직무별 직원수를 출력한다.
emp %>% count(job) #emp %>% group_by(job) %>% tally() #emp %>% group_by(job) %>% sumarize(n=n())

#[문제6] 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.
emp %>% filter(sal >=1000 & sal <= 3000) %>% select(ename, sal, deptno)

#[문제7] emp 에서 직무가 ANALYST 가 아닌 사원들의 이름, 직무, 월급을 출력한다.
emp %>% filter(job != "ANALYST") %>% select(ename, job, sal)

#[문제8] emp 에서 직무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직무를 출력한다.
emp %>% filter(job == "ANALYST" | job == "SALESMAN") %>% select(ename, job) #filter(job == "ANALYST" | job == "SALESMAN")대신 filter(jon %in% c("SALESMAN", "ANALYST")) 도 가능하다.

#[문제9] 부서별 직원들 월급의 합을 출력한다.
emp %>% group_by(부서번호 = deptno) %>% summarise(월급총합 = sum(sal))

#[문제10] 월급이 적은 순으로 모든 직원 정보를 출력한다.
emp %>% arrange(sal)

#[문제11] 월급이 제일 많은 직원의 정보를 출력한다.
emp %>% arrange(desc(sal)) %>% head(1)

#[문제12] 직원들의 월급을 보관하고 있는 컬럼의 컬럼명을 sal에서 salary 로 변경하고 
  #커미션 정보 저장한 컬럼의 컬럼명를 comm 에서 commrate 로 변경한 후 empnew 라는 새로운 데이터셋을 생성한다.
empnew <- emp %>% rename(salary = sal, commrate = comm)

#[문제13] 가장 많은 인원이 일하고 있는 부서 번호를 출력한다.
emp %>% count(deptno) %>% arrange(desc(n)) %>% head(1) %>% select(deptno)

#[문제14] 각 직원들 이름의 문자 길이를 저장하는 enamelength 라는 컬럼을 추가한 다음에 이름 길이가 짧은 순으로 직원의 이름을 출력한다.
emp %>% mutate(enamelength = nchar(ename)) %>% arrange(enamelength) %>% select(ename) #nchar은 exam8.R

#[문제15] 커미션이 정해진 직원들의 명수를 출력한다.
emp %>% filter(comm != "NA") %>% count(comm) %>%  summarise(sum(n))
#emp %>% filter(!is.na(comm)) %>% summarise(comm = n())
#emp %>% filter(!is.na(comm)) %>% tally()
