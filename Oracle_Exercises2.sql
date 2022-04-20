-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select substr(hiredate,1,5)
from employee;


-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�. 
select ename, hiredate from employee
where substr(hiredate,4,2) = 04;


-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select ename, manager from employee
where not MOD(manager,2) = 0;


-- 3-1. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select ename, salary from employee
where MOD(salary,3) = 0;


-- 4. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select ename, to_char(hiredate, 'YY/MM (DY)') from employee;


-- 5. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ������ ��ġ ��Ű�ÿ�. 
select sysdate, trunc (sysdate - to_date(20220101, 'YYYYMMDD'))
from dual;


-- 5-1. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select sysdate, trunc (sysdate - to_date(20020202, 'YYYYMMDD'))
from dual;


-- 5-2. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���. 
select trunc (months_between (sysdate , to_date('2002/02/22', 'YYYY/MM/DD'))) as ������
from dual;


-- 6. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�. 
select ename, nvl(manager,0)
from employee;


-- 7.  DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ 'ANAIYST' ����� 200 , 'SALESMAN' ����� 180, 'MANAGER'�� ����� 150, 'CLERK'�� ����� 100�� �λ��Ͻÿ�. 
select ename, salary, decode(job,'ANALYST', salary+200,
                                 'SALESMAN', salary+180,
                                 'MANAGER', salary+150,
                                 'CLERK', salary+100) as "�λ�"
from employee;


-- 8. (1�÷�) �����ȣ, �����ȣ 2�ڸ��� ��� �������� *�� ���� as ������ȣ, 
--    (2�÷�) �̸�, �̸��� ù�ڸ� ���, �� ���ڸ�, ���ڸ��� *�� ���� as �����̸�
/*
select replace(eno, substr(eno, 3, 2), '**') as ������ȣ
from employee;
select replace(ename, substr(ename, 2, 3), '***') as �����̸�
from employee;
*/

select eno, rpad(substr(eno, 1, 2), 4, '*') as ������ȣ
from employee;

select  ename, rpad(substr(ename, 1, 1), length(ename), '*') as �����̸�
from employee; --�� ���ڸ�?

-- 9. �ֹι�ȣ�� ����ϵ� 801210-1****** ��� �ϵ���, 
--    ��ȭ��ȣ: 010-1111-****���
--    dual ���̺� ���

/*
select replace('801210-1234567', substr('801210-1234567', 9, 6), '*******') as �ֹι�ȣ,
       replace('010-1111-1111', substr('010-1111-1111', 10, 4), '****') as ��ȭ��ȣ
from dual;
*/

select '801210-1234567' as �ֹι�ȣ, 
        rpad(substr('801210-1234567', 1, 8), 14, '*') as ������
from dual;

select '010-1111-1111' as ��ȭ��ȣ, 
        rpad(substr('010-1111-1111', 1, 9), 14, '*') as ������
from dual;

-- 10. �����ȣ, �����, ���ӻ��
--      ���ӻ���� ��� ��ȣ�� ���� ���: 0000, 
--      �� 2�ڸ��� 75�� ��� : 5555
--      �� 2�ڸ��� 76�� ��� : 6666
--      �� 2�ڸ��� 77�� ��� : 7777
--      �� 2�ڸ��� 78�� ��� : 8888
--      �� �ܴ� �״�� ���         

select eno, ename, manager,
    case
        when manager is null then '0000'
        when substr(manager, 1, 2) = '75' then '5555'
        when substr(manager, 1, 2) = '76' then '6666'
        when substr(manager, 1, 2) = '77' then '7777'
        when substr(manager, 1, 2) = '78' then '8888'
        else to_char(manager)
    end as ��ȣ
from employee;