<%@page import="vo.MemberVO"%>
<%@page import="dao.ThisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	ThisDAO dao = new ThisDAO();
	MemberVO member = dao.getMember(custno);
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="table_title">회원 수정</p>
	<form action="updatePros.jsp" name="frm">
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="number" value="<%=member.getCustno() %>" id="custno" name="custno" readonly="readonly"></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" id="custname" value="<%= member.getCustname()%>"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" id="phone" value="<%= member.getPhone() %>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" id="address" value="<%= member.getAddress() %>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="date" name="joindate" id="joindate" value="<%= member.getJoindate()%>"></td>
			</tr>
			<tr>
				<td>고객등급(A:VIP, B:일반, C:직원)</td>
				<td>
					<select name="grade" id="grade">
						<option value="0">회원등급선택</option>
						<option value="A" <%="A".equals(member.getGrade()) ? "selected" : ""%>>VIP</option>
						<option value="B" <%="B".equals(member.getGrade()) ? "selected" : ""%>>일반</option>
						<option value="C" <%="C".equals(member.getGrade()) ? "selected" : ""%>>직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" id="city" value="<%= member.getCity()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정" onclick="return checkForm()">
					<button><a href="/view/listo.jsp">다시조회</a></button>
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