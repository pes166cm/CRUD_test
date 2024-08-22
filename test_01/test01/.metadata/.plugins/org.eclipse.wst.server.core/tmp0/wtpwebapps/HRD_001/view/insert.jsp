<%@page import="dao.ThisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ThisDAO dao = new ThisDAO();
	int custno = dao.getMaxCustno();
 %>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="table_title">회원등록</p>
	<form action="insertPros.jsp" name="frm">
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="number" readonly="readonly" name="custno" id="custno" value="<%= custno %>"></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" id="custname"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" id="phone"></td>
			</tr>	
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" id="address"></td>
			</tr>	
			<tr>
				<td>가입일자</td>
				<td><input type="date" name="joindate" id="joindate">
			</tr>
			<tr>
				<td>고객등급(A:VIP, B:일반, C:직원)</td>
				<td>
					<select name="grade" id="grade">
						<option value="0">회원등급선택</option>
						<option value="A">VIP</option>
						<option value="B">일반</option>
						<option value="C">직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" id="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기" onclick="returncheck()"> 
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="/master/footer.jsp"/>
<script>
	function check(){
		if(document.querySelector("#custname").value.trim().length == 0 ){
			alert("이름을 입력하세요.");
			document.querySelector("#custname").value="";
			document.querySelector("#custname").focus();
			return false;
		}
		if(document.querySelector("#phone").value.trim().length == 0){
			alert("전화번호를 입력하세요.");
			document.querySelector("#phone").value="";
			document.querySelector("#phone").focus();
			return false;
		}
		if(document.querySelector("#address").value.trim().length == 0){
			alert("주소를 입력하세요.");
			document.querySelector("#address").value="";
			document.querySelector("#address").focus();
			return false;
		}
		if(document.querySelector("#joindate").value.trim().length == 0){
			alert("날짜를 입력하세요.");
			document.querySelector("#joindate").value="";
			document.querySelector("#joindate").focus();
			return false;
		}
		if(document.querySelector("#grade").value == 0){
			alert("등급을 선택하세요.");
			document.querySelector("#grade").focus();
			return false;
		}
		if(document.querySelector("#city").value.trim().length == 0){
			alert("도시코드를 입력하세요.");
			document.querySelector("#city").value="";
			document.querySelector("#city").focus();
			return false;
		}
	}
</script>