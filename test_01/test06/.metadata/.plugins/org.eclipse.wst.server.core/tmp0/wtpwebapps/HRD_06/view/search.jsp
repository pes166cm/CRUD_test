<%@page import="vo.SearchVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"/>
<section>
	<div class="content">
		<p class="title">백신 예약 조회</p>
		<table>	
			<form action="searchProc.jsp" name="frm" method="get">
				<tr>
					<td>예약번호</td>
					<td colspan="7"><input type="number" id="r_no" name="r_no"></td>
				</tr>
				<tr>
					<td colspan="8">
						<input type="submit" value="조회하기"  onclick="return check()">
						<button><a href="/">홈으로</a></button>
					</td>
				</tr>
			</form>
		</table>
	</div>
</section>
<jsp:include page="/master/footer.jsp"/>
<script>
	function check(){
		if(document.querySelector("#find").value.trim() == ""){
			alert("예약번호를 입력해주세요.");
			document.querySelector("#find").focus();
			return false;
		}
		return true;
	}
</script>