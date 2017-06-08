<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
 <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
function applyUpdatePopup(){
	var apply = document.apply;
	window.name = "applyParent";
	window.open('','apply','width=500, height=600');
	apply.action = "applyUpdatePopup.do";
	apply.target = "apply";
	apply.method = "post";
	apply.submit(); 
}
function deleteapplyPopup(){
	var apply = document.apply;
	window.name = "applyParent";
	window.open('','apply','width=500, height=600');
	apply.action = "deleteapplyPopup.do";
	apply.target = "apply";
	apply.method = "post";
	apply.submit(); 
}
function deleteapplyPopup(){
	var apply = document.apply;
	window.name = "applyParent";
	window.open('','apply','width=500, height=600');
	apply.action = "deleteapplyPopup.do";
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
function deletePopup(){
	var data = document.delupData;
	window.open('','del','width=500, height=600');
	data.action = "deleteBoardPopup.do";
	data.target = "del";
	data.method = "post";
	data.submit(); 	
}
function updatePopup(){
// 	var data = document.delupData;
// 	document.open('','up','width=500, height=600');
// 	data.action = "updateBoard.do";
// 	data.target = "up";
// 	data.method = "post";
// 	data.submit();
	document.location.href="updateBoard.do?boardNo="+${boardList.boardNo };

}
function police(){
		$.ajax({
			type : 'get',
			url : 'police.do',
			dataType : 'text',
			data : 'boardNo=' + ${boardList.boardNo} + '&userIndex=' + ${sessionScope.userIndex}+ '&boardFlag=' + ${boardList.boardFlag},
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
function insertForm(num)
{
	 $("#comment"+num).css("display","");
}
function deleteComment(num){
	alert("댓글이 삭제되었습니다");
	var delcomdata = document.delcomData;
	$('#delcom'+num).submit();
} 
$(document).ready(function() {                 
                var xOffset = 10;
                var yOffset = 30;
                 $(".thumnail0").on("mouseover", function(e){ //마우스 오버시          
                    $("body").append("<p id='preview'><img src='"+ $("#thumnail_img0").attr("src") +"' width='400px' /></p>"); //보여줄 이미지를 선언                       
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px")
                        .fadeIn("fast"); //미리보기 화면 설정 셋팅                
                    });      
                $(".thumnail0").on("mousemove", function(e){ //마우스 이동시
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px");
                });
                $(".thumnail0").on("mouseout", function(){ //마우스 아웃시
                    $("#preview").remove();
                });
                // 2번째 보상
                $(".thumnail1").on("mouseover", function(e){ //마우스 오버시          
                    $("body").append("<p id='preview'><img src='"+ $("#thumnail_img1").attr("src") +"' width='400px' /></p>"); //보여줄 이미지를 선언                       
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px")
                        .fadeIn("fast"); //미리보기 화면 설정 셋팅                
                    });      
                $(".thumnail1").on("mousemove", function(e){ //마우스 이동시
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px");
                });
                $(".thumnail1").on("mouseout", function(){ //마우스 아웃시
                    $("#preview").remove();
                });
                // 3번째 보상
                $(".thumnail2").on("mouseover", function(e){ //마우스 오버시          
                    $("body").append("<p id='preview'><img src='"+ $("#thumnail_img2").attr("src") +"' width='400px' /></p>"); //보여줄 이미지를 선언                       
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px")
                        .fadeIn("fast"); //미리보기 화면 설정 셋팅                
                    });      
                $(".thumnail2").on("mousemove", function(e){ //마우스 이동시
                    $("#preview")
                        .css("top",(e.pageY - xOffset) + "px")
                        .css("left",(e.pageX + yOffset) + "px");
                });
                $(".thumnail2").on("mouseout", function(){ //마우스 아웃시
                    $("#preview").remove();
                });


});
</script>
<style type="text/css">
th {
	width: 150px;
}
select {
	width: 100px;
	height: 35px;
}
.reply {
 	margin-bottom: 10px; 
 } 
.bordertable th {
	/* 	background-color: pink; */
	text-align: center;
} 
.people {
	width: 60px;
}
.hrmy {
	width: 80%;
	border: thin solid;
	color:#2C3E50;
}
#thumnail_img0{display:none; position:absolute; }
#thumnail_img1{display:none; position:absolute; }
#thumnail_img2{display:none; position:absolute; }
#preview{
    z-index: 9999;
    position:absolute;
    border:0px solid #ccc;
    background:#333;
    padding:1px;
    display:none;
    color:#fff;
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

				<table class="table table-bordered bordertable" >
				<tr>
					<th><h5>제목</h5></th>
					<c:if test="${boardList.bCompleteFlag ==0 }">
						<td colspan="5"><font size="4"><b>${boardList.title }</b></font></td>
					</c:if>
					<c:if test="${boardList.bCompleteFlag ==1 }">
						<td colspan="5"><font size="4"><b><font color="red">[완료된 퀘스트]</font>${boardList.title }</b></font></td>
					</c:if>
					<c:if test="${boardList.bCompleteFlag ==3 }">
						<td colspan="5"><font size="4"><b><font color="blue">[진행중 퀘스트]</font>${boardList.title }</b></font></td>
					</c:if>
				</tr>
				<tr>
					<th><h5>장소</h5></th>
					<td colspan="5">${addr.sido }&nbsp;&nbsp;&nbsp;${addr.gungu }</td>
				</tr>
				<tr>
					<th><h5>보상</h5></th>
					<td colspan="5">
							<li class="btn btn-warning btn-lg thumnail0">${boardList.reward1 }</li>
  							<img src="<%=request.getContextPath() %>/bootstrapResources/img_rewardThumnail/${fileinfo.file0 }" id="thumnail_img0">
						&nbsp; &nbsp; 
						<c:if test="${boardList.reward2 != '' and fileinfo.file1 != '' }">
							<li class="btn btn-warning btn-lg thumnail1">${boardList.reward2 }</li>
							<img src="<%=request.getContextPath() %>/bootstrapResources/img_rewardThumnail/${fileinfo.file1 }" id="thumnail_img1">
						</c:if> 
						&nbsp; &nbsp; 
						<c:if test="${boardList.reward3 != '' and fileinfo.file2 != '' }">
							<li class="btn btn-warning btn-lg thumnail2">${boardList.reward3 }</li>
							<img src="<%=request.getContextPath() %>/bootstrapResources/img_rewardThumnail/${fileinfo.file2 }" id="thumnail_img2">
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
					<td colspan="2">${boardList.stTime }시</td> 
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
						<!-- 	로그인 세션 체크 --> 
						<c:choose>
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
									<input type="hidden" name="bCompleteFlag" value=${boardList.bCompleteFlag }>
								</form>
								<form name="delupData">
											<input type="hidden" name="boardNo" value=${boardList.boardNo }>
								</form>
							<c:if test="${boardList.bCompleteFlag !=1 }">
								<c:if test="${sessionScope.userIndex == boardList.userIndex }">
									<input type="button" class="btn btn-info btn-lg" value="신청자 보기"	onclick="seeApplyUser()">
								</c:if>
								<c:if test="${boardList.bCompleteFlag != 3}">									
									<c:if test="${applydata == null and sessionScope.userIndex != boardList.userIndex}">									
										<input type="button" class="btn btn-info btn-lg" value="신청하기" onclick="applyPopup()">
									</c:if>	
									<c:if test="${applydata != null}">									
										<input type="button" class="btn btn-info btn-lg" value="신청수정" onclick="applyUpdatePopup()">
									</c:if>									
<%-- 									<c:if test="${applydata != null}">									 --%>
<!-- 										<input type="button" class="btn btn-info btn-lg" value="신청취소" onclick="deleteapplyPopup()"> -->
<%-- 									</c:if> --%>
								</c:if>
							</c:if> 
								<input type="button" class="btn btn-success btn-lg" value="즐겨찾기" onclick="bookmarkPopup()">
								<input type="button" class="btn btn-danger btn-lg" value="신고하기" onclick="police()" name="police">
								
								<c:if test="${boardList.bCompleteFlag == 0}">
									<c:if test="${sessionScope.userIndex == boardList.userIndex }">
										<input type="button" class="btn btn-warning btn-lg" value="퀘스트수정"	onclick="updatePopup()">
										<input type="button" class="btn btn-success btn-lg" value="퀘스트삭제"	onclick="deletePopup()">
									</c:if>
								</c:if>
							</c:when>
						</c:choose> 
						<input type="button" class="btn btn-primary btn-lg" onclick="location.href='listBoard.do'" value="퀘스트목록">

					</td>
				</tr>
				</table>
				
				
				<!-- 1차 댓글달기 부분 추가 -->
			<table width="80%" align="center" >
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
							<input type="hidden" name = "group" value = "-1">
							<input type="submit" class="btn-primary" value="댓글등록">
						</td>
					</form>
				</c:if>
				</tr>
				<!-- 댓글/대댓글 보기, 달기 부분 추가 -->
				<c:if test="${listComment != null }">
					<c:forEach var="comment" items="${listComment }">
					
						<c:if test="${comment.comment_lv == 0 }">		
							<tr height="40px">
								<td colspan="6">
								 <img src="bootstrapResources/img/reply_icon.gif">
								  ${comment.nickname } &nbsp;&nbsp; &nbsp;&nbsp;
								 <b>${comment.content } &nbsp;&nbsp; &nbsp;&nbsp;</b>
								 <c:if test="${sessionScope.userId != null }">
								 <a href="#" onclick="insertForm(${comment.boardNo}${comment.comment_seq }${comment.comment_group }${comment.comment_lv })" >[댓글]</a>				 
								 <c:if test="${sessionScope.userIndex == comment.userIndex }">
								 	<a href="#" onclick="deleteComment(${comment.boardNo}${comment.comment_seq }${comment.comment_group })" >[삭제]</a>								 
									 	<form  name="delcomData" id="delcom${comment.boardNo}${comment.comment_seq }${comment.comment_group }" method="get" action="deleteComment.do">
										<input type = "hidden" name = "comment_seq" value = "${comment.comment_seq }">
										<input type = "hidden" name = "comment_group" value = "${comment.comment_group }">
										<input type = "hidden" name ="userIndex" value="${sessionScope.userIndex }">
										<input type = "hidden" name = "boardNo" value = "${comment.boardNo }">							
										</form>
								 </c:if></c:if>
							 	</td>					
							</tr>								
							<tr style = "display:none;" id = "comment${comment.boardNo}${comment.comment_seq }${comment.comment_group }${comment.comment_lv }" >
								<td colspan="6" align="center">
								<form action="insertComment.do">
									<input type = "hidden" name = "seq" value = "${comment.comment_seq }">
									<input type = "hidden" name = "group" value = "${comment.comment_group }">
									<input type = "hidden" name = "nickname" value = "${board.nickname }">
									<input type="hidden" name="userIndex" value=${sessionScope.userIndex }>
									<input type = "hidden" name = "boardNo" value = "${comment.boardNo }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	<img src="bootstrapResources/img/reply_icon.gif"  class="reply">
										<textarea name="content" id="content" rows="1" cols="100"></textarea>
										<input type= "submit" value="등록"  class="reply">							
								</form>
								</td>
							</tr>
						</c:if>
						
						<c:if test="${comment.comment_lv == 1 }">
							<tr height="40px">
								<td colspan="6">
								<img src="bootstrapResources/img/reply_icon.gif"><img src="bootstrapResources/img/reply_icon2.gif">
								  ${comment.nickname } &nbsp;&nbsp; &nbsp;&nbsp;
								 <b>${comment.content } &nbsp;&nbsp; &nbsp;&nbsp;</b>
								<c:if test="${sessionScope.userId != null }">
								 <a href="#" onclick="insertForm(${comment.boardNo}${comment.comment_seq }${comment.comment_group }${comment.comment_lv })" >[댓글]</a>
								 <c:if test="${sessionScope.userIndex == comment.userIndex }">
								 	<a href="#" onclick="deleteComment(${comment.boardNo}${comment.comment_seq }${comment.comment_group })" >[삭제]</a>								 
									 	<form  name="delcomData" id="delcom${comment.boardNo}${comment.comment_seq }${comment.comment_group }" method="get" action="deleteComment.do">
										<input type = "hidden" name = "comment_seq" value = "${comment.comment_seq }">
										<input type = "hidden" name = "comment_group" value = "${comment.comment_group }">
										<input type = "hidden" name ="userIndex" value="${sessionScope.userIndex }">
										<input type = "hidden" name = "boardNo" value = "${comment.boardNo }">							
										</form>
								 </c:if></c:if>
							 	</td>				
							</tr>
							<tr style = "display:none;" id = "comment${comment.boardNo}${comment.comment_seq }${comment.comment_group }${comment.comment_lv }" >
								<td colspan="6" align="center">
								<form action="insertComment.do">
									<input type = "hidden" name = "seq" value = "${comment.comment_seq }">
									<input type = "hidden" name = "group" value = "${comment.comment_group }">
									<input type = "hidden" name = "nickname" value = "${board.nickname }">
									<input type="hidden" name="userIndex" value=${sessionScope.userIndex }>
									<input type = "hidden" name = "boardNo" value = "${comment.boardNo }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	<img src="bootstrapResources/img/reply_icon.gif"  class="reply">
										<textarea name="content" id="content" rows="1" cols="100"></textarea>
										<input type= "submit" value="등록"  class="reply">							
								</form>
								</td>
							</tr>
						</c:if>
						
						<c:if test="${comment.comment_lv == 2 }">
							<tr height="40px">
								<td colspan="6">
								<img src="bootstrapResources/img/reply_icon.gif"><img src="bootstrapResources/img/reply_icon2.gif"><img src="bootstrapResources/img/reply_icon2.gif">
								  ${comment.nickname } &nbsp;&nbsp; &nbsp;&nbsp;
								 <b>${comment.content } &nbsp;&nbsp; &nbsp;&nbsp;</b>
								 <c:if test="${sessionScope.userIndex == comment.userIndex }">
									 <a href="#" onclick="deleteComment(${comment.boardNo}${comment.comment_seq }${comment.comment_group })" >[삭제]</a>								 
									 	<form  name="delcomData" id="delcom${comment.boardNo}${comment.comment_seq }${comment.comment_group }" method="get" action="deleteComment.do">
										<input type = "hidden" name = "comment_seq" value = "${comment.comment_seq }">
										<input type = "hidden" name = "comment_group" value = "${comment.comment_group }">
										<input type = "hidden" name ="userIndex" value="${sessionScope.userIndex }">
										<input type = "hidden" name = "boardNo" value = "${comment.boardNo }">							
										</form>
								 </c:if>								 
							 	</td>				
							</tr>
						</c:if>
						
						
					</c:forEach>
				</c:if>
				
			</table>
			<hr class="star-primary1">
		</div>
	</div> 
<br><br><br>




</body>
</html>
