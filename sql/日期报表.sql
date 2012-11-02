---���ڱ���

---�ձ�
select f.tran_type,(select name from data_type d where d.no=f.tran_type),
       trunc(f.business_time)/*��ʱ����ض�*/,
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
       group by f.tran_type,trunc(f.business_time)
       order by 2,1
       
select trunc(f.business_time)/*��ʱ����ض�*/,
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
       group by trunc(f.business_time)
       order by 1
       
       
       ---�±�
select f.tran_type,(select name from data_type d where d.no=f.tran_type),
       trunc(f.business_time,'MM')/*��ʱ����ض�*/,
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
       group by f.tran_type,trunc(f.business_time,'MM')
       order by 2,1
       
  select TRUNC(f.business_time,'MM'),
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
      group by TRUNC(f.business_time,'MM')
       order by 1
       
 select to_char(f.business_time,'YYYY-MM'),
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-1-1'
             and f.business_time<DATE'2012-10-31'
       group by to_char(f.business_time,'YYYY-MM')
       order by 1
  ----------------------------------------
  --------------���������±�ͳ�ƽ�����±��浽ͳ�Ʊ�
  --------------------------------------
  select * from finance_month_report ;
  
  --�����������
  insert into finance_month_report(id,business_date_char,total_amount)
     select seq_finance_month_report.nextval,
            P.* 
            from( select  
                to_char(f.business_time,'YYYY-MM'),
             sum(f.total_amount) 
           from finance_order f
           where 1=1
                 and f.business_time>DATE'2012-1-1'
                 and f.business_time<DATE'2012-10-31'
           group by to_char(f.business_time,'YYYY-MM')
            ) P; /*���ORA-02287:�˴����������*/
            
           ----����groupͳ�ƽ�� 
     update finance_month_report r set r.total_amount=
     (select P.total_amount  from 
         (select to_char(f.business_time,'YYYY-MM') business_date_char,
             sum(f.total_amount) total_amount
           from finance_order f
           where 1=1
                 and f.business_time>DATE'2012-1-1'
                 and f.business_time<DATE'2012-10-31'
           group by to_char(f.business_time,'YYYY-MM')
            ) P
          where r.business_date_char=P.business_date_char ); 


       
       
 ----�ܱ�
 
  select to_char(
             next_day(trunc(f.business_time),
             to_char(DATE'2012-10-1','DAY')),'YYYY-MM-DD') Grp_date,
       sum(f.total_amount) Qty
       ,to_char(min(f.business_time),'YYYY-MM-DD HH:mm:ss') min_date
       ,to_char(max(f.business_time),'YYYY-MM-DD HH:mm:ss') max_date
       
       from finance_order f,dual
       where 1=1
             and f.business_time>=DATE'2012-10-1'
             and f.business_time< DATE'2012-10-1' +7*8
       group by next_day(trunc(f.business_time),to_char(DATE'2012-10-1','DAY'))
       order by 1
 
 
 
 
