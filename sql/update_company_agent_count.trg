create or replace trigger update_company_agent_count
       before insert or update or delete on agent_resume
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
/
