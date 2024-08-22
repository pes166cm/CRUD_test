<%@page import="dao.IsDAO"%>
<%@page import="vo.ListOne"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String artist_id = request.getParameter("artist_id");
	String artist_name = request.getParameter("artist_name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	
	ListOne vo = new ListOne();
	vo.setArtist_id(artist_id);
	vo.setArtist_name(artist_name);
	vo.setBirth(birth);
	vo.setGender(gender);
	vo.setTalent(talent);
	vo.setAgency(agency);
	
	IsDAO dao = new IsDAO();
	int n = dao.input(vo);
	
	if(n>0){
		%>
		<script>
			alert("입력완료");
			location.href="/view/listOne.jsp";
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