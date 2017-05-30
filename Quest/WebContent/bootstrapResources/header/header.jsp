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
<meta name="google-signin-client_id"
	content="730937907062-jog843h3nsiln40o93pjbqh6vmmniop4.apps.googleusercontent.com">
<meta name="description" content="">
<meta name="author" content="">
<title>Welcome To Quest World</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function loginPopup() {
		window.name = "pareWin";
		window.open('loginForm.do', '', 'width=500, height=400, top = 200, left= 300"');
	}

	// kakao
	Kakao.init("3a5e1bee013eec09ef701f6bf5efacba");
	function kakaoLogout() {
		Kakao.Auth.logout(function(obj) {
			if (obj == true) {
				alert("로그아웃 되었습니다.");
				location.href = "logout.do";
			} else {
				alert("로그아웃 실패하였습니다.");
			}
		});
	// 		win = window.open("http://developers.kakao.com/logout", "kakao logout", "width=1, height=1, left=innerWidth, top=innerHeight");
	// 		alert('kakao logout');
	// 		win.close();
	}

	// facebook
	window.fbAsyncInit = function() {
		//페이스북 SDK 초기화   
		FB.init({
			appId : "1664301437211779",
			status : true,
			cookie : true,
			xfbml : true
		});
		//check user session and refresh it
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				//user is authorized
			} else {
				//user is not authorized
			}
		});
	};
	//load the JavaScript SDK
	(function(d) {
		var js,
			id = "facebook-jssdk",
			ref = d.getElementsByTagName("script")[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement("script");
		js.id = id;
		js.async = true;
		js.src = "//connect.facebook.net/ko_KR/all.js";
		ref.parentNode.insertBefore(js, ref);
	}(document));
	function facebookLogout() {
		FB.logout(function(response) {
			  // user is now logged out
			  alert(response);
		});
		alert("로그아웃 되었습니다.");
	}


	// google
	function googleLogout() {
		// 		var auth2 = gapi.auth2.getAuthInstance();
		// 		auth2.signOut().then(function() {
		// 			alert('aaaaaaaaaa');
		// 			console.log('User signed out.');
		// 		});

		win = window.open("https://accounts.google.com/logout", "google logout", "width=1, height=1, left=2000, top=2000");
		alert("로그아웃 되었습니다.");
		win.close();

	}





	// naver
	function naverLogout() {
		// 		alert('naver logout');
		// 		var token = $('#token').val();
		// 		$.ajax({
		// 			type : "GET",
		// 			dataType : "JSON",
		// 			url : "https://nid.naver.com/oauth2.0/token",
		// 			data : "grant_type=delete&client_id=i5QN1eYsBD3HXcwrS_w7&client_secret=auZLADqLCW&access_token=" + token + "&service_provider=NAVER",
		// 			success : function(result) {
		// 				//성공하면...
		// 				// 				location.href = "http://localhost:8080/ajaxTest/Test02.jsp?id=" + id;
		// 				alert(result);
		// 			},
		// 			error : function(xhrReq, status, error) {
		// 				// 				alert(error + " / " +error_description);
		// 				// 				alert(status + " / "+error);
		// 				alert("로그아웃 아니되요..........");
		// 			}
		// 		});

		win = window.open("http://nid.naver.com/nidlogin.logout", "naver logout", "width=1, height=1, left=2000, top=2000");
		alert("로그아웃 되었습니다.");
		win.close();
	}
</script>
<style type="text/css">
#main {
	position: relative;
	height: 150px;
}

.page-scroll1 {
	font-size: 20px;
}

.menu {
	position: absolute;
	left: 1%;
	top: 1px;
}

.menu2 {
	position: absolute;
	left: 75%;
	top: 1px;
}


.logo {
	position: absolute;
	left: 35%;
	top: 20px;
}
</style>
</head>
<body>
	<div class="navbar navbar-default  navbar-custom " id="main">
		<c:choose>
			<c:when test="${sessionScope.userId == null}">
