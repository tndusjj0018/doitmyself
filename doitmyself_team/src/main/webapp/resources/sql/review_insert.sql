create sequence review_seq;

insert into PRODUCT_TBL
values(1, '콩콩','가게이름1',203,20000,'no-image',23,'딱히 할 설명이 없당',0,0,sysdate);


insert into review_tbl
values(review_seq.nextval, 1, '정말  soso 한 맛이네요 ㅡㅡ 3점 주기도 아까움', sysdate, 'java', 1,'');

insert into review_tbl
values(review_seq.nextval, 1, '난 맛있었는데 프로불편러임?', sysdate, 'ccorcle', 1,'');

insert into review_tbl
values(review_seq.nextval, 1, '그래서 1점 줌 ㅅㄱ', sysdate, 'java', 1,'');

insert into review_tbl
values(review_seq.nextval, 5, '아 ㅈㅅ 1점 나감', sysdate, 'ccorcle', 1,'');




select * from product_tbl;
select * from review_tbl;

drop table DIBS_TBL;
drop table QNA_TBL;
drop table IMG_TBL;
drop table RECENT_VIEW_TBL;
drop table CART_TBL;
drop table REFUND_TBL;
drop table review_tbl;
drop table ORDER_TBL;
drop table product_tbl;
