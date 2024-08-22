<%@page import="vo.StudentVO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	String s_no = request.getParameter("s_no");
	StudentVO vo = dao.getUpdate(s_no);
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">학생자료입력</p>
	<form action="/view/updateProc.jsp" name="frm">
		<table>
			<tr>
				<td>학번</td>
				<td><input type="text" name="s_no" id="s_no" value="<%=s_no%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="s_name" id="s_name" value="<%=vo.getS_name()%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="s_phone" id="s_phone" value="<%=vo.getS_phone()%>"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="s_gender" id="s_gender1" value="M" <%="M".equals(vo.getS_gender())?"checked":""%>> 남자
					<input type="radio" name="s_gender" id="s_gender2" value="F" <%="F".equals(vo.getS_gender())?"checked":""%>> 여자
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="s_address" id="s_address" value="<%=vo.getS_address()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기" onclick="return check()">
					<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form> 
</section>
<jsp:include page="/master/footer.jsp"/>
<script>
	function check() {
		
		let $s_no = document.querySelector("#s_no");
		let $s_name = document.querySelector("#s_name");
		let $s_phone = document.querySelector("#s_phone");
		let $s_gender1 = document.querySelector("#s_gender1");
		let $s_gender2 = document.querySelector("#s_gender2");
		let $s_address = document.querySelector("#s_address");
		
		if($s_no.value.length != 5){
			alert("학번을 다시 입력해주세요.");
			$s_no.value="";
			$s_no.focus();
			return false;
		}	
		if($s_gender1.checked == false && $s_gender2.checked == false){
			alert("성별을 선택해주세요.");
			$s_gender1.focus();
			return false;
		}
		return true;	
	}
</script>