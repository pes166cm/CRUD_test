<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@page import="vo.ListThree"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<ListThree> list = dao.getListThree();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">참가자 등위</p>
<table>
<%if(list != null){ %>
	<tr>
		<td>참가자명</td>
		<td>합산점수</td>
		<td>평균</td>
		<td>등위</td>
	</tr>
<%for(ListThree vo : list){ %>
	<tr>
		<td><%=vo.getArtist_name() %></td>
		<td><%=vo.getSum_point() %></td>
		<td><%=vo.getAvg_point() %></td>
		<td><%=vo.getRank() %></td>
	</tr>
<%	}
}else{
	out.print("<tr><td colspan='4'>조회된 자료가 없습니다.</td></tr>");
}
%>	
</table>
<jsp:include page="/master/footer.jsp"/>