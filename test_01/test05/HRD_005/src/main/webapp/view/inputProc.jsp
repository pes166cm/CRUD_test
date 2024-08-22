<%@page import="dao.IsDAO"%>
<%@page import="vo.InputVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String p_no = request.getParameter("p_no");
	String t_code = request.getParameter("t_code");
	Date t_sdate = Date.valueOf(request.getParameter("t_sdate"));
	String t_status = request.getParameter("t_status");
	Date t_ldate = Date.valueOf(request.getParameter("t_ldate"));
	String t_result = request.getParameter("t_result");
	
	InputVO vo = new InputVO();
		vo.setP_no(p_no);
		vo.setT_code(t_code);
		vo.setT_sdate(t_sdate);
		vo.setT_status(t_status);
		vo.setT_ldate(t_ldate);
		vo.setT_result(t_result);
		
		IsDAO dao = new IsDAO();
		int n = dao.input(vo);
		
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