<!-- 				<div class="menu"> -->
<!-- 					<ul class="nav navbar-nav"> -->
<!-- 						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
<!-- 						<li class="page-scroll1"><a href="listBoard.do?boardFlag=1">해주세요</a></li> -->
<!-- 						<li class="page-scroll1"><a href="listBoard.do?boardFlag=0">잘해요</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
				<div class="logo" id="logo" align="center" >
					<a href='listBoard.do?boardFlag=1&page=1'> <img
						src="bootstrapResources/img/questlogo.png" width="350px"
						height="100px">
					</a>
				</div>
				<div class="menu2">
					<ul class="nav navbar-nav">
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li class="page-scroll1"><a href="#" onclick="loginPopup()">로그인</a></li>
						<li class="page-scroll1"><a href="join.do">회원가입</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class=".menu" style="color: white;">
					<table style="width: 250px; ">
						<tr>
							<td colspan="3" align="center">
								${sessionScope.nickname }님의 활동 현황
							</td>
						</tr>
						<tr>
							<td align="center"></td>
							<td align="center">해주세요</td>
							<td align="center">잘해요</td>
						</tr>
						<tr>
							<td align="center">요청</td>
							<td align="center"><a href=mylistProc.do?boardFlag=1>${sessionScope.todo }개</a></td>
							<td align="center"><a href=mylistProc.do?boardFlag=2>${sessionScope.dowell }개</a></td>
						</tr>
						<tr>
							<td align="center">신청</td>
							<td align="center"><a href=mylistProc.do?boardFlag=1>${sessionScope.todoApply }개</a></td>
							<td align="center"><a href=mylistProc.do?boardFlag=2>${sessionScope.dowellApply }개</a></td>
						</tr>
					</table>
<%-- 					${sessionScope.nickname }님의 활동 현황 <br> --%>
<%-- 					잘해요 : <a href = "">${sessionScope.dowell }개</a> --%>
<%-- 					해주세요 : <a href = "">${sessionScope.todo }개</a> --%>
<!-- 					<br> -->
<%-- 					잘해요 신청 : <a href = "">${sessionScope.dowellApply }개</a> --%>
<%-- 					해주세요 신청 : <a href = "">${sessionScope.todoApply }개</a> --%>
				</div>
<!-- 				<div class="menu"> -->
<!-- 					<ul class="nav navbar-nav"> -->
<!-- 						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
<!-- 						<li class="page-scroll1"><a href="listBoard.do?boardFlag=1">해주세요</a></li> -->
<!-- 						<li class="page-scroll1"><a href="listBoard.do?boardFlag=0">잘해요</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
				
				<div class="logo" id="logo" align="center">
					<a href='listBoard.do?boardFlag=1&page=1'> <img alt=""
						src="bootstrapResources/img/questlogo.png" width="350px"
						height="100px">
					</a>
				</div>
				<div class="menu2">
					<ul class="nav navbar-nav">
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li class="page-scroll1"><a href="mylistProc.do?boardFlag=1">마이페이지</a></li>
						<li class="page-scroll1"><c:if
								test="${sessionScope.loginCategory == 1 }">
								<a href="logout.do">
							</c:if> <c:if test="${sessionScope.loginCategory == 3 }">
								<a href="#" onclick="kakaoLogout()">카카오톡 
							</c:if> <c:if test="${sessionScope.loginCategory == 2 }">
								<a href="logout.do" onclick="facebookLogout()">페이스북 
							</c:if> <c:if test="${sessionScope.loginCategory == 4 }">
								<input type="hidden" id="token" value="${sessionScope.token }">
								<a href="logout.do" onclick="naverLogout()">네이버 
							</c:if> <c:if test="${sessionScope.loginCategory == 5 }">
								<div class="g-signin2" style="display: none;"></div>
								<a href="logout.do" onclick="googleLogout()">구글 
							</c:if> 로그아웃</a></li>
					</ul>
				</div>
				
<!-- 				<marquee direction="right" style=""> -->
<%-- 					<font color="white"> ${sessionScope.nickname }님 환영합니다. </font> --%>
<!-- 				</marquee> -->
				
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