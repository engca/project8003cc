<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quest Header</title>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
     <link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
     <link href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
     <script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
     <script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
 	<script src="bootstrapResources/js/freelancer.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
		var btn = 1;
	$(document).ready(function() {
		$('#sangseaBtn').click(function() {
// 			alert("?");
			if(btn == 1)
				{
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
							var btn = $('<input type = "button"  align = "center" style = "font-weight:bold;text-align:center"  class = "btn-link" value = "' + this.sido +'" onclick="searchGungu(this)" />');
							td.append(btn);
							tr.append(td);
						});
					$('#sidooo').append(tr);
					btn = 2;
				},
				error : function(xhrReq, status, error)
				{
					alert("!");
				}
			});
			}
			else
				{
					$('#sidooo').empty();
					$('#gunguuu').empty();
					$('#areaList').empty();
					$('#area').empty();
					btn = 1;				
				}
			
		});
// 		$('#sangseaBtn').click(function() {
			
// 			$("input:checkbox[name='area']").prop("checked", false);
// 			$('#sangseaArea').css('visibility', 'hidden');
// 		});	 
	});
	function changeCheck(btn)
	{	
		 if($(btn).is(":checked")){
	            var input = $('<input type = "button" onclick ="deleteBtn(this)"  align = "center" style = " font-size: 10pt;font-weight:bold;text-align:center" value = "'+ $(btn).val()+'"/>');
	            $('#areaList').append(input);
// 	            $('#area').text($(btn).val());
// 	            alert("체크박스 체크 !");
	        
	        }else{
	        	$("#areaList input").each(function(){
	    			if($(this).val() == $(btn).val())
	    			{
	    				$(this).remove();
	    			}
	    		});
	        }
	}
	function deleteBtn(button)
	{	
		$("#areaList input").each(function(){
			if($(this).val() == $(button).val())
			{
				$(this).remove();
			}
		});
		$("input:checked").each(function(){
			if($(this).val() == $(button).val())
			{
				$(this).prop("checked",false);
			}
		});
		
	}
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
						var b = $('<input type ="checkbox"  onclick="changeCheck(this)" name="area" value="'+this.gungu+'">');
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
			
		
	}
</script>
<style type="text/css">
input[type="checkbox"], input[type="radio"] {
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

.div {
	background: #FFB400;
	height: 65px;
 	padding : 10px; 
} 

</style>
</head>
<body>
	<center>
<!-- 		<div class="div"> -->
			<form action="searchBoard.do">
				<div class="form-group">
					<div class="form-inline">
						<select name="boardFlag" class="form-control">
							<option value="0">잘해요</option>
							<option value="1">해주세요</option>
						</select> 
						<select name="searchFlag" class="form-control">
							<option value="0">컨텐츠</option>
							<option value="1">작성자</option>
						</select>  
						<input type="text" name="searchKey" class="form-control" placeholder="search"> 
						<input type="submit" value="검색" class="btn btn-primary"> 
						<input id="sangseaBtn" type="button" value="상세검색" class="btn btn-success">
						
<!-- 					<div id="sangsea" style="visibility: hidden;" align="center" style="width: 500px; height:300px; border: double"> -->
<!-- 						<table id="sidooo" align="center"	style="width: 500px; border: double"></table> -->
<!-- 						<table id="gunguuu" align="center" style="width: 700px; visibility: hidden;"></table> -->
<!-- 						<div id="areaList"	style="background: white; text-align: left; width: 700px"></div> -->
<!-- 						<input id="area" name="area" type="hidden"> -->
<!-- 					</div>		 				 -->
						<div id="sangsea" 	style="visibility: hidden; back-ground: #000000;	 width: 800px;	height:300px; 	border: double;">
							<table id="sidooo" align="center"></table>
							<table id="gunguuu" align="center"></table>
							<div id="areaList"></div>
<!-- 							<div name="area" id ="area"> -->
						</div>
						
						
								 				
					</div> 
				</div>
			</form>
<!-- 		</div> -->
	</center>

</body>
</html>