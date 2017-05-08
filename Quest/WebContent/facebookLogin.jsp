<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
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
				getUserData();
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
		js.src = "//connect.facebook.net/en_US/all.js";
		ref.parentNode.insertBefore(js, ref);
	}(document));


	function getUserData() {
		FB.api('/me', {
			fields : 'name,email'
		}, function(response) {
			console.log(JSON.stringify(response));
			$("#name").text("이름 : " + response.name);
			$("#email").text("이메일 : " + response.email);
			$("#id").text("아이디 : " + response.id);
		});
	}


	function facebooklogin() {

		//페이스북 로그인 버튼을 눌렀을 때의 루틴.  
		FB.login(function(response) {
			if (response.authResponse) {
				access_token = response.authResponse.accessToken; //get access token
				user_id = response.authResponse.userID; //get FB UID
				console.log('access_token = ' + access_token);
				console.log('user_id = ' + user_id);
				//user just authorized your app
				getUserData();
			}
		}, {
			scope : 'email,public_profile,user_birthday',
			return_scopes : true
		});
	}
</script>
</head>
<body>
	<div class="fb-login-button" data-width="100" data-max-rows="1"
		data-size="medium" data-button-type="continue_with"
		data-show-faces="false" data-auto-logout-link="true"
		data-use-continue-as="false"></div>
	<br>
	<span id="name"></span>
	<br>
	<span id="email"></span>
	<br>
	<span id="id"></span>
	<br>
</body>
</html>