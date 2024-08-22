<%@page import="vo.TwoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TpDAO dao = new TpDAO();
	ArrayList<TwoVO> list = dao.getTwoList();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">투표 검수 조회</p>
<table>
<% if(list != null){ %>
	<tr>
		<td>성명</td>
		<td>생년월일</td>
		<td>나이</td>
		<td>성별</td>
		<td>후보번호</td>
		<td>투표시간</td>
		<td>유권자확인</td>
	</tr>
<%  for(TwoVO vo : list){ %>	
	<tr>
		<td><%=vo.getV_name() %></td>
		<td><%=vo.getV_jumin() %></td>
		<td><%=vo.getAge() %></td>
		<td><%=vo.getV_gender() %></td>
		<td><%=vo.getC_no() %></td>
		<td><%=vo.getV_time() %></td>
		<td><%=vo.getV_confirm() %></td>
	</tr>
<%
	}
}else{
	out.print("<tr><td colspan='7'>조회된 자료가 없습니다.</td></tr>");
}
%>
</table>
<jsp:include page="/master/footer.jsp"/>