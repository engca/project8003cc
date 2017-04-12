<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 뿌리기</title>
<style type="text/css">
a {
	text-decoration: none
}
</style>
</head>
<body>

	<div id="board_title">
		<hi> ${title }</hi>
	</div>
	<div id="board">
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<c:forEach var="board" items="list">
				<tr>
					<td>${board.boardNo }</td>
					<td>${board.title }</td>
					<td>#{board.nickname }</td>
					<td>${board.date }</td>
					<td>${board.readcount }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

		<div id="paging">
			<a href="list.do?page=${first }">◀</a>
			<c:forEach var="num" begin="${start }" end="${end }">
				<c:choose>
					<c:when test="${num == current }">
							<b>${num}</b>  
					</c:when>
					<c:otherwise>
						<a href="list.do?page=${num}"> [${num}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="list.do?page=${last }">▶ </a>
		</div>



</body>
</html>