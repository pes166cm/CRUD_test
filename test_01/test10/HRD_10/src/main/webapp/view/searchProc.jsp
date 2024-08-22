<%@page import="dao.IsDAO"%>
<%@page import="vo.HtterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String registration_code = request.getParameter("registration_code");
	int game_numbers = Integer.parseInt(request.getParameter("game_numbers"));
	int appearance = Integer.parseInt(request.getParameter("appearance"));
	int hit_numbers = Integer.parseInt(request.getParameter("hit_numbers"));
	int home_runs = Integer.parseInt(request.getParameter("home_runs"));
	int put_out = Integer.parseInt(request.getParameter("put_out"));
	int double_play = Integer.parseInt(request.getParameter("double_play"));
	int error_count = Integer.parseInt(request.getParameter("error_count"));
	
	HtterVO vo = new HtterVO();
	vo.setRegistration_code(registration_code);
	vo.setGame_numbers(game_numbers);
	vo.setAppearance(appearance);
	vo.setHit_numbers(hit_numbers);
	vo.setHome_runs(home_runs);
	vo.setPut_out(put_out);
	vo.setDouble_play(double_play);
	vo.setError_count(error_count);
	
	IsDAO dao = new IsDAO();
	int n = dao.input(vo);
	
	if(n>0){
%>
		<script>
			alert("조회중");
			location.href="/view/searchList.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("조회실패");
			location.href="/view/searchError.jsp";
		</script>
<%
	}
%>