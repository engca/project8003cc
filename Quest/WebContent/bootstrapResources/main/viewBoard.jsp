<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퀘스트 상세보기</title>
<!-- Bootstrap Core CSS -->
<link	href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"	 rel="stylesheet">
<!-- Theme CSS -->
<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link	href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"	rel="stylesheet" type="text/css">
<link	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<!-- Contact Form JavaScript -->
<script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
<script src="bootstrapResources/js/contact_me.js"></script>
<!-- Theme JavaScript -->
<script src="bootstrapResources/js/freelancer.min.js"></script>
<script type="text/javascript">
function applyPopup(){
	alert("applyPopup");
	var apply = document.apply; 
	window.open('','apply','width=500, height=600');
	apply.action = "applyPopup.do";
	apply.target = "apply";
	apply.method = "post";
	apply.submit(); 
}
function bookmarkPopup(){
	alert("bookmarkpopup");
	var bm = document.bookmark;
	window.open('','Bookmark','width=400, height=300');
	bm.action = "bookmarkPopup.do";
	bm.target = "Bookmark";
	bm.method = "post";
	bm.submit(); 
}
function police(){
		$.ajax({
			type : 'get',
			url : 'police.do',
			dataType : 'text',
			data : 'boardNo=' + ${boardList.boardNo} + '&userIndex=' + ${boardList.userIndex},
			success : function(data) {
				if (data == 2) {
					alert('이미 신고된 게시글 입니다.');
				} else {
					alert('게시글이 신고완료 되었습니다.');
				}
			},
			error : function(){
				alert('DB에러');
			} 
		}); 
}

</script>
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

.bordertable th {
/* 	background-color: pink; */
	text-align: center;
}

.people {
	width: 60px;
}
FORM { 
margin-top: 0px; 
margin-right: 0px; 
margin-bottom: 0px; 
margin-left: 0px 
} 
</style>
</head>
<body>

	<div id="board"  class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>상세보기</h2>
				<hr class="star-primary1">
			</div>
		</div>
		<div class="row">

				<table class="table table-bordered bordertable">
					<tr>
						<th><h5>제목</h5></th>
						<td colspan="3">${boardList.title } </td>
					</tr>
					<tr>
						<th><h5>장소</h5></th>
						<td colspan="3">${addr.sido }&nbsp;&nbsp;&nbsp;${addr.gungu }</td>
					</tr>
					<tr>
						<th><h5>보상</h5></th>
						<td colspan="3">
							<li class="btn btn-warning btn-lg">${boardList.reward1 } </li>
							&nbsp; &nbsp;
						 <c:if test="${boardList.reward2 != ''}">
							<li class="btn btn-warning btn-lg">${boardList.reward2 } </li>
						</c:if>
							&nbsp; &nbsp;
						<c:if test="${boardList.reward3 != ''}">
							<li class="btn btn-warning btn-lg">${boardList.reward3 }</li>
						</c:if>  
					</tr>
					<tr>
						<th><h5>필요인원</h5></th> 
						<td colspan="3">${boardList.people } 명</td>
					</tr>
					<tr>
						<th><h5>연락방법</h5></th>
						<td colspan="3">${contactMethod }</td>
					</tr>
					<tr>
						<th><h5>희망시작시간</h5></th>
						<td>${boardList.stTime }</td>
						<th><h5>소요예정시간</h5></th>
						<td>${boardList.playTime } 분</td>
					</tr>
					<tr>
						<th height="100"><h5>내용</h5></th>
						<td colspan="3">${boardList.content }</td>
					</tr>
					<tr>
						<td colspan="4" align="right">
<!-- 	로그인 세션 체크 -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${userid != null }"> --%>

				<form name="apply">
					<input type="hidden" name="boardNo" value=${boardList.boardNo }>
					<input type="hidden" name="userIndex" value=${boardList.userIndex }>
					<input type="hidden" name="reward1" value=${boardList.reward1 }>
					<input type="hidden" name="reward2" value=${boardList.reward2 }>
					<input type="hidden" name="reward3" value=${boardList.reward3 }>
					<input type="hidden" name="contactAnswer" value=${boardList.contactAnswer }>										  
				</form>						
				<form name="bookmark">
					<input type="hidden" name="boardNo" value=${boardList.boardNo }>
					<input type="hidden" name="userIndex" value=${boardList.userIndex }>  
				</form>
				
				<input type="button"	class="btn btn-info btn-lg" value="신청하기" onclick="applyPopup()">
				<input type="button"	class="btn btn-success btn-lg" value="즐겨찾기" onclick="bookmarkPopup()">								
				<input type="button"	class="btn btn-danger btn-lg" value="신고하기" onclick="police()" name="police">
				<input type="button"	class="btn btn-warning btn-lg" value="퀘스트수정" onclick="location.href='updateBoard.do?boardNo=${boardList.boardNo }'">
				<input type="button"	class="btn btn-success btn-lg" value="퀘스트삭제" onclick="location.href='deleteBoard.do'">
<%-- 		</c:when> --%>
<%-- 	</c:choose>					 --%>
				<input type="button" 	class="btn btn-primary btn-lg" onclick="location.href='listBoard.do'" value="퀘스트목록">
			
					</td>
				</tr>
				</table>
										
		</div>
	</div>





</body>
</html>
