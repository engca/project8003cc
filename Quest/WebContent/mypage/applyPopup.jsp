<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청하기</title>
<script type="text/javascript">
	var apply = function() {
		alert('신청이 완료되었습니다.');
		var me = this;
		me.doClose();
	}

	var doClose = function() {
		window.open("about:blank", "_self").close();
	}
</script>
</head>
<body>
	<h1>신 청 하 기</h1>
	<form action=""></form>
	<table>
		<tr>
			<td>보상</td>
			<td><input type="radio" name="reward" id="reward"
				value="${보상1 }">${보상1 } &nbsp&nbsp&nbsp <input type="radio"
				name="reward" id="reward" value="${보상2 }">${보상2 } &nbsp&nbsp
				<input type="radio" name="reward" id="reward" value="${보상3 }">${보상3 }</td>
		</tr>
		<tr>
			<td>연락 방법</td>
			<td>${contact }<input type="text" name="contactInfo"
				id="contactInfo">
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="msg"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" value="취소"
				onclick="location.href='글상세보기.do'"> <input type="submit"
				value="신청완료" onclick="apply()">
		</tr>
	</table>
</body>
</html>