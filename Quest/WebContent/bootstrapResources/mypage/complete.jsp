<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<script type="text/javascript">
	function starpointPopup(boardNo, user1Index, user2Index) {
		
		var popUrl = "starpoint.do?boardNo="+boardNo+"&user1Index="+user1Index+"&user2Index="+user2Index;
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);
	}

</script>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>COMPLETE LIST</h2>
			</div>
		</div>
		
		<table class="table table-striped">
			<tr>
				<th width="5%">No</th>
				<th width="20%">구분</th>
				<th width="40%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">수행자</th>
				<th width="10%">작성일</th>
				<th width="5%">평가</th>
			</tr>
			

			<c:forEach var="board" items="${completeList }">
			
				<tr>
					<td>${board.boardNo }</td>
					<td><c:if test="${board.boardFlag == 0 }">
							<c:if test="${board.user1Index == board.userIndex }">
							잘해요(요청중)
							</c:if>
							<c:if test="${board.user1Index != board.userIndex }">
							잘해요(신청중)
							</c:if>
						</c:if> 
						<c:if test="${board.boardFlag == 1 }">
							<c:if test="${board.user1Index == board.userIndex }">
							해주세요(요청중)
							</c:if>
							<c:if test="${board.user1Index != board.userIndex }">
							해주세요(신청중)
							</c:if>
						</c:if></td>
					<c:choose>	
					<c:when test="${board.bCompleteFlag ==0 }">
					
			 			<td><a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${board.userIndex }">
			 				${board.title }</a>
			 			</td>
					</c:when>
					<c:when test="${board.bCompleteFlag ==1  }">
					
			 			<td><a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${board.userIndex }">
			 				<font color="red">[완료된 퀘스트] &nbsp;</font>${board.title }</a>
			 			</td>
					</c:when>
					<c:when test="${board.bCompleteFlag ==3}">
					
			 			<td><a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${board.userIndex }">
			 				<font color="blue">[진행중 퀘스트] &nbsp;</font>${board.title }</a>
			 			</td>
					</c:when>
					<c:when test="${board.bCompleteFlag ==2}">
						<td><font color="gray"><strike>삭제된 게시글 입니다</strike></font></td>
					</c:when>
					
					<c:otherwise>		 			
						<td><a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${board.userIndex }">${board.title }</a></td>
					</c:otherwise>
					</c:choose>
		 							
		 							
					<!-- USER INDEX>ID -->
					<td>${board.nickname }</td>
					<td>${board.playNick }</td>
					<td><fmt:formatDate value="${board.date }"
							pattern="yyyy-MM-dd" /></td>
							
					
					<c:choose>
					<c:when test="${board.sCompleteFlag == 3 }">
			 			<td> <input type="button" value="완료" class="btn btn-default" disabled="disabled"> </a>
			 			</td>
					</c:when>
					<c:when test="${userIndex==board.user1Index and board.sCompleteFlag == 1 }">
			 			<td> <input type="button" value="완료" class="btn btn-default" disabled="disabled"> </a>
			 			</td>
					</c:when>
					<c:when test="${userIndex==board.user2Index and board.sCompleteFlag == 2 }">
			 			<td> <input type="button" value="완료" class="btn btn-default" disabled="disabled"> </a>
			 			</td>
					</c:when>
					<c:otherwise>		 			
						<td><input type="button" class="btn btn-default" value="평가" onclick="starpointPopup(${board.boardNo },${board.user1Index }, ${board.user2Index })"></td>
					</c:otherwise>
					</c:choose>
							
					
				</tr>
			</c:forEach>

			<tr>
				<td width="1250px" colspan="6" align="center"><c:if
						test="${start != 1 }">
						<a href="complete.do?page=1"> [처음] &nbsp; </a>
						<a href="complete.do?page=${start-1 }"> ◀ &nbsp;&nbsp; </a>
					</c:if> <c:forEach begin="${start }" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current }">
					[${i }]
					</c:when>
							<c:otherwise>
								<a href="complete.do?page=${i}"> [${i }] </a>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${end != last }">
						<a href="complete.do?page=${end+1 }"> &nbsp;&nbsp; ▶ </a>
						<a href="complete.do?page=${last}"> &nbsp; [끝]</a>
					</c:if></td>
			</tr>

		</table>
	</div>
	
	
	

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrapResources/vendor/bootstrap/js/bootstrap.min.js"></script>

	
	
</body>
</html>