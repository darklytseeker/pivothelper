--inputs
--	1. table name
--	2. name  of the column you want to pivot against
--	3.
--	4.


declare @tablename nvarchar(4000) = ''
declare @columnname nvarchar(4000) = ''


--why?
drop table ##tempDistinctInColumn
--Declare @CSL nvarchar  (4000)= ''  --Dropped the idea of keeping it as 

--something to iterate over all the elements
select row_number() over (order by CUST)  as id, CUST 
into ##tempDistinctInColumn
from ( select distinct CUST as CUST from ##PRODUCT) P

--the fist element
set @CSL = @CSL + (select CUST from ##tempDistinctInColumn where id = (select max(id) from #temp) )
delete from  ##tempDistinctInColumn where id = (select max(id) from ##tempDistinctInColumn)

--the rest of them
while ((select count(*) from ##tempDistinctInColumn) > 0)
begin
		set @CSL = @CSL +  ', ' +(select CUST from ##tempDistinctInColumn where id = (select max(id) from ##tempDistinctInColumn) )
		delete from  ##tempDistinctInColumn where id = (select max(id) from ##tempDistinctInColumn)
end

print @csl