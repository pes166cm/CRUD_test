<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">투표하기</p>
		<form action="inputProc.jsp" name="frm">
			<table>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="v_jumin" id="v_jumin"></td>
					<td>입력>9901012000000</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="v_name" id="v_name"></td>
					<td></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td>
						<select name="c_no" id="c_no">
							<option value="0">후보번호를 선택하세요.</option>
							<option value="1">후보1번(김후보)</option>
							<option value="2">후보2번(이후보)</option>
							<option value="3">후보3번(박후보)</option>
							<option value="4">후보4번(조후보)</option>
							<option value="5">후보5번(최후보)</option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="v_time" id="v_time"></td>
					<td>입력예) 9시 30분 => 0910으로 입력</td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td>
						<select name="v_area" id="v_area">
							<option value="0">투표장소를 선택하세요.</option>
							<option value="1">제1투표장</option>
							<option value="2">제2투표장</option>
							<option value="3">제3투표장</option>
							<option value="4">제4투표장</option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td>
						<input type="radio" name="v_confirm" id="v_confirm" value="Y">확인
						<input type="radio" name="v_confirm" id="v_confirm" value="N">미확인
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="투표하기" onclick="return check()">
						<input type="reset" value="다시하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<script>
	function check(){
		if(document.querySelector("#v_jumin").value == ""){
			alert("주민등록번호를 입력하세요.");
			document.querySelector("#v_jumin").focus();
			return false;
		}
		if(document.querySelector("#v_name").value == ""){
			alert("이름을 입력하세요.");
			document.querySelector("#v_name").focus();
			return false;
		}
		if(document.querySelector("#c_no").value == "0"){
			alert("후보번호를 선택하세요.");
			document.querySelector("#c_no").focus();
			return false;
		}
		return true;
	}
</script>
<jsp:include page="/master/footer.jsp"/>