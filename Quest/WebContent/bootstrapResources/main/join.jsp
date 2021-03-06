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
	$('#id').on('keyup', function(){
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;		
		if( !regEmail.test($('#id').val()) ) {
			$('#idspan').html('올바른 이메일을 입력하세요');
			$('#userId').focus();
		} else {
			$.ajax({
				type : 'post',
				url : 'idCheck.do',
				dataType : 'text',
				data : 'userId=' + $('#id').val(),
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
	$('#pw').on('keyup', function(){
		var regpass = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).{8,20}/;
		if( !regpass.test($('#pw').val()) ) {
			$('#passwordspan').html('특수문자,숫자,영문 대소문자 포함 8자이상!! ');
		} else {
			$('#passwordspan').html('사용가능한 패스워드 입니다.');
			joinCheckPW1 = 1;
		}					
	}); 
	
	$('#passwordcheck').on('keyup', function() {				
		if($('#pw').val() != $('#passwordcheck').val()) {
			$('#passwordcheckspan').html('동일한 비밀번호 입력하세요');
		} else { 
			$('#passwordcheckspan').html('동일한 비밀번호 입니다');
			joinCheckPW2 = 1;
		}
	});

	// 닉네임 중복확인
	$('#name').on('keyup', function(){
		$.ajax({
			type : 'post',
			url : 'nicknameCheck.do',
			dataType : 'text',
			data : 'nickname=' + $('#name').val(),
			success : function(data) {
				if (data != 1) {
					$('#nicknamespan').html('사용가능한 닉네임 입니다.');
					joinCheckNick = 1;
				} else {
					$('#nicknamespan').text('이미 사용중인 닉네임 입니다.');
					$('#name').focus();
				}
			},
// 			error : function(xhrReq, status, error) {
// 			alert('에러');
// 			}
		});
	});
	
	$('#btn').click(function(){
		if ( $('#answer').val() == "" ){
			alert("답변을 입력해 주세요");
			return false;
		} else { 
			joinCheckAll();
		}
		
	});
	
});


// 가입처리
function joinCheckAll(){
if (joinCheckID==1 && joinCheckPW1==1 && joinCheckPW2==1 && joinCheckNick== 1){
	alert("회원가입이 완료되었습니다.");
	return true;		
} else {
	alert("가입데이터를 정확히 입력하세요!!");
	return false;
}
}	
</script>
<style>
#findPwQ {
	width : 400px;
}
</style>

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
                                <input type="text" class="form-control" placeholder="사용할 ID(이메일) 입력" name="id" id="id" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger" id="idspan"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="password">비밀번호</label>
                                <input type="password" class="form-control" placeholder="비밀번호 입력"  name="pw"  id="pw" required data-validation-required-message="Please enter your email address.">
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
                                <input type="text" class="form-control" placeholder="사용할 닉네임 입력" name="name"  id="name" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger" id="nicknamespan"></p>
                            </div>
                        </div>
                          <div class="row control-group"><br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          	<select name = "findPwQ" id = "findPwQ" class = "form-control">
                                <option value = "1">내가 키우는 애완동물 이름은?</option>
                                <option value = "2">나의 좌우명은?</option>
                                <option value = "3">학창시절 가장 기억에 남는 선생님 이름은?</option>
                                </select>
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="findPw">비밀번호 찾기 시 사용될 질문&답변</label>
                                <input type="text" class="form-control" placeholder="답변 입력" name="findPwA" id = "answer">
                                <p class="help-block text-danger" id="pwa"></p>
                            </div>
                        </div>
                        
                        <br>
                        <div id="success"></div>
                            <div class="form-group col-xs-12" align = "right">
                                <input type="button" class="btn btn-primary btn-lg" value="Cancel" onclick="location.href='listBoard.do'">
                                <button type="submit" class="btn btn-success btn-lg" id="btn">Send</button>
                                <br><br><br>
                            </div>
                        </div>
                
</form>




</body>
</html>