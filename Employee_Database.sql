create database Admin;
use admin;

create table employee(
empno int,
ename varchar(20),
job varchar(20),
mgr int,
hiredate date,
sal float,
comm float,
deptno int
);
      INSERT INTO EMPLOYEE VALUES (7369,"SMITH","CLERK",7902,'1890-12-17',800.00,NULL,20);
      INSERT INTO EMPLOYEE VALUES (7499,"ALLEN","SALESMAN",7698,'1981-02-20',1600.00,300.00,30);
       INSERT INTO EMPLOYEE VALUES(7521,"WARD","SALESMAN",7698,'1981-02-22',1250.00,500.00,30);
       INSERT INTO EMPLOYEE VALUES(7566,"JONES","MANAGER",7839,'1981-04-02',2975.00,NULL,20);
       INSERT INTO EMPLOYEE VALUES(7654,"MARTIN","SALESMAN",7698,'1981-09-28',1250.00,1400.00,30);
      INSERT INTO EMPLOYEE VALUES (7698,"BLAKE","MANAGER",7839,'1981-05-01',2850.00,NULL,30);
       INSERT INTO EMPLOYEE VALUES(7782,"CLARK","MANAGER",7839,'1981-06-09',2450.00,NULL,10);
       INSERT INTO EMPLOYEE VALUES(7788,"SCOOT","ANALYST",7566,'1981-04-19',3000.00,NULL,20);
       INSERT INTO EMPLOYEE VALUES(7839,"KING","PRESIDENT",NULL,'1981-11-17',5000.00,NULL,10);
       INSERT INTO EMPLOYEE VALUES(7844,"TURNER","SALESMAN",7698,'1981-09-08',1500.00,0.00,30);
       INSERT INTO EMPLOYEE VALUES(7876,"ADAMS","CLEARK",7788,'1981-05-23',1100.00,NULL,20);
       INSERT INTO EMPLOYEE VALUES(7900,"JAMES","CLEARK",7698,'1981-12-03',950.00,NULL,30);
       INSERT INTO EMPLOYEE VALUES(7902,"FORD","ANALYST",7566,'1981-12-03',3000.00,NULL,20);
       INSERT INTO EMPLOYEE VALUES(7934,"MILLER","CLERK",7782,'1981-01-23',1300.00,NULL,10);

SELECT * FROM EMPLOYEE;
        
        CREATE TABLE DEPT(
        DEPTNO INT,
        DNAME VARCHAR(20),
        LOC VARCHAR(20)
        );
	INSERT INTO DEPT VALUES(10,"OPERATIONS","BOSTON");
	INSERT INTO DEPT VALUES(20,"RESHARCH","DALLAS");
	INSERT INTO DEPT VALUES(30,"SALES","CHICAGO");
	INSERT INTO DEPT VALUES(40,"ACCOUNTING","NEW YORK");
	
    SELECT * FROM DEPT;    
    
-- 3. List the Names and salary of the employee whose salary is greater than 1000
  SELECT (ENAME),sal FROM EMPLOYEE having SAL > 1000 ;
   
-- 4. List the details of the employees who have joined before end of September 18.
SELECT hiredate,ename 
         FROM employee
               WHERE hiredate < ('1981-9-18');
   
-- 5. List Employee Names having I as second character.
SELECT *
      FROM employee
            WHERE (ENAME) LIKE '_I%';

   
-- 6. List Employee Name, Salary, Allowances (40% of Sal), P.F. (10 % of Sal) and Net Salary. Also assign the alias name for the columns.

SELECT ename, sal, sal*.10 PF ,sal*.40 allowances FROM employee;
   
-- 7. List Employee Names with designations who does not report to anybody
SELECT ename,job,mgr
        FROM employee
              WHERE mgr IS NULL;
              
-- 8. List Empno, Ename and Salary in the ascending order of salary.
select ENAME,EMPNO,SAL FROM EMPLOYEE ORDER by SAL ASC;

  
-- 9. How many jobs are available in the Organization 
    select count(distinct((job))) as No_Of_Jobs from employee;
    
-- 10. Determine total payable salary of salesman category      
 select job,SUM(SAL) from EMPLOYEE where JOB="SALESMAN";


 -- 11. List average monthly salary for each job within each department 
 SELECT JOB,AVG(SAL) AS 
AVGSALARY FROM EMPLOYEE GROUP BY JOB;

 -- 12. Use the Same EMP and DEPT table used in the Case study to Display EMPNAME, SALARY and DEPTNAME in which the employee is working.
	
    SELECT ENAME,SAL,DNAME FROM Admin.EMPLOYEE,Admin.DEPT WHERE EMPLOYEE.DEPTNO=DEPT.DEPTNO;
 
-- 13. Create the Job Grades Table as below
 
 create table jobgrades(
 grade varchar(5),
 lowest_sal int,
 higest_sal int
 );
 
 insert into jobgrades values("A",0,999);
 insert into jobgrades values("B",1000,199);
 insert into jobgrades values("C",2000,2999);
 insert into jobgrades values("D",3000,3999);
 insert into jobgrades values("E",4000,5000);
 SELECT * FROM JOBGRADES;


        
-- 14. Display the last name, salary and Corresponding Grade.
select e.ename,e.sal,g.grade from employee as e inner join jobgrades as
g on e.sal between g.lowest_sal and g.higest_sal;

-- 15. Display the Emp name and the Manager name under whom the Employee works in thebelow format .
#Emp Report to Mgr.
   select e.empno,e.ename,e.mgr,m.ename as manager from employee as e left outer join employee as m on e.mgr = m.empno; 
  
  
        
-- 16.Display Empname and Total sal where Total Sal (sal + Comm)      
  select ename,(sal + ifnull(comm,0)) as Totalsal from employee; 
  
  
  select * from employee;
  
-- 17.Display Empname and Sal whose empno is a odd number.
SELECT ENAME,SAL,EMPNO
FROM employee
WHERE mod(EMPNO,2) = 1;

-- 18 Display Empname , Rank of sal in Organisation , Rank of Sal in their department
  
  select ename,dense_rank() over(order by sal) as total_rank,rank() over (partition by deptno order by sal) as dept_rank,deptno from employee;
  
-- 19. Display Top 3 Empnames based on their Salary

select ename,dense_rank() over(order by sal desc)as top_rank,sal from employee order by sal desc limit 3;

-- 20. Display Empname who has highest Salary in Each Department.
 
    select ename,job,max(sal) from employee,dept group by job;    
    

    
        SET SQL_SAFE_UPDATES = 0;
        
        
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
