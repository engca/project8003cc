<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.div {
	background: #FFB400;
	height: 65px;
	padding: 10px;
}

#btn {
	color : white;
}
#btn:HOVER {
	color : #18CCA8;   
}
</style>


</head>
<body>

	<center>
		<div class="div">
			<div class="btn-group">
				<input type="button" value="MY LIST"
					class="btn btn-success1 btn-lg1" id="btn"
					style="width: 300dp; height: 38dp;" data-toggle="collapse" data-target="#dropdown" />
				<ul id="dropdown" class = "collapse dropdown-menu">
					<li><a href="mylistProc.do?boardFlag=1">해주세요</a></li>
					<li><a href="mylistProc.do?boardFlag=0">잘해요</a></li>
				</ul>
				<input type="button" value="COMPLETE LIST"
					onclick="location.href='complete.do'"
					class="btn btn-success1 btn-lg1"
					style="width: 300dp; height: 38dp;" id = "btn"/> 
				<input type="button"
					value="BOOKMARK" onclick="location.href='bookmark.do'"
					class="btn btn-success1 btn-lg1"
					style="width: 300dp; height: 38dp;" id = "btn"/> 
				<input type="button"
					value="PROFILE" onclick="location.href='profile.do'"
					class="btn btn-success1 btn-lg1"
					style="width: 300dp; height: 38dp;" id = "btn"/>
			</div>
		</div>
	</center>
</body>
</html>