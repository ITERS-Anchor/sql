--������ͼ
create view Student_Class--alter
as
select StudentInfo.*,ClassInfo.cTitle from StudentInfo
inner join ClassInfo on StudentInfo.cid=ClassInfo.cId
--��ͼ�д洢����select���,�����ǽ��������
select * from Student_Class
where IsDelete=0 and cTitle='�׻�'
--ɾ��
drop view Student_Class

-------------�Ӳ�ѯ
select * from StudentInfo
select * from ScoreInfo
--��ѯ�����˿��Ե�ѧ����Ϣ exists in
select * from StudentInfo
where sId in(select distinct stuid from ScoreInfo)

select * from StudentInfo
where exists 
(select * from ScoreInfo where ScoreInfo.stuId=StudentInfo.sid)

--��ҳ ��֪:ҳ��С(һҳ��ʾ����������),ҳ����
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

--case:�Խ�����е��н����ж�
--��ʾѧ����Ϣ,�Ա���"��Ů"��ʾ
select *,
	case sGender when 1 then '��'
	when 0 then 'Ů' end as �Ա�
from StudentInfo
--��ѧ��������ʾ�ɵȼ� >=90 ��,>=80 ��,>=60 ��,���� ��
select *,
	case
	when scoreValue>=60 and scoreValue<80 then '��'
	when scoreValue>=90 then '��'
	when scoreValue>=80 then '��'
	else '��' end as �ȼ�
from ScoreInfo

--��ѯѧ����������Ŀ���ơ��ɼ�
create view Student_Score
as
select stu.sName,sub.sTitle,score.scoreValue
from ScoreInfo score
inner join SubjectInfo sub on sub.sId=score.subId
inner join StudentInfo stu on stu.sId=score.stuId
--���� ���� ��ѧ Ӣ��
--С���� 100  89  92.5
select sName ����,
--�����ǰ��STitle��ֵ��"����",�����ScoreValue
max(case sTitle when '����' then scoreValue end) ����,
min(case when sTitle='��ѧ' then scoreValue end) ��ѧ,
sum(case sTitle when 'Ӣ��' then scoreValue end) Ӣ��
 from Student_Score
 group by sName
 
  select * from Student_Score
 --�༶  ����  Ů��
--	����	 1      2
create view Student_Class_Gender
as
select cTitle,sGender,COUNT(*) as count1
from StudentInfo stu
inner join ClassInfo class on stu.cid=class.cId
group by cTitle,sGender

select cTitle,
max(case sGender when 1 then count1 else 0 end) ��,
max(case when sGender=0 then count1 else 0 end) Ů
from Student_Class_Gender
group by cTitle

--����
declare @name nvarchar(10)--����
set @name='���ͷ��'--��ֵ
print @name--���

select @@version--�鿴��ǰ���ݿ�汾

select * from ClassInfo

insert into ClassInfo values('�Ĳ���123');
--select @@IDENTITY--�����insert���ı�ʶ
print @@rowcount

print @@servername

--ѡ�����
declare @id int
set @id=10
if @id>5
begin
	--��������ʱ,ִ�����´���
	print 'ok'
end
else
begin
	--����������ʱ,ִ�����´���
	print 'no'
end

--ѭ��
declare @id int
set @id=1
while @id<10
begin
	print @id
	set @id=@id+1
end

--���1-10֮�������ż��
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

--�쳣����
begin try
	delete from ClassInfo
end try
begin catch
	print @@error
end catch

--����:��֤һ�������������ȫ�����,����ص���֮ǰ��״̬
select * from UserInfo

begin try
	begin tran--���÷��ڵ�,��������
	delete from UserInfo where UserId>5
	delete from ClassInfo
	commit tran--������,�ύ����
end try
begin catch
	rollback tran--������,�ع�����
end catch

--��:��ֹ������Ա�������
select * from UserInfo

begin tran
update UserInfo set UserName='abc1' where UserId=10
rollback tran

select * from SubjectInfo

