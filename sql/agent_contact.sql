select * from agent_event;
select * from company c  where c.type=2
order by c.finance_count desc,c.update_time desc;


select t.*,rowid from agent_contact t where t.status=0;



select t.*,rowid from agent_resume t where t.status=0;

select t.*,rowid from company t where t.status=1;
