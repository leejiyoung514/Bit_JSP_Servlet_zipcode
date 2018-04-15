drop table zipcode_tbl;
create table zipcode2_tbl(
	seq number(5) primary key,
	zipcode varchar2(100) not null,
	sido varchar2(100) not null,
	gugun varchar2(100) not null,
	dong varchar2(100) not null,
	ri varchar2(100),
	bldg varchar2(100),
	bunji varchar2(100)
);

create sequence zipcode_seq2 start with 1;

select zipcode_seq.nextval from dual;
select count(*) from zipcode2_tbl;

select count(*) from ZIPCODE_TBL;
delete from zipcode2_tbl;

select * from ZIPCODE_TBL where dong like '%°­³²%';