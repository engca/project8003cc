<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 가입</title>

    <!-- Bootstrap Core CSS -->
    <link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script type="text/javascript">
window.onload = function() {
	 
	var userid = document.getElementById("userid");
	var useridspan = document.getElementById("useridspan");
	var password = document.getElementById("password");
	var passwordspan = document.getElementById("passwordspan");
	var pwd_check = document.getElementById("pwd_check");
	var pwd_checkspan = document.getElementById("pwd_checkspan");
	var nickname = document.getElementById("nickname");
	var nicknamespan = document.getElementById("nicknamespan");

	var check = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,20}/;
//	var email = /^([a-z0-9_+.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	var email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	password.addEventListener('keyup', function() {
		if (!check.test(password.value)) {
			passwordspan.innerHTML = "영문 대소문자/특수문자/숫자 포함 8자";
		} else {
			passwordspan.innerHTML = "올바른 비밀번호 입니다.";
		}
	});
		
	pwd_check.addEventListener('keyup', function() {
		if (pwd_check.value!=password.value){
			pwd_checkspan.innerHTML = "동일한 비밀번호를 입력하세요." ;
		} else {
			pwd_checkspan.innerHTML = "동일한 비밀번호 입니다." ;
		}
	});
	
	userid.addEventListener('keyup', function(e) {
		if (!email.test(userid.value)) {
			useridspan.innerHTML = "올바른 이메일을 입력하세요";
		} else {
			var http = new XMLHttpRequest();
			http.open('get', 'idCheck.do?userid=' + userid.value);
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) 
				{
					if (http.responseText == 0)
					{
						useridspan.innerHTML = "사용가능한 아이디(이메일) 입니다.";
					}
					else 
					{
						useridspan.innerHTML = "아이디(이메일)이 중복입니다";
					}
				}	
			}		
			http.send();
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
}


</script>
</head>

<body>

  <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contact Me</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="phone">Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="message">Message</label>
                                <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>



	<h1>회원가입</h1>
	<form action="join.do" method="post" name="frm">
		<table>
			<tr>
				<td width="100">아이디(email)</td>
				<td><input type="text" name="userid" size="30" id="userid" placeholder="사용할 이메일을 입력하세요"></td>
				<td><span id="useridspan"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" id="password" size="30" placeholder="비밀번호를 입력하세요"></td>
				<td><span id="passwordspan"></span></td>
			</tr>
			<tr>
				<td width="100">비밀번호 확인</td>
				<td><input type="text" name="pwd_check" id="pwd_check" size="30" placeholder="비밀번호를 입력하세요"></td>
				<td><span id="pwd_checkspan"></span></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname" id="nickname" size="30" placeholder="닉네임을 입력하세요"></td>
				<td><span id="nicknamespan"></span></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="확인"> &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="취소"></td>
			</tr>
		</table>
		</form>
</body>
</html>