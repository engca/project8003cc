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
	$(document).ready(function() {



		//이메일 유효성 검사
		if ($('#contactNo').val() == 2) {
			$('#contactAnswer').on('blur', function() {
				var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				if (!regEmail.test($('#contactAnswer').val())) {
					$('#contactSpan').html('올바른 이메일을 입력하세요');

					$('#contactAnswer').focus();
				} else {
					$('#contactSpan').html('');
				}
			});
		}

		//핸드폰 유효성 검사
		if ($('#contactNo').val() == 3) {
			$('#contactAnswer').on('blur', function() {
				var phone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
				if (!phone.test($('#contactAnswer').val())) {
					$('#contactSpan').html('올바른 핸드폰번호를 입력하세요');
					$('#contactAnswer').focus();
				} else {
					$('#contactSpan').html('');
				}

			});
		}



		$('#apply').on('click', function() {
			// 		alert("contactNo : "+$('#contactNo').val());

			if ($('#reward').val() == null) {
				alert('보상을 선택해주세요.');
			} else if ($('#contactAnswer').val() == "") {
				alert('연락 방법을 작성해주세요.');
				$('#contactAnswer').focus();
			} else if ($('#content').val() == "") {
				alert('작성자에게 전달할 내용을 작성해주세요.');
				$('#content').focus();
			} else {

				

			}
			


		}) // apply on click end


	});
	var updateApply = function() {
		var apply = document.applyUpdatePopup;
		window.name = "applyParent";
		window.open('','apply','');
		apply.action = "applyUpdatePopupProc.do";
		apply.target = "apply";
		apply.method = "post";
		apply.submit(); 
		alert('신청 수정이 완료되었습니다');
		window.close();

	}
	
// 	var deleteApplyUser = function(){
// 		alert('레알 삭제 ㄱㄱ???');
// 	};
	
	var doClose = function() {
		window.close();
	};
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="modal-body">
					<h1 align="center">신 청 수 정</h1>
					<hr class="star-primary">


					<form  action="applyUpdatePopupProc.do" method="post" name="applyUpdatePopup">
						<table align="center" class="table table-bordered">
							<tr align="center">
								<th>글 번 호</th>
								<td>${board.boardNo}<input type="hidden" name="boardNo"
									value="${board.boardNo}" id="boardNo">
							</tr>

							<tr align="center">
								<th>보상</th>
								<td>
									<c:choose>
										<c:when test="${apply.rewardNo==1 }">
											<input type="radio" name="rewardNo" id="reward"	value="1" checked="checked"> 
												${board.reward1 }
								
												&nbsp;&nbsp;&nbsp; 
											<c:if test="${apply.reward2 != ''}">																														
												<input type="radio" name="rewardNo" id="reward" value="2"> 
												${board.reward2 }
											</c:if>								
											&nbsp;&nbsp; 
											<c:if test="${apply.reward3 != ''}">	
												<input type="radio" name="rewardNo" id="reward" value="3"> 
												${board.reward3 }
											</c:if>	
										</c:when>
										
										<c:when test="${apply.rewardNo==2 }">
											<input type="radio" name="rewardNo" id="reward"	value="1" > 
												${board.reward1 }
								
												&nbsp;&nbsp;&nbsp; 
											<c:if test="${apply.reward2 != ''}">																														
												<input type="radio" name="rewardNo" id="reward" value="2" checked="checked"> 
												${board.reward2 }
											</c:if>								
											&nbsp;&nbsp; 
											<c:if test="${apply.reward3 != ''}">	
												<input type="radio" name="rewardNo" id="reward" value="3"> 
												${board.reward3 }
											</c:if>	
										</c:when>
										
										<c:when test="${apply.rewardNo==3 }">
											<input type="radio" name="rewardNo" id="reward"	value="1" > 
												${board.reward1 }
								
												&nbsp;&nbsp;&nbsp; 
											<c:if test="${apply.reward2 != ''}">																														
												<input type="radio" name="rewardNo" id="reward" value="2" > 
												${board.reward2 }
											</c:if>								
											&nbsp;&nbsp; 
											<c:if test="${apply.reward3 != ''}">	
												<input type="radio" name="rewardNo" id="reward" value="3" checked="checked"> 
												${board.reward3 }
											</c:if>	
										</c:when>
										
									</c:choose>
								</td>
							</tr>
							<tr align="center">
								<th>연락 방법</th>
								<td><input type="hidden" name="contactNo" id="contactNo"
									value="${board.contactNo }"> ${board.contact} &nbsp;<input type="text"
									value="${apply.contactAnswer }" name="contactAnswer"
									id="contactAnswer"><br> <span id="contactSpan"></span>
								</td>
							</tr>
							<tr align="center">
								<th>내용</th>
								<td> <textarea cols="4" rows="4" name="content" id="content" class="form-control">${apply.content}</textarea></td>
							</tr>

							<tr align="center">
								<td colspan="2" align="center">
									<input type="button" class="btn btn-primary btn-lg" value="취소" onclick="doClose()">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-success btn-lg" value="신청삭제" id="deleteApply" onclick="location.href='deleteApplyPopup.do?userIndex=${userIndex }&boardNo=${board.boardNo}'">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-success btn-lg" value="신청수정" id=" updateApply" onclick="updateApply()">
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>