<%@page import="vo.ListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<ListVO> list = dao.getList();
	int count = 0;
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">백신 예약 현황</p>
		<table>
		<% if(list != null){ %>
			<tr>
				<td>병원지역</td>
				<td>병원지역명</td>
				<td>접종예약건수</td>
			</tr>
			<% for(ListVO vo : list){ %>
			<tr>
				<td><%=vo.getH_zone() %></td>
				<td><%=vo.getHh_zone() %></td>
				<td><%=vo.getR_no() %></td>
				<%count+=vo.getR_no(); %>
			</tr>
			<%}%>
			<tr>
				<td colspan="2">종합</td>
				<td><%= count %></td>
			</tr>
			<%}else{out.print("<tr><td colspan='3'>조회된 자료가 없습니다.</td></tr>");}%>
		</table>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>