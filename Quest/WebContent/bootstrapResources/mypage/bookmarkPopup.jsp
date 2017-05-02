<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<style type="text/css">
th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}

.container {
	position: absolute;
	top: 60px;
	left: 60px;
}

h2 {
	text-align: center;
}
</style>

<script type="text/javascript">
	var doBook = function() {
		
		opener.document.location.href="bookmark.do";
		window.close();
	}

	var doClose = function() {
		window.open("about:blank", "_self").close();
	}
</script>
</head>

<body>
	<hr class="star-primary">
	<h2>즐겨찾기에 추가되었습니다.</h2>
	<p>
	<h2>즐겨찾기로 이동하시겠습니까?</h2>
	<p>
	<hr class="star-primary">
	<center>
		<input type="button" class="btn btn-primary btn-lg" value="닫기"
			onclick="doClose()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
			class="btn btn-success btn-lg" value="이동"
			onclick="doBook()">
	</center>

</body>
</html>