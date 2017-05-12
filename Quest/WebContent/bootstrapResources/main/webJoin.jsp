<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	font-size: 15px;
}
</style>
</head>
<body>
	<center>
		<div class="col-lg-12 text-center">
			<h2>첫 로그인 시 닉네임 설정이 필요합니다.</h2>
			<hr class="star-primary">
		</div>
		<table>
			<tr>
				<th><h5>Email :</h5></th>
				<td><b>${id }</b></td>
			</tr>
			<c:choose>
				<c:when test="${num == 1 }">
					<tr>
						<td colspan="2"><br> <span id="msg">이미 가입된 이메일
								입니다.</span></td>
					</tr>
					<tr>
						<td colspan="2"><br> <input type="button"
							value="로그인하러가기" onclick="location.href='join.do'"
							class="btn btn-primary"></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3"><br> <span id="msg">사용가능한 이메일
								입니다.</span></td>
					</tr>
					<tr>
						<td colspan="3"><br> <input type="button" value="다음"
							onclick="location.href='webJoinNick.do'" class="btn btn-primary"></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</center>
</body>
</html>