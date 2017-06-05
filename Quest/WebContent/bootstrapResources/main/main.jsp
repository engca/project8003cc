<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
  function averageClick(){
	  $('#doCountTable').css('display', 'none');
	  $('#averageTable').css('display', '');
	  $('#average').attr('class','active')
	  $('#docount').attr('class','')
  }
  
  function countClick(){
	  $('#doCountTable').css('display', '');
	  $('#averageTable').css('display', 'none');
	  $('#average').attr('class','')
	  $('#docount').attr('class','active')
  }
  function clickedClick(){
	  $('#clickedTable').css('display', 'none');
	  $('#applyTable').css('display', '');
	  $('#clicked').attr('class','active')
	  $('#apply').attr('class','')
  }
  
  function applyClick(){
	  $('#clickedTable').css('display', '');
	  $('#applyTable').css('display', 'none');
	  $('#clicked').attr('class','')
	  $('#apply').attr('class','active')
  }
  </script>
<style type="text/css">
#_chatbox {
	border-radius: 10em 0 5em 2em;
	background-color: aqua;
	border: 1px solid red;
}

#messageWindow {
	background-color: gray;
}

</style>
</head>
<body>

	<div></div>

	<table class="table table-bordered">
		<tr>
			<td>
				<h3><a href = "listBoard.do?boardFlag=0">잘해요</a></h3>
				<hr class="star-primary1">
				<table>
					<tr>
						<td align="center" width="8%"><b>No</b></td>
						<td align="center" width="54%"><b>제목</b></td>
						<td align="center" width="12%"><b>작성자</b></td>
						<td align="center" width="18%"><b>작성일</b></td>
						<td align="center" width="8%"><b>조회수</b></td>
					</tr>
					<c:forEach begin="0" end="5" step="1" items="${list0.boardList }" var="board">
						<tr>
							<td align="center">${board.boardNo}</td>

							<c:if test="${board.bCompleteFlag ==0 }">
								<td>
								<a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.title } </a> &nbsp;&nbsp;&nbsp;
										<font color="gray" size="1px"><b>[${board.commentCount }]</b></font></td>
							</c:if>
							<c:if test="${board.bCompleteFlag ==1 }">
								<td><a
									href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
										<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[완료된 퀘스트]</font> ${board.title }
								</a> &nbsp;&nbsp;&nbsp;<font color="gray" size="1px"><b>[${board.commentCount }]</b></font></td>
							</c:if>
							<c:if test="${board.bCompleteFlag ==3 }">
								<td><a
									href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
										<font color="blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[진행중 퀘스트]</font> ${board.title }
								</a> &nbsp;&nbsp;&nbsp;<font color="gray" size="1px"><b>[${board.commentCount }]</b></font></td>
							</c:if>
							<c:if test="${board.bCompleteFlag ==2 }">
								<td><font color="gray"><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제된 게시글 입니다</strike></font></td>
							</c:if>

							<td align="center">${board.nickname}</td>
							<td align="center"><fmt:formatDate value="${board.date }"
									pattern="yyyy.MM.dd" /></td>
							<td align="center">${board.readCount }</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td>
				<p>순위</p>
				<ul class="nav nav-tabs">
					<li role="presentation" id="average" class="active"><a
						href="javascript:averageClick()">Average</a></li>
					<li role="presentation" id="docount"><a
						href="javascript:countClick()">Count</a></li>
				</ul>
				<table id="averageTable">
					<tr>
						<th>순위</th>
						<th>이름</th>
						<th>평점</th>
					</tr>
					<c:forEach var="ranker" items="${rankAverage }" varStatus="status">
						<tr>
							<td>${status.count }위</td>
							<td>
								<!-- 						id --> ${ranker.userId }
							</td>
							<td>
								<!-- 						average --> ${ranker.average }
							</td>
						</tr>
					</c:forEach>
				</table>
				<table id="doCountTable" style="display: none;">
					<tr>
						<th>순위</th>
						<th>이름</th>
						<th>개수</th>
					</tr>
					<c:forEach var="ranker" items="${rankDocount }" varStatus="status">
						<tr>
							<td>${status.count }위</td>
							<td>
								<!-- 						id --> ${ranker.userId }
							</td>
							<td>
								<!-- 						count --> ${ranker.doCount }
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<h3><a href = "listBoard.do?boardFlag=0">해주세요</a></h3>
				<hr class="star-primary1">
				<table>
					<tr>
						<td align="center" width="8%"><b>No</b></td>
						<td align="center" width="54%"><b>제목</b></td>
						<td align="center" width="12%"><b>작성자</b></td>
						<td align="center" width="18%"><b>작성일</b></td>
						<td align="center" width="8%"><b>조회수</b></td>
					</tr>
					<c:forEach begin="0" end="5" step="1" items="${list1.boardList }"
						var="board">
						<tr>
							<td align="center">${board.boardNo}</td>
							<td><a href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.title } </a> &nbsp;&nbsp;&nbsp;<font color="gray"
								size="1px"><b>[${board.commentCount }]</b></font></td>
							<c:if test="${board.bCompleteFlag ==1 }">
								<td><a
									href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
										<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[완료된 퀘스트]</font> ${board.title }
								</a> &nbsp;&nbsp;&nbsp;<font color="gray" size="1px"><b>[${board.commentCount }]</b></font></td>
							</c:if>
							<c:if test="${board.bCompleteFlag ==3 }">
								<td><a
									href="viewBoard.do?boardNo=${board.boardNo}&userIndex=${sessionScope.userIndex}">
										<font color="blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[진행중 퀘스트]</font> ${board.title }
								</a> &nbsp;&nbsp;&nbsp;<font color="gray" size="1px"><b>[${board.commentCount }]</b></font></td>
							</c:if>
							<c:if test="${board.bCompleteFlag ==2 }">
								<td><font color="gray"><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제된 게시글 입니다</strike></font></td>
							</c:if>

							<td align="center">${board.nickname}</td>
							<td align="center"><fmt:formatDate value="${board.date }"
									pattern="yyyy.MM.dd" /></td>
							<td align="center">${board.readCount }</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td>
				<p>게시판 순위</p>
				<ul class="nav nav-tabs">
					<li role="presentation" id="clicked" class="active"><a
						href="javascript:clickedClick()">클릭 많은 게시판</a></li>
					<li role="presentation" id="apply"><a
						href="javascript:applyClick()">신청 많은 제목</a></li>
				</ul>
				<table id="clickedTable" style="display: none;">
					<tr>
						<th>순위</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="ranker" items="${rankClicked }" varStatus="status">
						<tr>
							<td>${status.count }위</td>
							<td>
		<!-- 						id --> <a href="viewBoard.do?boardNo=${ranker.boardNo }">${ranker.title }</a>
							</td>
							<td>
								<!-- 						average --> ${ranker.readCount }
							</td>
						</tr>
					</c:forEach>
				</table>
				<table id="applyTable" >
					<tr>
						<th>순위</th>
						<th>제목</th>
						<th>지원자 수</th>
					</tr>
					<c:forEach var="ranker" items="${rankApply }" varStatus="status">
						<tr>
							<td>${status.count }위</td>
							<td>
