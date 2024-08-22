<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">참가자 자료 입력</p>
		<form action="inputProc.jsp">
			<table>
				<tr>
					<td>아티스트 아이디</td>
					<td><input type="text" name="artist_id" id="artist_id"></td>
				</tr>
				<tr>
					<td>아티스트 이름</td>
					<td><input type="text" name="artist_name" id="artist_name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" id="birth"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" id="gender1" value="M">남
						<input type="radio" name="gender" id="gender2" value="F">여
					</td>
				</tr>
				<tr>
					<td>특기</td>
					<td>
						<select name="talent" id="talent">
							<option value="0">==특기를 선택하세요==</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>소속사</td>
					<td><input type="text" name="agency" id="agency"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록하기">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>