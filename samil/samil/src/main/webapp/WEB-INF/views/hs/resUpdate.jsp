<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../1.main/user_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resUpdate</title>
<style type="text/css">
	/* 메인 */
	.entire {
		display: flex;
		margin: 40px 120px 20px 150px;
	}
	
	/* 버튼 위치 조정 */
    .form-actions {
        margin-top: 20px;
        text-align: right; /* 버튼을 왼쪽으로 정렬 */
    }
</style>
</head>
<body>
<div class="entire">
	<form action="resRealUpdate" method="post">
		<div class="writeReservation">
			<h2>시설 예약 수정</h2>
			<input type="hidden" name="resCode" value="${reservation.resCode }">
			<table>
				<tr>
					<th>시설명</th>
					<td>
						<select name="facilId">
							<c:forEach var="facility" items="${facilSort }">
								<option value="${facility.facilId }"
									<c:if test="${facility.facilId == reservation.facilId}">selected</c:if>
								>${facility.facilType } ${facility.facilName }
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>일시</th>
					<td>
						<input type="datetime-local" name="resStart" required="required" value="${reservation.resStart }">
						<input type="datetime-local" name="resEnd" required="required" value="${reservation.resEnd }">
					</td>
				</tr>
				<tr>
					<th>예약내용</th>
					<td><input type="text" name="resContent" required="required" value="${reservation.resContent }"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="resTel" value="${reservation.resTel }"></td>
				</tr>
				<tr>
					<th>요청사안</th>
					<td><input type="text" name="resRequest" value="${reservation.resRequest }"></td>
				</tr>
			</table>
			<div class="form-actions">
				<input type="submit" value="수정">
			</div>
		</div>
	</form>
</body>
</html>