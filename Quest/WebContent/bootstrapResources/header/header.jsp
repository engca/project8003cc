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
	<style type="text/css">
	</style>
</head>
<body  >

            <div  class = "navbar navbar-default  navbar-custom ">
                   <c:choose>
                   	
					<c:when test="${sessionScope.userId == null}">
						<form action="login.do" method = "post">
							<div>
							<span> &nbsp;&nbsp;&nbsp;&nbsp;
							<a href = 'listBoard.do'> 
								<img alt="" src="bootstrapResources/img/questlogo.png"
								width = "250" height = "80">
							</a>
							</span>
								<span>
									<input type="button" id='dowellBtn' class='btn btn-success btn-lg'
										onclick="location.href='listBoard.do?boardFlag=0'" value="잘해요">
									<input type="button" id='todoBtn' class='btn btn-success btn-lg'
										onclick="location.href='listBoard.do?boardFlag=1'" value="해주세요">
								</span>
								<span  style="float:right">
									<span class="navbar-text" style="color:white"> id : <input type="text" name="id" class="input-sm" style="color:black"> </span>
									<span class="navbar-text" style="color:white"> pw: <input type="password" name="pw" class="input-sm" style="color:black"> </span>
									<input type="submit" value="로그인" class='btn btn-success btn-lg'> 
									<input type="button" value="회원가입" onclick="location.href='join.do'" class='btn btn-success btn-lg'>
								</span>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<span >  
							<input type="button" id='dowellBtn' class='btn btn-success btn-lg'
								onclick="location.href='listBoard.do?boardFlag=0'" value="잘해요">
							<input type="button" id='todoBtn' class='btn btn-success btn-lg'
								onclick="location.href='listBoard.do?boardFlag=1'" value="해주세요">
						</span>
						<span  style="float:right" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<input type="button" value="마이페이지" class='btn btn-success btn-lg'	onclick="location.href='profile.do'">
							<input type="button" value="로그아웃"	class='btn btn-success btn-lg'	onclick="location.href='logout.do'">
						</span>
						<br><br>
							<marquee direction="right" style=""><font color="white"> ${sessionScope.nickname }님 환영합니다. </font> </marquee> 
					</c:otherwise>
				</c:choose>
            </div>

   
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