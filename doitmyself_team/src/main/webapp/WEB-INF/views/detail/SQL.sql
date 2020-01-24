alter table

select * from qna_tbl;

select * from user_tbl;

select * from user_sys_privs;

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