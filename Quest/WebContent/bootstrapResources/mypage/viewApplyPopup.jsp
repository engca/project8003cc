<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.info{

}
</style>
<script type="text/javascript">
	var check = false;
	function CheckAll() {
		var chk = document.getElementsByName("chk");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true; //모두 체크
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //모두 해제
			}
		}
	};
		
	function applyUser(){
		if($('input:checkbox[name="chk"]').is(":checked") ==  false){
			alert('신청자를 선택해주시기 바랍니다.');
		}
		else if($('input:checkbox[name="chk"]').is(":checked") ==  true){

		
		var str = $('input[name=chk]:checked').serialize(); // 이건 QueryString 방식으로 
// 		alert(str);
// 		alert("boardNo "+typeof(${boardList.boardNo}));
		alert('신청자 선택이 완료되었습니다.');
		
		opener.document.location.href="viewApply.do?boardNo="+${boardList.boardNo}+"&"+str;
		
// 		var choiceApply = document.userApply;
	
// 		choiceApply.action = "viewApply.do?boardNo="+${boardList.boardNo};
// 		window.opener.name= "parent";
// 		choiceApply.target = "parent";
// 		choiceApply.method = "get";
// 		choiceApply.submit(); 
		window.close();
		
		}
	};
	
	
	
	
	$(function() {
		$("#btn").click(function() {
			
		});
	});
	
	function deleteUaer(btn){
		alert("신청자 선택이 취소되었습니다.");
		var applyIndex = btn.getAttribute('name');
		location.href="deleteApplyUser.do?boardNo="+${boardList.boardNo}+"&user2Index="+applyIndex;

	}
	
	function count_chk(btn){
		var chkbox = document.getElementsByName("chk");
		var chkCnt = 0;
		for(var i=0 ; i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
		if(chkCnt > ${boardList.people }){
			alert("필요인원 이상을 선택하셨습다.");
			btn.checked = false;
			return false;
		}
	}
	
	
	
</script>

</head>
<body>
	<div id="board" class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1>신청자보기</h1>
				<hr class="star-primary" style="margin-bottom: 20px">
				
			</div>
		</div>
		<p>
		
		<table class="info">
		
			<tr>
				<td>글&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp;:</td>
				<td>&nbsp;${boardList.boardNo }</td>
			</tr>
			<tr>
				<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;:</td>
				<td> ${boardList.title }</td>
			</tr>
			<tr>
				<td>필요인원&nbsp;:</td>
				<td>&nbsp;${boardList.people }명</td>
			</tr>
			<tr>
				<td>연락방법&nbsp;:</td>
				<td>&nbsp;${contact }</td>
			</tr>
			
		
		</table>
		<form name="userApply">
			<table class="table table-striped">
				<tr>
					<th width="5%">     </th>
					<th width="15%">신청자</th>
					<th width="15%">선택한 보상</th>
					<th width="10%">연락처</th>
					<th width="15%">선택여부 </th>
				</tr>
				
				<c:forEach var="applyUser" items="${applyList }">
					
					<tr name="tr_${applyUser.userIndex }" >
						<td> <input type="checkbox" name="chk" id="chk" value="${applyUser.userIndex }" onclick="count_chk(this)" >
						<td>${applyUser.nickname }</td>
						<td>
							<c:if test="${applyUser.rewardNo==1 }">${boardList.reward1 }</c:if>
							<c:if test="${applyUser.rewardNo==2 }">${boardList.reward2 }</c:if>
							<c:if test="${applyUser.rewardNo==3 }">${boardList.reward3 }</c:if>
						</td>
						<td>${applyUser.contactAnswer }</td>
						<c:choose>
							<c:when test="${applyUser.aCompleteFlag ==2 }">
						
						<td>
<%-- 							<input type="button" name="${applyUser.userIndex }" value="간택취소" id="${applyUser.userIndex }" onclick="deleteUaer(this)"> --%>
								<input type="button" value="선택완료"  disabled="disabled">
						</td>
						</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
					
				</c:forEach>
	
			</table>
			<center>
				<c:choose>
						<c:when test="${boardList.bCompleteFlag == 0 }">
				<input type="button" class="btn btn-primary btn-lg" 
				value="취소"onclick="window.close()">&nbsp;&nbsp;&nbsp;&nbsp; 
				<c:if test="$"></c:if>
				<input type="button"class="btn btn-success btn-lg" id="btn"
				value="신청완료" onclick="applyUser()">
				</c:when>
				</c:choose>
				
				<c:choose>
						<c:when test="${boardList.bCompleteFlag ==3 }">
						<input type="button" class="btn btn-primary btn-lg" value="확인"onclick="window.close()">
						</c:when>
				</c:choose>
			</center>
		</form>
	</div>

</body>
</html>