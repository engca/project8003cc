<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="google-signin-client_id"
	content="730937907062-jog843h3nsiln40o93pjbqh6vmmniop4.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login</title>
<link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
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
<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
<script src="bootstrapResources/js/contact_me.js"></script>
<script src="bootstrapResources/js/freelancer.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {


		//로그인 유효성 검사
		$('#img').on({
			'click' : function() {
				if ($('#id').val() == "") {
					$('#formCheck2').empty();
					$('#formCheck').html("아이디를 입력하세요");
					return false;
				} else if ($('#pw').val() == "") {
					$('#formCheck2').empty();
					$('#formCheck').html("비밀번호를 입력하세요");
					return false;
				} else {
					$.ajax({
						type : "post",
						url : "loginCheck.do",
						dataType : "text",
						data : "id=" + $('#id').val() + "&pw=" + $('#pw').val() + "&loginCategory=1",
						success : function(data) {
							if (data == "success") {
								login(1);
							} else {
								$('#formCheck').empty();
								$("#formCheck2").html("없는 아이디거나 비밀번호가 틀립니다.다시 입력해주세요.");
								$('#id').val('');
								$('#pw').val('');
								return false;
							}
						},
						error : function() {
							alert("error");
						}
					});

					return false;
				}
			}
		});


		function login(flag) {
			var login = document.login;
			$('#loginCategory').val(flag);
			login.action = "login.do";
			login.target = "pareWin";
			login.method = "post";
			login.submit();
			self.close();
		}


		//kakaoooooooooooooooooooooooo
		Kakao.init("3a5e1bee013eec09ef701f6bf5efacba");

		$('#kakao').on({
			'click' : function() {
				Kakao.Auth.login({
					persistAccessToken : true,
					persistRefreshToken : true,
					success : function(authObj) {
						// 						alert(JSON.stringify(authObj));
						Kakao.API.request({
							url : '/v1/user/me',
							success : function(res) {
								// 								alert(JSON.stringify(res));
								$('#id').val(res.kaccount_email);
								$('#pw').val("nopw");
								$('#name').val(res.properties.nickname);
// 								$('#userIndex').val(res.id);
								login(3);
							},
							fail : function(error) {
								console.log(error);
							}
						});
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
			}
		});


		// facebookkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
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

		$('#facebook').on({
			'click' : function() {
				FB.login(function(response) {
					if (response.authResponse) {
						access_token = response.authResponse.accessToken; //get access token
						user_id = response.authResponse.userID; //get FB UID
						FB.api('/me', {
							fields : 'name,email,id'
						}, function(response) {
// 							alert(JSON.stringify(response));
							$('#id').val(response.email);
							$('#pw').val("nopw");
							$('#name').val(response.name);
							// 							$('#userIndex').val(response.id);
							login(2);
						});
					}
				}, {
					scope : 'email,public_profile,user_birthday',
					return_scopes : true
				});
			}
		});
	});


	// google
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

		$('#id').val(profile.getEmail());
		$('#pw').val("nopw");
		$('#name').val(profile.getName());
		// 		$('#userIndex').val(profile.getId());
		login(5);
	}



	function login(flag) {
		var login = document.login;
		$('#loginCategory').val(flag);
		login.action = "login.do";
		login.target = "pareWin";
		login.method = "post";
		login.submit();
		self.close();
	}
</script>



</head>
<style>
#img {
	margin-bottom: 25%;
	margin-left: 5%;
}

body {
	background: #18BC9C;
}

.tb {
	position: absolute;
	top: 30px;
	left: 16.5%;
}

.tb2 {
	position: absolute;
	left: 15%;
	top: 200px;
	margin-top: 10%;
}

.loginBtn {
	margin: 10;
	pedding: 10;
}
</style>
</head>
<body>
	<center>

		<form name="login">
			<input type="hidden" name="loginCategory" id="loginCategory">
			<input type="hidden" name="name" id="name">
			<table class="tb">
				<tr>
					<td colspan="5" align="center">
						<h1 style="color: black">
							<b>LOGIN</b>
						</h1>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><h4 style="color: white">
							<b>ID</b>
						</h4></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" name="id" class="form-control"
						style="color: black;" id="id"></td>
					<td colspan="4" align="center" rowspan="2"><br> <input
						type="image" src="bootstrapResources/img/login2.png" width="65px"
						height="70px" id="img"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><h4 style="color: white">
							<b>PW</b>
						</h4></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="password" name="pw" class="form-control"
						style="color: black;" id="pw"></td>
				</tr>

				<tr>
					<td colspan="5"><span id="formCheck2"
						style="font-weight: bold; color: red"></span> <span id="formCheck"
						style="font-weight: bold;"></span></td>
				</tr>

			</table>
			<table class="tb2" align="center">
				<tr>
					<td width="180px" height="50px"><img
						src="bootstrapResources/img/button_facebook.png" id="facebook"
						name="facebook"></td>
					<td width="180px" height="50px"><img
						src="bootstrapResources/img/button_kakao.png" id="kakao"
						name="kakao"></td>
				</tr>
				<tr>
					<td width="180px" height="50px">
						<div id="naver_id_login"></div> <script type="text/javascript">
							var naver_id_login = new naver_id_login("i5QN1eYsBD3HXcwrS_w7", "http://localhost:8080/Quest/redirect_naver.jsp");
// 							var naver_id_login = new naver_id_login("i5QN1eYsBD3HXcwrS_w7", "http://localhost:8080/Quest/redirect_naver.jsp");
							var state = naver_id_login.getUniqState(); 
							naver_id_login.setButton("green", 3, 36);
							naver_id_login.setDomain("http://localhost:8080/Quest/");
// 							naver_id_login.setDomain("http://localhost:8080/Quest/");
							naver_id_login.setState(state);
							naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script>
					</td>
					<td width="180px" height="50px">
						<div class="g-signin2" data-onsuccess="onSignIn"
							style="width: 168px; height: 36px"></div>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>