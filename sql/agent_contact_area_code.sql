select * from agent t;
select * from agent t where stamp_group is not null;

select * from agent t where t.name='严睿';

select * from company c where c.id in(
  select company_Id from agent_resume where agent_id=717/*严睿*/
  );
  

begin
  update_agent_stamp_group('aa');
end;
                 

update agent_contact t set t.content='广东省珠海市' where t.content='珠海';
update agent_contact t set t.content='广东省深圳市' where t.content='深圳';
update agent_contact t set t.content='广东省广州市' where t.content='广州';

update agent_contact t set t.content='广西省' where t.content='广西';
update agent_contact t set t.content='广西省百色市' where t.content='广西百色';
update agent_contact t set t.content='广西省梧州市' where t.content='广西梧州';
update agent_contact t set t.content='广西省桂林市' where t.content='广西桂林';




update agent_contact t set t.content='北京市' where t.content='北京';
update agent_contact t set t.content='浙江省杭州市' where t.content='杭州';

update agent_contact t set t.content='江西省南昌市' where t.content='南昌';
update agent_contact t set t.content='江西省赣州市上犹市' where t.content='上犹' or t.content='江西上犹';

update agent_contact t set t.content='江西省赣州市于都县',t.tag='342300' where t.content='于都';



select * from agent_contact t where t.content='珠海';

update agent_contact t set t.tag=null where t.tag  in(select area_code from area_code);
---注意：area_code为行政区代码，非邮政代码
select * from area_code ;


select * from agent_contact t,area_code a where t.content like '%'||a.name||'%';


select * from area_code a where a.name like '%深圳%';
select * from area_code a where a.area_code like '4403%';




