<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<center>
		<div>
			<span align="left">
				<button type="button" id='dowellBtn'>잘해요</button>
				<button type="button" id='todoBtn'>해주세요</button>
			</span> <span align="right"> <c:choose>
					<c:when test="${param.id == null}">
						<form action="login.do">
							<input type="text" name="id"> 
							<input type="password" name="pw"> 
							<input type="submit" value="로그인"> 
							<input type="button" value="회원가입" onclick="location.href='joinForm.do'">
						</form>

					</c:when>
					<c:otherwise>
				${param.id }님 환영합니다.
				<input type="button" value="마이페이지"
							onclick="location.href='mypage.do'">
						<input type="button" value="로그아웃"
							onclick="location.href='logout.do'">

					</c:otherwise>
				</c:choose>
			</span>
		</div>
	</center>
</body>
</html>