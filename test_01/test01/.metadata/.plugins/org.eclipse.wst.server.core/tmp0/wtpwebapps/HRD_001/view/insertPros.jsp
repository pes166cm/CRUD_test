<%@page import="dao.ThisDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	MemberVO vo = new MemberVO();
	vo.setCustno(custno);
	vo.setCustname(custname);
	vo.setPhone(phone);
	vo.setAddress(address);
	vo.setJoindate(joindate);
	vo.setGrade(grade);
	vo.setCity(city);
	
	ThisDAO dao = new ThisDAO();
	int n = dao.input(vo);
	
	if(n>0){
		%>
		<script>
			alert("입력완료");
			location.href="/view/listo.jsp";
		</script>
<%
	} else{
%>      <script>
			alert("입력실패");
			history.back();
		</script>	
<% 
	}
%>