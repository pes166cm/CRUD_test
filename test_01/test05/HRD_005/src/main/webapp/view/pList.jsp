<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@page import="vo.PlistVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<PlistVO> list = dao.getpList();
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">환자 조회/수정</p>
	<table>
		<tr>
			<td>환자번호</td>
			<td>환자성명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>지역</td>
		</tr>
		<% 
			if(list != null){
				for(PlistVO vo : list){	
		%>
			<tr>
				<td><a href="/view/update.jsp?p_no=<%=vo.getP_no()%>"><%=vo.getP_no() %></a></td>
				<td><%=vo.getP_name() %></td>
				<td><%=vo.getP_birth() %></td>
				<td><%=vo.getP_gender() %></td>
				<td><%=vo.getP_tel() %></td>
				<td><%=vo.getP_city()%></td>
			</tr>
		<%	
				}  
			}else{
			out.print("<tr><td colspan='6'>조회된 정보가 없습니다.</td></tr>");
			}
		%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>