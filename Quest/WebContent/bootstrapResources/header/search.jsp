<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					$(data.sido).each(function(index)
						{
							var a = $('<td>');
							var b = $('<input type = "button" value = "' + this.sido +'" onclick="searchGungu(this)" />');
							a.append(b)
							$('#sidooo').append(a);
						});
					alert("!?");		
				},
				error : function(xhrReq, status, error)
				{
					alert("!");
				}
			});
			
		});
		$('#closeBtn').click(function() {
			$('#sangsea').css('visibility', 'hidden');
			$("input:checkbox[name='area']").prop("checked", false);
			$('#sangseaArea').css('visibility', 'hidden');
		});	 
	});
	function searchGungu(btn){
			var val = btn.value;
			$.ajax({
				type : "get",
				url : "getGugun.ajax",
				dataType : "json",
				data : "sido="+val,
				success : function(data){
					$('#gunguuu').empty();
						var ul = $('<ul>');
					$(data.gungu).each(function(index){
						var a = $('<il>')
						var b = $('<input type ="checkbox" name="area" value="'+this.gungu+'">');
						$(a).append(b);
						var c = this.gungu;
						$(a).append(c);		
						$(ul).append(a);
					});
					$('#gunguuu').append(ul);
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
table {
	width: 100%;
	border: 1px solid #bcbcbc;
}

.ls2 {
	letter-spacing: -1px;
	word-spacing: 3px;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}
</style>
</head>
<body>
	<center>
		<form action="searchBoard.do">
			<select name = "boardflag">
				<option value = "0">잘해요</option>
				<option value = "1">해주세요</option>
			</select>
			<select name = "searchFlag">
				<option value = "0">컨텐츠</option>
				<option value = "1">작성자</option>
			</select>
			<input type="text" name="searchKey" > 
			<input type="submit"value="검색" > 
			<input id="sangseaBtn" type="button" value="상세검색"> 
			<input type="button" id="closeBtn" value="상세검색닫기">
			<div id="sangsea" style="visibility: hidden;">
				<div id="sidooo"></div>
				<div id="gunguuu"></div>
			</div>
			<!-- 		<table width="50%" id="sangsea" style="visibility:;"> -->
			<!-- 			<tr id = "sidooo"> -->
			<!-- 			<tr> -->
			<!-- 			<tr id = "gunguuu" > -->
			<!-- 			</tr> -->
			<!-- 		</table> -->
		</form>
	</center>
</body>
</html>