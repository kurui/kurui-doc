select * from mail_code;
delete mail_code where mail_code is null or name is null;
delete mail_code where mail_code='��������' or name='����';


select * from mail_code where name like '%����%';

select t.*,t.rowid from agent_contact t where (t.type=21 or t.type=31) 
       and t.tag is null  
       --and t.content like '%��%'
       order by content; 
 

update agent_contact t set t.tag=(
select mail_code from mail_code where name like '%��Ԫ%') 
                           where t.content like '%��Ԫ%' and t.tag is null;
