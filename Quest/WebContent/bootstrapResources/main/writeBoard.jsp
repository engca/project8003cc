<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퀘스트 작성하기</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
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
	$.ajax({
		type : "get",
		url : "getSido.ajax",
		dataType : "json",
		success : function(data) {
			$("#sido").empty();
			$(data.sido).each(function(index) {
				var sido = $('<option value='+this.sido+'>'+ this.sido +'</option>');
				$("#sido").append(sido);
			});
		},
		error : function() {
			alert("error");
		}			
	});
	
	

$(document).ready(function(){
	 $('#sido').click(function(){
		 var selectedVal = $('#sido option:selected').val();
		 $.ajax({
			type : "get",
			url : "getGugun.ajax",
			dataType : "json",
			data : "sido="+selectedVal,
			success : function(data){
			$('#gungu').empty();
			$(data.gungu).each(function(index){
				var gungu = $('<option value='+this.gungu+'>'+this.gungu+'</option>');
				$("#gungu").append(gungu);
			});
			},
			error : function() {
				alert("error");
			}
		 });
	 });

	 $('#title').click(function(){
		 if($("input:radio[name='boardFlag']").is(":checked") == true){
		 }else{
			 alert("게시판 구분을 선택해주세요.")
			 $('#boardFlag').focus();
		}
	 });
	 
	 $('#reward1').click(function(){
		 if($("#gungu option").is(":selected") == true){
		 } else {
			 alert("장소를 선택해주세요.");
			 $('#sido').focus();
		 }
	 })
	 
	 $('#btn').click(function(){
		 if (!$('#title').val()) {
			 alert("제목을 입력하세요");
			 return false;
		 } else if (!$('#reward1').val()){
			 alert("보상은 하나 이상 입력해야 합니다.")
			 return false;
		 }  else if (!$('#people').val()) {
			$('#peoplechk').html("필요인원을 적어주세요.");
			$('#people').focus();
			return false;
		} else if ($("input:radio[name='contactNo']").is(":checked") == false) {
				 $('contactNo').focus();
				 $('#contact').html("연락방법을 선택하세요.");
				 return false;
		} else {
			return true;
		}
	 });
	 
		   

	 $('#people').keyup(function(){
		if ($.isNumeric($('#people').val()) == false) {
			$('#peoplechk').html("숫자로 입력해 주세요.");
			$('#people').focus();
		} else {
			$('#peoplechk').remove();
			$('#people').focus();
		}
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

	<section id="writeBoard">

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>퀘스트 작성하기</h3>
				<hr class="star-primary1">
			</div>
		</div>
		<div class="row">

			<form action="writeBoardProc.do" method="post">
				<table class="table table-bordered bordertable">
					<tr>
						<th><h5>게시판 구분</h5></th>
						<td colspan="5">
							<h4>
								<input type="radio" name="boardFlag" value="1" id="boardFlag">
								해주세요 <input type="radio" name="boardFlag" value="0"
									id="boardFlag"> 잘해요
							</h4>
						</td>
					</tr>
					<tr>
						<th><h5>제목</h5></th>
						<td colspan="3"><input type="text" placeholder="제목을 입력하세요. "
							name="title" class="form-control" id="title" /></td>
					</tr>
					<tr>
						<th><h5>장소</h5></th>
						<td colspan="3"><select name="sido" id="sido">
						</select> <select name="gungu" id="gungu">
						</select></td>
					</tr>
					<tr>
						<th><h5>보상</h5></th>
						<td colspan="3">
							<table>
								<tr>
									<td><input type="text" placeholder="보상1" name="reward1"
										class="form-control input-sm" id="reward1"></td>
									<td>&nbsp;&nbsp;</td>
									<td><input type="text" placeholder="보상2" name="reward2"
										class="form-control input-sm"></td>
									<td>&nbsp;&nbsp;</td>
									<td><input type="text" placeholder="보상3" name="reward3"
										class="form-control input-sm"></td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<th><h5>필요인원</h5></th>
						<td colspan="3"><input type="text" placeholder="     명"
							name="people" class="form-control people" id="people"
							maxlength="3" >

						<span id="peoplechk" style="color: red;"></span>
					</tr>
					<tr>
						<th><h5>연락방법</h5></th>
						<td colspan="3"><input type="radio" name="contactNo"
							value="1">카톡&nbsp;&nbsp; <input type="radio"
							name="contactNo" value="2">이메일 &nbsp;&nbsp;<input
							type="radio" name="contactNo" value="3">전화&nbsp;&nbsp;
							<span id = "contact" style = "color:red"></span>
							</td>
					</tr>

					<tr>
						<th><h5>희망시작시간</h5></th>
						<td><select name="stTime">
								<c:forEach var="i" begin="1" end="24">
									<option value=${i }>${i }시</option>
								</c:forEach>
						</select></td>
						<th><h5>소요예정시간</h5></th>
						<td><select name="playTime">
								<option value="30m">30분미만</option>
								<option value="3h">3시간 미만</option>
								<option value="over3h">3시간 이상</option>
						</select></td>
					</tr>
					<tr>
						<th height="100"><h5>내용</h5></th>
						<td colspan="3"><textarea cols="10" rows="6"
								placeholder="내용을 입력하세요." name="content" class="form-control"></textarea></td>
					</tr>
					<tr>

						<td colspan="4" align="right"><input type="submit"
							class="btn btn-success btn-lg" value="퀘스트등록" id="btn"> <a
							class="btn btn-primary btn-lg"
							onclick="location.href='listBoard.do'">퀘스트목록 </a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	</section>



</body>
</html>
