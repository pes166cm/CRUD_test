<%@page import="vo.RlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<RlistVO> list = dao.getrList();
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">검사 결과 조회</p>
	<table>
		<tr>
			<td>환자번호</td>
			<td>환자명</td>
			<td>검사명</td>
			<td>검사시작일</td>
			<td>검사상태</td>
			<td>검사종료일</td>
			<td>검사결과</td>
			<td>삭제</td>
		</tr>
		<% 
			if(list != null){
				for(RlistVO vo : list){	
		%>
			<tr>
				<td><%=vo.getP_no() %></td>
				<td><%=vo.getP_name() %></td>
				<td><%=vo.getT_name() %></td>
				<td><%=vo.getT_sdate() %></td>
				<td><%=vo.getT_status() %></td>
				<td><%=vo.getT_ldate() %></td>
				<td><%=vo.getT_result() %></td>
				<td>삭제</td>
			</tr>
		<%	
				}  
			}else{
			out.print("<tr><td colspan='7'>조회된 정보가 없습니다.</td></tr>");
			}
		%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>