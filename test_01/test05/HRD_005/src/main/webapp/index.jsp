<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">진단 검사 프로그램</p>
		<p>
			프로그램 작성순서<br>
			1. 환자테이블(t5_patient)테이블 생성 및 샘플데이터입력<br>
			2. 검사코드테이블(t5_test)테이블 생성 및 샘플데이터입력<br>
			3. 환자테이블(t5_result)테이블 생성 및 샘플데이터입력<br>
			4. 환자조회/수정 화면 작성(pList.jsp/pUpdate.jsp/pUpdateProc.jsp)<br>
		</p>
	
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>