<%@page import="vo.PlistVO"%>
<%@page import="dao.IsDAO"%>
<%@page import="vo.InputVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String p_no = request.getParameter("p_no");
	String p_name = request.getParameter("p_name");
	String p_birth = request.getParameter("p_birth");
	String p_gender = request.getParameter("p_gender");
	String p_tel1 = request.getParameter("p_tel1");
	String p_tel2 = request.getParameter("p_tel2");
	String p_tel3 = request.getParameter("p_tel3");
	String p_city = request.getParameter("p_city");
	
	PlistVO vo = new PlistVO();
		vo.setP_no(p_no);
		vo.setP_name(p_name);
		vo.setP_birth(p_birth);
		vo.setP_gender(p_gender);
		vo.setP_tel1(p_tel1);
		vo.setP_tel2(p_tel2);
		vo.setP_tel3(p_tel3);
		vo.setP_city(p_city);
		
		
		IsDAO dao = new IsDAO();
		int n = dao.update(vo);
		
		if(n>0){
			%>
			<script>
				alert("입력완료");
				location.href="/view/rList.jsp";
			</script>
			<%
		}else{
			%>
			<script>
				alert("입력실패");
				history.back();
			</script>
			<%
		}

%>