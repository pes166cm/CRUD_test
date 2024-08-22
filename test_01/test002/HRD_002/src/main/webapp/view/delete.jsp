<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	
	MemberDAO dao = new MemberDAO();
	
	int n = dao.delete(userid);
	
	if(n>0){
		response.sendRedirect("/view/list.jsp");
	} else{
		%>
		<script>
			alerrt("삭제 실패");
			location.href="/view/list.jsp";
		</script>
		<%
	}

%>