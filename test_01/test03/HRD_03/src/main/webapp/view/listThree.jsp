<%@page import="vo.ThreeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	TpDAO dao = new TpDAO();
	ArrayList<ThreeVO> list = dao.getThreeList();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">후보자 등수 조회</p>
<table>
<%if(list != null){ %>
	<tr>
		<td>후보자번호</td>
		<td>후보자이름</td>
		<td>정당이름</td>
		<td>득표수</td>
		<td>등위</td>
	</tr>
<%	for(ThreeVO vo : list){ %>	
	<tr>
		<td><%=vo.getC_no() %></td>
		<td><%=vo.getC_name() %></td>
		<td><%=vo.getP_name() %></td>
		<td><%=vo.getTotal() %></td>
		<td><%=vo.getRank() %></td>
	</tr>
<%	}
}else{
	out.print("<tr><td colspan='5'>조회된 자료가 없습니다.</td></tr>");
}
%>	
</table>
<jsp:include page="/master/footer.jsp"/>