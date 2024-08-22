<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p id="p_title">학생정보입력</p>
		<form action="inputProc.jsp">
			<table>
				<tr>
					<td>학생코드</td>
					<td><input type="text" id="student_id" name="student_id"></td>
				</tr>
				<tr>
					<td>학생이름</td>
					<td><input type="text" id="student_name" name="student_name"></td>
				</tr>
				<tr>
					<td>학과코드</td>
					<td>
						<select id="major_code" name="major_code">
							<option value="0">==학과 선택==</option>
							<option value="01">AI공학</option>
							<option value="02">게임공학</option>
							<option value="03">컴퓨터공학</option>
							<option value="04">인문학</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" id="jumin" name="jumin"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="phone" name="phone"></td>
				</tr>
				<tr>
					<td>선택코스</td>
					<td><input type="text" id="course" name="course"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="입력하기">
						<input type="reset" value="다시입력">
						<button><a href="/view/list.jsp">홈으로</a></button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>