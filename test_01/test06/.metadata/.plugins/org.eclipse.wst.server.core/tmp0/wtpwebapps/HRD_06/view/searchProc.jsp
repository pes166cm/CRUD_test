<%@page import="vo.SearchVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라메타 받기
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	IsDAO dao = new IsDAO();
	ArrayList<SearchVO> list = dao.getSearch(r_no);
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">예약번호 : <%=r_no %> 조회결과</p>
		<table>
			<tr>
				<td>예약번호</td>
				<td>성명</td>
				<td>성별</td>
				<td>병원이름</td>
				<td>예약날짜</td>
				<td>예약시간</td>
				<td>백신코드명</td>
				<td>병원지역</td>
			</tr>
<%			
			if(list != null){ 
				for(SearchVO vo : list){
					
%>
			<tr>
				<td><%=vo.getR_no() %></td>
				<td><%=vo.getJ_name() %></td>
				<td><%=vo.getJ_jumin() %></td>
				<td><%=vo.getH_name() %></td>
				<td><%=vo.getR_date() %></td>
				<td><%=vo.getR_time() %></td>
				<td><%=vo.getH_code() %></td>
				<td><%=vo.getH_zone() %></td>
			</tr>
<%				}
			}else{
%>
				<tr><td colspan="8">조회된 자료가 없습니다.</td></tr>
<%
			}
%>
		</table>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>