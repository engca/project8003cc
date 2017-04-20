<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<table style="rules : rows;">
	<tr>
		<div style="position:absolute;width:100%;height:20%;background-color:blue;">
<%-- 			<tiles:insertAttribute name = "header"></tiles:insertAttribute> --%>
			<hr>
		</div>
	</tr>
	<tr>
		<div style="position:absolute;top:20%;width:100%;height:10%; background-color:red;">
<%-- 			<tiles:insertAttribute name = "bar"></tiles:insertAttribute> --%>
			<hr>
		</div>
	</tr>
	<tr>
		<div style="position:absolute;top:30%;width:100%;height:60%;overflow:auto; background-color:pink;">
<%-- 			<tiles:insertAttribute name = "body"></tiles:insertAttribute> --%>
			<hr>
		</div>
	</tr>
	<tr>
		<div style="position:absolute;top:90%;width:100%;height:10%; background-color:red;">
<%-- 		<tiles:insertAttribute name = "footer"></tiles:insertAttribute> --%>
		</div>
	</tr>
</table>
	
</body>
</html>