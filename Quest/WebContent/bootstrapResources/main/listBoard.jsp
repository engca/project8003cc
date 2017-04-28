<%@ page language="java" contentType="text/html; charset=UTF8"
 	pageEncoding="UTF8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <!DOCTYPE html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
     <link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
     <link href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
     <script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
     <script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
 	<script src="bootstrapResources/js/freelancer.min.js"></script>
 	
 <script type="text/javascript">
 var checkLogin = function(){
 	var loginid = '${sessionScope.userId}';
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
 		<div class="col-lg-12">
 			<h2>${header1}</h2>
 			<hr class="star-primary1">
 		</div>
 		</div>
 		<table class="table tablestriped">
 			<tr>
 				<td align="center" width="8%"><b>No</b></td>
 				<td align="center" width="54%"><b>제목</b></td>
 				<td align="center" width="12%"><b>작성자</b></td>
 				<td align="center" width="18%"><b>작성일</b></td>
 				<td align="center" width="8%"><b>조회수</b></td>
 			</tr>
 			
  			<c:forEach var="board" items="${boardList}">
  				<tr>
 					<td align="center">${board.boardNo}</td> 
 					<c:if test="${board.bCompleteFlag ==0 }">
 					<td><a href="viewBoard.do?boardNo=${board.boardNo}">	${board.title }</a></td>
 					</c:if>
 					<c:if test="${board.bCompleteFlag ==1 }">
 					<td><a href="viewBoard.do?boardNo=${board.boardNo}">
 						<font color="red">[완료된 퀘스트]</font>	${board.title }</a></td>
 					</c:if>
 					<c:if test="${board.bCompleteFlag ==2 }">
 					<td><font color="gray"><strike>삭제된 게시글 입니다</strike></font></td>
 					</c:if>
 					
 					<td align="center">${board.nickname}</td>
 					<td align="center"><fmt:formatDate value="${board.date }"  pattern="yyyy/MM/dd" />
 					<td align="center">${board.readCount }</td>
 				</tr>			
 			</c:forEach>
 
 			<tr>
 				<td colspan="5" align="right">
 					<input type="button" value="글쓰기" onclick="checkLogin()" 	class="btn btndefault pullright"></td>
 			</tr>
 				 				
 			<tr>
				<td colspan="5" align="center">
<%-- 					<c:if test="${start != first }"> --%>
						<a href="listBoard.do?page=${first}&boardFlag=${boardFlag}"> [처음]</a> &nbsp;&nbsp; 
<%-- 					</c:if>  --%>
					<c:forEach begin="${start }" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current }">[<b>${i }</b>]
							</c:when>
							<c:otherwise>
								<a href="listBoard.do?page=${i}&boardFlag=${boardFlag}">[<b>${i }</b>] </a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
<%-- 					<c:if test="${end != last }"> --%>
						 &nbsp; <a href="listBoard.do?page=${last}&boardFlag=${boardFlag}">[끝]</a>
<%-- 					</c:if></td> --%>
			</tr>
			
 		</table>
 
 	</div>
 
 
 </body>
 </html> 