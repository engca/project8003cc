<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
<script type="text/javascript">
function applyPopup(){
	var apply = document.apply;
	window.name = "applyParent";
	window.open('','apply','width=500, height=600');
	apply.action = "applyPopup.do";
	apply.target = "apply";
	apply.method = "post";
	apply.submit(); 
}
function bookmarkPopup(){
	$.ajax({
		type : 'get',
		url : 'bookmarkCheck.do', 
		dataType : 'text',
		data : 'boardNo=' + ${boardList.boardNo} + '&userIndex=' + ${sessionScope.userIndex},
		success : function(data) {
			if (data == 1) {
				var bm = document.bookmark;
				window.open('','Bookmark','width=400, height=300');
				bm.action = "bookmarkPopup.do";
				bm.target = "Bookmark";
				bm.method = "post";
				bm.submit(); 
			} else {
				alert('이미 즐겨찾기 되었습니다.');
			}
		},
		error : function(){
			alert('DB에러');
		} 
	});	
}
function seeApplyUser(){
	var sAUser = document.applyUser;
	window.open('','seeuser','width=500, height=600');
	sAUser.action = "viewApplyPopup.do";
	sAUser.target = "seeuser";
	sAUser.method = "post";
	sAUser.submit(); 
}
function police(){
		$.ajax({
			type : 'get',
			url : 'police.do',
			dataType : 'text',
			data : 'boardNo=' + ${boardList.boardNo} + '&userIndex=' + ${sessionScope.userIndex},
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

	<div id="board" class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>상세보기</h3>
				<hr class="star-primary1">
			</div>
		</div>
		<div class="row">

				<table class="table table-bordered bordertable">
				<tr>
					<th><h5>제목</h5></th>
					<c:if test="${boardList.bCompleteFlag ==0 }">
						<td colspan="5">${boardList.title }</td>
					</c:if>
					<c:if test="${boardList.bCompleteFlag ==1 }">
						<td colspan="5"><font color="red">[완료된 퀘스트]</font>${boardList.title }</td>
					</c:if>
					<c:if test="${boardList.bCompleteFlag ==3 }">
						<td colspan="5"><font color="blue">[진행중 퀘스트]</font>${boardList.title }</td>
					</c:if>
				</tr>
				<tr>
					<th><h5>장소</h5></th>
					<td colspan="5">${addr.sido }&nbsp;&nbsp;&nbsp;${addr.gungu }</td>
				</tr>
				<tr>
					<th><h5>보상</h5></th>
					<td colspan="5">
						<li class="btn btn-warning btn-lg">${boardList.reward1 }</li>
						&nbsp; &nbsp; 
						<c:if test="${boardList.reward2 != ''}">
							<li class="btn btn-warning btn-lg">${boardList.reward2 }</li>
						</c:if> 
						&nbsp; &nbsp; 
						<c:if test="${boardList.reward3 != ''}">
							<li class="btn btn-warning btn-lg">${boardList.reward3 }</li>
						</c:if>
				</tr>
				<tr>
					<th><h5>필요인원</h5></th>
					<td colspan="5">${boardList.people }명</td>
				</tr>
				<tr>
					<th><h5>연락방법</h5></th>
					<td colspan="5">${contactMethod }</td>
				</tr>
				<tr>
					<th><h5>희망시작시간</h5></th>
					<td colspan="2">${boardList.stTime }</td>
					<th><h5>소요예정시간</h5></th>
					<td colspan="2">
						<c:if test="${boardList.playTime == '30m'}">30분</c:if> 
						<c:if test="${boardList.playTime == '3h' }">3시간이하</c:if> 
						<c:if test="${boardList.playTime == 'over3h'}">3시간이상</c:if>
					</td>
				</tr>
				<tr>
					<th height="100"><h5>내용</h5></th>
					<td colspan="5">${boardList.content }</td>
				</tr>
				<tr>
					<td colspan="6" align="right">
						<!-- 	로그인 세션 체크 --> <c:choose>
							<c:when test="${userId != null }">

								<form name="apply">
									<input type="hidden" name="boardNo" value=${boardList.boardNo }>
									<input type="hidden" name="userIndex" value=${sessionScope.userIndex }> 
									<input type="hidden"	name="reward1" value=${boardList.reward1 }> 
									<input type="hidden" name="reward2" value=${boardList.reward2 }>
									<input type="hidden" name="reward3" value=${boardList.reward3 }>
									<input type="hidden" name="contactNo" value=${boardList.contactNo }>
								</form>
								<form name="bookmark">
									<input type="hidden" name="boardNo" value=${boardList.boardNo }>
									<input type="hidden" name="userIndex" value=${sessionScope.userIndex }>
								</form>
								<form name="applyUser">
									<input type="hidden" name="boardNo" value=${boardList.boardNo }>
									<input type="hidden" name="userIndex" value=${sessionScope.userIndex }>
									<input type="hidden"	name="title" value=${boardList.title }>  
									<input type="hidden"	name="reward1" value=${boardList.reward1 }> 
									<input type="hidden" name="reward2" value=${boardList.reward2 }>
									<input type="hidden" name="reward3" value=${boardList.reward3 }>
									<input type="hidden" name="people" value=${boardList.people }>
									<input type="hidden" name="contactNo" value=${boardList.contactNo }>
								</form>
							<c:if test="${boardList.bCompleteFlag !=1 }">
								<c:if test="${sessionScope.userIndex == boardList.userIndex }">
									<input type="button" class="btn btn-info btn-lg" value="신청자 보기"	onclick="seeApplyUser()">
								</c:if>
								<c:if test="${boardList.bCompleteFlag != 3}">
									<c:if test="${applydata == null  || sessionScope.userIndex != boardList.userIndex }">									
										<input type="button" class="btn btn-info btn-lg" value="신청하기" onclick="applyPopup()">
									</c:if>
								</c:if>
							</c:if> 
								<input type="button" class="btn btn-success btn-lg" value="즐겨찾기" onclick="bookmarkPopup()">
								<input type="button" class="btn btn-danger btn-lg" value="신고하기" onclick="police()" name="police">
								<c:if test="${sessionScope.userIndex == boardList.userIndex }">
									<input type="button" class="btn btn-warning btn-lg" value="퀘스트수정"
										onclick="location.href='updateBoard.do?boardNo=${boardList.boardNo }'">
									<input type="button" class="btn btn-success btn-lg" value="퀘스트삭제"
										onClick="window.open('deleteBoardPopup.do?boardNo=${boardList.boardNo}','','width=400, height=300');">
								</c:if>
							</c:when>
						</c:choose> 
						<input type="button" class="btn btn-primary btn-lg" onclick="location.href='listBoard.do'" value="퀘스트목록">

					</td>
				</tr>
				<!-- 댓글보기 부분 추가 -->
				<tr>
				<c:if test="${sessionScope.userId != null }">
					<form action="insertComment.do" method="post">
						<td>${sessionScope.nickname}</td>
						<td colspan="4">
								<textarea name="content" id="content" rows="2" cols="100"></textarea>
						</td>
						<td>
							<input type="hidden" name="boardNo" value=${boardList.boardNo }> 
							<input type="hidden" name="userIndex" value=${sessionScope.userIndex }>
							<input type="submit" class="btn-primary" value="댓글등록">
						</td>
					</form>
				</c:if>
				</tr>
				<c:if test="${listComment != null }">
					<c:forEach var="comment" items="${listComment }">
					<tr>
							<td><b>${comment.nickname}</b></td>
							<td colspan="3">${comment.content}</td>
							<td align="center">${comment.date }</td>
							<td><c:if test="${sessionScope.nickname == comment.nickname }">
									<input type="button" onclick="location.href='deleteComment.do?boardNo=${boardList.boardNo }&userIndex=${sessionScope.userIndex }&content=${comment.content }'"
										value="삭제">
							</c:if></td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
<br><br><br>




</body>
</html>
