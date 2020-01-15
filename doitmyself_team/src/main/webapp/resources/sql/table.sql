<!--유저 시퀀스 생성-->

CREATE SEQUENCE USER_SEQ;

<!--유저 테이블 생성-->

CREATE TABLE USER_TBL(
	USER_NO					NUMBER 								PRIMARY KEY,
	USER_ID					VARCHAR2(20)						UNIQUE NOT NULL,
	USER_PASSWORD			VARCHAR2(20)						NOT NULL,
	USER_NAME				VARCHAR2(20)						NOT NULL,
	USER_NICKNAME			VARCHAR2(50)						UNIQUE  NOT NULL,
	USER_ADDRESS			VARCHAR2(150)						NOT NULL,
	USER_POSTCODE			VARCHAR2(20)						NOT NULL,
	USER_PHONE				VARCHAR2(12)						NOT NULL,
	USER_EMAIL				VARCHAR2(30)						UNIQUE NOT NULL,
	USER_BIRTH				DATE								NOT NULL,
	USER_GENDER	 			VARCHAR2(1)							NOT NULL  CHECK(USER_GENDER IN('F', 'M')),
	USER_REGISTRATION_DATE 	DATE			DEFAULT SYSDATE		NOT NULL,
	USER_IS_ADMIN			NUMBER(1)		DEFAULT 0			NOT NULL
);



<!-- 카테고리 테이블 생성 -->
CREATE TABLE CATEGORY_TBL(
	C_NO		NUMBER(4)		PRIMARY KEY,
	C_NAME	VARCHAR2(20)		NOT NULL
);

<!--판매자 정보 테이블 생성-->
CREATE TABLE SELLER_TBL(
	SELLER_NO 		NUMBER												PRIMARY KEY,
	SELLER_NAME		VARCHAR2(30)										UNIQUE NOT NULL,
	SELLER_RATE		NUMBER				DEFAULT 0 						NOT NULL,
	SELLER_ID		VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)	NOT NULL,
	SELLER_ADDRESS	VARCHAR2(100)										NOT NULL,
	SELLER_POSTCODE	VARCHAR2(30)										NOT NULL
			
);


<!-- 상품 테이블 생성 -->
CREATE TABLE PRODUCT_TBL(
	P_NO			NUMBER													PRIMARY KEY,	
	P_NAME			VARCHAR2(40)											NOT NULL,
	P_SELLER		VARCHAR2(30)	REFERENCES SELLER_TBL(SELLER_NAME)		NOT NULL, 	
	P_CATEGORY_NO	NUMBER(4)		REFERENCES CATEGORY_TBL(C_NO)			NOT NULL,
	P_PRICE			NUMBER(10)												NOT NULL,
	P_IMG			VARCHAR2(100)											NOT NULL,
	P_QUANTITY		NUMBER(5)												NOT NULL,
	P_DESCRIPTION	VARCHAR2(4000)											NOT NULL,
	P_READCOUNT		NUMBER(10)		DEFAULT 0								NOT NULL,
	P_DIBS			NUMBER(10)		DEFAULT 0								NOT NULL,
	P_REGDATE		DATE			DEFAULT SYSDATE							NOT NULL
);


<!-- 상품 추가 사진 테이블 -->
CREATE TABLE IMG_TBL(
	IMG_NO		NUMBER												PRIMARY KEY,
	IMG_P_NO	NUMBER			REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	IMG_NAME	VARCHAR2(50)										NOT NULL
);




<!-- 질의 응답 테이블 -->
CREATE TABLE QNA_TBL(
	QNA_NO 			NUMBER														PRIMARY KEY,
	QNA_P_NO		NUMBER				REFERENCES PRODUCT_TBL(P_NO)			NOT NULL,
	QNA_SUBJECT		VARCHAR2(100)												NOT NULL,
	QNA_CONTENT		VARCHAR2(1000)												NOT NULL,
	QNA_WRITER		VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)			NOT NULL,
	QNA_DATE		DATE				DEFAULT SYSDATE							NOT NULL,
	QNA_CATEGORY	NUMBER(1)													NOT NULL,
	QNA_S_ID		VARCHAR2(20)												NOT NULL,	
	QNA_SECRET		NUMBER(1)			DEFAULT 0 	CHECK(QNA_SECRET IN(0,1))	NOT NULL
);

