<%@page import="dao.IsDAO"%>
<%@page import="vo.InputVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	String j_jumin = request.getParameter("j_jumin");
	String h_code = request.getParameter("h_code");
	Date r_date = Date.valueOf(request.getParameter("r_date"));
	int r_time = Integer.parseInt(request.getParameter("r_time"));
	String r_vcode = request.getParameter("r_vcode");
	
	InputVO vo = new InputVO();
	vo.setR_no(r_no);
	vo.setJ_jumin(j_jumin);
	vo.setH_code(h_code);
	vo.setR_date(r_date);
	vo.setR_time(r_time);
	vo.setR_vcode(r_vcode);
	
	IsDAO dao = new IsDAO();
	int n = dao.input(vo);
	
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