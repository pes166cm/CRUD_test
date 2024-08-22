<%@page import="java.util.ArrayList"%>
<%@page import="vo.StudentVO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//dao생성
	//dao에 있는 함수(메서드)를 실행시켜서 ArrayList(뭉치)로 가져오긴
	
	StudentDAO dao = new StudentDAO();
	ArrayList<StudentVO> list = dao.getList();
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">학생조회/수정</p>
	<table>
		<% if(list != null){ %>
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>반</td>
			<td>번호</td>
			<td>성별</td>
			<td>전화번호</td>
			<td>주소</td>
		</tr>
		<% for(StudentVO vo : list){ %>
		<tr>
			<td><a href="/view/update.jsp?s_no=<%= vo.getS_no() %>"><%= vo.getS_no() %></a></td>
			<td><%= vo.getS_name() %></td>
			<td><%= vo.getYear() %></td>
			<td><%= vo.getBan() %></td>
			<td><%= vo.getNum() %></td>
			<td><%= vo.getS_gender() %></td>
			<td><%= vo.getS_phone() %></td>
			<td><%= vo.getS_address() %></td>
		</tr>
		
		<%
			}
		} else{ 
			out.print("<tr><td colspan='8'>조회된 자료가 없습니다.</td></tr>");
		}
		%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>