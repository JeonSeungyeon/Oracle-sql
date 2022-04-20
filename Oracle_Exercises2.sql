-- 1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력 하시오. 
select substr(hiredate,1,5)
from employee;

-- 2. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력 하시오. 
select ename, hiredate from employee
where substr(hiredate,4,2) = 04;

-- 3. MOD 함수를 사용하여 직속상관이 홀수인 사원만 출력하시오. 
select ename, manager from employee
where not MOD(manager,2) = 0;

-- 3-1. MOD 함수를 사용하여 월급이 3의 배수인 사원들만 출력하세요.
select ename, salary from employee
where MOD(salary,3) = 0;

-- 4. 입사한 년도는 2자리 (YY), 월은 (MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력 하시오. 
select ename, to_char(hiredate, 'YY/MM (DY)') from employee;

-- 5. 올해 몇 일이 지났는지 출력 하시오. 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형식을 일치 시키시오. 
select sysdate, trunc (sysdate - to_date(20220101, 'YYYYMMDD'))
from dual;

-- 5-1. 자신이 태어난 날짜에서 현재까지 몇 일이 지났는지 출력 하세요. 
select sysdate, trunc (sysdate - to_date(20020202, 'YYYYMMDD'))
from dual;

-- 5-2. 자신이 태어난 날짜에서 현재까지 몇 개월이 지났는지 출력 하세요. 
select trunc (months_between (sysdate , to_date('2002/02/22', 'YYYY/MM/DD'))) as 달의차
from dual;

-- 6. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 null 갑대신 0으로 출력 하시오. 
select ename, nvl(manager,0)
from employee;

-- 7.  DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 'ANAIYST' 사원은 200 , 'SALESMAN' 사원은 180, 'MANAGER'인 사원은 150, 'CLERK'인 사원은 100을 인상하시오. 
select ename, salary, decode(job,'ANALYST', salary+200,
                                 'SALESMAN', salary+180,
                                 'MANAGER', salary+150,
                                 'CLERK', salary+100) as "인상"
from employee;

-- 8. (1컬럼) 사원번호, 사원번호 2자리만 출력 나머지는 *로 가림 as 가린번호, 
--    (2컬럼) 이름, 이름의 첫자만 출력, 총 네자리, 세자리는 *로 가림 as 가린이름


-- 9. 주민번호를 출력하되 801210-1****** 출력 하도록, 
--    전화번호: 010-1111-****출력
--    dual 테이블 사용

-- 10. 사원번호, 사원명, 직속상관
--      직속상관의 사원 번호가 없을 경우: 0000, 앞 2자리가 75일 경우 : 5555
--      직속상관의 사원 번호가 없을 경우: 0000, 앞 2자리가 76일 경우 : 6666
--      직속상관의 사원 번호가 없을 경우: 0000, 앞 2자리가 77일 경우 : 7777
--      직속상관의 사원 번호가 없을 경우: 0000, 앞 2자리가 78일 경우 : 8888
--      그 외는 그대로 출력                                