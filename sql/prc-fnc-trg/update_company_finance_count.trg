create or replace trigger update_company_finance_count
       after insert or update or delete on finance_order
       for each row       
       declare
       pragma autonomous_transaction; --指定自定义事务处理。
       begin
          if inserting then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit;      --trigger中在没有声明自定义事务管理的时候，不能执行显示提交。   
          end if;
          if updating then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit; 
          end if;
       end;
/
