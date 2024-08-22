create table t9_artist(
	artist_id char(4) not null primary key,
	artist_name varchar2(20),
	artist_birth char(8),
	aritst_gender char(1),
	talent char(1),
	agency varchar2(20)
);


insert into T9_ARTIST values('A001', '황스타', '19970101', 'F', '1', 'A엔터테인먼트');
insert into T9_ARTIST values('A002', '정스타', '19980101', 'M', '2', 'B엔터테인먼트');
insert into T9_ARTIST values('A003', '박스타', '19990101', 'M', '3', 'C엔터테인먼트');
insert into T9_ARTIST values('A004', '김스타', '20000101', 'M', '1', 'D엔터테인먼트');
insert into T9_ARTIST values('A005', '서스타', '20010101', 'F', '2', 'E엔터테인먼트');

create table t9_mento(
	mento_id char(4) not null primary key,
	mento_name varchar2(20)
);

insert into t9_mento values('J001', '이멘토');
insert into t9_mento values('J002', '안멘토');
insert into t9_mento values('J003', '한멘토');

create table t9_point(
	serial_no char(4) not null primary key,
	artist_id varchar2(4),
	mento_id char(8),
	point number(6)
);

insert into t9_point values('P001', 'A001', 'J001', '84');
insert into t9_point values('P002', 'A001', 'J002', '82');
insert into t9_point values('P003', 'A001', 'J003', '86');
insert into t9_point values('P004', 'A002', 'J001', '98');
insert into t9_point values('P005', 'A002', 'J002', '99');
insert into t9_point values('P006', 'A002', 'J003', '100');
insert into t9_point values('P007', 'A003', 'J001', '23');
insert into t9_point values('P008', 'A003', 'J002', '43');
insert into t9_point values('P009', 'A003', 'J003', '34');
insert into t9_point values('P010', 'A004', 'J001', '67');
insert into t9_point values('P011', 'A004', 'J002', '56');
insert into t9_point values('P012', 'A004', 'J003', '89');
insert into t9_point values('P013', 'A005', 'J001', '3');
insert into t9_point values('P014', 'A005', 'J002', '6');
insert into t9_point values('P015', 'A005', 'J003', '9');

--참가자 목록 (참가자번호, 참가자명, 생년월일, 성별, 특기, 소속사)
select 
	artist_id,
	artist_name,
	substr(artist_birth, 1, 4) || '년' || substr(artist_birth, 5, 2) || '월' || substr(artist_birth, 7, 2) || '일' as birth,
	decode(aritst_gender, 'F', '여자', 'M', '남자') as gender,
	decode(talent, '1', '보컬', '2', '댄스', '3', '랩') as talent,
	agency
from t9_artist;

--멘토점수 리스트 (참가번호, 참가자명, 생년월일, 점수, 등급, 멘토)
select 
	C.serial_no,
	A.artist_name,
	substr(A.artist_birth, 1, 4) || '년' || substr(A.artist_birth, 5, 2) || '월' || substr(A.artist_birth, 7, 2) || '일' as birth,
	C.point,
	case
		when C.point >= 90 then 'A' 
		when C.point >= 80 then 'B' 
		when C.point >= 70 then 'C' 
		when C.point >= 60 then 'D' 
		else 'F'
	end as point_two,
	B.mento_name
from t9_artist A, t9_mento B, t9_point C
where B.mento_id = C.mento_id and C.artist_id = A.artist_id;
	
--참가자 등위(참가자명, 합산점수, 평균, 등위)
select
	A.artist_name,
	round(sum(B.point),1) as sum_point,
	round(avg(B.point),1) as avg_point,
	rank() over(order by sum(B.point) desc) as rank
from t9_artist A, t9_point B
where A.artist_id = B.artist_id
group by A.artist_name
order by rank;