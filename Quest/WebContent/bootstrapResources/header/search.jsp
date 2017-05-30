<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quest Header</title>
 <meta httpequiv="ContentType" content="text/html; charset=UTF8">
<script type="text/javascript">
		var btn = 1;
	$(document).ready(function() {
		$('#sangseaBtn').click(function() {
			if(btn == 1)
			{
				$('#sidooo').css('display', '');
				$.ajax({
					type : 'get',
					url : 'getSido.do',
					dataType : 'json',
					success : function(data)
					{
						$('#sidooo').empty();
						$(data.sido).each(function(index)
							{
								var div = $('<div>');
								var btn = $('<input type = "button" class = "btn-social" align = "center" style = "font-weight:bold;text-align:center" value = "' + this.sido +'" onclick="searchGungu(this)" />');
								div.append(btn);
								$('#sidooo').append(div);
							});
						btn = 2;
						divList = $('<span >');
						$('#areaList').append(divList);
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
					//$('#areaList').remove("button");
					// $('#area').empty();
					$("#areaList input").each(function(){
						$( this ).detach();
	    			});
					$('#sidooo').css('display', 'none');
					$('#gunguuu').css('display', 'none');
					$('#areaList').css('display', 'none');
					btn = 1;				
				}
		});
	});
	function searchGungu(btn){
		$('#gunguuu').css('display', '');
		$('#areaList').css('display', '');
		
		var val = btn.value;
		$.ajax({
			type : "get",
			url : "getGugun.do",
			dataType : "json",
			data : "sido="+val,
			success : function(data){
				$('#gunguuu').empty();
				var div =$("<div>");
				var tr = $('<ul>');
				$(data.gungu).each(function(index){
						
					var td = $('<li>');
					var label = $('<label class = "btn btn-success active">');
					/* <label class="btn btn-success active">
						<input type="checkbox" autocomplete="off" checked>
						<span class="glyphicon glyphicon-ok"></span>
					</label> */
					var b = $('<input type ="checkbox" autocomplete="off" onclick="changeCheck(this)" name="area" autocomplete="off" value="'+this.gungu+'">');
					var c = this.gungu;
					label.append(b);
					label.append(c);
// 					td.append(b);
// 					td.append(c);
					td.append(label);
					tr.append(td);
				});
						div.append(tr);
				$("#gunguuu").append(div);
				},
			error : function() {
				alert("error");
			}
		 });
	}
	function changeCheck(btn)
	{	
		 if($(btn).is(":checked")){
	            var input = $('<input type = "button" class = "btn-primary" onclick ="deleteBtn(this)"  style = "margin:3px" value = "'+ $(btn).val()+'" id = "'+ $(btn).val()+'"/>');
	            divList.after(input);
	        }
		 else{
	        	$("#areaList input").each(function(){
	    			if($(this).val() == $(btn).val())
	    			{
						$( this ).detach();
	    			}
	    		});
	        }
	}
	function deleteBtn(button)
	{	
		$("#areaList input").each(function(){
			if($(this).val() == $(button).val())
			{
				$(this).detach();
			}
		});
		$("input:checked").each(function(){
			if($(this).val() == $(button).val())
			{
				$(this).prop("checked",false);
			}
		});
		
	}
</script>
<style type="text/css">
	
input[type="checkbox"], input[type="radio"] {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10;
}

select {
	width: 80px;
	height: 30px;
}

.div {
	height: 10px;
}
#sidooo{
	margin : 10px;
	overflow:hidden;
	padding : 10px;
}
#sidooo > div{
	float:left;
/* 	width : 192px; */
}
 #gunguuu{ 
  	overflow:hidden; 
 	padding : 10px; 
 	background: #3B414D; 
 	align:center;
 }
 #gunguuu > div{ 
 	align:center;
 	width : 900px;
 }  
 #gunguuu > div> ul{
 	width : 900dp;
	margin-top : 2px;
	padding : 3px 5px;
	white-space : nowrap;
	overflow : hidden;
	float:left;
}
 #gunguuu > div > ul > li{
	float:left;
	margin-top : 5px;
	margin-left : 10px;
	margin-right : 10px;
	padding : 2px 2px;
	white-space : nowrap;
	overflow : hidden;
	text-overflow : ellipsis;
	color : #F3F3F3;
}
 #gunguuu > div > ul > li > input {
	margin-right : 6px;
	color : #F3F3F3;
}
#areaList
{
	margin : 3px;
	padding : 2px;
	
}
#areaList >span {
	overflow : hidden;
	margin : 3px;
	
}
 #areaList > span > input{
 	float:left;
	margin : 3px;
}
<style type="text/css">
.div {
	background: #FFB400;
	height: 75px;
	padding: 10px;
}

#btn {
	color: white;
}

#btn:HOVER {
	color: #18CCA8;
}
</style>
</head>
<body>
		<div class="div"></div>
		<div class="div"></div>
			<form action="searchBoard.do">
				<div class="form-group" align = "center">
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
						
						<div id="sidooo"  style="width: 900px; display:none;"></div>
						<div id="gunguuu" style=" display:none;"></div>
						<div id="areaList"	style="display:none; width: 800px;" align ="left">
								<label class = "btn btn-info"><span>선택한 지역 : </span></label>
						</div>
				</div>
			</div>
		</form>
	<hr>

</body>
</html>