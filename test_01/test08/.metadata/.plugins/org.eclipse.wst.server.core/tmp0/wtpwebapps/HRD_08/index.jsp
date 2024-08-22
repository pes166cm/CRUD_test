<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="contetn">
		<p class="title">학생성적관리 시스템</p>
		<p>
			학생성적(전체) / 학생성적(개인별)을 조회하고 수정하는 프로그램입니다.<br>
			프로그램 작성 순서<br>
			1. 학생정보 테이블(T_8STUDENT)생성 및 샘플데이터 입력<br>
			2. 과목정보 테이블(T8_SUBJECT)생성 및 샘플데이터 입력<br>
			3. 학생성적목록(전체) 조회/수정 페이지 작성<br>
			4. 학생성적목록(개인) 조회 페이지 작성<br>
			5. 성적 수정 및 삭제 프로그램 작성<br>
		</p>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>