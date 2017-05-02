<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Quest Header</title>
<link href="bootstrapResources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="bootstrapResources/css/freelancer.min.css" rel="stylesheet">
<link
	href="bootstrapResources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	<script src="bootstrapResources/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="bootstrapResources/js/jqBootstrapValidation.js"></script>
	<script src="bootstrapResources/js/contact_me.js"></script>
	<script src="bootstrapResources/js/freelancer.min.js"></script>
	
	
<script language="JavaScript">
	top.window.moveTo(0, 0);
	if (document.all) {
		top.window.resizeTo(screen.availWidth, screen.availHeight);
	} else if (document.layers || document.getElementById) {
		if (top.window.outerHeight < screen.availHeight
				|| top.window.outerWidth < screen.availWidth) {
			top.window.outerHeight = screen.availHeight;
			top.window.outerWidth = screen.availWidth;
		}
	}
</script>
</head>
<body>
	<table class="table-responsive" style="width: 100%; height: 100%"
		align="center">
		<tr>
			<td><tiles:insertAttribute name="header"></tiles:insertAttribute>
			</td>
		</tr>
		<tr>
			<td>
					<tiles:insertAttribute name="bar"></tiles:insertAttribute>
			</td>
		</tr>
		<tr>
			<td><tiles:insertAttribute name="body"></tiles:insertAttribute>
			</td>
		</tr>
		<tr>
			<td><tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</td>
		</tr>
	</table>
</body>
</html>