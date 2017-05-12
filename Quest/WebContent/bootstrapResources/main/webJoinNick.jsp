<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	font-size: 20px;
}
</style>
</head>
<body>
	<center>
		<div class="col-lg-12 text-center">
			<h2>닉네임 설정하기</h2>
			<hr class="star-primary">
		</div>
		<form method="post" action="webJoinNickProc.do">
			<table>
				<tr>
					<th><h5>닉네임 :</h5></th>
					<td><input type="text" class="form-control" name="nickname">
					</td>
					<td><input type="submit" value="중복확인" class="btn btn-success"></td>
				</tr>
				<c:choose>
					<c:when test="">
						<tr>
							<td colspan="3"><br> <span id="msg">이미 존재하는 닉네임 입니다.</span></td>
						</tr>
						<tr>
							<td colspan="3"><br> <input type="button"
								value="로그인하러가기" onclick="location.href='join.do'" class="btn btn-primary"></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3"><br> <span id="msg">사용가능한 닉네임 입니다.</span></td>
						</tr>
						<tr>
							<td colspan="3"><br> <input type="button" value="닉네임 설정 완료"
								onclick="location.href='listBoard.do'" class="btn btn-primary"></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
	</center>
</body>
</html>