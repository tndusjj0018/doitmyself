--�쑀�� �떆���뒪 �깮�꽦
CREATE SEQUENCE USER_SEQ;

--�쑀�� �뀒�씠釉� �깮�꽦
CREATE TABLE USER_TBL(
	USER_NO				NUMBER 				PRIMARY KEY,
	USER_ID				VARCHAR2(20)		UNIQUE 				NOT NULL,
	USER_PASSWORD		VARCHAR2(20)							NOT NULL,
	USER_NAME			VARCHAR2(20)							NOT NULL,
	USER_ADDRESS		VARCHAR2(150)							NOT NULL,
	USER_POSTCODE		VARCHAR2(20)							NOT NULL,
	USER_PHONE			VARCHAR2(12)							NOT NULL,
	USER_EMAIL			VARCHAR2(30)		UNIQUE 				NOT NULL,
	USER_BIRTH			VARCHAR2(8)								NOT NULL,
	USER_GENDER	 		VARCHAR2(1)			NOT NULL  			CHECK(USER_GENDER IN('F', 'M' , 'U')),
	USER_REGISTRATION_DATE 	DATE			DEFAULT SYSDATE		NOT NULL,
	USER_IS_ADMIN		NUMBER(1)			DEFAULT 0 			NOT NULL
);

select * from user_tbl

--移댄뀒怨좊━ �뀒�씠釉� �깮�꽦
CREATE TABLE CATEGORY_TBL(
	C_NO		NUMBER(4)					PRIMARY KEY,
	C_NAME		VARCHAR2(20)				NOT NULL
);

--insert into CATEGORY_TBL values(101 , 'test') 

--�뙋留ㅼ옄 �젙蹂� �뀒�씠釉� �깮�꽦
CREATE TABLE SELLER_TBL(
	SELLER_NO 			NUMBER				PRIMARY KEY,
	SELLER_NAME			VARCHAR2(30)		UNIQUE 							NOT NULL,
	SELLER_RATE			NUMBER				DEFAULT 0 						NOT NULL,
	SELLER_ID			VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)	NOT NULL,
	SELLER_ADDRESS		VARCHAR2(100)										NOT NULL,
	SELLER_POSTCODE		VARCHAR2(30)										NOT NULL
);

--select * from SELLER_TBL

--�긽�뭹 �뀒�씠釉� �깮�꽦
CREATE TABLE PRODUCT_TBL(
	P_NO			NUMBER					PRIMARY KEY,	
	P_NAME			VARCHAR2(40)													NOT NULL,
	P_SELLER		VARCHAR2(30)			REFERENCES SELLER_TBL(SELLER_NAME)		NOT NULL, 	
	P_CATEGORY_NO	NUMBER(4)				REFERENCES CATEGORY_TBL(C_NO)			NOT NULL,
	P_PRICE			NUMBER(10)														NOT NULL,
	P_IMG			VARCHAR2(100)													NOT NULL,
	P_QUANTITY		NUMBER(5)														NOT NULL,
	P_DESCRIPTION	VARCHAR2(4000)													NOT NULL,
	P_READCOUNT		NUMBER(10)				DEFAULT 0								NOT NULL,
	P_DIBS			NUMBER(10)				DEFAULT 0								NOT NULL,
	P_REGDATE		DATE					DEFAULT SYSDATE							NOT NULL
);
--insert into product_tbl values(7 , 'test7' , 'qweqrqqr' , 101 , 110000 , '11' , 1100 , 'test以�7' , 499 , 5515 , sysdate);
--insert into product_tbl values(8 , 'test8' , 'qweqrqqr' , 101 , 340000 , '11' , 5500 , 'test以묐떎8' , 21500 ,15 , sysdate);
--insert into product_tbl values(9 , 'test9' , 'qweqrqqr' , 101 , 4330000 , '11' , 6400 , 'test以�9' , 120 , 552 , sysdate);
--insert into product_tbl values(10 , 'test10' , 'qweqrqqr' , 101 , 2000000 , '11' , 220 , 'test以묒엯�땲�꽕�떎10' , 20 , 125 , sysdate);
--insert into product_tbl values(5 , 'test6' , 'qweqrqqr' , 101 , 6000 , '11' , 130 , 'test以묒엯�땲�떎ddd5' , 50 , 333 , sysdate);
insert into product_tbl values(11 , 'test11' , 'qweqrqqr' , 101 , 24000 , '11' , 1220 , 'test以묒엯�땲�꽕�떎11' , 221 , 1225 , sysdate);
insert into product_tbl values(12 , 'test12' , 'qweqrqqr' , 101 , 60200 , '11' , 1430 , 'test以묒엯�땲�떎12' , 545 , 38 , sysdate);

--�긽�뭹 異붽� �궗吏� �뀒�씠釉�
CREATE TABLE IMG_TBL(
	IMG_NO		NUMBER														PRIMARY KEY,
	IMG_P_NO	NUMBER						REFERENCES PRODUCT_TBL(P_NO)	NOT NULL,
	IMG_NAME	VARCHAR2(50)												NOT NULL
);

