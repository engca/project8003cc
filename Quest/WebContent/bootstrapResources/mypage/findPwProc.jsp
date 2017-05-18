<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#answerCheck').on('click', function() {
			var id = $('#id').val();
			var answer = $('#answer').val();
			$.ajax({
				type : 'get',
				url : 'findPwProc.do',
				dataType : 'text',
				data : 'category=2&id=' + id + '&answer=' + answer,
				success : function(data) {
					if (data == 0)
						location.href = "changePw.do?id="+id;
					else
						alert("질문의 답이 아닙니다.");
				}
			});
		});
		
		
	});
</script>
<style type="text/css">
body {
	background: #18BC9C;
}

.tb {
	position: absolute;
	top: 30px;
	left: 23.5%;
}

.checkspan {
	font-weight: bold;
	color: purple;
}
</style>
</head>
<body>
	<center>
				<input type="hidden" value='${id }' name="id" id="id">
				<table class="tb">
					<tr>
						<td colspan="5" align="center">
							<h2 style="color: black">
								<b>비밀번호 찾기</b>
							</h2>
							<h5>가입당시 입력하신 질문의 답을 입력해 주세요.</h5> <br>
						</td>
					</tr>
					<tr>
						<td><h4>
								<c:choose>
									<c:when test="${question==1 }">
									내가 키우는 애완동물 이름은?
								</c:when>
									<c:when test="${question==2 }">
									나의 좌우명은?								
								</c:when>
									<c:when test="${question==3 }">
									학창시절 가장 기억에 남는 선생님 이름은?
								</c:when>
								</c:choose>
							</h4></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="정답 입력" name="answer"
							id="answer" class="form-control" style="font-size: 15px">
						</td>
					</tr>
					<tr>
						<td align="center"><br> <br> <input type="button"
							value="확인" class="btn btn-primary" id="answerCheck"
							name="answerCheck"></td>
					</tr>
				</table>
	</center>
</body>
</html>