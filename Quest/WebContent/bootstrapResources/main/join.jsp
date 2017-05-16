<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원가입</title>
<script type="text/javascript">
var joinCheckID = 0;
var joinCheckPW1 = 0;
var joinCheckPW2 = 0;
var joinCheckNick = 0;
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
						joinCheckID = 1;
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
	
	// 테스트 중에는 주석임
// 	$('#password').on('keyup', function(){
// 		var regpass = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).{8,20}/;
// 		if( !regpass.test($('#password').val()) ) {
// 			$('#passwordspan').html('특수문자,숫자,영문 대소문자 포함 8자이상!! ');
// 		} else {
// 			$('#passwordspan').html('사용가능한 패스워드 입니다.');
// 			joinCheckPW1 = 1;
// 		}					
// 	});
	
	$('#passwordcheck').on('keyup', function() {				
		if($('#password').val() != $('#passwordcheck').val()) {
			$('#passwordcheckspan').html('동일한 비밀번호 입력하세요');
		} else {
			$('#passwordcheckspan').html('동일한 비밀번호 입니다');
			joinCheckPW2 = 1;
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
					joinCheckNick = 1;
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

// 가입처리
function	joinCheckAll(){
if (joinCheckID==1 && joinCheckPW1==1 && joinCheckPW2==1 && joinCheckNick== 1){
	alert("회원가입이 완료되었습니다.");
	return true;		
} else {
	alert("가입데이터를 정확히 입력하세요!!");
	return false;
}
}	
</script>
</head>

<body>
                <div class="col-lg-12 text-center">
                    <h2>Join US</h2>
                    <hr class="star-primary">
                </div>
<form action="userjoin.do" method="post" name="frm" id="frm">
		<input type = "hidden" value ="1" name = "loginCategory" id="loginCategory">
                <div class="col-lg-8 col-lg-offset-2">
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
                            <div class="form-group col-xs-12" align = "right">
                                <input type="button" class="btn btn-primary btn-lg" value="Cancel" onclick="location.href='listBoard.do'">
                                <button type="submit" class="btn btn-success btn-lg" id="btn" onclick="return joinCheckAll()">Send</button>
                                <br><br><br>
                            </div>
                        </div>
                
</form>




</body>
</html>