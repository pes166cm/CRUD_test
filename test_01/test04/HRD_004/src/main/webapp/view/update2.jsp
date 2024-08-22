<%@page import="vo.Student2VO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	Student2VO vo = dao.getUpdate2(s_no, s_name);
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">학생 성적 수정</p>
	<form action="/view/update2Proc.jsp" name="frm">
		<table>
			<tr>
				<td>학번</td>
				<td><input type="text" name="s_no" id="s_no" value="<%=s_no%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="s_name" id="s_name" value="<%=s_name%>"></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="number" step="0.1" name="e_kor" id="e_kor" value="<%=vo.getE_kor()%>"></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="number" step="0.1" name="e_eng" id="e_eng" value="<%=vo.getE_eng()%>"></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="number" step="0.1" name="e_math" id="e_math" value="<%=vo.getE_math()%>"></td>
			</tr>
			<tr>
				<td>한국사</td>
				<td><input type="number" step="0.1" name="e_hist" id="e_hist" value="<%=vo.getE_hist()%>"></td>
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