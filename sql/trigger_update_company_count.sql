/*更新company 交易统计字段*/
create or replace trigger update_company_finance_count
       after insert or update or delete on finance_order
       for each row
       declare
       pragma autonomous_transaction; 
       begin
          if inserting then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit;
          end if;
           
          if updating then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit;
           end if;
       end;
       
       
       
 /*更新company 关联客户统计字段*/
create or replace trigger update_company_agent_count
       after insert or update or delete on agent_resume
       for each row
       declare
       pragma autonomous_transaction;
       begin
           if inserting then              
              update company c set c.agent_count=cal_company_agent_count(c.id) where 1=1;
              commit;
           end if;
           
           if updating then              
              update company c set c.agent_count=cal_company_agent_count(c.id) where 1=1;
              commit;
           end if;
       end;
       
       
       select * from company order by finance_count desc;

select * from finance_order;

select count(*) from finance_order f where f.cussent_company_id=;

select cal_company_finance_count(c.id) from company c ;

--update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;

select c.name,cal_company_agent_count(c.id) from company c ;

