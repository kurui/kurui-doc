create or replace function cal_company_finance_count(companyId integer)
  return NUMBER is
  result  NUMBER(15,4):=0;
begin
  if companyId is not null then

       select count(*) into result from finance_order f where f.cussent_company_id=companyId;
end if;
    if result is null then
      result:=0;
    end if;

    return result;

  end cal_company_finance_count;
/
