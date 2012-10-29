select g.agent_id,g.content,g.status,c.name,t.name from (select r.agent_id,r.status,r.company_id,r.content 
       from agent_resume r group by r.agent_id,r.company_id,r.content,r.status
       order by r.agent_id,r.status ) g,company c,agent t
        where g.company_id=c.id and g.agent_id=t.id ;
 


