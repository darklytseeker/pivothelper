--inputs
--	1. table name
--	2. name  of the column you want to pivot against
--	3.
--	4.


declare @tablename nvarchar(4000) = ''
declare @columnname nvarchar(4000) = ''

declare @sql as nvarchar(4000) = ''

--why?
--drop table #tempDistinctInColumn
--Declare @CSL nvarchar  (4000)= ''  --Using a global temp table instead of a variable
IF OBJECT_ID('tempdb..#tempDistinctInColumn') is not null
drop table #tempDistinctInColumn
IF OBJECT_ID('tempdb..##CSL') is not null
drop table ##CSL
create table ##CSL (CSL nvarchar(4000))
insert into ##CSL values ('')
--something to iterate over all the elements
set @sql ='
select row_number() over (order by CUST)  as id, CUST 
into #tempDistinctInColumn
from ( select distinct CUST as CUST from ##PRODUCT) P

--the fist element
update ##CSL
set CSL = CSL + (select CUST from #tempDistinctInColumn where id = (select max(id) from #tempDistinctInColumn) )
delete from  #tempDistinctInColumn where id = (select max(id) from #tempDistinctInColumn)

--the rest of them
while ((select count(*) from #tempDistinctInColumn) > 0)
begin
		update ##CSL
		set CSL = CSL +  '', '' +(select CUST from #tempDistinctInColumn where id = (select max(id) from #tempDistinctInColumn) )
		delete from  #tempDistinctInColumn where id = (select max(id) from #tempDistinctInColumn)
end'

print (@sql)
exec(@sql)

select CSL from ##CSL