select t.rowid, t.id,t.name,t.work_place,t.know_place,t.reside,t.address,t.memo,t.temp 
from agent t 
where t.temp=1 order by know_place;

select r.agent_id,count(*) c from agent_resume r     
       group by r.agent_id
       order by c desc;
       
       
       select t.name,g.c from agent t,
                     (select r.agent_id,count(*) c from agent_resume r   group by r.agent_id) g
                 where t.id=g.agent_id
                 order by g.c desc ;


select a.id,a.name,a.address,
r.content,r.type
from agent a,agent_resume r
where a.id=r.agent_id
and 1=1
and a.address is not null;

select * from Agent_Resume r where 1=1   
       and r.agent_id in(select a.id from Agent a where 1=1 and   
                           (   a.name like '%王%'  or a.agent_No like '%王%'  ) 
                  ) 
    or r.content like '%王%'



select t.rowid, t.id,t.name,t.work_place,t.know_place,t.temp from agent t 
where t.temp=1 and t.work_place like '%银行%' order by know_place;

update agent t set temp=0 where t.work_place is null and t.know_place is null;

select t.*,t.rowid from company t;

select * from agent_resume t ;
select * from company where name like '%积享通%';
select t.*,t.rowid from agent t where t.work_place like '%天狮%';
       
insert  into agent_resume(id,agent_id,company_id,type,status,content,position) 
       values(seq_agent_resume.nextval,677,635,1,1,'','');


insert into agent_resume(id,agent_id,company_id,type,status) 
       select seq_agent_resume.nextval,t.id,579,1,1 from agent t where t.know_place='积享通';
       
       insert into agent_resume(id,agent_id,company_id,type,status) 
       select seq_agent_resume.nextval,t.id,564,1,1 from agent t where t.know_place like '%品尚%';
       
