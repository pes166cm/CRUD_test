create table t8_student(
	student_id char(8) not null primary key,
	student_name varchar2(20),
	major_code char(2),
	jumin varchar2(14),
	phone varchar2(13),
	course char(2)
);


insert into T8_STUDENT values('20240001', '김길동', '03', '0301013000001', '01011110001', 'BD');
insert into T8_STUDENT values('20240002', '이길동', '03', '0301013000002', '01011110002', 'BD');
insert into T8_STUDENT values('20240003', '박길동', '02', '0301013000003', '01011110003', 'BD');
insert into T8_STUDENT values('20240004', '정길동', '02', '0301013000004', '01011110004', 'BD');
insert into T8_STUDENT values('20240005', '최길동', '01', '0301013000005', '01011110005', 'BD');
insert into T8_STUDENT values('20240006', '황길동', '01', '0301013000006', '01011110006', 'BD');

select * from t8_student;

create table t8_subject(
	subject_code char(4) not null primary key,
	subject_name varchar2(40),
	professor_name varchar2(20),
	classification char(2)
);

insert into t8_subject values('S001', '메타버스의 이해', '김교수', '02');
insert into t8_subject values('S002', '게임엔진기초', '이교수', '01');
insert into t8_subject values('S003', '게임엔진심화', '박교수', '01');
insert into t8_subject values('S004', '인문학개론', '정교수', '04');

select * from t8_subject;

create table t8_grade(
	student_id char(8) not null,
	subject_code char(4) not null,
	mid_term number(3,0),
	final_term number(3,0),
	attend number(3,0),
	report number(3,0),
	etc number(3,0),
	primary key(student_id, subject_code)
);

insert into t8_grade values('20240001', 'S001', 70, 80, 100, 100, 90);
insert into t8_grade values('20240001', 'S002', 80, 85, 100, 90, 90);
insert into t8_grade values('20240001', 'S003', 70, 80, 100, 100, 100);
insert into t8_grade values('20240002', 'S001', 70, 80, 90, 90, 100);
insert into t8_grade values('20240002', 'S002', 60, 70, 100, 90, 100);
insert into t8_grade values('20240002', 'S003', 90, 70, 100, 100, 90);
insert into t8_grade values('20240003', 'S001', 90, 90, 90, 100, 100);
insert into t8_grade values('20240003', 'S002', 100, 85, 100, 100, 100);
insert into t8_grade values('20240003', 'S003', 90, 100, 100, 90, 100);
insert into t8_grade values('20240004', 'S004', 85, 90, 90, 85, 90);

select * from t8_grade;

--학생목록조회및수정
select 
	student_id,
	student_name,
	major_code,
	substr(jumin, 1, 6) || '-' || substr(jumin, 7, 7) as jumin,
	substr(phone, 1, 3) || '-' || substr(phone, 4, 4) || '-' || substr(phone, 7, 4) as phone,
	course
from t8_student;

--학생성적목록조회
select
	A.student_id,
	A.student_name,
	substr(A.jumin, 1, 6) || '-' || substr(A.jumin, 7, 7) as jumin,
	B.subject_name,
	B.classification,
	B.professor_name,
	C.mid_term,
	C.final_term,
	C.attend,
	C.report,
	C.etc
from t8_student A, t8_subject B, t8_grade C
where A.student_id = C.student_id and B.subject_code = C.subject_code;

--학생성적목록조회(개인별)
select
	A.course,
	A.student_id,
	A.student_name,
	ROUND(sum((B.mid_term*0.3)+(B.final_term*0.3)+(B.attend*0.2)+(B.report*0.1)+(B.etc*0.1)),1) as chd, 
	count(A.student_id) as counta,
	ROUND(avg((B.mid_term*0.3)+(B.final_term*0.3)+(B.attend*0.2)+(B.report*0.1)+(B.etc*0.1)),1) as phon
from t8_student A, t8_grade B
where A.student_id = B.student_id
group by A.course, A.student_id, A.student_name
order by count(A.student_id) desc;

select * from t8_student where student_id = '20240001';
