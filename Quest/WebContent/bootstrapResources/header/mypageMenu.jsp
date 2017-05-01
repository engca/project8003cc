<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>






<style type="text/css">
.div {
	background: #FFB400;
	height: 65px;
 	padding : 10px; 
}

</style>


</head>
<body>
	<center>
		<div class="div"> 
			<form action="#">
				<input type="button" value="MY LIST"
					onclick="location.href='mylist.do'" class="btn btn-success1 btn-lg1'"
					id = "btn"
				style = "width : 300px; height : 41px;"/>
				<input type="button" value="COMPLETE LIST"
				 onclick="location.href='complete.do'" class="btn btn-success1 btn-lg1'" 
				 style = "width : 300px; height : 41px;"/> 
					<input type="button" value="BOOKMARK" 
				 onclick="location.href='bookmark.do'" class="btn btn-success1 btn-lg1'"
				style = "width : 300px; height : 41px;"/> 
				 <input type="button" value="PROFILE"
				 onclick="location.href='profile.do'" class="btn btn-success1 btn-lg1'" 
				 style = "width : 300px; height : 41px;"/>
			</form>
		</div>
	</center>
</body>
</html>