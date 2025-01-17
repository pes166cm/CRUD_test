create table t6_jumin(
	j_jumin varchar2(20) not null primary key,
	j_name varchar2(15),
	j_phone varchar2(15),
	j_address varchar2(50)
);


insert into t6_jumin values('710101-1000001', '김주민', '010-1111-1111', '경기도 성남시 수정구 태평1동');
insert into t6_jumin values('720101-1000001', '이주민', '010-1111-2222', '경기도 성남시 수정구 태평2동');
insert into t6_jumin values('730101-1000001', '박주민', '010-1111-3333', '경기도 성남시 수정구 복정동');
insert into t6_jumin values('740101-1000001', '홍주민', '010-1111-4444', '경기도 성남시 수정구 산성동');
insert into t6_jumin values('750101-1000001', '조주민', '010-1111-5555', '경기도 성남시 수정구 성남동');
insert into t6_jumin values('760101-1000001', '최주민', '010-1111-6666', '경기도 성남시 수정구 중앙동');
insert into t6_jumin values('770101-1000001', '장주민', '010-1111-7777', '경기도 성남시 수정구 상대원동');
insert into t6_jumin values('780101-1000001', '정주민', '010-1111-8888', '경기도 성남시 수정구 하대원동');
insert into t6_jumin values('790101-1000001', '강주민', '010-1111-9999', '경기도 성남시 수정구 야탑1동');
insert into t6_jumin values('800101-1000001', '신주민', '010-2222-1111', '경기도 성남시 수정구 야탑2동');

create table t6_hosp(
	h_code char(4) not null primary key,
	h_name varchar2(40),
	h_tel varchar2(15),
	h_zone varchar2(2)
);

insert into t6_hosp values('H001', '가_병원', '031-1111-2222', '10');
insert into t6_hosp values('H002', '나_병원', '031-1111-3333', '20');
insert into t6_hosp values('H003', '다_병원', '031-1111-4444', '30');
insert into t6_hosp values('H004', '라_병원', '031-1111-5555', '40');

create table t6_resv(
	r_no number(8) not null primary key,
	j_jumin varchar2(20),
	h_code char(4), 
	r_date date,
	r_time number(4),
	r_vcode char(4)
);

select * from T6_RESV;

insert into t6_resv values(20210001, '710101-1000001', 'H001', '20210801', '0930', 'V001');
insert into t6_resv values(20210002, '720101-1000001', 'H002', '20210801', '1030', 'V002');
insert into t6_resv values(20210003, '730101-1000001', 'H003', '20210801', '1130', 'V003');
insert into t6_resv values(20210004, '740101-1000001', 'H001', '20210801', '1230', 'V001');
insert into t6_resv values(20210005, '750101-1000001', 'H001', '20210801', '1330', 'V002');
insert into t6_resv values(20210006, '760101-1000001', 'H002', '20210801', '1430', 'V003');
insert into t6_resv values(20210007, '770101-1000001', 'H003', '20210801', '1530', 'V001');
insert into t6_resv values(20210008, '780101-1000001', 'H001', '20210801', '1630', 'V002');
insert into t6_resv values(20210009, '790101-1000001', 'H001', '20210801', '1730', 'V003');
insert into t6_resv values(20210010, '800101-1000001', 'H002', '20210801', '1830', 'V001');

select 
	h_code,
	h_name,
	h_tel,
	decode(h_zone, '10', '서울', '20', '대전', '30', '대구', '40', '광주') as h_zone
from t6_hosp;


select 
	A.r_no,
	B.j_name,
	decode(substr(B.j_jumin, 8, 1), '1', '남', '2', '여') as j_jumin,
	C.h_name,
	to_char(A.r_date, 'YYYY') || '년 ' || to_char(A.r_date, 'MM') || '월 ' || to_char(A.r_date, 'DD') || '일' as r_date,
	substr(lpad(a.r_time, 4, 0), 1, 2) || ':' || substr(lpad(A.r_time, 4, 0), 3, 2) as r_time,
	decode(A.h_code, 'H001', 'A백신', 'H002', 'B백신', 'H003', 'C백신') as h_code,
	decode(C.h_zone, '10', '서울', '20', '대전', '30', '대구', '40', '광주') as h_zone
from t6_jumin B , t6_hosp C, t6_resv A
where A.j_jumin = B.j_jumin and A.h_code = C.h_code and A.r_no = '20210001';

select 
	A.h_zone,
	decode(A.h_zone, '10', '서울', '20', '대전', '30', '대구', '40', '광주') as hh_zone,
	count(B.r_no) as r_no
from t6_hosp A, t6_resv B
where A.h_code = B.h_code(+)
group by A.h_zone
order by count(B.r_no) desc;

select * from t6_resv;


