<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}
</style>
	<div id="board" class="container">
			
				<c:if test="${boardFlag == 0}">
					<h1 align = "center">잘 해 요</h1>
				</c:if>

				<c:if test="${boardFlag ==1}">
					<h1 align = "center">해 주 세 요</h1>
				</c:if>

				<c:if test="${boardFlag == 0 || boardFlag == 1 }">
					<hr class="star-primary">
					<h3>게시한 글(요청중)</h3>  
					<div>
						<table class="table table-striped">
							<tr>
								
								<th width="5%">No</th>
								<th width="50%">제목</th>
								<th width="20%">작성자</th>
								<th width="20%">작성일</th>
								<th width="5%">조회수</th>
							
							</tr>
							<c:forEach var="myboard" items="${myboard }">
								<tr>
									
									<td>${myboard.boardNo }</td>
									
									<c:if test="${myboard.bCompleteFlag ==0 }">
		 								<td><a href="viewBoard.do?boardNo=${myboard.boardNo}">	${myboard.title } </a>
		 							
									</td>	 							
		 							</c:if> 
		 												
		 							<c:if test="${myboard.bCompleteFlag ==1 }">
		 								<td><a href="viewBoard.do?boardNo=${myboard.boardNo}">
		 									<font color="red">[완료된 퀘스트]</font>	${myboard.title }</a>
				 						</td>
		 							</c:if>
		 							
		 							<c:if test="${myboard.bCompleteFlag ==3 }">
			 							<td><a href="viewBoard.do?boardNo=${myboard.boardNo}">
			 								<font color="blue">[진행중 퀘스트]</font>	${myboard.title }</a>
			 						 	</td>
		 							</c:if> 					
		 					
		 							<c:if test="${myboard.bCompleteFlag ==2 }">
		 								<td><font color="gray"><strike>삭제된 게시글 입니다</strike></font></td>
		 							</c:if>

									<!-- USER INDEX>ID -->
									<td>${myboardnickname}</td>
									<td><fmt:formatDate value="${myboard.date }"
											pattern="yyyy-MM-dd" /></td>
									<td>${myboard.readCount }</td>
									
								</tr>
							</c:forEach>
						</table>
					</div>

					<h3>신청한 글(신청중)</h3>
					<div>
						<table class="table table-striped">
							<tr>
								<th width="5%">No</th>
								<th width="15%">구분</th>
								<th width="45%">제목</th>
								<th width="15%">작성자</th>
								<th width="15%">작성일</th>
								<th width="5%">조회수</th>
							</tr>
							<c:forEach var="myapply" items="${myapply }">
								<tr>
									<td>${myapply.boardNo }</td>
									<td><c:if test="${myapply.aCompleteFlag == 1 }">접수완료</c:if> 
										<c:if test="${myapply.aCompleteFlag == 2 }">간택완료</c:if>
										<c:if test="${myapply.aCompleteFlag == 3 }">간택실패</c:if></td>
									<td><a href="viewBoard.do?boardNo=${myapply.boardNo }">${myapply.title }</a></td>
									<td>${myapply.nickname}</td>
									<td><fmt:formatDate value="${myapply.date }" pattern="yyyy-MM-dd" /></td>
									<td>${myapply.readCount }</td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</c:if>
	</div>
