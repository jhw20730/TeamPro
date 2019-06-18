-------------shop 계정 만들기---------------

drop user shop cascade;

-- oracle 계정: shop / 비밀번호: shop
create user shop
identified by shop;

grant connect, resource to shop;
grant create view, create synonym to shop;

alter user shop account unlock;

-------------상품(tbl_product) 테이블-----------------
create table tbl_product(
    productCode varchar2(100),
    productName varchar2(100), 
    manufacturer varchar2(100),
    price number,
    description varchar2(300),
    os varchar2(50),
    productType varchar2(100),
    stock number,
    usability varchar2(50)
);
--기본키 설정(productCode)--
alter table tbl_product add constraint pk_product primary key (productCode);

drop table tbl_product;
delete from tbl_product;
commit;
---------사용자(tbl_user) 테이블------------------
create table tbl_user(
    id varchar2(50),
    password varchar2(250),
    name varchar2(50),
    address varchar2(100),
    contact varchar2(50),
    email varchar2(50),
    point number,
    regiDate DATE,
    updateDate DATE,
    enabled char(1)
);
--기본키 설정(id)--
alter table tbl_user add constraint pk_user primary key (id);
--처음 가입하면 point는 default값으로 10000 / 보너스 포인트: 10000
alter table tbl_user modify (point default 10000);
--regiDate는 default값으로 sysdate
alter table tbl_user modify (regiDate default sysdate);
--속성값 수정--
alter table tbl_user add (enabled char(1) default '1');
alter table tbl_user add (updateDate date default sysdate);

drop table tbl_user;
delete from tbl_user;
commit;

---------사용자 인증정보(tbl_user_auth) 테이블--------------
create table tbl_user_auth(
    id varchar2(50),
    auth varchar2(50),
    constraint fk_user_auth foreign key(id) references tbl_user(id) on delete cascade
);

create unique index ix_auth_id on tbl_user_auth (id, auth);
alter table tbl_user_auth modify (auth default 'ROLE_MEMBER');
alter table tbl_user_auth add constraint 
fk_user_auth foreign key(id) references tbl_user(id) on delete cascade;
commit;

delete from tbl_user_auth;
drop table tbl_user_auth;
---------장바구니(tbl_cart) 테이블------------------
create table tbl_cart(
    cartNo NUMBER,
    productCode VARCHAR2(100),
    id varchar2(50),
    amount number,
    price number
);
create sequence tbl_cart_seq
start with 1
increment by 1;
--기본키(복합키) 설정(cartNo, id, productCode)--
alter table tbl_cart add constraint pk_cart primary key (cartNo, id, productCode);
--외래키 설정(productCode)--
alter table tbl_cart add constraint fk_cart1
foreign key (productCode) references tbl_product (productCode);
--외래키 설정(id)
alter table tbl_cart add constraint fk_cart2
foreign key (id) references tbl_user (id) on delete cascade;
--새로운 행 추가(price, productName, description) --
alter table tbl_cart add (price number);
alter table tbl_cart add (productName varchar2(100));
alter table tbl_cart add (description varchar2(300));
delete from tbl_cart;
drop table tbl_cart;

commit;
---------결제(tbl_payment) 테이블----------------
create table tbl_payment(
    payNo number,
    cartNo number,
    id varchar2(50),
    name varchar2(50),
    amount number,
    address varchar2(100),
    payDate DATE,
    contact varchar2(50),
    price number
);
--결제 시퀸스(tbl_payment_seq) 결제번호(payNo)에 적용--
create sequence tbl_payment_seq
start with 1
increment by 1;
--기본키 설정(payNo, cartNo, id, productCode)--
alter table tbl_payment add constraint pk_payment primary key (payNo, cartNo, id, productCode);
--외래키 설정(cartNo, id, productCode)-- 
alter table tbl_payment add constraint fk_payment1
foreign key (cartNo, id, productCode) references tbl_cart (cartNo, id, productCode);
--payDate 디폴트 값으로 sysdate--
alter table tbl_payment modify (payDate date default sysdate);
alter table tbl_payment add (productCode varchar2(100));
alter table tbl_payment drop column productCode;

commit;
delete from tbl_payment;
drop table tbl_payment;
---------결제(tbl_payment_detail) 테이블----------------
create table tbl_payment_detail(
    detailNo number,
    cartNo number,
    payNo number,
    id varchar2(50),
    productCode varchar2(100),
    amount NUMBER,
    payDate date
);
--기본키 설정(detailNo)--
alter table tbl_payment_detail add constraint pk_payment_detail primary key (detailNo);
--외래키 설정(payNo, id, productCode)-- 
alter table tbl_payment_detail add constraint fk_payment_detail
foreign key (payNo, cartNo, id, productCode) references tbl_payment (payNo, cartNo, id, productCode);
--tbl_payment_detail 시퀸스(tbl_payment_detail_seq) 결제번호(detailNo)에 적용--
create sequence tbl_payment_detail_seq
start with 1
increment by 1;
--payDate 디폴트 값으로 sysdate--
alter table tbl_payment_detail modify (payDate date default sysdate);