<!-- 						id --> <a href="viewBoard.do?boardNo=${ranker.boardNo }">${ranker.title }</a>
							</td>
							<td>
						<!-- 						count --> ${ranker.count }
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>

	<div>
		<!--     채팅창 -->
		<div id="_chatbox" style="display: none; position: absolute; right: 50px; bottom: 70px;">
			<fieldset>
				<div id="messageWindow" style="overflow-x: hidden; overflow-y: scroll; height: 330px;"></div>
				<input id="inputMessage" type="text" onkeyup="enterkey()" />
				<input type="submit" value="send" onclick="send()" />
			</fieldset>
		</div>
		<div style="position: absolute; right: 20px; bottom: 20px; text-align: right;">
			<img class="chat" src="<%=request.getContextPath()%>/img/chat_black.png" />
		</div>
		<!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
		<c:if test="${(sessionScope.userIndex ne '') and !(empty sessionScope.userIndex)}">
			<input type="hidden" value='${sessionScope.nickname }' id='chat_id' />
		</c:if>
		<c:if test="${(sessionScope.userIndex eq '') or (empty sessionScope.userIndex)}">
			<input type="hidden" value='<%=session.getId().substring(0, 6)%>(손님)' id='chat_id' />
		</c:if>
		
	</div>
</body>
<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->
<script type="text/javascript">
    $(".chat").on({"click" : function() {
            if ($(this).attr("src") == "<%=request.getContextPath()%>/img/chat_black.png") {
                $(".chat").attr("src", "<%=request.getContextPath()%>/img/chat_red.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "<%=request.getContextPath()%>/img/chat_red.png") {
                $(".chat").attr("src", "<%=request.getContextPath()%>/img/chat_black.png");
				$("#_chatbox").css("display", "none");
			}
		}
	});
</script>
<script type="text/javascript">
// 	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:8080/Quest/broadcasting');
	var inputMessage = document.getElementById('inputMessage');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		var message = event.data.split("|");
		var sender = message[0];
		var content = message[1];
		if (content == "") {

		} else {
			if (content.match("/")) {
				if (content.match(("/" + $("#chat_id").val()))) {
					var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
					if (temp[1].trim() == "") {
					} else {
						$("#messageWindow").html($("#messageWindow").html()+ "<p class='whisper'>"+ sender+ content.replace("/"+ $("#chat_id").val(), "(귓속말) :") + "</p>");
					}
				} else {
				}
			} else {
				if (content.match("!")) {
					$("#messageWindow").html($("#messageWindow").html()+ "<p class='chat_content'><b class='impress'>"+ sender + " : " + content+ "</b></p>");
				} else {
					$("#messageWindow").html($("#messageWindow").html()+ "<p class='chat_content'>" + sender+ " : " + content + "</p>");
				}
			}
		}
	}
	function onOpen(event) {
		$("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		if (inputMessage.value == "") {
		} else {
			$("#messageWindow").html($("#messageWindow").html() + "<p class='chat_content'>나 : "+ inputMessage.value + "</p>");
		}
		webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
		inputMessage.value = "";
		
		//	     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
		var elem = document.getElementById('messageWindow');
		elem.scrollTop = elem.scrollHeight;
	}
	//     엔터키를 통해 send함
	function enterkey() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
	//     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
// 	window.setInterval(function() {
// 		var elem = document.getElementById('messageWindow');
// 		elem.scrollTop = elem.scrollHeight;
// 	}, 0);
</script>
</html>