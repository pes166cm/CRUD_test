<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@page import="vo.ListTwo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<ListTwo> list = dao.getListTwo();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">멘토점수 리스트</p>
<table>
<%if(list != null){ %>
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>점수</td>
		<td>등급</td>
		<td>멘토</td>
	</tr>
<% for(ListTwo vo : list){ %>	
	<tr>
		<td><%=vo.getSerial_no() %></td>
		<td><%=vo.getArtist_name() %></td>
		<td><%=vo.getBirth() %></td>
		<td><%=vo.getPoint() %></td>
		<td><%=vo.getPoint_two() %></td>
		<td><%=vo.getMento_name() %></td>
	</tr>
<%
	}
}else{
	out.print("<tr><td colspan='6'>조회된 자료가 없습니다.</td></tr>");
}
%>
</table>
<jsp:include page="/master/footer.jsp"/>