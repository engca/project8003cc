<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {

	// 테스트 중에는 주석임
	$('#password').on('keyup', function(){
		var regpass = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).{8,20}/;
		if( !regpass.test($('#password').val()) ) {
			$('#passwordspan').html('특수문자,숫자,영문 대소문자 포함 8자이상!! ');
		} else {
			$('#passwordspan').html('사용가능한 패스워드 입니다.');
			joinCheckPW1 = 1;
		}					
	}); 
	
	$('#password2').on('keyup', function() {				
		if($('#password').val() != $('#password2').val()) {
			$('#passwordcheckspan').html('동일한 비밀번호 입력하세요');
		} else { 
			$('#passwordcheckspan').html('동일한 비밀번호 입니다');
			joinCheckPW2 = 1;
		}
	});
	
	function joinCheckAll(){
		if (joinCheckPW1==1 && joinCheckPW2==1){
			alert("변경이 완료되었습니다.");
			return true;		
		} else {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
	
	$('#confirm').click(function(){
		var password = $('#password').val();
		var id = $('#id').val();
		$.ajax({
			type : 'post',
			url : 'changePwProc.do',
			dataType : 'text',
			data : 'id='+id + '&password=' + password,
			success : function(data) {
				if (data == 1) {
					alert("비밀번호가 변경되었습니다.");
					location.href = "loginForm.do";
				} 
			}
		});
	});
	
	
});
</script>

<style type="text/css">
body {
	background: #18BC9C;
}

.tb {
	position: absolute;
	top: 30px;
	left: 26.5%;
}

.checkspan {
	font-weight: bold;
	color: purple;
}
</style>
</head>
<body>
			<table class="tb">
				<tr>
					<td colspan="5" align="center">
								<input type = "hidden" value = '${id }' name = "id" id = "id">
					
						<h2 style="color: black">
							<b>비밀번호 찾기</b>
						</h2>
						<h5>비밀번호를 재설정 해주세요.</h5> <br>
					</td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호 입력"
						name="password" id="password" class="form-control"
						style="font-size: 15px"></td>
				</tr>
				<tr>
					<td><span id="passwordspan" class="checkspan"></span></td>
				</tr>
				<tr>
					<td><br> <input type="password" placeholder="비밀번호 재입력"
						name="password2" id="password2" class="form-control"
						style="font-size: 15px"></td>
				</tr>
				<tr>
					<td><span id="passwordcheckspan" class="checkspan"></span></td>
				</tr>
				<tr>
					<td align="center"><br> <br> <input type="button"
						value="확인" class="btn btn-primary" id="confirm" name="confirm"></td>
				</tr>
			</table>
</body>
</html>