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
*/


