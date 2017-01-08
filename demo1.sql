--创建视图
create view Student_Class--alter
as
select StudentInfo.*,ClassInfo.cTitle from StudentInfo
inner join ClassInfo on StudentInfo.cid=ClassInfo.cId
--视图中存储的是select语句,而不是结果集数据
select * from Student_Class
where IsDelete=0 and cTitle='白虎'
--删除
drop view Student_Class

-------------子查询
select * from StudentInfo
select * from ScoreInfo
--查询参与了考试的学生信息 exists in
select * from StudentInfo
where sId in(select distinct stuid from ScoreInfo)

select * from StudentInfo
where exists 
(select * from ScoreInfo where ScoreInfo.stuId=StudentInfo.sid)

--分页 已知:页大小(一页显示多少条数据),页索引
--			3,4						1,2,3,4
--1,3   1,3		(pageIndex-1)*pageSize+1	pageIndex*pageSize
--2,3	4,6
--3,3	7,9
--4,3	10,12

--2,4	5,8
select * from
(select *,
ROW_NUMBER() over(order by sid desc) as rowIndex
from StudentInfo) as t1
where rowindex between 5 and 8

--case:对结果集中的列进行判断
--显示学生信息,性别以"男女"显示
select *,
	case sGender when 1 then '男'
	when 0 then '女' end as 性别
from StudentInfo
--将学生分数显示成等级 >=90 优,>=80 良,>=60 中,其它 差
select *,
	case
	when scoreValue>=60 and scoreValue<80 then '中'
	when scoreValue>=90 then '优'
	when scoreValue>=80 then '良'
	else '差' end as 等级
from ScoreInfo

--查询学生姓名、科目名称、成绩
create view Student_Score
as
select stu.sName,sub.sTitle,score.scoreValue
from ScoreInfo score
inner join SubjectInfo sub on sub.sId=score.subId
inner join StudentInfo stu on stu.sId=score.stuId
--姓名 语文 数学 英语
--小笼包 100  89  92.5
select sName 姓名,
--如果当前的STitle的值是"语文",则输出ScoreValue
max(case sTitle when '语文' then scoreValue end) 语文,
min(case when sTitle='数学' then scoreValue end) 数学,
sum(case sTitle when '英语' then scoreValue end) 英语
 from Student_Score
 group by sName
 
  select * from Student_Score
 --班级  男生  女生
--	青龙	 1      2
create view Student_Class_Gender
as
select cTitle,sGender,COUNT(*) as count1
from StudentInfo stu
inner join ClassInfo class on stu.cid=class.cId
group by cTitle,sGender

select cTitle,
max(case sGender when 1 then count1 else 0 end) 男,
max(case when sGender=0 then count1 else 0 end) 女
from Student_Class_Gender
group by cTitle

--变量
declare @name nvarchar(10)--声明
set @name='武大头帖'--赋值
print @name--输出

select @@version--查看当前数据库版本

select * from ClassInfo

insert into ClassInfo values('四不像123');
--select @@IDENTITY--最近的insert语句的标识
print @@rowcount

print @@servername

--选择语句
declare @id int
set @id=10
if @id>5
begin
	--满足条件时,执行如下代码
	print 'ok'
end
else
begin
	--不满足条件时,执行如下代码
	print 'no'
end

--循环
declare @id int
set @id=1
while @id<10
begin
	print @id
	set @id=@id+1
end

--输出1-10之间的所有偶数
declare @num int
set @num=1
while @num<11
begin
	if @num%2=0
	begin
		print @num
	end
	set @num=@num+1
end

--异常处理
begin try
	delete from ClassInfo
end try
begin catch
	print @@error
end catch

--事务:保证一个多操作的事情全部完成,否则回到做之前的状态
select * from UserInfo

begin try
	begin tran--设置反悔点,开启事务
	delete from UserInfo where UserId>5
	delete from ClassInfo
	commit tran--不反悔,提交事务
end try
begin catch
	rollback tran--反悔啦,回滚事务
end catch

--锁:防止其它人员的误操作
select * from UserInfo

begin tran
update UserInfo set UserName='abc1' where UserId=10
rollback tran

select * from SubjectInfo

