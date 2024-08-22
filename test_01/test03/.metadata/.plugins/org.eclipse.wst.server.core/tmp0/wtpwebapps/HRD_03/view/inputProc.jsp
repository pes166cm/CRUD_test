<%@page import="dao.TpDAO"%>
<%@page import="vo.InputVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	InputVO vo = new InputVO();
	TpDAO dao = new TpDAO();
	int n = 0;
	
	String v_jumin = request.getParameter("v_jumin");
	String v_name = request.getParameter("v_name");
	String c_no = request.getParameter("c_no");
	String v_time = request.getParameter("v_time");
	String v_area = request.getParameter("v_area");
	String v_confirm = request.getParameter("v_confirm");
	
	vo.setV_jumin(v_jumin);
	vo.setV_name(v_name);
	vo.setC_no(c_no);
	vo.setV_time(v_time);
	vo.setV_area(v_area);
	vo.setV_confirm(v_confirm);
	
	n = dao.input(vo);
	
	if(n>0){
		%>
		<script>
			alert("입력완료");
			location.href="/view/listTwo.jsp";
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