<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@page import="vo.LllistVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	ArrayList<LllistVO> list = dao.getLllist();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">학생 성적 목록 조회(개인별)</p>
<table>
	<% if(list != null){ %>
	<tr>
		<td>코드명</td>
		<td>학생코드</td>
		<td>학생이름</td>
		<td>총점</td>
		<td>과목수</td>
		<td>평균</td>
	</tr>
	<% for(LllistVO vo : list){ %>
	<tr>
		<td><%=vo.getCourse() %></td>
		<td><%=vo.getStudent_id() %></td>
		<td><%=vo.getStudent_name() %></td>
		<td><%=vo.getChd() %></td>
		<td><%=vo.getCounta() %></td>
		<td><%=vo.getPhon() %></td>
	</tr>
	<%
		}
	}else{
		out.print("<tr><td colspan='6'>조회된 자료가 없습니다.</td></tr>");
	}
	%>
</table>
<jsp:include page="/master/footer.jsp"/>