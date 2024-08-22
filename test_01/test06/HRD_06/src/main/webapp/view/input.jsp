<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">백신예약</p>
		<form action="inputProc.jsp" style="width: 50%;">
			<table>
				<tr>
					<td>예약번호</td>
					<td><input type="number" id="r_no" name="r_no"></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" id="j_jumin" name="j_jumin">예)123456-7890123</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td>
						<select id="h_code" name="h_code">
							<option value="0">병원을 선택하세요.</option>
							<option value="H001">가_병원</option>
							<option value="H002">나_병원</option>
							<option value="H003">다_병원</option>
							<option value="H004">라_병원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>예약날짜</td>
					<td><input type="date" id="r_date" name="r_date"></td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td><input type="number" id="r_time" name="r_time">예)0930</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td>
						<select id="r_vcode" name="r_vcode">
							<option value="0">백신의 종류를 선택하세요.</option>
							<option value="V001">A백신</option>
							<option value="V002">B백신</option>
							<option value="V003">C백신</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="예약하기">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>