select * from mail_code;
delete mail_code where mail_code is null or name is null;
delete mail_code where mail_code='邮政编码' or name='地区';


select * from mail_code where name like '%大连%';

select t.*,t.rowid from agent_contact t where (t.type=21 or t.type=31) 
       and t.tag is null  
       --and t.content like '%区%'
       order by content; 
 

update agent_contact t set t.tag=(
select mail_code from mail_code where name like '%广元%') 
                           where t.content like '%广元%' and t.tag is null;
