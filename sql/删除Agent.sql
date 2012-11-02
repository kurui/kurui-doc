select * from agent t where t.agent_no='A20111010000002';

delete  agent_contact c where c.agent_id in(select t.id from agent t where t.status=0);
delete  agent_resume c where c.agent_id in(select t.id from agent t where t.status=0);
delete agent t  where t.status=0;


select * from agent_contact c where c.agent_id in(select t.id from agent t where t.status=0);
select * from agent_resume c where c.agent_id in(select t.id from agent t where t.status=0);

select t.*,rowid from agent t where t.status=0;
