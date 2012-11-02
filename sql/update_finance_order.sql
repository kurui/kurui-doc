select f.id,f.order_no,f.business_type,f.tran_type,f.business_time,f.memo from finance_order f;

select f.order_no,f.tran_type,f.business_time,f.memo,f.total_amount,f.cussent_company_id,f.rowid
 from finance_order f where f.tran_type=120112 and f.total_amount>10 and f.cussent_company_id is null;
 
 update finance_order f set f.cussent_company_id=678
                      where f.cussent_company_id is null and f.memo like '%Õô½È%';
 
 
 
 select * from assets_item t;
 

