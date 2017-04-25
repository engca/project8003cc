<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table style="rules: rows;">
		<tr>
			<td>
				<div style="position: absolute; width: 100%;">
					<tiles:insertAttribute name="header"></tiles:insertAttribute>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div style="position: absolute; top: 80px; width: 100%;">
					<tiles:insertAttribute name="bar"></tiles:insertAttribute>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div style="position: absolute; top: 150px; width: 100%;height:700px;">
					<tiles:insertAttribute name="body"></tiles:insertAttribute>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div
					style="position: absolute; top: 800px; width: 100%; height: 10%;">
					<tiles:insertAttribute name="footer"></tiles:insertAttribute>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>