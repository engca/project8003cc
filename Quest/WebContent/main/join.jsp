<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 </title>
<script type="text/javascript" src="script/join.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="join.do" method="post" name="frm">
		<table>
			<tr>
				<td width="100">아이디(email)</td>
				<td><input type="text" name="userid" size="20" id="userid"></td>
				<td><input type="hidden" name="reid" size="20"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password" size="20"></td>
			</tr>
			<tr>
				<td width="100">비밀번호 확인</td>
				<td><input type="password" name="pwd_check" size="20"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname" id="nickname" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="확인" onclick="return joinCheck()"> &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="취소"></td>
			</tr>
		</table>
		</form>
</body>
</html>