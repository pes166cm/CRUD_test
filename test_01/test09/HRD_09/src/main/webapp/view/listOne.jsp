<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@page import="vo.ListOne"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<ListOne> list = dao.getListOne();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">참가자 목록</p>
<table>
<%if(list != null){ %>
	<tr>
		<td>참가자번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>성별</td>
		<td>특기</td>
		<td>소속사</td>
	</tr>
<% for(ListOne vo : list){ %>	
	<tr>
		<td><%=vo.getArtist_id()%></td>
		<td><%=vo.getArtist_name() %></td>
		<td><%=vo.getBirth() %></td>
		<td><%=vo.getGender() %></td>
		<td><%=vo.getTalent() %></td>
		<td><%=vo.getAgency() %></td>
	</tr>
<%	} 
}else{
	out.print("<tr><td colspan='6'>조회된 자료가 없습니다.</td></tr>");
}
%>
</table>
<jsp:include page="/master/footer.jsp"/>