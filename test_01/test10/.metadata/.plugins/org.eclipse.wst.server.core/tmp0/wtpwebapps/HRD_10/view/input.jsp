<%@page import="dao.IsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">타자 성적 등록</p>
		<form action="inputProc.jsp" name="frm">
			<table>
				<tr>
					<td>타자 선택</td>
					<td>
						<select name="registration_code" id="registration_code">
							<option value="0">-----타자 선택-----</option>
							<option value="A001">김길동</option>
							<option value="A002">이길동</option>
							<option value="A003">홍길동</option>
							<option value="A004">조길동</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">공격 포인트</td>			
				</tr>
				<tr>
					<td>게임 수</td>
					<td><input type="number" id="game_numbers" name="game_numbers"></td>
				</tr>
				<tr>
					<td>타석 수</td>
					<td><input type="number" id="appearance" name="appearance"></td>
				</tr>
				<tr>
					<td>안타 수</td>
					<td><input type="number" id="hit_numbers" name="hit_numbers"></td>
				</tr>
				<tr>
					<td>홈런 수</td>
					<td><input type="number" id="home_runs" name="home_runs"></td>
				</tr>
				<tr>
					<td colspan="2">수비 포인트</td>
				</tr>
				<tr>
					<td>아웃 카운트 수</td>
					<td><input type="number" id="put_out" name="put_out"></td>
				</tr>
				<tr>
					<td>더블 플레이 수</td>
					<td><input type="number" id="double_play" name="double_play"></td>
				</tr>
				<tr>
					<td>에러</td>
					<td><input type="number" id="error_count" name="error_count"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="return check()">
						<input type="reset" value="다시 쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<script>
	function check(){
		if(document.querySelector("#registration_code").value == "0"){
			alert("타자가 선택되지 않았습니다.");
			document.querySelector("#registration_code").focus();
			return false;
		}
		if(document.querySelector("#game_numbers").value.trim()length == 0){
			alert("게임 수가 입력되지 않았습니다");
			document.querySelector("#game_numbers").value="";
			document.querySelector("#game_numbers").focus();
			return false;
		}
		if(document.querySelector("#appearance").value.trim()length == 0){
			alert("타석 수가 입력되지 않았습니다.");
			document.querySelector("#appearance").value="";
			document.querySelector("#appearance").focus();
			return false;
		}
		if(document.querySelector("#hit_numbers").value.trim()length == 0){
			alert("안타 수가 입력되지 않았습니다.");
			document.querySelector("#hit_numbers").value="";
			document.querySelector("#hit_numbers").focus();
			return false;
		}
		if(document.querySelector("#home_runs").value.trim()length == 0){
			alert("홈런 수가 입력되지 않았습니다.");
			document.querySelector("#home_runs").value="";
			document.querySelector("#home_runs").focus();
			return false;
		}
		if(document.querySelector("#put_out").value.trim()length == 0){
			alert("아웃 카운트 수가 입력되지 않았습니다.");
			document.querySelector("#put_out").value="";
			document.querySelector("#put_out").focus();
			return false;
		}
		if(document.querySelector("#double_play").value.trim()length == 0){
			alert("더블 플레이 수가 입력되지 않았습니다.");
			document.querySelector("#double_play").value="";
			document.querySelector("#double_play").focus();
			return false;
		}
		if(document.querySelector("#error_count").value.trim()length == 0){
			alert("에러 수가 입력되지 않았습니다.");
			document.querySelector("#error_count").value="";
			document.querySelector("#error_count").focus();
			return false;
		}
		return true;
	}
</script>
<jsp:include page="/master/footer.jsp"/>