<%@page import="java.util.ArrayList"%>
<%@page import="dao.IsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IsDAO dao = new IsDAO();
	ArrayList<String> list = dao.getP_no(); 
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">검사 결과 입력</p>
		<form action="inputProc.jsp">
			<table>
				<tr>
					<td>환자번호</td>
					<td>
						<select id="p_no" name="p_no">
							<option value="0">환자번호선택</option>
							<option value="1001">1001</option>
							<option value="1002">1002</option>
							<option value="1003">1003</option>
							<option value="1004">1004</option>
							<option value="1005">1005</option>
							<option value="1006">1006</option>
							<option value="1007">1007 </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>검사코드</td>
					<td>
						<select id="t_code" name="t_code">
							<option value="0">검사코드를 선택하세요</option>
							<option value="T001">결핵</option>
							<option value="T002">장티푸스</option>
							<option value="T003">수두</option>
							<option value="T004">홍역</option>
							<option value="T005">콜레라</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>검사시작일</td>
					<td><input type="date" id="t_sdate" name="t_sdate"></td>
				</tr>
				<tr>
					<td>검사상태</td>
					<td>
						<input type="radio" id="t_status" name="t_status" value="1">검사중
						<input type="radio" id="t_status" name="t_status" value="2">검사완료
					</td>
				</tr>
				<tr>
					<td>검사종료일</td>
					<td><input type="date" id="t_ldate" name="t_ldate"></td>
				</tr>
				<tr>
					<td>검사결과</td>
					<td>
						<select id="t_result" name="t_result">
							<option value="X">미입력</option>
							<option value="N">음성</option>
							<option value="P">양성</option>
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