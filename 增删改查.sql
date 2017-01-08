--别名、全部列、部分列
select UserInfo.UserName name,UserInfo.UserPwd pwd
from UserInfo

--top n
select * from StudentInfo
select top 1 *
from StudentInfo

select top 2 percent *
from StudentInfo

--排序,asc表示升,desc表示降
select * from StudentInfo
order by cid desc,sId asc

--消除重复行
select distinct cid from StudentInfo

--where
select * from StudentInfo

select sname from StudentInfo
where sId>5

--取出编号从3-8的学生
select * from StudentInfo
where sId between 3 and 8
--取考试分数在60-80间的成绩
select * from ScoreInfo
where scoreValue between 60 and 80

--取班级编号为1-3的学生信息
select * from StudentInfo
--where cid between 1 and 3
where cid>=1 and cid<=3
--取班级编号为1或3或8或10或100的学生信息
select * from StudentInfo
--where cid not in (1,3)
where cid=1 or cid=3

--学生编号在[3,8],在1班,学生信息
select * from StudentInfo
where (sId between 3 and 8) and (cid=1)

select * from StudentInfo
where sGender=1

--模糊查询
--名字中包含三的学生信息
select * from StudentInfo
where sName like '%三%'
--姓张的学生
select * from StudentInfo
where sName like '张%'
--姓名为2个字的姓黄的学生
select * from StudentInfo
where sName like '黄_'
--查询使用电话为13段的学生信息
select * from StudentInfo
where sPhone like '13%'

select * from StudentInfo
where sPhone like '1[^579]%'
--取使用qq邮箱的学生
select * from StudentInfo
where sEMail like '%@qq%'
update StudentInfo set sPhone =null 
where sId in(5,6)
--电话为nul的学生信息
select * from StudentInfo
where sPhone is not null
--连接查询:当需要的结果从多张表中取时
--查询学生姓名及所在班级名称
--StudentInfo
--ClassInfo
--关系:StudentInfo.cid=>ClassInfo.cid
--关键问题:哪些表,关系
select si.sName,ci.cTitle
from StudentInfo as si
inner join ClassInfo as ci on si.cid=ci.cid
where ci.cTitle='青龙'


select * 
from ClassInfo as ci
left join StudentInfo as si on ci.cId=si.cid

select * 
from ClassInfo as ci
right join StudentInfo as si on ci.cId=si.cid

select * 
from ClassInfo as ci
full join StudentInfo as si on ci.cId=si.cid

--班级名称、学生姓名、科目名称、分数
--StudentInfo,SubjectInfo,ScoreInfo，classinfo
--sid=stuid,sid=subid,
select class.cTitle,stu.sName,sub.sTitle,score.scoreValue
from ScoreInfo as score
inner join StudentInfo as stu on score.stuId=stu.sId
inner join SubjectInfo as sub on score.subId=sub.sId
inner join ClassInfo as class on stu.cid=class.cId
where class.cId=1

--聚合函数
select * from StudentInfo where cid=1
select COUNT(*) as count1 from StudentInfo
where cid=1

select * from ScoreInfo

select MAX(scorevalue) from ScoreInfo
where subId=2
--求学生编号为1的最低分
select min(scorevalue) from ScoreInfo
where stuId=1
--求语文科目的平均分
--SubjectInfo,ScoreInfo,avg
select AVG(scoreValue)
from SubjectInfo
inner join ScoreInfo on subId=SubjectInfo.sId
where sTitle='语文'

--将统计信息分布到行中
select ScoreInfo.*,avg(scorevalue) over()
from ScoreInfo
where subId=1

--统计男女生人数
select sGender,COUNT(*)
from StudentInfo
group by sGender

select AVG(scoreValue) from ScoreInfo
where subId=1

select * from StudentInfo
--求每个班的男女生人数
--结果集中,分组依据值相同的实例在一组,
--在结果列中只能出现分组依据列和聚列
select sGender,cid,COUNT(*)
from StudentInfo
group by sGender,cid

--统计学生编号大于2的各班级的各性别的学生人数
select cid,sGender,COUNT(*)
from StudentInfo
where sId>2
group by cid,sGender

--统计学生编号大于2的各班级的各性别的学生人数大于3的信息
select cid,sGender,COUNT(*)
from StudentInfo
where sId>2
group by cid,sGender having COUNT(*)>3

--查询学生姓名、总分
--studentinfo scoreinfo
select stu.sName,SUM(score.scoreValue) as score1
from StudentInfo stu
inner join ScoreInfo score on stu.sId=score.stuId
group by stu.sName
order by score1 desc

--联合查询
select sid from StudentInfo
--union--合并,排序,消除重复项
--union all--合并,不排序,不消除重复项
--except--差集
--intersect--交集
select cid from ClassInfo

--快速备份:向一个不存在的表中快速插入数据
select * into test1 from ClassInfo
where cId>2

select * into test2 from ClassInfo where 1=2

--向一个存在的表中插入数据
insert into test2(cTitle)
select cTitle from ClassInfo

select * from test2

select * from StudentInfo

--89.000000
select CAST(89.000000 as decimal(4,1))
select CONVERT(decimal(4,1),89.000000,)
--11
select cast(1 as CHAR(1))+'1'
select STR(1)

select datepart("Dayofyear",GETDATE())
--函数总结:以“2015-1-1”的格式显示日期
select * from StudentInfo
取出表A中第31到第40记录（SQLServer,以自动增长的ID作为主键,注意：ID可能不是连续的
select* from(SELECT Row_Number() over ( order by cId desc) as Rid , * FROM ClassInfo) as T
   Where T.Rid between 3 and 5
3）select top 10 * from T_FilterWords 
where id not in (select top 30 id from T_FilterWords)



