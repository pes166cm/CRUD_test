<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">교과목 목록 수정</p>
		<form action="inputProc.jsp">
			<table>
				<tr>
					<td>과목코드</td>
					<td><input type="text" id="id" name="id"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="number" id="credit" name="credit"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td>
						<select id="lecturer" name="lecturer">
							<option value="0">===강사선택===</option>
							<option value="1">김교수</option>
							<option value="2">이교수</option>
							<option value="3">박교수</option>
							<option value="4">우교수</option>
							<option value="5">최교수</option>
							<option value="6">임교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
						<input type="radio" id="week1" name="week" value="1">월요일
						<input type="radio" id="week2" name="week" value="2">화요일
						<input type="radio" id="week3" name="week" value="3">수요일
						<input type="radio" id="week4" name="week" value="4">목요일
						<input type="radio" id="week5" name="week" value="5">금요일
					</td>
				</tr>
				<tr>
					<td>시작시간 예)0930</td>
					<td><input type="text" id="start_hour" name="start_hour"></td>
				</tr>
				<tr>
					<td>종료시간 예)0930</td>
					<td><input type="text" id="end_hour" name="end_hour"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="추가하기">
						<button><a href="/view/list.jsp">목록보기</a></button>
					</td>
				</tr>
			</table>
		</form>	
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>