select * from agent t;

SELECT name,birthday,
       IF(cur>today, cur,next) AS birth_day
FROM (
  SELECT name,birthday,today,
     DATE_ADD(cur, INTERVAL IF(DAY(birthday)=29 
      && DAY(cur)=28,1,0) DAY) AS cur,
     DATE_ADD(next,INTERVAL IF(DAY(birthday)=29 
      && DAY(next)=28,1,0) DAY) AS next
  FROM (
    SELECT name,birthday,today,
           DATE_ADD(birthday,INTERVAL diff YEAR) AS cur,
           DATE_ADD(birthday,INTERVAL diff+1 YEAR) AS next
    FROM (
          SELECT  Name, BirthDay,
              (to_date(sysdate)-to_date(birthday,'yyyy-mm-dd')) AS diff,
             sysdate AS today
             FROM agent t,dual  where 1=1  and t.name='»ÆÓ¢') AS a
    ) AS b
) AS c
 
  SELECT  t.rowid,Name,birthday,to_date(BirthDay,'yyyy-mm-dd hh24:mi:ss'),sysdate AS today
     FROM agent t,dual
    where 1=1   and t.name='»ÆÓ¢';
    
      SELECT  t.rowid,Name,to_date(BirthDay,'yyyy-mm-dd'),sysdate AS today
     FROM agent t,dual
    where 1=1   and t.name='×ÞÁá×Ó';

  SELECT  Name, BirthDay,
          to_date(sysdate)-to_date(birthday,'yyyy-mm-dd') as diff,
         --to_date(sysdate)-birthday as diff,--error
          months_between(sysdate,to_date(birthday,'yyyy-mm-dd')) as mdiff,
            sysdate AS today
     FROM agent t,dual
     where 1=1  and t.name='»ÆÓ¢'


SELECT name,birthday,
       IF(cur>today, cur,next) AS birth_day
FROM (
  SELECT name,birthday,today,
     DATE_ADD(cur, INTERVAL IF(DAY(birthday)=29 
      && DAY(cur)=28,1,0) DAY) AS cur,
     DATE_ADD(next,INTERVAL IF(DAY(birthday)=29 
      && DAY(next)=28,1,0) DAY) AS next
  FROM (
    SELECT name,birthday,today,
           DATE_ADD(birthday,INTERVAL diff YEAR) AS cur,
           DATE_ADD(birthday,INTERVAL diff+1 YEAR) AS next
    FROM (
      SELECT CONCAT(last_name,' ',first_name) AS Name,
             birth_date AS BirthDay,
             (YEAR(NOW())-YEAR(birth_date)) AS diff,
             NOW() AS today
     FROM employees ) AS a
    ) AS b
) AS c