<!-- 찜 테이블 -->
CREATE TABLE DIBS_TBL(
	D_NO		NUMBER			  										PRIMARY KEY,
	D_P_NO		NUMBER				REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	D_USER_ID	VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)		NOT NULL
);



<!--주문/취소/반품/교환 내역 테이블-->
CREATE TABLE ORDER_TBL(
	ORDER_NO		NUMBER															PRIMARY KEY,
	ORDER_P_NO		NUMBER			REFERENCES PRODUCT_TBL(P_NO)					NOT NULL,
	ORDER_DELIVERY	NUMBER(1)		CHECK(ORDER_DELIVERY IN(0,1,2,3,4))				NOT NULL,
	ORDER_STATUS	NUMBER(1)		DEFAULT 0	CHECK(ORDER_STATUS IN(0,1,2,3))		NOT NULL,			
	ORDER_ID		VARCHAR2(20)	REFERENCES USER_TBL(USER_ID)					NOT NULL,
	ORDER_CATEGORY	NUMBER(4)		REFERENCES CATEGORY_TBL(C_NO)					NOT NULL,
	ORDER_PRICE		NUMBER(10)														NOT NULL,
	ORDER_PAYMENT	VARCHAR2(10)	CHECK(ORDER_PAYMENT IN ('kakaopay', 'deposit'))	NOT NULL,
	ORDER_ADDRESS	VARCHAR2(200)													NOT NULL,
	ORDER_DATE		DATE			DEFAULT SYSDATE									NOT NULL,
	ORDER_R_DATE	DATE,
	ORDER_SELLER	VARCHAR2(20)													NOT NULL,
	ORDER_TRNO		VARCHAR2(20)
);



<!--리뷰 테이블-->
CREATE TABLE REVIEW_TBL(
	REVIEW_NO		NUMBER											PRIMARY KEY,
	REVIEW_RATE		NUMBER(1)										NOT NULL,
	REVIEW_CONTENT	VARCHAR2(400)				 					NOT NULL,
	REVIEW_DATE		DATE			DEFAULT SYSDATE					NOT NULL,
	REVIEW_WRITER	VARCHAR2(20)	REFERENCES USER_TBL(USER_ID)	NOT NULL,
	REVIEW_P_NO		NUMBER			REFERENCES PRODUCT_TBL(P_NO)	NOT NULL,
	REVIEW_IMG		VARCHAR2(40)
);


<!--최근 본 상품 테이블-->
CREATE TABLE RECENT_VIEW_TBL(
	RV_ID		VARCHAR2(30)	REFERENCES USER_TBL(USER_ID)		NOT NULL,
	RV_P_NO		NUMBER			REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	RV_DATE		DATE			DEFAULT SYSDATE						NOT NULL,			
	RV_NO		NUMBER												NOT NULL	
);


<!--장바구니 테이블-->
CREATE TABLE CART_TBL(
	CART_NO 		NUMBER			PRIMARY KEY,
	CART_ID			VARCHAR2(20)	REFERENCES USER_TBL(USER_ID)		NOT NULL,
	CART_P_NO		NUMBER			REFERENCES PRODUCT_TBL(P_NO)		NOT NULL
);



<!--보안 인증 번호 테이블-->
CREATE TABLE SECURITY_NO_TBL(
	SN_NO		NUMBER(6),
	SN_ID		VARCHAR2(20)		REFERENCES USER_TBL(USER_ID)		PRIMARY KEY
);




<!--환불 테이블-->
CREATE TABLE REFUND_TBL(
	REFUND_NO		NUMBER		REFERENCES PRODUCT_TBL(P_NO)		NOT NULL,
	REFUND_P_NO		NUMBER		REFERENCES ORDER_TBL(ORDER_NO)		NOT NULL,
	REFUND_STATUS	NUMBER(1)	DEFAULT 0							NOT NULL
);
