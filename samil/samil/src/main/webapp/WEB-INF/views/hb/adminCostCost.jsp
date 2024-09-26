<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../1.main/admin_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정산</title>
<style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        main {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #8C8C8C; /* 제목 밑줄 색상 변경 */
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }
        a {
            text-decoration: none;
        }
        .button-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        input[type="button"] {
            background-color: #8C8C8C; /* 버튼 배경색 변경 */
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="button"]:hover {
            background-color: #A6A6A6; /* 마우스 오버 시 색상 변경 */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 2px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #8C8C8C; /* 테이블 헤더 배경색 변경 */
            color: white;
            font-size: 16px;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #B0BEC5; /* 행 마우스 오버 색상 변경 */
        }
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
<script>
    function openModal() {
        document.getElementById('myModal').style.display = "block";
    }

    function closeModal() {
        document.getElementById('myModal').style.display = "none";
    }
    
    function confirmDelete(codeNum) {
        const confirmation = confirm("정말 삭제하시겠습니까?");
        if (confirmation) {
            location.href = 'adminCostDelete?code=' + codeNum;
        }
    }
</script>

</head>
<body>
<main>
    <h2>관리자 정산 페이지입니다</h2>
    <div style="text-align: center;">
        <a href="adminCostCheck"><input type="button" value="내역 관리"></a>
        <input type="button" value="항목 추가" onclick="openModal()">
    </div>
    <table>
        <thead>
            <tr>
                <th>코드</th>
                <th>비용 항목</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="costCode" items="${adminCodeList}">
                <tr>
                    <td>${costCode.codeNum}</td>
                    <td>${costCode.codeName}</td>
                  <td>
    				<input type="button" value="삭제" onclick="confirmDelete('${costCode.codeNum}')">
				</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Modal for adding cost item -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>비용 항목 추가</h3>
            <form action="adminCostPlusEnd" method="post">
                <label for="codeName">비용 항목 이름:</label><br>
                <input type="text" id="codeName" name="codeName" required><br><br>
                <input type="submit" value="추가">
            </form>
        </div>
    </div>
</main>
</body>
</html>