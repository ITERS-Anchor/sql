--'  abc  '   'abc'
declare @temp varchar(10)
set @temp='  abc  '
select LTRIM(RTRIM(@temp))

create proc trim
	@str1 varchar(10)
as
begin
	select LTRIM(RTRIM(@str1))
end
--'abc'
exec trim '  abc  '

--��д�洢����,��ѯ���е�������,����ǰҳ������
--pageindex,pagesize
alter proc GetPageList
	@pageIndex int,
	@pageSize int,
	@rowsCount int output
as
begin
	SET NOCOUNT ON;
	select @rowsCount=COUNT(*) from StudentInfo where IsDelete=0
	
	select * from 
	(select *,ROW_NUMBER() over(order by sid desc) as rowIndex
	from StudentInfo where IsDelete=0) as t1
	where rowindex between (@pageIndex-1)*@pageSize+1 and @pageIndex*@pageSize
end

declare @temp int
exec GetPageList 1,2,@temp output
print @temp

select * from StudentInfo

select * from PersonList

select * into test2 from PersonList

create nonclustered index ix_phone
on test1(pPhone)

set statistics time on
select * from test1

select * from test1--CPU ʱ�� = 0 ���룬ռ��ʱ�� = 0 ���롣
where pName='����ϼ'

select * from test2-- CPU ʱ�� = 15 ���룬ռ��ʱ�� = 20 ���롣
where pName='����ϼ'

--������
select * into classTest from ClassInfo where 1=2

select * from ClassInfo
select * from classTest

delete from ClassInfo where cId=12

create trigger ClassInfo_Delete on classinfo
after delete
as
begin
	set nocount on
	insert into classtest(ctitle) 
	select ctitle from deleted
end

alter view ScoreInfoList
as
select scoreinfo.sid,scoreValue,
StudentInfo.sName,stuid,classinfo.cid,
SubjectInfo.sTitle,subid
from ScoreInfo
inner join StudentInfo on ScoreInfo.stuId=StudentInfo.sId
inner join SubjectInfo on SubjectInfo.sId=ScoreInfo.subId
inner join classinfo on classinfo.cid=studentinfo.cid

select * from ScoreInfoList

select * from Student_Class

select * from ScoreInfo;
select * from StudentInfo






