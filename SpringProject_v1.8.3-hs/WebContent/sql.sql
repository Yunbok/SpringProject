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

	
insert into userinfo values('yb@dd.com','1234','À±º¹',1111,'19/02/19','1');	
	insert into userinfo values('hs@dd.com','1234','ÈÆ»ó',1111,'19/02/19','1');
	insert into userinfo values('jh@dd.com','1234','ÁØÈ£',1111,'19/02/19','1');
	insert into userinfo values('jh@dd.com','1234','Á¤Çõ',1111,'19/02/19','1');
	
	insert into membercheck values('jw@dd.com','1234','¹ÚÁø¿ø',1111,'19/02/20','3');
	insert into membercheck values('bs@dd.com','1234','±è¹ü¼ö',2222,'19/02/19','3');
	insert into membercheck values('gs25@dd.com','1234','¿ë°ü¼ø',2222,'19/02/19','3');
	insert into membercheck values('BSK@dd.com','1234','¹ö¼­Ä¿',1111,'19/02/20','3');
	insert into membercheck values('in@dd.com','1234','ÀÎÆÄÀÌÅÍ',2222,'19/02/19','3');
	insert into membercheck values('DT@dd.com','1234','µðÆ®',1111,'19/02/19','3');
	insert into membercheck values('HKI@dd.com','1234','È£Å©¾ÆÀÌ',2222,'19/02/19','3');
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

insert into rereply values(1,1,1,'¾È³çÇÏ¼¼¿ä','À±º¹',sysdate());
insert into rereply values(1,3,1,'¾È³çÇÏ¼¼¿ä','À±º¹',sysdate());
insert into rereply values(31,1,1,'¾È³çÇÏ¼¼¿ä','À±º¹',sysdate());

insert into reply values(1,1,'¾È³çÇÏ¼¼¿ä','À±º¹',sysdate());
insert into reply values(1,2,'´ñ±Û3','À±º¹',sysdate());
insert into reply values(1,3,'´ñ±Û4','À±º¹',sysdate());
insert into reply values(1,4,'´ñ±Û5','À±º¹',sysdate());
insert into reply values(1,5,'´ñ±Û6','À±º¹',sysdate());
insert into reply values(1,6,'´ñ±Û7','À±º¹',sysdate());
insert into reply values(1,7,'´ñ±Û8','À±º¹',sysdate());
insert into reply values(1,8,'´ñ±Û9','À±º¹',sysdate());
insert into reply values(1,9,'´ñ±Û10','À±º¹',sysdate());