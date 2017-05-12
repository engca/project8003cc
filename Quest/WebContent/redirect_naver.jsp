<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("i5QN1eYsBD3HXcwrS_w7", "http://localhost:8080/Quest/redirect_naver.jsp");
	// 접근 토큰 값 출력
	// 	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// 		alert(naver_id_login.getProfileData('email'));
		// 		alert(naver_id_login.getProfileData('nickname'));
		// 		alert(naver_id_login.getProfileData('name'));
		// 		alert(naver_id_login.getProfileData('id'));

		$("#names").text("이름 : " + naver_id_login.getProfileData('name'));
		$("#email").text("이메일 : " + naver_id_login.getProfileData('email'));
		$("#ids").text("아이디 : " + naver_id_login.getProfileData('id'));

		$('#id').val(naver_id_login.getProfileData('email'));
		$('#pw').val("nopw");
		$('#name').val(naver_id_login.getProfileData('name'));
		// 		$('#userIndex').val(naver_id_login.getProfileData('id'));
		login(4);
	}

	function login(flag) {
		alert(flag);
		var login = document.login;
		$('#loginCategory').val(flag);
		login.action = "login.do";
		login.target = "pareWin";
		login.method = "post";
		login.submit();
		opener.window.close();
		self.close();
	}
</script>
</head>
<body>
	<form name="login">
		<input type="hidden" name="loginCategory" id="loginCategory">
		<input type="hidden" name="name" id="name">
		<input type="hidden" name="userIndex" id="userIndex">
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="pw" id="pw">
	</form>
	<span id="names"></span>
	<br>
	<span id="email"></span>
	<br>
	<span id="ids"></span>
</body>
</html>