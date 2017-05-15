<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	width: 70px;
	text-align: center;
}

td {
	width: 150px;
	text-align: center;
}

#msg {
	color: red;
	font-weight: bold;
	font-size: 15px;
}
</style>
<script type="text/javascript">
//facebook
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
//		alert('facebook logout');
		FB.logout();
//		alert('aaaaaaaa');
	}
</script>
</head>
<body>
	<center>


		<c:choose>
			<c:when test="${id == '' || id == null }">
				<div class="col-lg-12 text-center">
					<h2>전화번호로는 로그인 할 수 없습니다.</h2> <br>
					<h3>회원가입 해주세요</h3>
					<hr class="star-primary">
				</div>
				<input type="button" value="회원가입하기" class="btn btn-success"
					onclick="location.href='join.do'">
				<input type="button" value="홈으로" class="btn btn-primary"
					onclick="location.href='listBoard.do'">
			</c:when>
			<c:otherwise>
				<div class="col-lg-12 text-center">
					<h2>첫 로그인 시 닉네임 설정이 필요합니다.</h2>
					<hr class="star-primary">
				</div>
				<form action="webJoinNick.do">
					<table>
						<tr>
							<th><h5>Email :</h5></th>
							<td><b>${id }</b></td>
						</tr>
						<c:choose>
							<c:when test="${num == 1 }">
								<tr>
									<td colspan="2"><br> <span id="msg">이미 가입된 이메일
											입니다.</span></td>
								</tr>
								<tr>
									<td colspan="2"><br> <input type="button"
										value="로그인하러가기" onclick="location.href='join.do'"
										class="btn btn-primary"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3"><br> <span id="msg">사용가능한 이메일
											입니다.</span></td>
								</tr>
								<tr>
									<td colspan="3"><br> <input type="hidden"
										value=${id } name="id"> <input type="submit"
										value="다음" class="btn btn-primary"></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</form>
			</c:otherwise>
		</c:choose>

		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</center>
</body>
</html>