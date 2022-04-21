-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select substr(hiredate, 1, 5) as ���
from employee;

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�. 
select ename, hiredate
from employee
where substr(hiredate, 4, 2) = 04;

-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select ename, manager
from employee
where MOD (manager, 2) != 0;

-- 3-1. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select ename, salary
from employee
where MOD (salary, 3) = 0;

-- 4. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select hiredate, to_char (hiredate, 'YY MON DD DY') as ��°��
from employee;

-- 5. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ������ ��ġ ��Ű�ÿ�. 
select trunc(sysdate - to_date (20220101, 'YYYYMMDD')) as ���س�¥��
from dual;

-- 5-1. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select trunc(sysdate - to_date (20020222, 'YYYYMMDD')) as �곯
from dual;

-- 5-2. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���. 
select trunc (months_between (sysdate, to_date (20020222, 'YYYYMMDD'))) as ���
from dual;

-- 6. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�. 
select ename, manager, nvl(manager, 0), nvl2(manager, manager, 0)
from employee;

-- 7.  DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ 'ANAIYST' ����� 200 , 'SALESMAN' ����� 180, 'MANAGER'�� ����� 150, 'CLERK'�� ����� 100�� �λ��Ͻÿ�. 
select ename, salary, decode(job,'ANALYST', salary+200,
                                 'SALESMAN', salary+180,
                                 'MANAGER', salary+150,
                                 'CLERK', salary+100) as "�λ�"
from employee;

-- 8. (1�÷�) �����ȣ, �����ȣ 2�ڸ��� ��� �������� *�� ���� as ������ȣ, 
--    (2�÷�) �̸�, �̸��� ù�ڸ� ���, �� ���ڸ�, ���ڸ��� *�� ���� as �����̸�
select eno, rpad(substr(eno, 1, 2), 4, '*') as ������ȣ,
ename, rpad(substr(ename, 1, 1), 4, '*') as �����̸�
from employee; 

select eno, rpad(substr(eno, 1, 2), 4, '*') as ������ȣ,
ename, rpad(substr(ename, 1, 1), length(ename),  '*') as �����̸�
from employee; 


-- 9. �ֹι�ȣ�� ����ϵ� 801210-1****** ��� �ϵ���, 
--    ��ȭ��ȣ: 010-1111-****���
--    dual ���̺� ���

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