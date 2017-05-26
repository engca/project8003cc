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
<script type="text/javascript">
var doClose = function() {
	window.open("about:blank", "_self").close();
}
</script>
<script type="text/javascript">
var dodelete = function() {
	alert('신청이 취소 되었습니다.');
	opener.window.location.href="deleteApply.do?boardNo="+${boardNo}+"&userIndex="+${userIndex};
	window.open("about:blank", "_self").close();
}
</script>
<style type="text/css">
h2 {
	text-align: center;
}
</style>
</head>

<body>
	<hr class="star-primary">
	<h2>삭제하시겠습니까?</h2>
	<p>
	<hr class="star-primary">
	<center>
	- boardNo ${boardNo} / ${userIndex }
			<input type="hidden" name="boardNo" value=${boardNo }>
			<input type="hidden" name="userIndex" value=${userIndex }>
		<input type="button" class="btn btn-primary btn-lg" value="아니요" onclick="location.href = 'javascript:history.back()'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button" class="btn btn-success btn-lg" value="예" onclick="dodelete()"	>
	</center>

</body>
</html>