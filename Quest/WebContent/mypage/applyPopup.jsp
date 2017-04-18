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
	href="../bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="../bootstrapResources/css/freelancer.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="../bootstrapResources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="../bootstrapResources/js/jqBootstrapValidation.js"></script>
<script src="../bootstrapResources/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="../bootstrapResources/js/freelancer.min.js"></script>

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
</style>

<script type="text/javascript">
	var apply = function() {
		alert('신청이 완료되었습니다.');
		var me = this;
		me.doClose();
	}

	var doClose = function() {
		window.open("about:blank", "_self").close();
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="modal-body">
					<h1 align="center">신 청 하 기</h1>
					<hr class="star-primary">
					<form action=""></form>
					<table align="center" class="table table-bordered">
						<tr align="center">
							<td>보상</td>
							<td>
								<!-- 							<input type="radio" name="reward" id="reward" --> <%-- 								value="${보상1 }">${보상1 } &nbsp&nbsp&nbsp <input --%>
								<%-- 								type="radio" name="reward" id="reward" value="${보상2 }">${보상2 } --%>
								<!-- 								&nbsp&nbsp <input type="radio" name="reward" id="reward" -->
								<%-- 								value="${보상3 }">${보상3 } --%>
							</td>
						</tr>
						<tr align="center">
							<td>연락 방법</td>
							<td>${contact }<input type="text" placeholder="연락처를 입력하세요."
								name="contactInfo" id="contactInfo" >
						</tr>
						<tr align="center">
							<td>내용</td>
							<td><textarea cols="4" rows="4" placeholder="내용을 입력하세요."
									name="content" class="form-control"></textarea></td>
						</tr>
						<tr align="center">
							<td colspan="2" align="center"><input type="button"
								class="btn btn-primary btn-lg" value="취소"
								onclick="location.href='글상세보기.do'">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
								class="btn btn-success btn-lg" value="신청완료" onclick="apply()">
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>