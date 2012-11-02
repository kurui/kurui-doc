---日期报表

---日报
select f.tran_type,(select name from data_type d where d.no=f.tran_type),
       trunc(f.business_time)/*将时分秒截断*/,
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
       group by f.tran_type,trunc(f.business_time)
       order by 2,1
       
select trunc(f.business_time)/*将时分秒截断*/,
       sum(f.total_amount) 
       from finance_order f
       where 1=1
             and f.business_time>DATE'2012-10-1'
             and f.business_time<DATE'2012-10-31'
       group by trunc(f.business_time)
       order by 1
       
       
       ---月报
select f.tran_type,(select name from data_type d where d.no=f.tran_type),
       trunc(f.business_time,'MM')/*将时分秒截断*/,
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
  --------------将此类型月报统计结果更新保存到统计表
  --------------------------------------
  select * from finance_month_report ;
  
  --插入分组数据
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
            ) P; /*解决ORA-02287:此处不允许序号*/
            
           ----更新group统计结果 
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


       
       
 ----周报
 
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
 
 
 
 
