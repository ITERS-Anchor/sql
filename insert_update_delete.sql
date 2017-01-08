select * from UserInfo
--21232f297a57a5a743894a0e4a801fc3 admin
insert UserInfo(UserName,UserPwd) 
values('小龙包','21232f297a57a5a743894a0e4a801fc3')
--为所有的列,按照默认顺序赋值,可以使用如下简写
insert UserInfo
values('大头贴','21232f297a57a5a743894a0e4a801fc3')
--为某些列赋值,而不是全部列
insert UserInfo(UserName)
values('尹志平')

--为所有行的指定列进行修改
update UserInfo set UserPwd='admin'

--为指定行进行修改列
update UserInfo set UserPwd='21232f297a57a5a743894a0e4a801fc3'
where UserId>1

update UserInfo set UserPwd=null

--一次性写多个数据,批量插入
select * from classInfo
insert into classInfo
values('青龙'),('白虎'),('朱雀'),('玄武')

delete classinfo where cid>4

insert into classinfo values('武当')

--清空
--truncate table classinfo
truncate table userinfo



