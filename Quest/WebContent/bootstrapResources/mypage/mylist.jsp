<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<style type="text/css">
select {
	width: 80px;
	height: 30px;
}

th{ 
text-align: center; }
td {
text-align: center;
}

</style>

<script type="text/javascript">
$(document).ready(function() {

$("#boardSelect").change(function(){
//     alert("select" + $(this).val());
//     alert("boardFlag"+${boardFlag})
    if($(this).val() == 0){
    	document.location.href="mylistProc.do?boardFlag="+${boardFlag};
    }    else{  
	document.location.href="selectFlag.do?boardFlag="+${boardFlag}+"&boardSelect="+$("#boardSelect").val()+"&applySelect="+$("#applySelect").val();
    }
});

$("#applySelect").change(function(){
//     alert($(this).val());
//     alert("boardFlag"+${boardFlag})
 if($(this).val() == 0){
	 document.location.href="mylistProc.do?boardFlag="+${boardFlag};
    }    else{  
    document.location.href="selectFlag.do?boardFlag="+${boardFlag}+"&boardSelect="+$("#boardSelect").val()+"&applySelect="+$("#applySelect").val();
    }
});

})
</script>
</head>
<body>
	<div id="board" class="container">
			
				<c:if test="${boardFlag == 0}">
					<h1>잘 해 요</h1>
				</c:if>

				<c:if test="${boardFlag ==1}">
					<h1>해 주 세 요</h1>
				</c:if>

				<c:if test="${boardFlag == 0 || boardFlag == 1 }">
					<hr class="star-primary">
					<h3>게시한 글(요청중)</h3>  
					<div align="right"  class="form-inline">
						<h4 >정렬:<select name="selectFlag"  class="form-control" id="boardSelect" class="form-control">
							<option value="0">선택</option>
							<option value="0">All</option>
							<option value="3">진행중</option>
							<option value="1">완료</option>
							
<!-- 							<option value="3">삭제</option> -->
						</select> </h4>
					</div>
					<div>
						<table class="table table-striped">
							<tr>
								
								<th align="center" width="5%">No</th>
								<th align="center" width="10%">신청자현황</th>
								<th align="center" width="45%">제목</th>
								<th align="center" width="10%">작성자</th>
								<th align="center" width="15%">작성일</th>
								<th align="center" width="5%">조회수</th>
							
							</tr>
							<c:forEach var="myboard" items="${myboard}">
								<tr>
									
									<td>${myboard.boardNo }</td>
									
									<c:choose>
										<c:when test="${myboard.bCompleteFlag ==3 }">
										<td> 진행중 </td>
										</c:when>
										<c:when test="${myboard.bCompleteFlag ==1 }">
										<td><font color="red"> 완료</font> </td>
										</c:when>
										<c:otherwise>
										<td align="center"><font color=blue>${myboard.totalapplycount}</font></td>
										</c:otherwise>
									</c:choose>
									
									
									<c:if test="${myboard.bCompleteFlag ==0 }">
		 								<td><a href="viewBoard.do?boardNo=${myboard.boardNo}&userIndex=${userIndex}">	${myboard.title } </a>
		 							
									</td>	 							
		 							</c:if> 
		 												
		 							<c:if test="${myboard.bCompleteFlag ==1 }">
		 								<td><a href="viewBoard.do?boardNo=${myboard.boardNo}&userIndex=${userIndex}">
		 									<font color="red">[완료된 퀘스트] &nbsp; </font>	${myboard.title }</a>
				 						</td>
		 							</c:if>
		 							
		 							<c:if test="${myboard.bCompleteFlag ==3 }">
			 							<td><a href="viewBoard.do?boardNo=${myboard.boardNo}&userIndex=${userIndex}">
			 								<font color="blue">[진행중 퀘스트] &nbsp;</font>	${myboard.title }</a>
			 						 	</td>
		 							</c:if> 					
		 					
		 							<c:if test="${myboard.bCompleteFlag ==2 }">
		 								<td><font color="gray"><strike>삭제된 게시글 입니다</strike></font></td>
		 							</c:if>

									<!-- USER INDEX>ID -->
									
									
									<td align="center">${myboardnickname}</td>
									<td align="center"><fmt:formatDate value="${myboard.date }"
											pattern="yyyy-MM-dd" /></td>
									<td align="center">${myboard.readCount }</td>
									
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<br>
					<br>
					<br>
					<br>

					<h3>신청한 글(신청중)</h3>
					<div align="right"  class="form-inline">
						<h4 >정렬:<select name="selectFlag"  class="form-control" id="applySelect" class="form-control">
							<option value="0">선택</option>
							<option value="0">All</option>
							<option value="1">접수완료</option>
							<option value="2">간택완료</option>
							<option value="3">간택실패</option>
						</select> </h4>
					</div>
					<div>
						<table class="table table-striped">
							<tr>
								<th align="center" width="5%">No</th>
								<th align="center" width="10%">구분</th>
								<th align="center" width="45%">제목</th>
								<th align="center" width="10%">작성자</th>
								<th align="center" width="15%">작성일</th>
								<th align="center" width="5%">조회수</th>
							</tr>
							<c:forEach var="myapply" items="${myapply }">
								<tr>
									<td>${myapply.boardNo }</td>
									<td align="center"><c:if test="${myapply.aCompleteFlag == 1 }">접수완료</c:if> 
										<c:if test="${myapply.aCompleteFlag == 2 }">간택완료</c:if>
										<c:if test="${myapply.aCompleteFlag == 3 }">간택실패</c:if></td>
<%-- 									<td align="center"><a href="viewBoard.do?boardNo=${myapply.boardNo }&userIndex=${userIndex}">${myapply.title }</a></td> --%>
									
									
									<c:if test="${myapply.bCompleteFlag ==0 }">
		 								<td><a href="viewBoard.do?boardNo=${myapply.boardNo}&userIndex=${userIndex}">	${myapply.title } </a>
		 							
									</td>	 							
		 							</c:if> 
		 												
		 							<c:if test="${myapply.bCompleteFlag ==1 }">
		 								<td><a href="viewBoard.do?boardNo=${myapply.boardNo}&userIndex=${userIndex}">
		 									<font color="red">[완료된 퀘스트] &nbsp; </font>	${myapply.title }</a>
				 						</td>
		 							</c:if>
		 							
		 							<c:if test="${myapply.bCompleteFlag ==3 }">
			 							<td><a href="viewBoard.do?boardNo=${myapply.boardNo}&userIndex=${userIndex}">
			 								<font color="blue">[진행중 퀘스트] &nbsp;</font>	${myapply.title }</a>
			 						 	</td>
		 							</c:if> 					
		 					
		 							<c:if test="${myapply.bCompleteFlag ==2 }">
		 								<td><font color="gray"><strike>삭제된 게시글 입니다</strike></font></td>
		 							</c:if>
									
									
									<td align="center">${myapply.nickname}</td>
									<td align="center"><fmt:formatDate value="${myapply.date }" pattern="yyyy-MM-dd" /></td>
									<td align="center">${myapply.readCount }</td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</c:if>
	</div>
</body>
</html>
