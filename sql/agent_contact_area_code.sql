select * from agent t;
select * from agent t where stamp_group is not null;

select * from agent t where t.name='���';

select * from company c where c.id in(
  select company_Id from agent_resume where agent_id=717/*���*/
  );
  

begin
  update_agent_stamp_group('aa');
end;
                 

update agent_contact t set t.content='�㶫ʡ�麣��' where t.content='�麣';
update agent_contact t set t.content='�㶫ʡ������' where t.content='����';
update agent_contact t set t.content='�㶫ʡ������' where t.content='����';

update agent_contact t set t.content='����ʡ' where t.content='����';
update agent_contact t set t.content='����ʡ��ɫ��' where t.content='������ɫ';
update agent_contact t set t.content='����ʡ������' where t.content='��������';
update agent_contact t set t.content='����ʡ������' where t.content='��������';




update agent_contact t set t.content='������' where t.content='����';
update agent_contact t set t.content='�㽭ʡ������' where t.content='����';

update agent_contact t set t.content='����ʡ�ϲ���' where t.content='�ϲ�';
update agent_contact t set t.content='����ʡ������������' where t.content='����' or t.content='��������';

update agent_contact t set t.content='����ʡ�������ڶ���',t.tag='342300' where t.content='�ڶ�';



select * from agent_contact t where t.content='�麣';

update agent_contact t set t.tag=null where t.tag  in(select area_code from area_code);
---ע�⣺area_codeΪ���������룬����������
select * from area_code ;


select * from agent_contact t,area_code a where t.content like '%'||a.name||'%';


select * from area_code a where a.name like '%����%';
select * from area_code a where a.area_code like '4403%';




