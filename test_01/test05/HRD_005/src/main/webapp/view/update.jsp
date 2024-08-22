<%@page import="vo.PlistVO"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	PlistVO vo = dao.listOne(request.getParameter("p_no"));
%>    
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">환자 정보 수정</p>
		<form action="updateProc.jsp">
			<table>
				<tr>
					<td>환자번호</td>
					<td><input type="text" id="p_no" name="p_no" value="<%=vo.getP_no() %>"></td>
				</tr>
				<tr>
					<td>환자성명</td>
					<td><input type="text" id="p_name" name="p_name" value="<%=vo.getP_name() %>"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" id="p_birth" name="p_birth" value="<%=vo.getP_birth()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" id="p_gender1" name="p_gender" value="M" <%="M".equals(vo.getP_gender())?"checked":""%> >남자
						<input type="radio" id="p_gender2" name="p_gender" value="F" <%="F".equals(vo.getP_gender())?"checked":""%> >여자
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" id="p_tel1" name="p_tel1" value="<%=vo.getP_tel1()%>"> - 
						<input type="text" id="p_tel2" name="p_tel2" value="<%=vo.getP_tel2()%>"> - 
						<input type="text" id="p_tel3" name="p_tel3" value="<%=vo.getP_tel3()%>">
					</td>
				</tr>
				<tr>
					<td>도시</td>
					<td>
						<select id="p_city" name="p_city">
							<option value="0">도시코드를 선택하세요.</option>
							<option value="10" <%="10".equals(vo.getP_city())?"selected":"" %>>서울</option>
							<option value="20" <%="20".equals(vo.getP_city())?"selected":"" %>>경기</option>
							<option value="30" <%="30".equals(vo.getP_city())?"selected":"" %>>강원</option>
							<option value="40" <%="40".equals(vo.getP_city())?"selected":"" %>>대구</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="저장하기">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>