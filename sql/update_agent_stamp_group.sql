create or replace procedure update_agent_stamp_group(aa String) is

begin

update agent t set t.stamp_group=null where 1=1;
commit;
update agent t set t.stamp_group=1 where t.id in(
                   select r.agent_id from agent_resume r where r.company_id in(647,648,649,566
                         -- select company_Id from agent_resume where agent_id=717/*ÑÏî£*/
                          )
                 );
commit;
 update agent t set t.stamp_group=t.stamp_group||','||2 where t.id in(
                   select r.agent_id from agent_resume r where r.company_id in(556,557,564,579
                         -- select company_Id from agent_resume where agent_id=717/*ÑÏî£*/
                          )
                 );      
  commit;
end update_agent_stamp_group;
