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
<title>Quest Header</title>
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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</head>
<body>
		<div align = "left">
			<span >
				<button type="button" id='dowellBtn' class='btn btn-success btn-lg'>잘해요</button>
				<button type="button" id='todoBtn' class='btn btn-success btn-lg'>해주세요</button>
			</span>
		</div>
		<div align = "right">
		<hr>
			<span>
				<c:choose>
					<c:when test="${param.id == null}">
						<form action="login.do">
								<span>id : <input type="text" name="id" ></span> 
								<span>pw: <input type="password" name="pw" ></span>
								<input type="submit" value="로그인" class='btn btn-success btn-lg'> 
								<input type="button" value="회원가입" onclick="location.href='joinForm.do'" class='btn btn-success btn-lg'>
						</form>

					</c:when>
					<c:otherwise>
						<span> ${param.id }님 환영합니다. </span>
						<input type="button" value="마이페이지"
							onclick="location.href='mypage.do'">
						<input type="button" value="로그아웃"
							onclick="location.href='logout.do'">

					</c:otherwise>
				</c:choose>
			</span>
			<hr>
		</div>
	<!-- jQuery -->
	<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

</body>
</html>