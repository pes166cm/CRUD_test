<%@page import="dao.AddDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	AddDAO dao = new AddDAO();
	
	int n = dao.delete(id);
	
	if(n>0){
		response.sendRedirect("/view/list.jsp");
	} else{
		%>
		<script>
			alert("삭제 실패");
			location.href="/view/list.jsp";
		</script>
		<%
	}
%>