<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function starpointPopup() {
		var popUrl = "starpoint.jsp";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);
	}

</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>버튼</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>즐겨찾기</th>
		</tr>
<%-- 		<c:forEach var="listValue" items="${list }"> --%>
			<tr>
				<td><input type="button" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td><input type="button" value="평가하기" onclick="starpointPopup()"></td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>즐겨찾기</td>
			</tr>
<%-- 		</c:forEach> --%>
	</table>
</body>
</html>