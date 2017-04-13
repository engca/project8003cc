<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type = "button" value="해주세요" onclick="location.href='리스트보여주기.do?boardflag=0'">
<input type = "button" value="잘해요" onclick="location.href='리스트보여주기.do?boardflag=1'">
	<c:if test="${boardflag }== 0">
	<h1>해 주 세 요</h1>
		</c:if>
		
		<c:if test="${boardflag }== 1">
	<h1>잘 해 요</h1>
		</c:if>
	<p>
	<table border="1">
		<tr>
			<td align="center" width="150">글번호</td>
			<td align="center" width="150">구 분</td>
			<td align="center" width="150">제 목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="150">조회수</td>
		</tr>




		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.boardNo }</td>
				<td><c:if test="${board.bcompleteflag == 0 }">요청중</c:if> <c:if
						test="${board.acompleteflag == 1 }">신청중</c:if></td>
				<td>${board.title }</td>
				<!-- USER INDEX>ID -->
				<td>${board.닉네임 }</td>
				<td><fmt:formatDate value="${board.date }" pattern="yyyy-MM-dd" /></td>
				<td>${board.readcount }</td>
			</tr>
		</c:forEach>

		<tr>
			<td width="1250px" colspan="6" align="center"><c:if
					test="${start != 1 }">
					<a href="list.do?page=1"> [처음] &nbsp </a>
					<a href="list.do?page=${start-1 }"> ◀ &nbsp&nbsp </a>
				</c:if> <c:forEach begin="${start }" end="${end}" var="i">
					<c:choose>
						<c:when test="${i == current }">
					[${i }]
					</c:when>
						<c:otherwise>
							<a href="list.do?page=${i}"> [${i }] </a>
						</c:otherwise>
					</c:choose>

				</c:forEach> <c:if test="${end != last }">
					<a href="list.do?page=${end+1 }"> &nbsp&nbsp  ▶ </a>
					<a href="list.do?page=${last}"> &nbsp [끝]</a>
				</c:if></td>
		</tr>

	</table>

</body>
</html>