<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 잘해요 검색결과  리스트 -->
	<div id="welldoboard" class="container">
		<div class="row">
		<div class="col-lg-12">
			<h2>잘해요</h2>
<%-- 			<h2>${title}</h2> --%>
			<hr class="star-primary1">
		</div>
		</div>

		<table class="table table-striped">
			<tr>
				<th width="10%">No</th>
				<th width="40%">제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="board" items="list">
				<tr>
					<td> 111 </td>
					<td> 제목입니다. </td>
					<td> 닉네임 </td>
					<td> 2017-01-01 </td>
					<td> 1 </td>
<!-- 					서버 연동되면 아래 살리기 -->
<%-- 					<td>${board.boardNo }</td> --%>
<%-- 					<td><a href="readBoard.do?boardNo=${board.boardNo }">	${board.title }</a></td> --%>
<%-- 					<td>#{board.nickname }</td> --%>
<%-- 					<td>${board.date }</td> --%>
<%-- 					<td align="center"><fmt:formatDate value="${board.readcount }"  pattern="yyyy-MM-dd" /> --%>
				</tr>
			</c:forEach>
		</table>
	</div>

<!-- 해주세요 검색결과  리스트 -->
	
	<div id="todoboard" class="container">
		<div class="row">
		<div class="col-lg-12">
			<h2>해주세요</h2>
<%-- 			<h2>${title}</h2> --%>
			<hr class="star-primary1">
		</div>
		</div>

		<table class="table table-striped">
			<tr>
				<th width="10%">No</th>
				<th width="40%">제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="board" items="list">
				<tr>
					<td> 111 </td>
					<td> 제목입니다. </td>
					<td> 닉네임 </td>
					<td> 2017-01-01 </td>
					<td> 1 </td>
<!-- 					서버 연동되면 아래 살리기 -->
<%-- 					<td>${board.boardNo }</td> --%>
<%-- 					<td><a href="readBoard.do?boardNo=${board.boardNo }">	${board.title }</a></td> --%>
<%-- 					<td>#{board.nickname }</td> --%>
<%-- 					<td>${board.date }</td> --%>
<%-- 					<td align="center"><fmt:formatDate value="${board.readcount }"  pattern="yyyy-MM-dd" /> --%>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>