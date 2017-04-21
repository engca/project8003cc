<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

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
    
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready ( function() {
	
	// id(이메일) 중복확인
	$('#userId').on('keyup', function(){
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;		
		if( !regEmail.test($('#userId').val()) ) {
			$('#idspan').html('올바른 이메일을 입력하세요');
			$('#userId').focus();
		} else {
			$.ajax({
				type : 'post',
				url : 'idCheck.do',
				dataType : 'text',
				data : 'userId=' + $('#userId').val(),
				success : function(data) {
					if (data != 1) {
						$('#idspan').html('사용가능한 ID(이메일) 입니다.');
					} else {
						$('#idspan').text('이미 사용중인 ID(이메일) 입니다.');
						$('#userId').focus();
					}
				},
// 				error : function(xhrReq, status, error) {
// 					alert('에러');
// 				}
			});
		}	
	});	
	
	$('#password').on('keyup', function(){
		var regpass = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).{8,20}/;
		if( !regpass.test($('#password').val()) ) {
			$('#passwordspan').html('특수문자,숫자,영문 대소문자 포함 8자이상!! ');
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
				} else {
					$('#nicknamespan').text('이미 사용중인 닉네임 입니다.');
					$('#nickname').focus();
				}
			},
// 			error : function(xhrReq, status, error) {
// 			alert('에러');
// 			}
		});
	});	
	
});
</script>
</head>

<body>
  <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Join US</h2>
                    <hr class="star-primary">
                </div>
            </div>
<form action="userjoin.do" method="post" name="frm">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="userId">아이디(email)</label>
                                <input type="text" class="form-control" placeholder="사용할 ID(이메일) 입력" name="userId" id="userId" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger" id="idspan"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="password">비밀번호</label>
                                <input type="password" class="form-control" placeholder="비밀번호 입력"  name="password"  id="password" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger" id="passwordspan"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="passwordcheck">비밀번호 확인</label>
                                <input type="password" class="form-control" placeholder="동일한 비밀번호 입력하세요" id="passwordcheck" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger" id="passwordcheckspan"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="nickname">닉네임</label>
                                <input type="text" class="form-control" placeholder="사용할 닉네임 입력" name="nickname"  id="nickname" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger" id="nicknamespan"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <input type="button"	class="btn btn-primary btn-lg" value="Cancel" onclick="location.href='viewBoard.do'">
								
                                <button type="submit" class="btn btn-success btn-lg" id="btn">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
</form>
        </div>
    </section>




</body>
</html>