<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="bootstrapResources/css/freelancer.min.css"
	rel="stylesheet">

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

.container {
	position: absolute;
	top: 60px;
	left: 60px;
}

h2 {
	text-align: center;
}
</style>
<script type="text/javascript">
	function starpointPopup() {
		var popUrl = "starpoint.jsp";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);
	}

</script>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>완 료 LIST</h2>
				<hr class="star-primary">
			</div>
		</div>
		<div class="row">

	<table border="1">
		<tr>
			<th>버튼</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>즐겨찾기</th>
		</tr>
<%-- 		<c:forEach var="listValue" items="${list }"> --%>
			<tr>
				<td><input type="button" class="btn btn-default" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" class="btn btn-default" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" class="btn btn-default" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" class="btn btn-default" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" class="btn btn-default" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			
<%-- 		</c:forEach> --%>

	</table>
	
</body>
</html>