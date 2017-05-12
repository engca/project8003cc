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
				$('#sidooo').css('visibility', 'visible');
				$.ajax({
					type : 'get',
					url : 'getSido.ajax',
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
// 					$('#area').empty();
					$('#sidooo').css('visibility', 'hidden');
					$('#gunguuu').css('visibility', 'hidden');
					$('#areaBackground').css('visibility', 'hidden');
					btn = 1;				
				}
		});
	});
	function searchGungu(btn){
		$('#gunguuu').css('visibility', 'visible');
		$('#areaList').css('visibility', 'visible');
		divList = $('<span >');
		$('#areaList').append(divList);
		var val = btn.value;
		$.ajax({
			type : "get",
			url : "getGugun.ajax",
			dataType : "json",
			data : "sido="+val,
			success : function(data){
				$('#gunguuu').empty();
				var div =$("<div>");
				var tr = $('<ul>');
				$(data.gungu).each(function(index){
						
					var td = $('<li>');
					var b = $('<input type ="checkbox"  onclick="changeCheck(this)" name="area" value="'+this.gungu+'">');
					var c = this.gungu;
					td.append(b);
					td.append(c);		
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
			 	
	            var input = $('<input type = "button" class = "btn-primary" onclick ="deleteBtn(this)"  style = "margin:3px" value = "'+ $(btn).val()+'"/>');
	            divList.after(input);
	            
	        }else{
	        	$("#areaList input").each(function(){
	    			if($(this).val() == $(btn).val())
	    			{
	    				$('div.'+$(btn).val()).remove();
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
</script>
<style type="text/css">
	
input[type="checkbox"], input[type="radio"] {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10;
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
#areaBackground{

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
</style>
</head>
<body>
	<center>
		<div class="div"></div>
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
						
<!-- 					<div id="sangsea" style="visibility: hidden;width: 800px;" align="center"> <br> -->
						<div id="sidooo" align="center" style="align:center;width: 900px; visibility: hidden;"></div>
						<div id="gunguuu" style=" visibility: hidden;"></div>
						<div id = "areaBackground" style="visibility: hidden; ">
						<div id="areaList"	style=" width: 750px;" align ="left">
								<span>선택한 지역 : </span>
						</div>
						</div>
<!-- 					</div>  -->
				</div>
			</div>
		</form>
	</center>

</body>
</html>