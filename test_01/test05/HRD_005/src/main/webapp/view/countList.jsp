<%@page import="vo.CountVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<CountVO> list = dao.getcountList();
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">검사 결과 조회</p>
	<table>
		<tr>
			<td>지역번호</td>
			<td>지역명</td>
			<td>검사건수</td>
		</tr>
		<% 
			if(list != null){
				for(CountVO vo : list){	
		%>
			<tr>
				<td><%=vo.getP_city() %></td>
				<td><%=vo.getCity() %></td>
				<td><%=vo.getCount() %></td>
			</tr>
		<%	
				}  
			}else{
			out.print("<tr><td colspan='3'>조회된 정보가 없습니다.</td></tr>");
			}
		%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>