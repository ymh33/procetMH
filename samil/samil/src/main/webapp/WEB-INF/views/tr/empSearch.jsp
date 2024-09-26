<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../1.main/user_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

</style>
<title>관리자 사원정보관리</title>
</head>
<body>
	<main>
		<h2>사용자 사원 검색 페이지입니다</h2>
		${emp.name}
		<form action="searchEmpByKeyword" method="get">
			<input type="text" name="keyword"
				placeholder="Search by name or department" />
			<button type="submit">검색</button>
		</form>
		<br />
		<table border="1">
			<thead>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>직급</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${empDeptList}">
					<tr>
						<td>${emp.empno}</td>
						<td class="empName">${emp.name}</td>
						<td>${emp.deptName}</td>
						<td><c:choose>
								<c:when test="${emp.job == 100}">평사원</c:when>
								<c:when test="${emp.job == 110}">팀장</c:when>
								<c:when test="${emp.job == 120}">대표</c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${emp.grade == 100}">사원</c:when>
								<c:when test="${emp.grade == 110}">주임</c:when>
								<c:when test="${emp.grade == 120}">대리</c:when>
								<c:when test="${emp.grade == 130}">과장</c:when>
								<c:when test="${emp.grade == 140}">차장</c:when>
								<c:when test="${emp.grade == 150}">부장</c:when>
								<c:when test="${emp.grade == 160}">사장</c:when>
							</c:choose></td>
						<td>${emp.phone}</td>
						<td>${emp.email}</td>
					</tr>
				</c:forEach>

				<c:if test="${empty empDeptList}">
					<tr>
						<td colspan="3">No employees found</td>
					</tr>
				</c:if>
			</tbody>
		</table>

	</main>
</body>
</html>