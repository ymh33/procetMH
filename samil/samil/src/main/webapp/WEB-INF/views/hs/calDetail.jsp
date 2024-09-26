<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../1.main/user_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calDetail</title>
<style type="text/css">
	/* 메인 */
	main {
		margin: 0px 120px 0px 150px;
	}
	
	.entire {
		width: 100%;
	}
	
	/* 버튼 스타일 */
	.btn {
		padding: 4px 10px;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		cursor: pointer;
		transition: all 0.3s ease;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 기본 그림자 */
		font-size: 14px;
    }

	.bef {
		background-color: #d3d3d3; /* 회색 */
		color: black;
    }

	.bef:hover {
		background-color: #c0c0c0; /* 호버 시 색상 변화 */
		box-shadow: inset 0 4px 6px rgba(0, 0, 0, 0.2); /* 눌리는 느낌 */
	}

	.upd {
		background-color: #4374D9; /* 하늘색 */
		color: white;
	}

	.upd:hover {
		background-color: #1F50B5; /* 호버 시 색상 변화 */
		box-shadow: inset 0 4px 6px rgba(0, 0, 0, 0.2); /* 눌리는 느낌 */
    }

	.del {
		background-color: #FF0000; /* 빨간색 */
		color: white;
	}

	.del:hover {
		background-color: #DB0000; /* 호버 시 색상 변화 */
		box-shadow: inset 0 4px 6px rgba(0, 0, 0, 0.2); /* 눌리는 느낌 */
	}
</style>
<!-- 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	function confirmDel(eventId) {
		// 알림창 띄우기
		var result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
			// 사용자가 확인을 클릭한 경우, 삭제 요청을 수행합니다.
			window.location.href = 'deleteEvent?eventId=' + eventId;
		}
	}
</script>
</head>
<body>
<main>
	<div class="entire">
		<h2>일정 상세보기</h2>
		<table>
			<tr>
				<th>제목</th>
				<td>${attendee.eventTitle }</td>
			</tr>
			<tr>
				<th>일시</th>
				<td>${attendee.formatStartdate } - 
					  ${attendee.formatEnddate }
				</td>
			</tr>
			<tr>
				<th>분류</th>
				<td>${cateMap[attendee.eventCategory]}</td>
			</tr>
			<tr>
				<th>장소</th>
				<td>${attendee.eventLoc }</td>
			</tr>
			<tr>
				<th>메모</th>
				<td>${attendee.eventMemo }</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>${attendee.eventFile }</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;">
					<input type="button" class="btn btn-outline-secondary btn-sm" value="이전" onclick="location.href='/hs/cal'">
					<c:if test="${attendee.eventCategory != 100 }">
						<c:if test="${attendee.attendRsvp != 110 }">
							<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="location.href='/hs/calUpdate?eventId=${attendee.eventId}'">
							<form action="deleteEvent" method="post" style="display: inline;">
								<input type="hidden" name="eventId" value="${attendee.eventId }">
								<input type="hidden" name="eventDelete" value="110">
								<button type="submit" class="btn btn-outline-danger btn-sm" onclick="confirmDel(${attendee.eventId})">삭제</button>
							</form>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</main>
</body>
</html>