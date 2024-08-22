<%@page import="dao.StudentDAO"%>
<%@page import="vo.Student2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터를 받아야함
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	double e_kor = Double.parseDouble(request.getParameter("e_kor"));
	double e_eng = Double.parseDouble(request.getParameter("e_eng"));
	double e_math = Double.parseDouble(request.getParameter("e_math"));
	double e_hist = Double.parseDouble(request.getParameter("e_hist"));
	
	//vo 바인딩
	Student2VO vo = new Student2VO();
	vo.setS_no(s_no);
	vo.setS_name(s_name);
	vo.setE_kor(e_kor);
	vo.setE_eng(e_eng);
	vo.setE_math(e_math);
	vo.setE_hist(e_hist);
	
	//DAO 생성
	StudentDAO dao = new StudentDAO();
	int n = dao.update2(vo);

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