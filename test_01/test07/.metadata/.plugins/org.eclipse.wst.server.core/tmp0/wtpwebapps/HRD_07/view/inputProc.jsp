<%@page import="dao.AddDAO"%>
<%@page import="vo.ListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int credit = Integer.parseInt(request.getParameter("credit"));
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_hour = request.getParameter("end_hour");
	
	ListVO vo = new ListVO();
	vo.setId(id);
	vo.setName(name);
	vo.setCredit(credit);
	vo.setLecturer(lecturer);
	vo.setWeek(week);
	vo.setStart_hour(start_hour);
	vo.setEnd_hour(end_hour);
	
	AddDAO dao = new AddDAO();
	int n = dao.Input(vo);
	
	if(n>0){
		%>
		<script>
			alert("입력완료");
			location.href="/view/list.jsp";
		</script>
		<%
	} else{
		%>
		<script>
			alert("입력실패");
			history.back();
		</script>
		<%
	}

%>