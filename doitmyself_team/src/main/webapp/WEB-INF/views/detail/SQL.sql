alter table

select * from qna_tbl;

select * from user_tbl;

select * from product_tbl;

select * from user_sys_privs;

select * from review_tbl;

select * from order_tbl;



update order_tbl set ORDER_DELIVERY=4 where order_no = 9;


CREATE TABLE REVIEW_TBL(
	REVIEW_NO		NUMBER							PRIMARY KEY,
	REVIEW_RATE		NUMBER(1)							NOT NULL,
	REVIEW_CONTENT	VARCHAR2(400)				 		NOT NULL,
	REVIEW_DATE		DATE			DEFAULT SYSDATE			NOT NULL,
	REVIEW_WRITER	VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)	NOT NULL,
	REVIEW_P_NO	NUMBER		REFERENCES PRODUCT_TBL(P_NO)	NOT NULL,
	REVIEW_IMG		VARCHAR2(40)
);


update qna_tbl set  qna_SECRET=1 where qna_no = 14;

SET DEFINE OFF
create table SUB_CATEGORY_TBL(
SC_NO number(4),
SC_NAME VARCHAR2(20),
SC_NO_REF NUMBER(4)
);

UPDATE product_tbl SET p_quantity='1' WHERE p_no=2;

CREATE TABLE CATEGORY_TBL(
	C_NO		NUMBER(4)		PRIMARY KEY,
	C_NAME	VARCHAR2(20)		NOT NULL
);


drop table PRODUCT_TBL cascade constraint;

create table PRODUCT_TBL(
P_NO			NUMBER									PRIMARY KEY,	
	P_NAME		VARCHAR2(40)									NOT NULL,
	P_SELLER		VARCHAR2(30)				NOT NULL, 	
	P_CATEGORY_NO	NUMBER(4)			NOT NULL,
	P_PRICE		NUMBER(10)									NOT NULL,
	P_IMG			VARCHAR2(100)								NOT NULL,
	P_QUANTITY		NUMBER(5)									NOT NULL,
	P_DESCRIPTION	VARCHAR2(4000)								NOT NULL,
	P_READCOUNT	NUMBER(10)		DEFAULT 0						NOT NULL,
	P_DIBS			NUMBER(10)		DEFAULT 0						NOT NULL,
	P_REGDATE		DATE			DEFAULT SYSDATE					NOT NULL

);


insert into category_tbl
values(100, '가구');
insert into category_tbl
values(200, '음식');
insert into category_tbl
values(300, '취미');

insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '침실','100');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '주방','100');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '수납','100');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '거실','100');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '욕실','100');

insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '한식','200');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '일식','200');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '양식','200');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '중식','200');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '베이킹','200');

insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '드로잉','300');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '미니어쳐','300');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '캔들&향수','300');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '슬라임','300');
insert into sub_category_tbl
values((select nvl(max(sc_no),0)+1 from sub_category_tbl), '악세서리','300');

insert into qna_tbl(QNA_NO, QNA_P_NO, QNA_SUBJECT, QNA_CONTENT,
		QNA_WRITER, QNA_DATE, QNA_CATEGORY, QNA_S_ID, QNA_SECRET)
		values('15', '0', '0', '0', '0', SYSDATE, '0', '0', '0');
		
		delete QNA_TBL;
		
CREATE TABLE QNA_TBL(
	QNA_NO 		NUMBER,
	QNA_P_NO		NUMBER,
	QNA_SUBJECT	VARCHAR2(100),
	QNA_CONTENT	VARCHAR2(1000),
	QNA_WRITER		VARCHAR2(20),
	QNA_DATE		DATE,
	QNA_CATEGORY	NUMBER(1),
	QNA_S_ID		VARCHAR2(20),	
	QNA_SECRET		NUMBER(1)		DEFAULT 0 	CHECK(QNA_SECRET IN(0,1))		NOT NULL
);

CREATE SEQUENCE QNA_NO;

alter table qna_tbl drop column qna_re_ref;

alter table qna_tbl add QNA_RE_REF NUMBER(4) DEFAULT 0;