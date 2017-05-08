<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	$(document).ready(function() {
		Kakao.init("3a5e1bee013eec09ef701f6bf5efacba");
		function getKakaotalkUserProfile() {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					$("#kakao-profile").append(res.properties.nickname);
					$("#kakao-profile").append($("<img/>", {
						"src" : res.properties.profile_image,
						"alt" : res.properties.nickname + "님의 프로필 사진"
					}));
					console.log(JSON.stringify(res));
					$("#name").text("이름 : " + res.properties.nickname);
					$("#email").text("이메일 : " + res.kaccount_email);
					$("#id").text("아이디 : " + res.id);
				},
				fail : function(error) {
					console.log(error);
				}
			});
		}
		function createKakaotalkLogin() {
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var loginBtn = $("<a/>", {
				"class" : "kakao-login-btn",
				"text" : "로그인"
			});
			loginBtn.click(function() {
				Kakao.Auth.login({
					persistAccessToken : true,
					persistRefreshToken : true,
					success : function(authObj) {
						getKakaotalkUserProfile();
						createKakaotalkLogout();
					},
					fail : function(err) {
						console.log(err);
					}
				});
			});
			$("#kakao-logged-group").prepend(loginBtn)
		}
		function createKakaotalkLogout() {
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var logoutBtn = $("<a/>", {
				"class" : "kakao-logout-btn",
				"text" : "로그아웃"
			});
			logoutBtn.click(function() {
				Kakao.Auth.logout();
				createKakaotalkLogin();
				$("#kakao-profile").text("");
			});
			$("#kakao-logged-group").prepend(logoutBtn);
		}
		if (Kakao.Auth.getRefreshToken() != undefined && Kakao.Auth.getRefreshToken().replace(/ /gi, "") != "") {
			createKakaotalkLogout();
			getKakaotalkUserProfile();
		} else {
			createKakaotalkLogin();
		}
	});
</script>
</head>
<body>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
	
	<br>
	<span id="name"></span>
	<br>
	<span id="email"></span>
	<br>
	<span id="id"></span>
	<br>
</body>
</html>