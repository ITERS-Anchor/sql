select * from sysdatabases

drop database dbtest
--创建数据库
create database dbtest
on primary
(
	name='dbtest',
	filename='C:\Users\qing\Desktop\dbtest.mdf',
	size=10mb,
	filegrowth=10mb
)
log on
(
	name='dbtest_log',
	filename='C:\Users\qing\Desktop\dbtest_log.ldf',
	size=5mb,
	filegrowth=10%
)

--创建表
use dbtest

create table ClassInfo
(
	cId int not null primary key identity(1,1),
	cTitle nvarchar(10)
)

create table StudentInfo
(
	sId int not null primary key identity(1,1),
	sName nvarchar(10) not null,
	sGender bit default(0),
	sBirthday date,
	sPhone char(11),
	sEMail varchar(20),
	cid int not null,
	foreign key(cid) references ClassInfo(cid)
)
