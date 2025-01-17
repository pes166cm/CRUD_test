<%@page import="dao.AddDAO"%>
<%@page import="vo.ListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AddDAO dao = new AddDAO();
	ListVO vo = dao.listOne(request.getParameter("id"));
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">교과목 목록 수정</p>
		<form action="updateProc.jsp">
			<table>
				<tr>
					<td>과목코드</td>
					<td><input type="text" id="id" name="id" value="<%=vo.getId() %>"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" id="name" name="name" value="<%=vo.getName() %>"></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="number" id="credit" name="credit" value="<%=vo.getCredit() %>"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td>
						<select id="lecturer" name="lecturer">
							<option value="0">===강사선택===</option>
							<option value="1" <%="1".equals(vo.getLecturer())?"selected":"" %>>김교수</option>
							<option value="2" <%="2".equals(vo.getLecturer())?"selected":"" %>>이교수</option>
							<option value="3" <%="3".equals(vo.getLecturer())?"selected":"" %>>박교수</option>
							<option value="4" <%="4".equals(vo.getLecturer())?"selected":"" %>>우교수</option>
							<option value="5" <%="5".equals(vo.getLecturer())?"selected":"" %>>최교수</option>
							<option value="6" <%="6".equals(vo.getLecturer())?"selected":"" %>>임교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
						<input type="radio" id="week1" name="week" value="1" <%="1".equals(vo.getWeek())?"checked":"" %>>월요일
						<input type="radio" id="week2" name="week" value="2" <%="2".equals(vo.getWeek())?"checked":"" %>>화요일
						<input type="radio" id="week3" name="week" value="3" <%="3".equals(vo.getWeek())?"checked":"" %>>수요일
						<input type="radio" id="week4" name="week" value="4" <%="4".equals(vo.getWeek())?"checked":"" %>>목요일
						<input type="radio" id="week5" name="week" value="5" <%="5".equals(vo.getWeek())?"checked":"" %>>금요일
					</td>
				</tr>
				<tr>
					<td>시작시간 예)0930</td>
					<td><input type="text" id="start_hour" name="start_hour" value="<%=vo.getStart_hour() %>"></td>
				</tr>
				<tr>
					<td>종료시간 예)0930</td>
					<td><input type="text" id="end_hour" name="end_hour" value="<%=vo.getEnd_hour() %>"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="수정하기">
						<button><a href="/view/list.jsp">목록보기</a></button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>