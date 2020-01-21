drop table member CASCADE CONSTRAINTS;

create table member(
id varchar2(15),
password varchar2(10),
name varchar2(15),
age Number,
gender varchar2(5),
email varchar2(30),
primary key(id)
);

select * from member;

drop table board CASCADE CONSTRAINTS;

create table board(
  BOARD_NUM NUMBER,
  BOARD_NAME VARCHAR2(30),
  BOARD_PASS VARCHAR2(30),
  BOARD_SUBJECT VARCHAR2(300),
  BOARD_CONTENT VARCHAR2(4000),
  BOARD_FILE VARCHAR2(50),
  BOARD_ORIGINAL VARCHAR2(50),
  BOARD_RE_REF NUMBER,
  BOARD_RE_LEV NUMBER,
  BOARD_RE_SEQ NUMBER,
  BOARD_READCOUNT NUMBER,
  BOARD_DATE DATE,
  PRIMARY KEY(BOARD_NUM)
);

select * from board;

drop table comments;

create table comments(
  num number primary key,
  id varchar2(30) references member(id),
  content varchar2(200),
  reg_date date,
  board_re_ref number references board(board_num) on delete cascade
);

select * from comments;

DROP SEQUENCE com_seq;

create sequence com_seq;

create table delete_File(
 BOARD_FILE VARCHAR2(50) primary key
);
select * from delete_file;


select * from qna_tbl;

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