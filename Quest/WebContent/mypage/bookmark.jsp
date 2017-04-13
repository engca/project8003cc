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
<h1> 즐 겨 찾 기</h1>

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
				<td><c:if test="${board.boardflag == 0 }">해주세요</c:if>
				 <c:if	test="${board.boardflag == 1 }">잘해요</c:if></td>
				<td>${board.title }</td>
				<!-- USER INDEX>ID -->
				<td>${board.userindex }</td>
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