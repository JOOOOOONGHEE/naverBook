CREATE SCHEMA `nbdevdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

use nbdevdb;

create table tb_member (
	member_id varchar(225) not null,
	password varchar(225) not null,
    name varchar(225) not null,
    phone_number varchar(225) not null,
    brthdy varchar(225) not null,
    gender char(1) not null,
    email varchar(225) not null,
    constraint tb_member_pk primary key(member_id)
);

create table tb_member (
	member_id varchar(225) not null,
	password varchar(225) not null,
    name varchar(225) not null,
    phone_number varchar(225) not null,
    brthdy varchar(225) not null,
    gender char(1) not null,
    email varchar(225) not null,
    constraint tb_member_pk primary key(member_id)
);

ALTER TABLE `nbdevdb`.`tb_member` 
ADD COLUMN `regist_dt` DATETIME NOT NULL AFTER `email`,
ADD COLUMN `updt_dt` DATETIME NOT NULL AFTER `regist_dt`;

create table tb_mrhst (
	mrhst_id varchar(225) not null,
    mrhst_name varchar(225) not null,
    mrhst_tlphon varchar(225) not null,
    mrhst_adres varchar(225) not null,
    mrhst_hmpg text,
    regist_dt datetime not null,
    updt_dt datetime not null,
    member_id varchar(225) not null, 
    constraint tb_mrhst_pk primary key(mrhst_id),
    constraint tb_mrhst_fk1 foreign key(member_id) references tb_member(member_id)
);

ALTER TABLE `nbdevdb`.`tb_member` 
DROP COLUMN `mrhst_sttus_code`;

ALTER TABLE `nbdevdb`.`tb_mrhst` 
ADD COLUMN `mrhst_sttus_code` varchar(225) NOT NULL AFTER `mrhst_hmpg`;

create table tb_item (
	item_id bigint not null auto_increment primary key,
    mrhst_id varchar(225) not null,
    item_name varchar(225) not null,
    item_price varchar(225) not null,
    etc text,
    item_max_cnt bigint not null,
    item_sttus_code varchar(225) NOT NULL,
	regist_dt datetime not null,
    updt_dt datetime not null,
    constraint tb_item_fk1 foreign key(mrhst_id) references tb_mrhst(mrhst_id)
);

/*
예약 테이블을 어떻게 해야할지 잘 모르겠어요..
예를 들면 예약 가능 일자, 예약 가능 시간, 예약 가능 시간에 가능한 인원수
어떻게 해야하나요..

--> 
예약 정보 테이블에는
(id, 상호명, 예약 가능 요일, 예약 가능 시간, 예약 기간   )
실제 예약 테이블에는
id, 예약자 id, 에약 날짜, 예약 정보 (위의 예약 정보테이블 foreign key)
*/

/*
시간당 예약 가능 수, 실제 예약 수, 예약 가능 여부
예를 들면 
이 가맹점은 최대 4명 밖에 못들어오고 최대 1시간 30분만 이용할 수 있다.
근데 한번에 9시에 4명이 예약했으면 
9:00/9:30/10:00/10:30 선택 란을 막아야 하는건가?
그건 어떻게 테이블을 짜야할지 고민되요!
*/
create table tb_resve_info (
	resve_info_id bigint not null auto_increment primary key,
    item_id bigint not null,
    resve_info_day varchar(225),
    resve_info_time varchar(225),
    regist_dt datetime not null,
    updt_dt datetime not null,
    constraint tb_resve_info_fk1 foreign key(item_id) references tb_item(item_id)
);

create table tb_resve (
	resve_id bigint not null auto_increment primary key,
    member_id varchar(225) not null, 
    resve_info_id bigint not null,
    constraint tb_resve_fk1 foreign key(member_id) references tb_member(member_id),
    constraint tb_resve_fk2 foreign key(resve_info_id) references tb_resve_info(resve_info_id)
)


