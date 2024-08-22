<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@page import="vo.Student2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StudentDAO dao = new StudentDAO();
	ArrayList<Student2VO> list = dao.getList2();
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<p id="p_title">성적조회/수정</p>
	
	<table>
	 	<%if(list != null){
	 		double sKor = 0;
	 		double sMath = 0; 
	 		double sEng = 0;
	 		double sHist = 0;
	 		double sSum = 0;
	 		double sAvg = 0;
	 		int count = 0;
	 	%>
		<tr>
			<td>학년</td>
			<td>반</td>
			<td>번호</td>
			<td>이름</td>
			<td>국어</td>
			<td>수학</td>
			<td>영어</td>
			<td>역사</td>
			<td>합계</td>
			<td>평균</td>
			<td>석차</td>
		</tr>
		<% for(Student2VO vo : list){ %>
		<tr>
			<td><%= vo.getYear() %></td>
			<td><%= vo.getBan() %></td>
			<td><%= vo.getNum() %></td>
			<td><a href="/view/update2.jsp?s_no=<%=vo.getS_no()%>&s_name=<%=vo.getS_name()%>"><%= vo.getS_name() %></a></td>
			<td><%= vo.getE_kor() == 0 ? "" : vo.getE_kor() %></td>
			<td><%= vo.getE_math() == 0 ? "" : vo.getE_math() %></td>
			<td><%= vo.getE_eng() == 0 ? "" : vo.getE_eng()%></td>
			<td><%= vo.getE_hist() == 0 ? "" : vo.getE_hist() %></td>
			<td><%= vo.getSum() == 0 ? "" : vo.getSum() %></td>
			<td><%= vo.getAvg() == 0 ? "" : vo.getAvg() %></td>
			<td><%= vo.getRank() == 0 ? "" : vo.getRank() %></td>
		</tr>
		<%
			sKor += vo.getE_kor();
			sMath += vo.getE_math();
			sEng += vo.getE_eng();
			sHist += vo.getE_hist();
			sSum += vo.getSum();
			sAvg += vo.getAvg();
			if(vo.getAvg() !=0){
				count++;
			}
			}
		%>
		<tr>
			<td colspan="4">과목별 합</td>
			<td><%=sKor %></td>	
			<td><%=sMath %></td>	
			<td><%=sEng %></td>	
			<td><%=sHist %></td>	
			<td><%=sSum %></td>	
			<td><%=sAvg/count %></td>	
			<td></td>	
		</tr>
		<% } else{
			out.print("<tr><td colspan='11'>조회된 자료가 없습니다.</td></tr>");
		}%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>