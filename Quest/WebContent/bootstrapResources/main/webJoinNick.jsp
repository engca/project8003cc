<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		//닉네임 중복확인
		$('#nickCheck').on('click', function() {
			$.ajax({
				type : 'post',
				url : 'nicknameCheck.do',
				dataType : 'text',
				data : 'nickname=' + $('#nickname').val(),
				success : function(data) {
					if (data != 1) {
						$('#msg').text('사용가능한 닉네임 입니다.');
						$('#completeBtn').attr('disabled', false);

					} else {
						$('#msg').text('이미 사용중인 닉네임 입니다.');
						$('#completeBtn').attr('disabled', true);
						$('#nickname').focus();
					}
				},
				error : function() {
					alert('에러');
				}
			});
		});
	});
</script>
<style>
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
	font-size: 13px;
}
</style>
</head>
<body>
	<center>
		<div class="col-lg-12 text-center">
			<h2>닉네임 설정하기</h2>
			<hr class="star-primary">
		</div>
		<form action = "webLogin.do" method = "post">
		<table>
			<tr>
				<th><h5>닉네임 :</h5></th>
				<td><input type="text" class="form-control" name="name"
					id="nickname"></td>
					<td><input type = "button" class = "btn btn-success" value = "중복확인"
						id = "nickCheck"></td>
			</tr>
			<tr>
				<td colspan="3"><br> <span id="msg"></span></td>
			</tr>
			<tr>
				<td colspan="3"><br> 
			<input type = "hidden" value = ${param.id } name = "id">
			<input type = "hidden" value = ${loginCategory } name = "loginCategory">
			<input type = "hidden" value = "noPw" name = "pw">
			
				<input type="submit"  value="닉네임 설정 완료" 
					class="btn btn-primary" id = "completeBtn"></td>
			</tr>
		</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
	</center>
</body>
</html>