<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap Core CSS -->
    <link href="../bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
     <!-- Custom Fonts -->
    <link href="../bootstrapResources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<style type="text/css">
a {
	text-decoration: none
}
</style>
<title>Insert title here</title>
</head>
<body>
<h1>게시물 보기!! </h1>
<table border="1" width="800">
	<tr>
		<td width="100" bgcolor="gray"> 글번호 </td> 
		<td> <b>${Constant.Board.BOARDNO }</b></td>
		<td bgcolor="gray"> 작성자 </td> 
		<td>${board.name }(${board.email }) </td>
		<td bgcolor="gray"> 작성일 </td> 
		<td align="center"><fmt:formatDate value="${board.writedate }"  pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td bgcolor="gray"> 글제목 </td> 
		<td colspan="5"> <b>${board.title }</b></td>
	</tr>
	<tr>
		<td bgcolor="gray"> 첨부파일 </td> 
		<td colspan="5"><a href="download.do?id=${boardFile.id }"> ${boardFile.originFileName } </a>
		(<fmt:formatNumber value="${boardFile.size }" pattern="#,###"/>B)
	</tr>
	<tr>		
		<td colspan="6" height="200"> ${board.content }  </td> 
	</tr>
</table>
<br>
<input type="button" value="수정" onclick="location.href='modifyForm.do?num=${board.num }'">
<input type="button" value="삭제" onclick="window.open('checkpw.do?num=${board.num }', '게시글 삭제', 'width=500, height=200');"> 

<!-- <form action="delete.do"> -->
<%-- 	<input type="hidden" name="num" value="${viewList.num }"> --%>
<!-- 	<input type="text" name="pass"> -->
<!-- 	<input type="submit" value="삭제"> -->
<!-- </form> -->

<input type="button" value="목록" onclick="location.href='list.do'">

    <!-- jQuery -->
    <script src="../bootstrapResources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>