drop table zipcode_tbl;
create table zipcode_tbl(
	seq varchar2(100) primary key,
	zipcode varchar2(100) not null,
	sido varchar2(100) not null,
	gugun varchar2(100) not null,
	dong varchar2(100) not null,
	ri varchar2(100),
	bldg varchar2(100),
	bunji varchar2(100)
);

select count(*) from ZIPCODE_TBL;
delete from zipcode_tbl;

select * from ZIPCODE_TBL where dong like '%°­³²%';