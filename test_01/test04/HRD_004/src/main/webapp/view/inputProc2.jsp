<%@page import="dao.StudentDAO"%>
<%@page import="vo.Student2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_no = request.getParameter("s_no");
	double e_kor = Double.parseDouble(request.getParameter("e_kor"));
	double e_eng = Double.parseDouble(request.getParameter("e_eng"));
	double e_math = Double.parseDouble(request.getParameter("e_math"));
	double e_hist = Double.parseDouble(request.getParameter("e_hist"));
	
	Student2VO vo = new Student2VO();
	vo.setS_no(s_no);
	vo.setE_kor(e_kor);
	vo.setE_eng(e_eng);
	vo.setE_math(e_math);
	vo.setE_hist(e_hist);
	
	StudentDAO dao = new StudentDAO();
	int n = dao.inputTwo(vo);
	
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