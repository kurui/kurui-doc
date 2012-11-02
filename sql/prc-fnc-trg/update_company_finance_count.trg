create or replace trigger update_company_finance_count
       after insert or update or delete on finance_order
       for each row       
       declare
       pragma autonomous_transaction; --ָ���Զ���������
       begin
          if inserting then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit;      --trigger����û�������Զ�����������ʱ�򣬲���ִ����ʾ�ύ��   
          end if;
          if updating then
             update company c set c.finance_count=cal_company_finance_count(c.id) where 1=1;
             commit; 
          end if;
       end;
/
