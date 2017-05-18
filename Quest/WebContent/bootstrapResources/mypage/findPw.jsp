
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<table class="tb" border = "1">
				<tr>
					<td colspan="5" align="center">
						<h2 style="color: black">
							<b>비밀번호 찾기</b>
						</h2>
						<h5>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h5> <br>
					</td>
				</tr>
				<tr><td>
					<input type="text" placeholder = "아이디 입력" name = "findPwId" id = "findPwId"
					class = "form-control" style = "font-size: 15px">
				</td></tr>
				<tr>
				<td>
				<input type = "button" value = "다음" class = "btn btn-primary"
				onclick = "location.href='findPwProc.do'">
				</td>
				</tr>
			</table>
		</form>

	</center>
</body>
</html>