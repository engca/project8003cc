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
// function applyPopup(){
// 	var url = "applyPopup.do?boardNo="+${boardNo}+"&userIndex="
// 			+${userIndex}+"&rewardNo="+${rewardNo}+"&contactAnswer="+${contactAnswer};	
// 	window.open(url,'Apply','width=400, height=300');	
// }
// function bookmarkPopup(){
// 	var url = "bookmarkPopup.do?boardNo="+${boardNo}+"&userIndex="+${userIndex};  
//     window.open(url,'Bookmark','width=400, height=300');	
// }   
function applyPopup(boardNo,userIndex,rewardNo,contactAnswer){
	var apply = document.apply; 
	window.open(url,'apply','width=400, height=300');
	apply.action = "applyPopup.do";
	apply.target = "apply";
	apply.method = "post";
	apply.boardNo.value = boardNo;
	apply.userIndex.value = userIndex;
	apply.rewardNo.value = rewardNo;
	apply.contactAnswer.value = contactAnswer;
	apply.submit(); 
}
function bookmarkPopup(boardNo, userIndex){
	var bm = document.bookmark;
	window.open(url,'Bookmark','width=400, height=300');
	bm.action = "bookmarkPopup.do";
	bm.target = "Bookmark";
	bm.method = "post";
	bm.boardNo.value = boardNo;
	bm.userIndex.value = userIndex;
	bm.submit(); 
}
function police(){
	$('#police').onclick(function(){
		$.ajax({
			type : 'get',
			url : 'police.do',
// 			dataType : 'text',
			data : 'boardNo=' + ${boardNo} + '&userIndex=' +${userIndex},
			success : function(data) {
				if (data == 2) {
					window.open('이미 신고된 게시글 입니다.');
				} else {
					window.open('게시글 신고되었습니다.');
				}
			},
		});
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
</style>
</head>
<body>
	<section id="viewBoard">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>퀘스트 상세보기</h2>
				<hr class="star-primary1">
			</div>
		</div>
		<div class="row">

				<table class="table table-bordered bordertable">
					<tr>
						<th><h5>제목</h5></th>
						<td colspan="3">${title } </td>
					</tr>
					<tr>
						<th><h5>장소</h5></th>
						<td colspan="3">${sido }&nbsp;&nbsp;&nbsp;${gungu }</td>
					</tr>
					<tr>
						<th><h5>보상</h5></th>
						<td colspan="3">
							<li class="btn btn-lg btn-outline">${reward1 }</li>
							<li class="btn btn-lg btn-outline">${reward2 }</li>
							<li class="btn btn-lg btn-outline">${reward3 }</li>
					</tr>
					<tr>
						<th><h5>필요인원</h5></th>
						<td colspan="3">${people }</td>
					</tr>
					<tr>
						<th><h5>연락방법</h5></th>
						<td colspan="3">${contactNo }</td>
					</tr>
					<tr>
						<th><h5>희망시작시간</h5></th>
						<td>${stTime }</td>
						<th><h5>소요예정시간</h5></th>
						<td>${playTime }</td>
					</tr>
					<tr>
						<th height="100"><h5>내용</h5></th>
						<td colspan="3">${content }</td>
					</tr>
					<tr>
						<td colspan="4" align="right">
<!-- 	로그인 세션 체크 -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${userid != null }"> --%>

				<form name="apply">
					<input type="hidden" name="boardNo" value=${boardNo }>
					<input type="hidden" name="userIndex" value=${userIndex }>
					<input type="hidden" name="rewardNo" value=${rewardNo }>
					<input type="hidden" name="contactAnswer" value=${contactAnswer }>										  
				</form>		
				<input type="button"	class="btn btn-info btn-lg" value="신청하기" onclick="applyPopup('boardNo','userIndex','rewardNo','contactAnswer')">

				<form name="bookmark">
					<input type="hidden" name="boardNo" value=${boardNo }>
					<input type="hidden" name="userIndex" value=${userIndex }>  
				</form>
				<input type="button"	class="btn btn-success btn-lg" value="즐겨찾기" onclick="bookmarkPopup('boardNo','userIndex')">
				
				<input type="button"	class="btn btn-danger btn-lg" value="신고하기" onclick="police()">
				<input type="button"	class="btn btn-warning btn-lg" value="퀘스트수정" onclick="location.href='updateBoard.do?boardNo=${boardNo }'">
				<input type="button"	class="btn btn-success btn-lg" value="퀘스트삭제" onclick="location.href='deleteBoard.do'">
<%-- 		</c:when> --%>
<%-- 	</c:choose>					 --%>
				<input type="button" 	class="btn btn-primary btn-lg" onclick="listBoard.do" value="퀘스트목록">
			
			
					</td>
				</tr>
				</table>
										
		</div>
	</div>

	</section>



</body>
</html>
