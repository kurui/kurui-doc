create or replace procedure update_agent_contact(aa String) is

begin


insert  into agent_contact(id,agent_id,content,type,status) 
select seq_agent_contact.nextval,a.id,
       /*a.mobile_phone,1,1*/
       /*a.email,11,1*/
      /* a.qq_code,12,1*/
      /*a.native_country,21,1*/
      a.address,31,1
        from agent a where 1=1;

 commit;
 update agent_contact set update_time=(select sysdate from dual);
 commit;
 delete from agent_contact where  content is null;
 commit;
end update_agent_contact;
/