--吏덉쓽 �쓳�떟 �뀒�씠釉�
CREATE TABLE QNA_TBL(
	QNA_NO 	NUMBER																	PRIMARY KEY,
	QNA_P_NO	NUMBER						REFERENCES PRODUCT_TBL(P_NO)			NOT NULL,
	QNA_SUBJECT	VARCHAR2(100)														NOT NULL,
	QNA_CONTENT	VARCHAR2(1000)														NOT NULL,
	QNA_WRITER	VARCHAR2(20)				REFERENCES USER_TBL(USER_ID)			NOT NULL,
	QNA_DATE	DATE						DEFAULT SYSDATE							NOT NULL,
	QNA_CATEGORY	NUMBER(1)														NOT NULL,
	QNA_S_ID	VARCHAR2(20)														NOT NULL,	
	QNA_SECRET	NUMBER(1)					DEFAULT 0 	CHECK(QNA_SECRET IN(0,1))	NOT NULL ,
	QNA_ISRESPONSE NUMBER(1) 				DEFAULT 0 
);

DROP TABLE QNA_TBL;

--李� �뀒�씠釉�
CREATE TABLE DIBS_TBL(
	D_NO		NUMBER			  												PRIMARY KEY,
	D_P_NO		NUMBER						REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	D_USER_ID	VARCHAR2(20)				REFERENCES USER_TBL(USER_ID)		NOT NULL
);

--二쇰Ц/痍⑥냼/諛섑뭹/援먰솚 �궡�뿭 �뀒�씠釉�
CREATE TABLE ORDER_TBL(
	ORDER_NO		NUMBER																	PRIMARY KEY,
	ORDER_P_NO		NUMBER					REFERENCES PRODUCT_TBL(P_NO)					NOT NULL,
	ORDER_DELIVERY	NUMBER(1)				CHECK(ORDER_DELIVERY IN(0,1,2,3,4))				NOT NULL,
	ORDER_STATUS	NUMBER(1)				DEFAULT 0	CHECK(ORDER_STATUS IN(0,1,2,3))		NOT NULL,			
	ORDER_ID		VARCHAR2(20)			REFERENCES USER_TBL(USER_ID)					NOT NULL,
	ORDER_CATEGORY	NUMBER(4)				REFERENCES CATEGORY_TBL(C_NO)					NOT NULL,
	ORDER_PRICE		NUMBER(10)																NOT NULL,
	ORDER_PAYMENT	VARCHAR2(10)			CHECK(ORDER_PAYMENT IN ('kakaopay', 'deposit'))	NOT NULL,
	ORDER_ADDRESS	VARCHAR2(200)															NOT NULL,
	ORDER_DATE		DATE					DEFAULT SYSDATE									NOT NULL,
	ORDER_R_DATE	DATE,
	ORDER_SELLER	VARCHAR2(20)															NOT NULL,
	ORDER_TRNO		VARCHAR2(20)
);

--由щ럭 �뀒�씠釉�
CREATE TABLE REVIEW_TBL(
	REVIEW_NO		NUMBER					PRIMARY KEY,
	REVIEW_RATE		NUMBER(1)													NOT NULL,
	REVIEW_CONTENT	VARCHAR2(400)				 								NOT NULL,
	REVIEW_DATE		DATE					DEFAULT SYSDATE						NOT NULL,
	REVIEW_WRITER	VARCHAR2(20)			REFERENCES USER_TBL(USER_ID)		NOT NULL,
	REVIEW_P_NO		NUMBER					REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	REVIEW_IMG		VARCHAR2(40)
);

--理쒓렐 蹂� �긽�뭹 �뀒�씠釉�
CREATE TABLE RECENT_VIEW_TBL(
	RV_ID		VARCHAR2(30)				REFERENCES USER_TBL(USER_ID)		NOT NULL,
	RV_P_NO		NUMBER						REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	RV_DATE		DATE						DEFAULT SYSDATE						NOT NULL,			
	RV_NO		NUMBER															NOT NULL	
);	

	SELECT PT.P_IMG , RVT.RV_NO FROM
		RECENT_VIEW_TBL RVT JOIN PRODUCT_TBL PT
		ON RV_P_NO = P_NO
		WHERE RV_ID = 'qweqrqqr'
		ORDER BY RV_NO DESC;

--�옣諛붽뎄�땲 �뀒�씠釉�
CREATE TABLE CART_TBL(
	CART_NO 	NUMBER															PRIMARY KEY,
	CART_ID		VARCHAR2(20)				REFERENCES USER_TBL(USER_ID)		NOT NULL,
	CART_P_NO	NUMBER						REFERENCES PRODUCT_TBL(P_NO)		NOT NULL
);

--insert into cart_tbl values(1111,'sun112',1);
--insert into cart_tbl values(11112,'sun112',1);
--insert into cart_tbl values(11113,'sun112',1);

--蹂댁븞 �씤利� 踰덊샇 �뀒�씠釉�
CREATE TABLE SECURITY_NO_TBL(
	SN_NO		NUMBER(6),
	SN_ID		VARCHAR2(20)				REFERENCES USER_TBL(USER_ID)		PRIMARY KEY
);

--�솚遺� �뀒�씠釉�
CREATE TABLE REFUND_TBL(
	REFUND_NO		NUMBER					REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	REFUND_P_NO		NUMBER					REFERENCES ORDER_TBL(ORDER_NO)		NOT NULL,
	REFUND_STATUS	NUMBER(1)				DEFAULT 0							NOT NULL
);

--
--drop sequence user_seq;
--drop table cart_tbl;
--drop table category_tbl;
--drop table dibs_tbl;
--drop table img_tbl;
--drop table order_tbl;
--drop table product_tbl;
--drop table qna_tbl;
--drop table recent_view_tbl;
--drop table refund_tbl;
--drop table review_tbl;
--drop table security_no_tbl;
--drop table seller_tbl;
--drop table user_tbl;
--
