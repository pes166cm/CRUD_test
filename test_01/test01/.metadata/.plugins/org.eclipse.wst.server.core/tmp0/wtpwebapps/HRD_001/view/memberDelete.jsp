<%@page import="dao.ThisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
  	ThisDAO dao = new ThisDAO();
  	
  	//파라메타받기
  	int custno = Integer.parseInt(request.getParameter("custno"));
  
  	int n = dao.memberDelete(custno);
  	
  	if(n>0){
  		response.sendRedirect("/view/listo.jsp");
  	}else{
		%>
		<script>
			history.back();
		</script>
		<%
	}
  	
  %>
    