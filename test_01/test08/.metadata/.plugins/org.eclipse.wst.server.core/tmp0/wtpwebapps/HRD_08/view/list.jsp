<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@page import="vo.ListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	ArrayList<ListVO> list = dao.getList();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">학생 목록 조회 및 수정</p>
<table>
	<%if(list != null){ %>
	<tr>
		<td>학생코드</td>
		<td>학생이름</td>
		<td>학과코드</td>
		<td>주민번호</td>
		<td>전화번호</td>
		<td>선택코스</td>
	</tr>
	<% for(ListVO vo : list){ %>
	<tr>
		<td><a href="/view/update.jsp?student_id<%=vo.getStudent_id()%>"><%=vo.getStudent_id() %></a></td>
		<td><%=vo.getStudent_name() %></td>
		<td><%=vo.getMajor_code() %></td>
		<td><%=vo.getJumin() %></td>
		<td><%=vo.getPhone() %></td>
		<td><%=vo.getCourse() %></td>
	</tr>
	<%
		} 
	}else{
		out.print("<tr><td colspan='6'>조회된 자료가 없습니다.</td></tr>");
	}
	%>
</table>
<jsp:include page="/master/footer.jsp"/>