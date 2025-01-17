
create table t7_course(
	id varchar2(5) not null primary key,
	name varchar2(40),
	credit number(2),
	lecturer number(2) ,
	week number(2),
	start_hour number(4),
	end_hour number(4)
);

insert into t7_course values('10001', '애플리케이션 배포', 2, 1, 1, 0900, 1100);
insert into t7_course values('10002', '프로그래밍 언어 활용', 2, 2, 2, 0900, 1200);
insert into t7_course values('10003', '응용 SW 기초기술 활용', 3, 6, 3, 0900, 1200);
insert into t7_course values('10004', '화면구현', 3, 4, 4, 0900, 1200);
insert into t7_course values('20001', '애플리케이션 테스트 수행', 2, 5, 1, 1300, 1600);
insert into t7_course values('20002', 'SQL활용', 3, 5, 2, 1500, 1800);
insert into t7_course values('20003', 'UI테스트', 3, 6, 3, 1330, 1630);
insert into t7_course values('30001', '화면 설계', 2, 3, 4, 1330, 1530);
insert into t7_course values('30002', '네트워크 프로그래밍 구현', 3, 3, 5, 0900, 1200);
insert into t7_course values('40001', '스마트문화앱 구현', 2, 1, 1, 1300, 1600);

create table t7_lecture(
	idx number(2) not null primary key,
	name varchar2(10),
	major varchar2(40)
);

insert into t7_lecture values(1, '김교수', '소프트웨어 공학');
insert into t7_lecture values(2, '이교수', '프로그래밍');
insert into t7_lecture values(3, '박교수', '네트워크');
insert into t7_lecture values(4, '우교수', '운영체제');
insert into t7_lecture values(5, '최교수', '자료구조');
insert into t7_lecture values(6, '임교수', '인공지능');


select
	id,
	name,
	credit,
	decode(lecturer, '1', '김교수', '2', '이교수', '3', '박교수', '4', '우교수', '5', '최교수', '6', '임교수') as lecturer,
	decode(week,  '1', '월요일', '2', '화요일', '3', '수요일', '4', '목요일', '5', '금요일') as week,
	substr(lpad(start_hour, 4, 0), 1, 2) || '시' || substr(lpad(start_hour, 4, 0), 3, 2) || '분' as start_hour,
	substr(lpad(end_hour, 4, 0), 1, 2) || '시' || substr(lpad(end_hour, 4, 0), 3, 2) || '분' as end_hour
from t7_course;



substr(lpad(a.r_time, 4, 0), 1, 2) || '시' || substr(lpad(A.r_time, 4, 0), 3, 2) as r_time,








