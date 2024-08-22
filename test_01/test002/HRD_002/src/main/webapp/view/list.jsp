<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getList();
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">회원목록조회/수정</p>
	<table>
	<%if(list != null){ %>
		<tr>
			<td>회원ID</td>
			<td>회원명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>직업</td>
			<td>메일수신여부</td>
			<td>자기소개</td>
			<td>삭제</td>
		</tr>
		<% for(MemberVO vo : list){ %>
		<tr>
			<td><a href="/view/update.jsp?userid=<%=vo.getUserid()%>"><%=vo.getUserid() %></a></td>
			<td><%=vo.getUsername() %></td>
			<td><%=vo.getJumin() %></td>
			<td><%=vo.getGender() %></td>
			<td><%=vo.getJobcd() %></td>
			<td><%=vo.getMailrcv() %></td>
			<td><%=vo.getIntro() %></td>
			<td><a href="/view/delete.jsp?userid=<%=vo.getUserid()%>">삭제</a></td>
		</tr>
		<% }
		}else{
			out.print("<tr><td colspan='8'>조회된 자료가 없습니다.</td></tr>");
		}
		%>
		
		
		
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>