delete from tbl_payment_detail;
drop table tbl_payment_detail;
commit;
---------카테고리(tbl_category) 테이블.....기본키 설정과 외래키 설정해야함-----------
create table tbl_category(
    cateCode varchar2(30),
    productCode varchar2(100),
    productType varchar2(100),
    cateCodeRef varchar2(30)
);
--기본키 설정(cateCode)--
alter table tbl_category add constraint pk_category primary key (cateCode);
--외래키 설정(productCode)-- 
alter table tbl_category add constraint fk_category1
foreign key (productCode) references tbl_product (productCode);
--외래키 설정(cateCodeRef)-- 
alter table tbl_category add constraint fk_category2
foreign key (cateCodeRef) references tbl_category (cateCode);

drop table tbl_category;
commit;
---------리뷰(tbl_review) 테이블-----------------
create table tbl_review(
    reviewNo number,
    cartNo number,
    productCode varchar2(100),
    payNo NUMBER,
    id varchar2(50),
    name varchar2(50),
    content varchar2(300),
    reviewPoint number,
    reviewDate DATE
);
--리뷰 시퀸스(tbl_review_seq) 리뷰글번호(reviewNo)에 적용--
create sequence tbl_review_seq
start with 1
increment by 1;
--기본키 설정(reviewNo, cartNo, productCode, payNo, id)--
alter table tbl_review add constraint pk_review primary key (reviewNo, cartNo, productCode, payNo, id);
--외래키 설정(payNo, cartNo, id, productCode)-- 
alter table tbl_review add constraint fk_review
foreign key (payNo, cartNo, id, productCode) references tbl_payment (payNo, cartNo, id, productCode);

drop sequence tbl_review_seq;
drop table tbl_review;
delete from tbl_review;
commit;
---------문의(tbl_inquiry) 테이블---------------
create table tbl_inquiry(
   inquiryNo number,
   id varchar2(50),
   name varchar2(50),
   title varchar2(100),
   content varchar2(300),
   inquiryDate DATE
);
--문의 시퀀스(tbl_inquiry_seq) 문의 글번호(inquiryNo)에 적용--
create sequence tbl_inquiry_seq
start with 1
increment by 1;
--기본키 설정(inquiryNo)--
alter table tbl_inquiry add constraint pk_inquiry primary key (inquiryNo);
--아이디(id) 외래키 설정--
alter table tbl_inquiry add constraint fk_inquiry
foreign key (id) references tbl_user (id) on delete cascade;

--열 삭제(password)
alter table tbl_inquiry drop column password;
--inquityDate 디폴트값으로 sysdate--
alter table tbl_inquiry modify (inquiryDate default sysdate);
alter table tbl_inquiry drop constraint pk_inquiry;
drop sequence tbl_inquiry_seq;
drop table tbl_inquiry;
delete from tbl_inquiry;
commit;
---------답변(tbl_reply) 테이블-----------------
create table tbl_reply(
    replyNo number,
    inquiryNo number,
    id varchar2(50),
    title varchar2(100),
    content varchar2(300),
    replyDate DATE
);
--답변 시퀀스(tbl_reply_seq) 답변 글번호(replyNo)에 적용--
create sequence tbl_reply_seq
start with 1
increment by 1;
--기본키 설정(replyNo)--
alter table tbl_reply add constraint pk_reply primary key (replyNo);

--외래키 설정(inquiryNo, id)--
alter table tbl_reply add constraint fk_reply
foreign key (inquiryNo) references tbl_inquiry (inquiryNo) on delete cascade;

--replyDate 디폴트값으로 sysdate--
alter table tbl_reply modify (replyDate default sysdate);
drop sequence tbl_reply_seq;
drop table tbl_reply;
delete from tbl_reply;
commit;
---------공지(tbl_notice) 테이블---------------
create table tbl_notice(
   noticeNo number,
   id varchar2(50),
   title varchar2(100),
   content varchar2(300),
   noticeDate DATE
);
--공지 시퀀스(tbl_notice_seq) 공지 글번호(noticeNo)에 적용--
create sequence tbl_notice_seq
start with 1
increment by 1;
--기본키 설정(noticeNo)--
alter table tbl_notice add constraint pk_notice primary key (noticeNo);
--아이디(id) 외래키 설정--
alter table tbl_notice add constraint fk_notice
foreign key (id) references tbl_user (id);
--noticeDate 디폴트값으로 sysdate--
alter table tbl_notice modify (noticeDate default sysdate);
alter table tbl_notice drop constraint pk_notice;
drop sequence tbl_notice_seq;
drop table tbl_notice;
delete from tbl_notice;
commit;
--------------------------------------------------
SELECT 
  mem.id, password, name, address, contact, email, enabled, regiDate, updateDate, auth
FROM 
  TBL_USER mem LEFT OUTER JOIN TBL_USER_AUTH auth on mem.id = auth.id
WHERE mem.id = 'admin'; 
