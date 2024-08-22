<%@page import="dao.StudentDAO"%>
<%@page import="vo.ListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String student_id = request.getParameter("student_id");
	String student_name = request.getParameter("student_name");
	String major_code = request.getParameter("major_code");
	String jumin = request.getParameter("jumin");
	String phone = request.getParameter("phone");
	String course = request.getParameter("course");
	
	ListVO vo = new ListVO();
	vo.setStudent_id(student_id);
	vo.setStudent_name(student_name);
	vo.setMajor_code(major_code);
	vo.setJumin(jumin);
	vo.setPhone(phone);
	vo.setCourse(course);
	
	StudentDAO dao = new StudentDAO();
	int n = dao.update(vo);
	
	if(n>0){
		%> 
		<script>
			alert("수정완료");
			location.href="/view/list.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert("수정실패");
			history.back();
		</script>
		<%
	}
%>