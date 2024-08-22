create table member_2024(
	userid varchar2(15) not null primary key,
	username varchar2(20) not null,
	passwd varchar2(10),
	jumin varchar2(13),
	gender char(1),
	address varchar2(50),
	jobcd char(1),
	mailrcv char(1),
	intro varchar(50)
);

insert into member_2024 values('seojh','서장훈','s123!','0000001111111', '1' ,'안양시 안양동','1', 'Y', '방송인');
insert into member_2024 values('honggd','홍길동','h123!','1111112222222', '2' ,'수원시 수원동','2', 'Y', '축구선수');
insert into member_2024 values('kanggc','강감찬','k123!','2222223333333', '1' ,'청주시 청주동','3', 'N', '농구선수');
insert into member_2024 values('yooks','유관순','y123!','4444445555555', '2' ,'과천시 과천동','3', 'N', '발레리나');
insert into member_2024 values('leess','이순신','e123!','5555556666666', '1' ,'성남시 성남동','1', 'Y', '회사원');

select userid, username, 
substr(jumin, 1, 2) || '-' || substr(jumin, 3, 2) || '-' || substr(jumin, 5,2) jumin, 
decode(gender,'1' ,'남', '2' ,'여') gender,
address,
decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') jobcd, 
decode(mailrcv, 'Y', '수신', 'N', '수신않음') mailrcv, 
intro 
from member_2024;

select 
	userid,
	username, 
	substr(jumin, 1, 2) || '-' || substr(jumin, 3, 2) || '-' || substr(jumin, 5,2) as jumin, 
	case gender
		when '1' then '남'
		when '2' then '여' 
	end as gender,
	decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') as jobcd
from member_2024 
where userid = 'seojh';
