<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입</title>
<style type="text/css">
th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}

h1 {
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready ( function() {
	


	$('#password').on('keyup', function(){
		var regpass = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).{8,20}/;
		if( !regpass.test($('#pass').val()) ) {
			$('#passwordspan').html('특수문자,숫자,영문 대소문자 포함하세요');
		} else {
			$('#passwordspan').html('사용가능한 패스워드 입니다.');
		}					
	});
	
	$('#passwordcheck').on('keyup', function() {				
		if($('#password').val() != $('#passwordcheck').val()) {
			$('#passwordcheckspan').html('동일한 비밀번호 입력하세요');
		} else {
			$('#passwordcheckspan').html('동일한 비밀번호 입니다');
		}
	});
	
	nickname.addEventListener('keyup', function(e) {
		var http = new XMLHttpRequest();
		http.open('get', 'nicknameCheck.do?nickname=' + nickname.value);
		http.onreadystatechange = function() {
			if (http.readyState == 4 && http.status == 200) 
			{
				if (http.responseText == 0)
				{
					nicknamespan.innerHTML = "사용가능한 닉네임 입니다";
				}
				else 
				{
					nicknamespan.innerHTML = "닉네임이 중복입니다";
				}
			}	
		}
		http.send();
	});
	
	// 닉네임 중복확인
	$('#nickname').on('keyup', function(){
		$.ajax({
			type : 'post',
			url : 'nicknameCheck.do',
			dataType : 'text',
			data : 'nickname=' + $('#nickname').val(),
			success : function(data) {
				if (data != 1) {
					$('#nicknamespan').html('사용가능한 닉네임 입니다.');
					joinCheckNick = 1;
				} else {
					$('#nicknamespan').text('이미 사용중인 닉네임 입니다.');
					$('#nickname').focus();
				}
			},
		});
	});	

	

});
</script>
</head>

<body>

	<form action="profileProc.do" method="post">
		
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>PROFILE</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="id">아이디(email)</label> <input type="text"
									class="form-control" readonly="readonly" id="id" name="userId" value="${userId }">
								<p class="help-block text-danger" id="idspan"></p>
							</div>
						</div>
						
						<c:if test="${loginCategory== 1 }">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="password">변경 비밀번호</label> <input type="password"
									class="form-control" placeholder="변경 비밀번호 입력" name="password" id="password"
									required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger" id="passwordspan"></p>
							</div>
						</div>
						
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="passwordcheck">변경 비밀번호 확인</label> <input
									type="password" class="form-control"
									placeholder="동일한 변경 비밀번호 입력하세요" id="passwordcheck" required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger" id="passwordcheckspan"></p>
							</div>
						</div>
						</c:if>
						
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" value="${nickname }" name = "nickname" id="nickname"
									required data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger" id="nicknamespan"></p>
							</div>
						</div>
						
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="starPoint"> </label> <input type="text" readonly="readonly"
									class="form-control" value="별점 : ${starPoint } 점 / 평가자 수 : ${doCount } 명 " name = "starPoint" id="starPoint"									required data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger" id="nicknamespan"></p>
							</div>
						</div>
						
						<input type="hidden" name = "userIndex" id ="userIndex" value="${userIndex }">
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12" align = "right">
								<input type="button" class="btn btn-primary btn-lg"
									value="Cancel" onclick="location.href='bookmark.do'">
								<button type="submit" class="btn btn-success btn-lg" id="btn">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</form>


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