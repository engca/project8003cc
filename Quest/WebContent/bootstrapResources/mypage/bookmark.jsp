<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
<script src="bootstrapResources/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="bootstrapResources/js/freelancer.min.js"></script>

<style type="text/css">
th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}

h1 {
	text-align: center;
}
</style>

</head>
<body>
	<div id="board" class="container">
		<div class="row">
				<h1>즐 겨 찾 기</h1>
				<hr class="star-primary">
			</div>
		</div>
		<table class="table tablestriped">
			<tr>
				<th width="5%">No</th>
				<th width="15%">구분</th>
				<th width="45%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="5%">조회수</th>
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
				</tr>
			</c:forEach>

			<tr>
				<td width="1250px" colspan="6" align="center"><c:if
						test="${start != 1 }">
						<a href="bookmark.do?page=1"> [처음] &nbsp; </a>
						<a href="bookmark.do?page=${start-1 }"> ◀ &nbsp;&nbsp; </a>
					</c:if> <c:forEach begin="${start }" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current }">
					[${i }]
					</c:when>
							<c:otherwise>
								<a href="bookmark.do?page=${i}"> [${i }] </a>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${end != last }">
						<a href="bookmark.do?page=${end+1 }"> &nbsp;&nbsp; ▶ </a>
						<a href="bookmark.do?page=${last}"> &nbsp; [끝]</a>
					</c:if></td>
			</tr>

		</table>
	</div>
</body>
</html>