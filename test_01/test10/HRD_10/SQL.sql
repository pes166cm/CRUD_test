create table tbl_player_info(
	registration_code char(4) not null primary key,
	name varchar2(18),
	birty_day varchar2(8),
	height number(3),
	weigth number(3)
);

insert into TBL_PLAYER_INFO values('A001', '김길동', '19900101', 180, 82);
insert into TBL_PLAYER_INFO values('A005', '이길동', '20000101', 190, 85);
insert into TBL_PLAYER_INFO values('A002', '홍길동', '19950101', 175, 75);
insert into TBL_PLAYER_INFO values('A006', '조길동', '19990101', 185, 80);

create table tbl_hitter_info(
	registration_code char(4) not null primary key,
	game_numbers number(3),
	appearance number(3),
	hit_numbers number(3),
	home_runs number(3),
	put_out number(3),
	double_play number(3),
	error_count number(3)
);


insert into tbl_hitter_info values('A001', 120, 330, 100, 20, 80, 27, 1);
insert into tbl_hitter_info values('A005', 110, 300, 110, 30, 60, 5, 2);
insert into tbl_hitter_info values('A002', 100, 270, 90, 5, 100, 10, 3);

 select registration_code from tbl_player_info
 minus
 select registration_code from tbl_hitter_info;