<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="board" class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1>즐 겨 찾 기</h1>
				<hr class="star-primary">
				
			</div>
		</div>
	
		<table class="table table-striped">
			<tr>
				<th width="5%">     </th>
				<th width="15%">신청자</th>
				<th width="10%">선택한 보상</th>
				<th width="10%">연락처</th>
			</tr>

			<c:forEach var="board" items="${bookmarkList }">
				<tr>
					<td>${board.boardNo }</td>
					<td><c:if test="${board.boardFlag == 0 }">잘해요</c:if> <c:if
							test="${board.boardFlag == 1 }">해주세요</c:if></td>
					<td><a href="viewBoard.do?boardNo=${board.boardNo }">
							${board.title }</a></td>
					<!-- USER INDEX>ID -->
					<td>${nickname }</td>
					<td><fmt:formatDate value="${board.date }"
							pattern="yyyy-MM-dd" /></td>
					<td>${board.readCount }</td>
					<td><input type="button" value="삭제" name="${board.boardNo }" onclick="deleteBook(this)">
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>

</body>
</html>