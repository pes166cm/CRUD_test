<%@page import="java.util.ArrayList"%>
<%@page import="dao.TpDAO"%>
<%@page import="vo.OneVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	TpDAO dao = new TpDAO();
	ArrayList<OneVO> list = dao.getOneList();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">후보조회</p>
<table>
<%if(list != null){ %>
	<tr>
		<td>후보조회</td>
		<td>성명</td>
		<td>소속정당</td>
		<td>학력</td>
		<td>주민번호</td>
		<td>지역구</td>
		<td>대표전화</td>
	</tr>
	<%for(OneVO vo : list){ %>	
	<tr>
		<td><%=vo.getC_no() %></td>
		<td><%=vo.getP_name() %></td>
		<td><%=vo.getP_code() %></td>
		<td><%=vo.getC_school() %></td>
		<td><%=vo.getC_jumin() %></td>
		<td><%=vo.getC_city() %></td>
		<td><%=vo.getP_tel() %></td>
	</tr>
<%	} 
}else{
	out.print("<tr><td colspan='7'>조회된 자료가 없습니다.</td></tr>");
}
%>	
</table>
<jsp:include page="/master/footer.jsp"/>