<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	ArrayList<String> list = dao.getS_no();
	
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">학생 자료 입력</p>
	<form action="/view/inputProc2.jsp" name="frm">
		<table>	
			<tr>
				<td>학번</td>
				<td>
					<select name="s_no" id="s_no">
						<option value="0">학번을 선택하세요.</option>
			<%
				if(list != null){
					for(String str : list){
			%>
						<option value="<%=str%>"><%=str%></option>
			<% 		}
				}
			%>
					</select>
				</td>
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="number" id="e_kor" name="e_kor"></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="number" id="e_eng" name="e_eng"></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="number" id="e_math" name="e_math"></td>
			</tr>
			<tr>
				<td>한국사</td>
				<td><input type="number" id="e_hist" name="e_hist"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장하기" onclick="return check()">
					<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="/master/footer.jsp"/>