<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Welcome To Quest World</title>
<script type="text/javascript">
function loginPopup(){
	window.name="pareWin";
	window.open('loginForm.do','','width=500, height=400, top = 200, left= 300"');  
}

</script>
<style type="text/css">
#main{
	position : relative;
	height : 150px;
}
.page-scroll1 {
	font-size: 20px;
}

.menu {
	position : absolute;
	left : 1%;
	top : 1px;	
}
.menu2{
	position : absolute;
	left : 75%;
	top : 1px;
}
</style>
</head>
<body>

	<div class="navbar navbar-default  navbar-custom " id="main">
		<c:choose>
			<c:when test="${sessionScope.userId == null}">
						 <div class="menu">
							<ul class="nav navbar-nav">
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="page-scroll1"><a href="listBoard.do?boardFlag=1">해주세요</a></li>
								<li class="page-scroll1"><a href="listBoard.do?boardFlag=0">잘해요</a></li>
							</ul>
						</div>
						<div class="logo" id="logo" align = "center">
							<a href='listBoard.do'> <img src="bootstrapResources/img/questlogo.png" width="350px"
								height="100px">
							</a>
						</div>
						<div class = "menu2">
							<ul class="nav navbar-nav">
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="page-scroll1"><a href="#" onclick = "loginPopup()">로그인</a></li>
								<li class="page-scroll1"><a href="join.do">회원가입</a></li>
							</ul>
						</div>
			</c:when>
			<c:otherwise>
						 <div class="menu">
							<ul class="nav navbar-nav">
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="page-scroll1"><a href="listBoard.do?boardFlag=1">해주세요</a></li>
								<li class="page-scroll1"><a href="listBoard.do?boardFlag=0">잘해요</a></li>
							</ul>
						</div>
						<div class="logo" id="logo" align = "center">
							<a href='listBoard.do'> <img alt=""
								src="bootstrapResources/img/questlogo.png" width="350px"
								height="100px">
							</a>
						</div>
						<div class = "menu2">
							<ul class="nav navbar-nav">
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="page-scroll1"><a href="profile.do">마이페이지</a></li>
								<li class="page-scroll1"><a href="logout.do">로그아웃</a></li>
							</ul>
						</div>
				<marquee direction="right" style="">
					<font color="white"> ${sessionScope.nickname }님 환영합니다. </font>
				</marquee>
			</c:otherwise>
		</c:choose>
	</div>


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


</body>
</html>