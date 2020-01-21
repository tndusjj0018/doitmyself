<!-- seller -->
insert into seller_tbl
values (1,'내가 1빠',3,'ccorcle','서울시 중구','110-45','11111-4567-4545');

INSERT INTO seller_tbl 
VALUES((select nvl(max(SELLER_NO),0)+1 from seller_tbl),'가게이름1',0,'ccorcle','서울시 종로구','123-12','12-1234-12345');

INSERT INTO seller_tbl 
VALUES((select nvl(max(SELLER_NO),0)+1 from seller_tbl),'가게이름2',0,'java','서울시 도봉구','123-12','12-1234-12345');

INSERT INTO seller_tbl 
VALUES((select nvl(max(SELLER_NO),0)+1 from seller_tbl),'가게이름3',0,'admin','서울시 동대문구','123-12','12-1234-12345');


insert into CATEGORY_TBL 
values(1,'식품');

insert into PRODUCT_TBL
values(1, '맛있는거','내가 1빠',1,20000,'apple.jpg',5,'사과는 맛있어',2,1,sysdate);




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