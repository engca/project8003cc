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

/* .container { */
/* 	position: absolute; */
/* 	top: 60px; */
/* 	left: 60px; */
/* } */
</style>

</head>
<body>
	<div id="board" class="container">
		<input type="button" class="btn btn-primary btn-lg" value="해주세요"
			onclick="location.href='mylist.do?boardFlag=0'"> <input
			type="button" class="btn btn-primary btn-lg" value="잘해요"
			onclick="location.href='mylist.do?boardFlag=1'">
		<div class="row">
			<div class="col-lg-12 ">
				<c:if test="${boardFlag ==0}">
					<h1 align="center">해 주 세 요</h1>
				</c:if>

				<c:if test="${boardFlag == 1}">
					<h1 align="center">잘 해 요</h1>
				</c:if>
			</div>
		</div>

		<c:if test="${boardFlag == 0 || boardFlag == 1 }">
			<hr class="star-primary">


			<table class="table table-striped">

				<tr>
					<th width="5%">No</th>
					<th width="15%">구분</th>
					<th width="45%">제목</th>
					<th width="15%">작성자</th>
					<th width="15%">작성일</th>
					<th width="5%">조회수</th>
				</tr>




				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.boardNo }</td>
						<td><c:if test="${board.bcompleteflag == 0 }">요청중</c:if> <c:if
								test="${board.acompleteflag == 1 }">신청중</c:if></td>
						<td>${board.title }</td>
						<!-- USER INDEX>ID -->
						<td>${board.닉네임 }</td>
						<td><fmt:formatDate value="${board.date }"
								pattern="yyyy-MM-dd" /></td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>

				<tr>
					<td width="1250px" colspan="6" align="center"><c:if
							test="${start != 1 }">
							<a href="list.do?page=1"> [처음] &nbsp; </a>
							<a href="list.do?page=${start-1 }"> ◀ &nbsp;&nbsp; </a>
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
							<a href="list.do?page=${end+1 }"> &nbsp;&nbsp; ▶ </a>
							<a href="list.do?page=${last}"> &nbsp; [끝]</a>
						</c:if></td>
				</tr>

			</table>
		</c:if>
	</div>
</body>
</html>