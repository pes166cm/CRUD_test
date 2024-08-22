create table t3_vote(
	v_jumin char(13) not null primary key,
	v_name varchar2(20),
	c_no char(1),
	v_time varchar2(4),
	v_area varchar2(20),
	v_confirm char(1)
);

insert into t3_vote values('9901011000001', '김유권', '1', '0930', '제1투표장', 'Y');
insert into t3_vote values('8901011000002', '이유권', '2', '0930', '제2투표장', 'Y');
insert into t3_vote values('6901011000003', '박유권', '3', '1030', '제3투표장', 'Y');
insert into t3_vote values('5901011000004', '안유권', '4', '1130', '제1투표장', 'Y');
insert into t3_vote values('7901011000005', '금유권', '5', '1230', '제2투표장', 'Y');
insert into t3_vote values('8901012000006', '귀유권', '1', '1230', '제3투표장', 'N');
insert into t3_vote values('5901012000007', '가유권', '1', '1330', '제4투표장', 'N');
insert into t3_vote values('4901012000008', '나유권', '3', '1330', '제1투표장', 'N');
insert into t3_vote values('7901012000009', '다유권', '3', '1330', '제2투표장', 'Y');
insert into t3_vote values('8901012100010', '라유권', '4', '1000', '제3투표장', 'Y');
insert into t3_vote values('9901012000011', '마유권', '5', '1010', '제4투표장', 'Y');
insert into t3_vote values('6901012000012', '바유권', '1', '0920', '제1투표장', 'Y');

select * from t3_vote;

create table t3_candidate(
	c_no char(1) not null primary key,
	c_name varchar2(20),
	p_code varchar2(2),
	c_school char(1),
	c_jumin char(13),
	c_city varchar2(20)
);

insert into t3_candidate values('1', '김후보', 'P1' ,'1', '6603011999991', '수선화동');
insert into t3_candidate values('2', '이후보', 'P2' ,'3', '5503011999991', '민들래동');
insert into t3_candidate values('3', '박후보', 'P3' ,'2', '7703011999991', '나팔꽃동');
insert into t3_candidate values('4', '조후보', 'P4' ,'2', '8803011999991', '진달래동');
insert into t3_candidate values('5', '최후보', 'P5' ,'3', '9903011999991', '개나리동');

create table t3_party(
	p_code char(2) not null primary key,
	p_name varchar2(20),
	p_indate date,
	p_leader varchar2(20),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4)
);

insert into t3_party values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into t3_party values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into t3_party values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into t3_party values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into t3_party values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');



--후보조회 (후보조회, 성명, 소속정당, 학력, 주민번호, 지역구, 대표전화)
select 
	A.c_no,
	B.p_name,
	A.p_code,
	decode(A.c_school, '1', '고졸', '2', '학사', '3', '석사', '4', '박사') as c_school,
	substr(A.c_jumin, 1, 6) || '-' || substr(A.c_jumin, 7, 13) as c_jumin,
	A.c_city,
	B.p_tel1 || '-' || B.p_tel2 || '-' || B.p_tel3 as p_tel
from t3_candidate A, t3_party B
where A.p_code = B.p_code;

--투표 검수 조회 (성명, 생년월일, 나이, 성별, 후보번호, 투표시간, 유권자 확인)
select 
	v_name,
	'19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) ||'일' as v_jumin,
	'만' || (2024-to_number('19' || substr(v_jumin,1,2)))||'세' as age,
	decode(substr(v_jumin, 7, 1), '1', '남', '2', '여', '3', '남', '4', '여') v_gender,
	c_no,
	substr(v_time, 1, 2) || ':' || substr(v_time, 3, 2) v_time,
	decode(v_confirm, 'Y', '확인', 'N', '미확인') v_confirm 
from t3_vote;

--후보자 등수 조회 (후보자번호, 후보자이름, 정당이름, 득표수, 등위)
select 
	A.c_no,
	B.c_name,
	C.p_name,
	count(A.c_no) as total,
	rank() over(order by count(A.c_no) desc) as rank
from t3_vote A, t3_candidate B, t3_party C
where A.c_no = B.c_no and B.p_code = C.p_code and A.v_confirm ='Y'
group by A.c_no, B.c_name, C.p_name
order by rank;