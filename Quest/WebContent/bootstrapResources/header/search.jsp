<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Quest Header</title>
<!-- Bootstrap Core CSS -->
<link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#sangseaBtn').click(function() {
			$('#sangsea').css('visibility', 'visible');
			$.ajax({
				type : 'get',
				url : 'getSido.ajax',
				dataType : 'json',
				success : function(data)
				{
// 					alert(data.sido);
					$('#sidooo').empty();
					var tr = $('<tr>');
					$(data.sido).each(function(index)
						{
							var td = $('<td>');
							var btn = $('<input type = "button" class = "btn-link" value = "' + this.sido +'" onclick="searchGungu(this)" />');
							td.append(btn);
							tr.append(td);
						});
					$('#sidooo').append(tr);
				},
				error : function(xhrReq, status, error)
				{
					alert("!");
				}
			});
			
		});
		$('#closeBtn').click(function() {
			$('#sidooo').empty();
			$('#gunguuu').empty();
// 			$("input:checkbox[name='area']").prop("checked", false);
// 			$('#sangseaArea').css('visibility', 'hidden');
		});	 
	});
	function searchGungu(btn){
			$('#gunguuu').css('visibility', 'visible');
			var val = btn.value;
			$.ajax({
				type : "get",
				url : "getGugun.ajax",
				dataType : "json",
				data : "sido="+val,
				success : function(data){
					$('#gunguuu').empty();
					var tr;
					$(data.gungu).each(function(index){
						if(index%6 == 0 )
							tr = $('<tr>');
						var td = $('<td>');
						var b = $('<input type ="checkbox" name="area" value="'+this.gungu+'">');
						var c = this.gungu;
						$(td).append(b);
						$(td).append(c);		
						$(tr).append(td);
						if(index%6 == 0 )
							$('#gunguuu').append(tr);
					});
					
					},
				error : function() {
					alert("error");
				}
			 });
		function insertAreaList()
		{
			
		}
		
	}
</script>
<style type="text/css">
input[type="checkbox"],
input[type="radio"] {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 0;
}

.ls2 {
	letter-spacing: -1px;
	word-spacing: 3px;
}
select {
	width: 80px;
	height: 30px;
}
</style>
</head>
<body >
	<center>
		<form action="searchBoard.do">
			<select name = "boardFlag">
				<option value = "0">잘해요</option>
				<option value = "1">해주세요</option>
			</select>
			<select name = "searchFlag">
				<option value = "0">컨텐츠</option>
				<option value = "1">작성자</option>
			</select>
			<input type="text" name="searchKey" class="input-sm"> 
			<input type="submit"value="검색" class = "btn-primary" > 
			<input id="sangseaBtn" type="button" value="상세검색" class ="btn-success"> 
			<input type="button" id="closeBtn" value="상세검색닫기" class= "btn-warning">
			<div id="sangsea" style="visibility: hidden;">
				<table id="sidooo" style = "width: 500px; border:double" class="col-lg-12"></table>
				<table id="gunguuu" style = "width: 800px; visibility:hidden;"></table>
			</div>
		</form>
	</center>
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
</body>
</html>