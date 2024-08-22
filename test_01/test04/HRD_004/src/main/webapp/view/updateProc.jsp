<%@page import="dao.StudentDAO"%>
<%@page import="vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터를 받아야함
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	String s_phone = request.getParameter("s_phone");
	String s_gender = request.getParameter("s_gender");
	String s_address = request.getParameter("s_address");
	
	//vo 바인딩
	StudentVO vo = new StudentVO();
	vo.setS_no(s_no);
	vo.setS_name(s_name);
	vo.setS_phone(s_phone);
	vo.setS_gender(s_gender);
	vo.setS_address(s_address);
	
	//DAO 생성
	StudentDAO dao = new StudentDAO();
	int n = dao.update(vo);

	if(n>0){
		out.print("<script>");
		out.print("location.href='/view/list.jsp';");
		out.print("alert('입력완료');");
		out.print("</script>");
	} else{
		out.print("<script>");
		out.print("alert('입력실패');");
		out.print("history.back(); ");
		out.print("</script>");
	}
%>