create table userinfo (
	id varchar(100),
	pw varchar(20),
	name varchar(20),
	code int,
	birthday date,
	administrator varchar(20)
	)DEFAULT CHARSET=EUCKR;

	create table membercheck (
	id varchar(100),
	pw varchar(20),
	name varchar(20),
	code int,
	birthday date,
	administrator varchar(20)
	)	DEFAULT CHARSET=EUCKR;

	
insert into userinfo values('yb@dd.com','1234','����',1111,'19/02/19','1');	
	insert into userinfo values('hs@dd.com','1234','�ƻ�',1111,'19/02/19','1');
	insert into userinfo values('jh@dd.com','1234','��ȣ',1111,'19/02/19','1');
	insert into userinfo values('jh@dd.com','1234','����',1111,'19/02/19','1');
	
	insert into membercheck values('jw@dd.com','1234','������',1111,'19/02/20','3');
	insert into membercheck values('bs@dd.com','1234','�����',2222,'19/02/19','3');
	insert into membercheck values('gs25@dd.com','1234','�����',2222,'19/02/19','3');
	insert into membercheck values('BSK@dd.com','1234','����Ŀ',1111,'19/02/20','3');
	insert into membercheck values('in@dd.com','1234','��������',2222,'19/02/19','3');
	insert into membercheck values('DT@dd.com','1234','��Ʈ',1111,'19/02/19','3');
	insert into membercheck values('HKI@dd.com','1234','ȣũ����',2222,'19/02/19','3');
commit
drop table rereply

create table Reply (
    bno       int not null,
    rno        int not null,
    content   varchar(2000)    not null,
    writer    varchar(30)      not null,
    regDate   date,
    primary key(bno, rno)
)DEFAULT CHARSET=EUCKR;

create table Rereply (
    bno       int not null,
    rno       int not null,
    sno       int not null, 
    content   varchar(2000) not null,
    writer    varchar(30) not null,
    regDate   date,
    primary key(bno, rno,sno)
)DEFAULT CHARSET=EUCKR;

insert into rereply values(1,1,1,'�ȳ��ϼ���','����',sysdate());
insert into rereply values(1,3,1,'�ȳ��ϼ���','����',sysdate());
insert into rereply values(31,1,1,'�ȳ��ϼ���','����',sysdate());

insert into reply values(1,1,'�ȳ��ϼ���','����',sysdate());
insert into reply values(1,2,'���3','����',sysdate());
insert into reply values(1,3,'���4','����',sysdate());
insert into reply values(1,4,'���5','����',sysdate());
insert into reply values(1,5,'���6','����',sysdate());
insert into reply values(1,6,'���7','����',sysdate());
insert into reply values(1,7,'���8','����',sysdate());
insert into reply values(1,8,'���9','����',sysdate());
insert into reply values(1,9,'���10','����',sysdate());