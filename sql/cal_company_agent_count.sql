create or replace function cal_company_agent_count(companyId integer)
  return NUMBER is
  result  NUMBER(15,4):=0;
begin
  if companyId is not null then

       select count(*) into result from agent_resume f where f.company_id=companyId;
end if;
    if result is null then
      result:=0;
    end if;

    return result;

  end cal_company_agent_count;
