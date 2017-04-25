<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
var doClose = function() {
	window.open("about:blank", "_self").close();
}
</script>
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
</head>

<body>
	<hr class="star-primary">
	<h2>삭제하시겠습니까?</h2>
	<p>
	<hr class="star-primary">
	<center>
		<input type="button" class="btn btn-primary btn-lg" value="삭제"
			onclick="location.href='deleteBoard.do?boardNo=${boardList.boardNo }'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button"	class="btn btn-success btn-lg" value="취소"
			onclick="doClose()">
	</center>

</body>
</html>