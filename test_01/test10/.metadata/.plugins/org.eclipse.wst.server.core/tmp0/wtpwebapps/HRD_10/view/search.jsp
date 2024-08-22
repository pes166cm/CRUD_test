<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = (String)request.getAttribute("search");
%>    
<jsp:include page="/master/header.jsp"/>
	<p id="p_title">개별 타자 성적 조회</p>
	<form action="searchProc.jsp" name="frm">
		<table>
			<tr>
				<td>선수 등록 코드를 입력하세요.</td>
				<td><input type="text" id="registration_code" name="registration_code"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="선수조회하기">
					<button><a href="/">홈으로</a></button>
				</td>
			</tr>
		</table>	
	</form>
<jsp:include page="/master/footer.jsp"/>