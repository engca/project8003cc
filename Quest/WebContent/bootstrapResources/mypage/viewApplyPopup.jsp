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
<!-- Bootstrap Core CSS -->
<link
	href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="bootstrapResources/css/freelancer.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
<script src="bootstrapResources/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="bootstrapResources/js/freelancer.min.js"></script>

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
		
	function applyUser(boarNo){
// 		$("#chk:checked").each(function(idx, row) {
// 			var record = $(row).parents("tr").;
// 			alert(record[0].innerText);
// 		});
		
// 		var arr = $('input[name=chk]:checked').serializeArray().map(function(item) { return item.value });
		var str = $('input[name=chk]:checked').serialize(); // 이건 QueryString 방식으로 
		alert(str);
		alert("boardNo "+typeof(${boardList.boardNo}));
		alert('신청자 선택이 완료되었습니다.');
		
		opener.document.location.href="viewApply.do?boardNo="+${boardList.boardNo}+"&"+str;
		
// 		var choiceApply = document.userApply;
	
// 		choiceApply.action = "viewApply.do?boardNo="+${boardList.boardNo};
// 		window.opener.name= "parent";
// 		choiceApply.target = "parent";
// 		choiceApply.method = "get";
// 		choiceApply.submit(); 
		window.close();
		
		
	};
	
	$(function() {
		$("#btn").click(function() {
			
		});
	});
	
	
	
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
			제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;:</td>
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
					<th width="5%"> <input type="checkbox" name="selectAll" onclick="CheckAll()">   </th>
					<th width="15%">신청자</th>
					<th width="15%">선택한 보상</th>
					<th width="10%">연락처</th>
				</tr>
				
				<c:forEach var="applyUser" items="${applyList }">
					<tr>
						<td> <input type="checkbox" name="chk" id="chk" value="${applyUser.userIndex }">
						<td>${applyUser.nickname }</td>
						<td>
							<c:if test="${applyUser.rewardNo==1 }">${boardList.reward1 }</c:if>
							<c:if test="${applyUser.rewardNo==2 }">${boardList.reward2 }</c:if>
							<c:if test="${applyUser.rewardNo==3 }">${boardList.reward3 }</c:if>
						</td>
						<td>${applyUser.contactAnswer }</td>
						
					</tr>
				</c:forEach>
	
			</table>
			<center>
				<input type="button" class="btn btn-primary btn-lg" 
				value="취소"onclick="window.close()">&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button"class="btn btn-success btn-lg" id="btn"
				value="신청완료" onclick="applyUser()">
			</center>
		</form>
	</div>

</body>
</html>