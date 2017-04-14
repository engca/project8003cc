<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퀘스트 작성하기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script></script>
<style type="text/css">
th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}

.container {
	position: absolute;
	top: 60px;
	left: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<form action=".do" method="post">
			<caption>
				<h3>퀘스트 작성하기</h3>
			</caption>
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" placeholder="제목을 입력하세요. "
						name="title" class="form-control" /></td>

				</tr>
				<tr>
					<th>장소</th>
					<td colspan="3"><select name="sido">
							<option>시도</option>
					</select> <select name="gugun">
							<option>군구</option>
					</select> <select name="dong">
							<option>동</option>
					</select></td>
				</tr>
				<tr>
					<th>보상</th>
					<td colspan="3">
						<table>
							<tr>
								<td><input type="text" placeholder="보상1" name="reward1"
									class="form-control input-sm"></td>
								<td>&nbsp;&nbsp;</td>
								<td><input type="text" placeholder="보상2" name="reward2"
									class="form-control input-sm"></td>
								<td>&nbsp;&nbsp;</td>
								<td><input type="text" placeholder="보상3" name="reward3"
									class="form-control input-sm"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<th>필요인원</th>
					<td colspan="3"><input type="text" name="people"
						class="col-xs-1"> 명
				</tr>
				<tr>
					<th>연락방법</th>
					<td colspan="3"><input type="radio" name="contact"
						value="kakao">카톡&nbsp;&nbsp; <input type="radio"
						name="contact" value="email">이메일 &nbsp;&nbsp;<input
						type="radio" name="contact" value="phone">전화&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<th>희망시작시간</th>
					<td><select name="sido">
							<option>오전</option>
							<option>오후</option>
							<option>새벽</option>
					</select></td>
					<th>소요예정시간</th>
					<td><select name="sido">
							<option>오전</option>
							<option>오후</option>
							<option>새벽</option>
					</select></td>
				</tr>
				<tr>
					<th height="100">내용</th>
					<td colspan="3"><textarea cols="10" rows="10"
							placeholder="내용을 입력하세요." name="content" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><a class="btn btn-default"
						onclick=".do">퀘스트등록 </a> <a class="btn btn-default" onclick=".do">퀘스트목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
