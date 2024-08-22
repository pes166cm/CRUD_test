create table t4_student(
	s_no varchar2(5) not null primary key,
	s_name varchar2(10),
	s_phone varchar2(13),
	s_gender char(1),
	s_address varchar2(50)
);


insert into T4_STUDENT values('10101', '김행복', '01011112222', 'M', '서울시 동대문구 휘경1동');
insert into T4_STUDENT values('10102', '이축복', '01011113333', 'F', '서울시 동대문구 휘경2동');
insert into T4_STUDENT values('10103', '장믿음', '01011114444', 'M', '경기도 안양시 안양1동');
insert into T4_STUDENT values('10104', '최사랑', '01011115555', 'F', '경기도 안양시 안양2동');
insert into T4_STUDENT values('10105', '진평화', '01011116666', 'M', '제주도 제주시 제주1동');
insert into T4_STUDENT values('10106', '사공단', '01011117777', 'M', '제주도 제주시 제주1동');

select * from t4_student;

create table T4_EXAM(
	s_no varchar2(5) not null primary key,
	e_kor number(4,1),
	e_math number(4,1),
	e_eng number(4,1),
	e_hist number(4,1)
);


insert into T4_EXAM values('10101', 98.5, 91.3, 95.2, 90.6);
insert into T4_EXAM values('10102', 87.4, 89.3, 92.8, 82.7);
insert into T4_EXAM values('10103', 34.4, 73.5, 74.9, 84.6);
insert into T4_EXAM values('10104', 23.4, 63.9, 73.4, 86.3);



select * from T4_EXAM;

select 
	s_no, 
	s_name, 
	substr(s_no, 1, 1) as year, 
	substr(s_no, 2, 2) as ban,
	substr(s_no, 4, 2) as num,
	decode(s_gender, 'M', '남', 'F', '여') as s_gender,
	substr(s_phone, 1, 3) || '-' || substr(s_phone, 4, 4) || '-' || substr(s_phone, 7, 4) as s_phone,
	s_address
from t4_student;

select 
	substr(A.s_no, 1, 1) as year,
	substr(A.s_no, 2, 2) as ban,
	substr(A.s_no, 4, 2) as num,
	A.s_name,
	B.e_kor,
	B.e_math,
	B.e_eng,
	B.e_hist,
	(B.e_kor + B.e_math + B.e_eng + B.e_hist) as sum,
	round((B.e_kor + B.e_math + B.e_eng + B.e_hist)/4, 2) as avg,
	decode(B.e_kor, null, null, rank() over (order by (B.e_kor + B.e_eng + B.e_math + B.e_hist) desc nulls last)) as rank
from T4_STUDENT A, T4_EXAM B
where A.s_no = B.s_no(+)
order by A.s_no;	



select s_no from t4_student
minus
select s_no from t4_exam;
	

 select s_no,  s_name,  s_gender,  s_phone, s_address from t4_student where  = 

  select 
  	A.s_no,
  	A.s_name,
	B.e_kor,
	B.e_math,
	B.e_eng,
	B.e_hist
  from T4_STUDENT A, T4_EXAM B
  where A.s_no = '10101'; 
 
  update t4_student set s_name=?, e_kor=?, e_eng=?, e_math=?, e_hist=? where s_no=?;
  
