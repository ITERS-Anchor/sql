--������ȫ���С�������
select UserInfo.UserName name,UserInfo.UserPwd pwd
from UserInfo

--top n
select * from StudentInfo
select top 1 *
from StudentInfo

select top 2 percent *
from StudentInfo

--����,asc��ʾ��,desc��ʾ��
select * from StudentInfo
order by cid desc,sId asc

--�����ظ���
select distinct cid from StudentInfo

--where
select * from StudentInfo

select sname from StudentInfo
where sId>5

--ȡ����Ŵ�3-8��ѧ��
select * from StudentInfo
where sId between 3 and 8
--ȡ���Է�����60-80��ĳɼ�
select * from ScoreInfo
where scoreValue between 60 and 80

--ȡ�༶���Ϊ1-3��ѧ����Ϣ
select * from StudentInfo
--where cid between 1 and 3
where cid>=1 and cid<=3
--ȡ�༶���Ϊ1��3��8��10��100��ѧ����Ϣ
select * from StudentInfo
--where cid not in (1,3)
where cid=1 or cid=3

--ѧ�������[3,8],��1��,ѧ����Ϣ
select * from StudentInfo
where (sId between 3 and 8) and (cid=1)

select * from StudentInfo
where sGender=1

--ģ����ѯ
--�����а�������ѧ����Ϣ
select * from StudentInfo
where sName like '%��%'
--���ŵ�ѧ��
select * from StudentInfo
where sName like '��%'
--����Ϊ2���ֵ��ջƵ�ѧ��
select * from StudentInfo
where sName like '��_'
--��ѯʹ�õ绰Ϊ13�ε�ѧ����Ϣ
select * from StudentInfo
where sPhone like '13%'

select * from StudentInfo
where sPhone like '1[^579]%'
--ȡʹ��qq�����ѧ��
select * from StudentInfo
where sEMail like '%@qq%'
update StudentInfo set sPhone =null 
where sId in(5,6)
--�绰Ϊnul��ѧ����Ϣ
select * from StudentInfo
where sPhone is not null
--���Ӳ�ѯ:����Ҫ�Ľ���Ӷ��ű���ȡʱ
--��ѯѧ�����������ڰ༶����
--StudentInfo
--ClassInfo
--��ϵ:StudentInfo.cid=>ClassInfo.cid
--�ؼ�����:��Щ��,��ϵ
select si.sName,ci.cTitle
from StudentInfo as si
inner join ClassInfo as ci on si.cid=ci.cid
where ci.cTitle='����'


select * 
from ClassInfo as ci
left join StudentInfo as si on ci.cId=si.cid

select * 
from ClassInfo as ci
right join StudentInfo as si on ci.cId=si.cid

select * 
from ClassInfo as ci
full join StudentInfo as si on ci.cId=si.cid

--�༶���ơ�ѧ����������Ŀ���ơ�����
--StudentInfo,SubjectInfo,ScoreInfo��classinfo
--sid=stuid,sid=subid,
select class.cTitle,stu.sName,sub.sTitle,score.scoreValue
from ScoreInfo as score
inner join StudentInfo as stu on score.stuId=stu.sId
inner join SubjectInfo as sub on score.subId=sub.sId
inner join ClassInfo as class on stu.cid=class.cId
where class.cId=1

--�ۺϺ���
select * from StudentInfo where cid=1
select COUNT(*) as count1 from StudentInfo
where cid=1

select * from ScoreInfo

select MAX(scorevalue) from ScoreInfo
where subId=2
--��ѧ�����Ϊ1����ͷ�
select min(scorevalue) from ScoreInfo
where stuId=1
--�����Ŀ�Ŀ��ƽ����
--SubjectInfo,ScoreInfo,avg
select AVG(scoreValue)
from SubjectInfo
inner join ScoreInfo on subId=SubjectInfo.sId
where sTitle='����'

--��ͳ����Ϣ�ֲ�������
select ScoreInfo.*,avg(scorevalue) over()
from ScoreInfo
where subId=1

--ͳ����Ů������
select sGender,COUNT(*)
from StudentInfo
group by sGender

select AVG(scoreValue) from ScoreInfo
where subId=1

select * from StudentInfo
--��ÿ�������Ů������
--�������,��������ֵ��ͬ��ʵ����һ��,
--�ڽ������ֻ�ܳ��ַ��������к;���
select sGender,cid,COUNT(*)
from StudentInfo
group by sGender,cid

--ͳ��ѧ����Ŵ���2�ĸ��༶�ĸ��Ա��ѧ������
select cid,sGender,COUNT(*)
from StudentInfo
where sId>2
group by cid,sGender

--ͳ��ѧ����Ŵ���2�ĸ��༶�ĸ��Ա��ѧ����������3����Ϣ
select cid,sGender,COUNT(*)
from StudentInfo
where sId>2
group by cid,sGender having COUNT(*)>3

--��ѯѧ���������ܷ�
--studentinfo scoreinfo
select stu.sName,SUM(score.scoreValue) as score1
from StudentInfo stu
inner join ScoreInfo score on stu.sId=score.stuId
group by stu.sName
order by score1 desc

--���ϲ�ѯ
select sid from StudentInfo
--union--�ϲ�,����,�����ظ���
--union all--�ϲ�,������,�������ظ���
--except--�
--intersect--����
select cid from ClassInfo

--���ٱ���:��һ�������ڵı��п��ٲ�������
select * into test1 from ClassInfo
where cId>2

select * into test2 from ClassInfo where 1=2

--��һ�����ڵı��в�������
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
--�����ܽ�:�ԡ�2015-1-1���ĸ�ʽ��ʾ����
select * from StudentInfo
ȡ����A�е�31����40��¼��SQLServer,���Զ�������ID��Ϊ����,ע�⣺ID���ܲ���������
select* from(SELECT Row_Number() over ( order by cId desc) as Rid , * FROM ClassInfo) as T
   Where T.Rid between 3 and 5
3��select top 10 * from T_FilterWords 
where id not in (select top 30 id from T_FilterWords)



