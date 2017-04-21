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
</head>
<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                   <c:choose>
					<c:when test="${param.id == null}">
						<form action="login.do">
							<div>
								<span style = "position:absolute; margin:5px;" align = "right">
									<input type="button" id='dowellBtn' class='btn btn-success btn-lg'
										onclick="location.href='List.do?boardflag=0'" value="잘해요">
									<input type="button" id='todoBtn' class='btn btn-success btn-lg'
										onclick="location.href='List.do?boardflag=1'" value="해주세요">
								</span>
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
								<span style="left:50%; margin:5px;" align = "right">
									<span style=" color:white;"> id : </span><input type="text" name="id" > 
									<span style="color:white;"> pw: </span><input type="password" name="pw" >
									<input type="submit" value="로그인" class='btn btn-success btn-lg'
									onclick = "locaion.href='login.do'"> 
									<input type="button" value="회원가입" onclick="location.href='join.do'" class='btn btn-success btn-lg'>
								</span>
								</ul>
								</div>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<span >
							<input type="button" id='dowellBtn' class='btn btn-success btn-lg'
								onclick="location.href='List.do?boardflag=0'" value="잘해요">
							<input type="button" id='todoBtn' class='btn btn-success btn-lg'
								onclick="location.href='List.do?boardflag=1'" value="해주세요">
						</span>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
						<span style="color:white;" > ${param.id }님 환영합니다. </span>
						<input type="button" value="마이페이지" 	onclick="location.href='mypage.do'">
						<input type="button" value="로그아웃"	onclick="location.href='logout.do'">
						</ul>
						</div>
					</c:otherwise>
				</c:choose>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>


    

   
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