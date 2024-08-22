create table t5_patient(
	p_no varchar2(4) not null primary key,
	p_name varchar2(20),
	p_birth date,
	p_gender char(1),
	p_tel1 varchar2(3),
	p_tel2 varchar2(4),
	p_tel3 varchar2(4),
	p_city varchar2(2)
);

select 
	p_no, 
	p_name, 
	to_char(p_birth, 'yyyy"년"mm"월"dd"일"') as p_birth, 
	decode(p_gender, 'F', '여', 'M', '남') as p_gender, 
	(p_tel1 || '-' || p_tel2 || '-' || p_tel3) as p_tel, 
	decode(p_city, '10', '서울', '20', '경기','30', '강원', '40', '대구') as p_city 
from t5_patient;

insert into T5_PATIENT values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into T5_PATIENT values('1002', '이환자', '19950301', 'M', '010', '2222', '0002', '20');
insert into T5_PATIENT values('1003', '박환자', '17750301', 'F', '010', '2222', '0003', '30');
insert into T5_PATIENT values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into T5_PATIENT values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into T5_PATIENT values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into T5_PATIENT values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');



create table t5_test(
	t_code char(4) not null primary key,
	t_name varchar2(20)
);

insert into t5_test values('T001', '결핵');
insert into t5_test values('T002', '장티푸스');
insert into t5_test values('T003', '수두');
insert into t5_test values('T004', '홍역');
insert into t5_test values('T005', '콜레라');

create table t5_result(
	p_no varchar2(4) not null,
	t_code varchar2(4) not null,
	t_sdate date not null,
	t_status char(1),
	t_ldate date,
	t_result char(1),
	primary key(p_no, t_code, t_sdate)
);

insert into t5_result values('1001', 'T001','2020-01-01', '1', '2020-01-02', 'X');
insert into t5_result values('1002', 'T002','2020-01-01', '2', '2020-01-02', 'P');
insert into t5_result values('1003', 'T003','2020-01-01', '1', '2020-01-02', 'N');
insert into t5_result values('1004', 'T004','2020-01-01', '1', '2020-01-02', 'P');
insert into t5_result values('1005', 'T005','2020-01-01', '2', '2020-01-02', 'P');
insert into t5_result values('1006', 'T001','2020-01-01', '2', '2020-01-02', 'N');
insert into t5_result values('1007', 'T002','2020-01-01', '1', '2020-01-02', 'P');
insert into t5_result values('1005', 'T003','2020-01-01', '1', '2020-01-02', 'P');
insert into t5_result values('1006', 'T004','2020-01-01', '1', '2020-01-02', 'N');
insert into t5_result values('1007', 'T005','2020-01-01', '2', '2020-01-02', 'N');

select 
	A.p_no,
	A.p_name,
	B.t_name,
	to_char(C.t_sdate, 'yyyy-mm-dd') t_sdate,
	decode(C.t_status, '1', '검사중','2', '검사완료') t_status, 
	to_char(C.t_ldate, 'yyyy-mm-dd') t_ldate,
	decode(C.t_result, 'X' , '미입력','P', '양성', 'N', '음성') t_result
from t5_patient A, t5_test B, t5_result C
where A.p_no = C.p_no and B.t_code = C.t_code;

select 
	B.p_city,
	decode(B.p_city, '10', '서울', '20', '경기','30', '강원', '40', '대구') as city,
	count(B.p_city) as count
from t5_result A, t5_patient B
where A.p_no = B.p_no
group by B.p_city
order by B.p_city asc;


select p_no from t5_patient
	minus
	select p_no from t5_result;



