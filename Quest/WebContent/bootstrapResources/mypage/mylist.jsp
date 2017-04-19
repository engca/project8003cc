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
    <link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">


</head>
<body>

<input type = "button" value="해주세요" onclick="location.href='리스트보여주기.do?boardflag=0'" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<input type = "button" value="잘해요" onclick="location.href='리스트보여주기.do?boardflag=1'">
	<c:if test="${boardflag }== 0">
	<h2>해 주 세 요</h2>
	<hr class="star-primary">
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
				<td><c:if test="${board.bcompleteflag == 0 }">요청중</c:if>
				 	<c:if test="${board.acompleteflag == 1 }">신청중</c:if></td>
				<td>${board.title }</td>
				<!-- USER INDEX>ID -->
				<td>${board.닉네임 }</td>
				<td><fmt:formatDate value="${board.date }" pattern="yyyy-MM-dd" /></td>
				<td>${board.readcount }</td>
			</tr>
		</c:forEach>

		<tr>
			<td width="1250px" colspan="6" align="center">
				<c:if test="${start != 1 }">
					<a href="list.do?page=1"> [처음] &nbsp </a>
					<a href="list.do?page=${start-1 }"> ◀ &nbsp&nbsp </a>
				</c:if>
				<c:forEach begin="${start }" end="${end}" var="i">
					<c:choose>
						<c:when test="${i == current }">
							[${i }]
						</c:when>
						<c:otherwise>
							<a href="list.do?page=${i}"> [${i }] </a>
						</c:otherwise>
					</c:choose>

				</c:forEach> 
					<c:if test="${end != last }">
						<a href="list.do?page=${end+1 }"> &nbsp&nbsp  ▶ </a>
						<a href="list.do?page=${last}"> &nbsp [끝]</a>
					</c:if>
			</td>
		</tr>

	</table>
    <!-- jQuery -->
    <script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
    <script src="bootstrapResources/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="bootstrapResources/js/freelancer.min.js"></script>

</body>
</html>