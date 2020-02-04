insert into order_tbl
values(1,1,0,0,'ccorcle',302,30000,'deposit','서울시 용산구',sysdate,'','가게이름1','TR232f23',2);
insert into order_tbl
values(2,1,0,0,'ccorcle',203,30000,'deposit','서울시 용산구',sysdate,'','가게이름1','TR52d235',2);
insert into order_tbl
values(3,1,0,0,'ccorcle',101,30000,'kakaopay','서울시 용산구',sysdate,'','가게이름1','TR374d523',2);
insert into order_tbl
values(4,1,0,0,'ccorcle',202,30000,'deposit','서울시 용산구',sysdate,'','가게이름1','TR232as35858',2);
insert into order_tbl
values(5,1,0,0,'ccorcle',102,30000,'kakaopay','서울시 용산구',sysdate,'','가게이름1','TR23276gj873',2);
insert into order_tbl
values(6,1,0,0,'ccorcle',103,30000,'deposit','서울시 용산구',sysdate,'','가게이름1','TR232g3',2);

insert into order_tbl
values(7,1,2,1,'ccorcle',103,30000,'kakaopay','서울시 용산구',sysdate,'','가게이름1','TR2s32gg3',2);
insert into order_tbl
values(8,1,3,2,'ccorcle',103,30000,'kakaopay','서울시 용산구',sysdate,'','가게이름1','TR2s32gg3',2);


insert into order_tbl
values(15,1,4,1,'ccorcle',103,306400,'kakaopay','서울시 중구',sysdate,'','가게이름1','TdRer2s32gg3',2);

insert into order_tbl
values(16,1,4,1,'admin234in2',103,33400,'deposit','서울시 마포구',sysdate,'','가게이름1','TdR2s371g3',2);

insert into order_tbl
values(17,1,4,2,'admdin2',103,70000,'kakaopay','서울시 노원구',sysdate,'','가게이름1','TdR24445g3',2);

insert into order_tbl
values(18,1,4,2,'ajaava',103,830000,'deposit','서울시 영등포구',sysdate,'','가게이름1','TdR99975gg3',2);




select *from ORDER_TBL;



select * from PRODUCT_TBL;

select user_id from user_tbl;



select o.*, r.*
from order_tbl o full outer join refund_tbl r
on o.order_no = r.refund_no
where o.order_delivery>=1 and order_status=1 or order_status=2;


select * from ORDER_TBL
where order_delivery = 4 AND ORDER_STATUS = 3;


select * from sub_category_tbl;

delete from CATEGORY_TBL where c_no = 1;