<%@page import="dao.IsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.HtterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<HtterVO> list = dao.getHtterList();
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">선수 등록 코드 : <%= %> 성적조회</p>
			<table>
			<%if(list != null){ %>
				<tr>
					<td>선수등록코드</td>
					<td>선수명</td>
					<td>게임수</td>
					<td>타석수</td>
					<td>안타수</td>
					<td>공격포인트</td>
					<td>아웃 카운트</td>
					<td>더블플레이수</td>
					<td>에러수</td>
					<td>수비포인트</td>
				</tr>	
				<%for(HtterVO vo : list){ %>
				<tr>
					<td><%=vo.getRegistration_code() %></td>
					<td><%=vo.getGame_numbers() %></td>
					<td><%=vo.getAppearance() %></td>
					<td><%=vo.getHit_numbers() %></td>
					<td><%=vo.getHome_runs() %></td>
					<td><%=vo.getPut_out() %></td>
					<td><%=vo.getDouble_play() %></td>
					<td><%=vo.getError_count() %></td>
				</tr>
				<%	}
				} else{
					%>
					<script>
					alert("조회실패");
					location.href="/view/searchError.jsp";
					</script>
					<%
				}
				%>
			</table>
		<button><a href="/view/search.jsp">돌아가기</a></button>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>