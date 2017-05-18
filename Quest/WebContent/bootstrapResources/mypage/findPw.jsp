
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

		$('#next').on('click', function(){
			var id = $('#findPwId').val();
			var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;		
			if( !regEmail.test($('#findPwId').val()) ) {
				alert("올바른 이메일을 입력하세요");
				$('#findPwId').focus();
			} else {
				$.ajax({
					type : 'get',
					url : 'idCheck.do',
					dataType : 'text',
					data : 'userId=' + id,
					success : function(data) {
						if (data != 0) {
							location.href = "findPwProc.do?category=1&id="+id;
						} else {
							alert("일치하는 아이디가 없습니다.");
							$('#findPwId').empty();
							$('#findPwId').focus();
						}
					}
				});
			}	
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
	left: 23.5%;
}
</style>
</head>
<body>
	<center>
		<form name="findPw">
			<table class="tb">
				<tr>
					<td colspan="5" align="center">
						<h2 style="color: black">
							<b>비밀번호 찾기</b>
						</h2>
						<h5>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h5> <br>
					</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="아이디 입력" name="findPwId"
						id="findPwId" class="form-control" style="font-size: 15px">
					</td>
				</tr>
				<tr>
					<td align="center"><br> <br> <input type="button"
						value="다음" class="btn btn-primary" id="next" name="next"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>