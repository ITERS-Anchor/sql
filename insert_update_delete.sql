select * from UserInfo
--21232f297a57a5a743894a0e4a801fc3 admin
insert UserInfo(UserName,UserPwd) 
values('С����','21232f297a57a5a743894a0e4a801fc3')
--Ϊ���е���,����Ĭ��˳��ֵ,����ʹ�����¼�д
insert UserInfo
values('��ͷ��','21232f297a57a5a743894a0e4a801fc3')
--ΪĳЩ�и�ֵ,������ȫ����
insert UserInfo(UserName)
values('��־ƽ')

--Ϊ�����е�ָ���н����޸�
update UserInfo set UserPwd='admin'

--Ϊָ���н����޸���
update UserInfo set UserPwd='21232f297a57a5a743894a0e4a801fc3'
where UserId>1

update UserInfo set UserPwd=null

--һ����д�������,��������
select * from classInfo
insert into classInfo
values('����'),('�׻�'),('��ȸ'),('����')

delete classinfo where cid>4

insert into classinfo values('�䵱')

--���
--truncate table classinfo
truncate table userinfo



