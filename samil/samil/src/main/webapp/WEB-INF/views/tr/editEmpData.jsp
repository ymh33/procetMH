<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../1.main/admin_header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사원정보등록</title>
<script type="text/javascript">
	function email_change() {
		if (document.join.email.options[document.join.email.selectedIndex].value == '0') {
			document.join.email2.disabled = true;
			document.join.email2.value = "";
		}
		if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
			document.join.email2.disabled = false;
			document.join.email2.value = "";
			document.join.email2.focus();

		} else {
			document.join.email2.disabled = true;
			document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
		}
		1002
	}
</script>

</head>
<body>
	<main>
		<h2>관리자 사원정보수정 페이지입니다</h2>
		${emp.name}
		<form name="join" action="updateEmp" method="post">
			이름: ${emp1.name} <input type="text" required="required" name="name"
				hidden="hidden" value="${emp1.name}">
			<p>
				사원번호: ${emp1.empno} <input type="number" required="required"
					name="empno" hidden="hidden" value="${emp1.empno}">
			<p>
				이메일 : <input type="text" name="email1" value=""
					onfocus="this.value='';"> @ <input type="text"
					name="email2" value="" disabled> <select name="email"
					onchange="email_change()">
					<option value="0">선택하세요</option>
					<option value="9">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
				</select>
			<p>
				전화번호 :<input type="text" name="phone" value="${emp1.phone}">
			<p>
				직급: <select name="grade">
					<option value=100
						<c:if test="${emp1.grade eq 100}" >selected="selected"</c:if>>사원</option>
					<option value=110
						<c:if test="${emp1.grade eq 110}" >selected="selected"</c:if>>주임</option>
					<option value=120
						<c:if test="${emp1.grade eq 120}" >selected="selected"</c:if>>대리</option>
					<option value=130
						<c:if test="${emp1.grade eq 130}" >selected="selected"</c:if>>과장</option>
					<option value=140
						<c:if test="${emp1.grade eq 140}" >selected="selected"</c:if>>차장</option>
					<option value=150
						<c:if test="${emp1.grade eq 150}" >selected="selected"</c:if>>부장</option>
					<option value=160
						<c:if test="${emp1.grade eq 160}" >selected="selected"</c:if>>사장</option>
				</select>
			<p>
				직책: <select name="job">
					<option value="100"
						<c:if test="${emp1.job eq 100}" >selected="selected"</c:if>>평사원</option>
					<option value="110"
						<c:if test="${emp1.job eq 110}" >selected="selected"</c:if>>팀장</option>
					<option value="120"
						<c:if test="${emp1.job eq 120}" >selected="selected"</c:if>>대표</option>
				</select>
			<p>
				은행: <input type="text" name="bank" value="${emp1.bank}">
			<p>
				계좌: <input type="text" name="account" value="${emp1.account}">
			<p>
				주소: <input type="text" name="address" value="${emp1.address}">
			<p>
				부서 : <select name="deptno">
					<c:forEach var="dept" items="${deptList}">
						<option value="${dept.deptno}"
							<c:if test="${emp1.deptno eq dept.deptno}" >selected="selected"</c:if>>${dept.deptName}</option>
					</c:forEach>
				</select>
			<p>
				<input value="${emp.empno}" name="recentEditor" hidden="hidden">
				<c:choose>
					<c:when test="${emp.admin eq 160}">
				권한 : 
			<input type="radio" name="admin" value="100"
							<c:if test="${emp1.admin eq 100}">checked="checked"</c:if>>인사 
				<input type="radio" name="admin" value="110"
							<c:if test="${emp1.admin eq 110}">checked="checked"</c:if>>결재
				 <input type="radio" name="admin" value="120"
							<c:if test="${emp1.admin eq 120}">checked="checked"</c:if>>급여
				 <input type="radio" name="admin" value="130"
							<c:if test="${emp1.admin eq 130}">checked="checked"</c:if>>비용
				 <input type="radio" name="admin" value="140"
							<c:if test="${emp1.admin eq 140}">checked="checked"</c:if>>게시판
				<input type="radio" name="admin" value="150"
							<c:if test="${emp1.admin eq 150}">checked="checked"</c:if>>일정 
				 <input type="radio" name="admin" value="160"
							<c:if test="${emp1.admin eq 160}">checked="checked"</c:if>>마스터
				 <input type="radio" name="admin" value="170"
							<c:if test="${emp1.admin eq 170}">checked="checked"</c:if>>권한없음
						</c:when>
					<c:otherwise>
						<input type="text" name="admin" value="${emp1.admin}"
							hidden="hidden">
					</c:otherwise>

				</c:choose>
			<p>
				<input type="submit" value="수정">
		</form>
	</main>
</body>
</html>