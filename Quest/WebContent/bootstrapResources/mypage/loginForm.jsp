<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>egngg</title>
<script type="text/javascript">
	function homepage() {
		var login = document.login;
		login.action = "login.do";
		login.target = "pareWin";
		login.method = "post";
		login.submit();
		self.close();
	}
</script>
<style type="text/css">
body {
 	background: #18BC9C;
/* 	background: whitd; */
}
.tb {
	position : absolute;
	top : 50px;
	left : 90px;
}
.loginBtn {
	margin : 10;
	pedding : 10;
	
}
</style>
</head>
<body>
	<center>
		<form name="login">
			<table align="center" class = "tb">
				<tr>
					<td colspan = "4" align = "center">
						<h1 style = "color : #2C3E50"><b>LOGIN</b></h1>
					</td>
				</tr>
				<tr>
					<td><h4 style = "color : white"><b>ID</b></h4></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" name="id" class="form-control"
						style="color: black;"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td><h4 style = "color : white"><b>PW</b></h4></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="password" name="pw" class="form-control"
						style="color: black;"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
				<td colspan = "4" align = "center">
				<br>
					<input type = "image" src = "bootstrapResources/img/login.png" width = "70px"
					height = "50px" onclick = "homepage()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>