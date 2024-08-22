<%@page import="vo.LlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	ArrayList<LlistVO> list = dao.getLlist();
%>    
<jsp:include page="/master/header.jsp"/>
<p id="p_title">학생 성적 목록 조회</p>
<table>
	<%if(list != null){ %>
	<tr>
		<td>학생코드</td>
		<td>학생이름</td>
		<td>주민번호</td>
		<td>과목명</td>
		<td>유형</td>
		<td>교수명</td>
		<td>중간고사</td>
		<td>기말고사</td>
		<td>출석</td>
		<td>과제</td>
		<td>기타</td>
	</tr>
	<%for(LlistVO vo : list){ %>
	<tr>
		<td><%=vo.getStudent_id() %></td>
		<td><%=vo.getStudent_name() %></td>
		<td><%=vo.getJumin() %></td>
		<td><%=vo.getSubject_name() %></td>
		<td><%=vo.getClassification() %></td>
		<td><%=vo.getProfessor_name() %></td>
		<td><%=vo.getMid_term() %></td>
		<td><%=vo.getFinal_term() %></td>
		<td><%=vo.getAttend() %></td>
		<td><%=vo.getReport() %></td>
		<td><%=vo.getEtc() %></td>
	</tr>
	<%
		}
	}else{
		out.print("<tr><td colspan='12'>조회된 자료가 없습니다.</td></tr>");
	}
	%>
</table>
<jsp:include page="/master/footer.jsp"/>