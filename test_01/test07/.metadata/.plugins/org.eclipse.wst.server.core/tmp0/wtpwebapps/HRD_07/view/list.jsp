<%@page import="vo.ListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AddDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AddDAO dao = new AddDAO();
	ArrayList<ListVO> list = dao.getList();
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">교과목 목록 조회/수정</p>
		<table>
		<% if(list != null){ %>
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>삭제</td>
			</tr>
		<% for(ListVO vo : list){ %>
			<tr>
				<td><a href="/view/update.jsp?id=<%=vo.getId()%>"><%=vo.getId() %></a></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getCredit() %></td>
				<td><%=vo.getLecturer() %></td>
				<td><%=vo.getWeek() %></td>
				<td><%=vo.getStart_hour() %></td>
				<td><%=vo.getEnd_hour() %></td>
				<td><a href="/view/delete.jsp?id=<%=vo.getId()%>">삭제</a></td>
			</tr>
		<% }}else{out.print("<tr><td colspan='7'>조회된 자료가 없습니다.</td></tr>");} %>
		</table>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>