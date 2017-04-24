<%@ page language="java" contentType="text/html; charset=UTF8"
 	pageEncoding="UTF8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <!DOCTYPE html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
     <! Bootstrap Core CSS >
     <link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
     <! Theme CSS >
 	<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
      <! Custom Fonts >
     <link href="bootstrapResources/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
     <! jQuery >
     <script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
     <! Bootstrap Core JavaScript >
     <script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
     <! Theme JavaScript >
 	<script src="bootstrapResources/js/freelancer.min.js"></script>
 	
 <script type="text/javascript">
 var checkLogin = function(){
 	var loginid = '${sessionScope.id}';
 	if (loginid == ""){
 		alert('로그인 후 가능합니다.');
 	} else {
 		location.href='writeBoard.do';
 	}
 }
 </script>
 <style type="text/css">
 a {
 	textdecoration: none
 }
 </style>
 </head>
 <body>
 
 	<div id="board" class="container">
 		<div class="row">
 		<div class="collg12 ">
 			<h2>${header1}</h2>
 			<hr class="starprimary1">
 		</div>
 		</div>
 		<table class="table tablestriped">
 			<tr>
 				<th width="10%">No</th>
 				<th width="40%">제목</th>
 				<th width="20%">작성자</th>
 				<th width="20%">작성일</th>
 				<th width="10%">조회수</th>
 			</tr>
 			<c:forEach var="board" items="${list}">
 				<tr>
 					<td>${board.boardNo}</td>
 					<td><a href="viewBoard.do?boardNo=${board.boardNo}">	${board.title }</a></td>
 					<td>${board.nickname}</td>
 					<td align="center"><fmt:formatDate value="${board.date }"  pattern="yyyyMMdd" />
 					<td>${board.readCount }</td>
 				</tr>
 			</c:forEach>
 			<tr>
 				<td colspan="5" align="right">
 					<input type="button" value="글쓰기" onclick="checkLogin()" 	class="btn btndefault pullright"></td>
 			</tr>
 		</table>
 
 	</div>
 
 
 </body>
 </html> 