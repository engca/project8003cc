<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
<title>퀘스트 작성하기</title>
<script type="text/javascript">
	$.ajax({  
		type : "get",
		url : "getSido.do",
		dataType : "json",
		success : function(data) {
			$("#sido").empty();
			$(data.sido).each(function(index) {
				var sido = $('<option value='+this.sido+'>'+ this.sido +'</option>');
				$("#sido").append(sido);
			});
		},
		error : function() {
			alert("error");
		}			
	});
	
	 $(function(){
		if ( $('#reward1').val() == "" ) {
		 $('#reward2').attr('readonly', true);
		 $('#reward3').attr('readonly', true);
		} 
	 });
	
	 
$(document).ready(function(){
	 $('#sido').click(function(){
		 var selectedVal = $('#sido option:selected').val();
		 $.ajax({
			type : "get",
			url : "getGugun.do",
			dataType : "json",
			data : "sido="+selectedVal,
			success : function(data){
			$('#gungu').empty();
			$(data.gungu).each(function(index){
				var gungu = $('<option value='+this.addrNo+'>'+this.gungu+'</option>');
				$("#gungu").append(gungu);
			});
			},
			error : function() {
				alert("error");
			}
		 });
	 });

	 $('#title').click(function(){
		 if($("input:radio[name='boardFlag']").is(":checked") == true){
		 }else{
			 alert("게시판 구분을 선택해주세요.")
			 $('#boardFlag').focus();
		}
	 });
	 
	 $('#people').click(function(){
		 if($("#gungu option").is(":selected") == true){
		 } else {
			 alert("장소를 선택해주세요.");
			 $('#sido').focus();
		 }
	 });
	 
	 $("input:radio[name='contactNo']").click(function(){
		 $('#contact').html("");
	 });
	 
	 
	 $('#btn').click(function(){
		 if ($('#title').val() == "") {
			 alert("제목을 입력하세요");
			 return false;
		 } else if ( $('#reward1').val() == "" ) {
				$('#rewardChk').html("보상은 하나 이상 입력해야 합니다.");
				$('#reward1').focus();
			return false; 
		 } else if ($('#people').val() == "") {
			$('#peoplechk').html("필요인원을 적어주세요.");
			$('#people').focus();
			return false;
		} else if ($("input:radio[name='contactNo']").is(":checked") == false) {
				 $('contactNo').focus();
				 $('#contact').html("연락방법을 선택하세요.");
				 return false;
		} else if ($.isNumeric($('#people').val()) == false) {
			return false;
		} else {
			$('#content').val( $('#summernote').summernote('code')  )
			return true;
		}
	 });
	 

	 
	$('#reward1').keyup(function(){
		$('#reward2').attr('readonly', false);
		$('#div1').stop(true, false).slideDown();
		if ( $('#reward1').val() == "" ) {
			$('#div1').stop(true, false).slideUp();
			 $('#reward2').attr('readonly', true);
			 $('#reward3').attr('readonly', true);
		}
	});	
	
	$('#reward2').keyup(function(){
		$('#reward3').attr('readonly', false);
		$('#div2').stop(true, false).slideDown();
		if ( $('#reward2').val() == "" ) {
			$('#div2').stop(true, false).slideUp();
			 $('#reward3').attr('readonly', true);
		}
	})
	
	$('#reward3').keyup(function(){
		$('#div3').stop(true, false).slideDown();
		if ( $('#reward3').val() == "" ) {
			$('#div3').stop(true, false).slideUp();
		}
	})
	

	 $('#people').change(function(){
		if ($.isNumeric($('#people').val()) == false) {
			$('#peoplechk').html("숫자로 입력해 주세요.");
			$('#people').focus();
		} else {
			$('#peoplechk').remove();
			$('#people').focus();
		}
	 });
	 
	 $('#reward1').change(function(){
			if ( $('#reward1').val() == '' ) {
				$('#rewardChk').html("보상을 입력하세요");
				$('#reward1').focus();
			} else {
				$('#rewardChk').html("");				
			}
		 });
	 
	 //확장자 체크 및 파일크기 체크
		 $('#ufile1').change(function(){
					var filename = $('#ufile1').val();
					var extension = filename.slice(filename.indexOf(".") + 1).toLowerCase();
					var fileSize = this.files[0].size;
					if(extension != "jpg" && extension != "png" &&  extension != "gif" &&  extension != "bmp"){
						alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
						this.val("");
						}
					if ( fileSize > 1024 * 1024 * 10) {
						alert("파일크기는 10MB를 초과할 수 없습니다.");
						this.val("");
					}
				 });	
	 
	 $('#ufile2').change(function(){
			var filename = $('#ufile2').val();
			var extension = filename.slice(filename.indexOf(".") + 1).toLowerCase();
			var fileSize = this.files[0].size;

			if(extension != "jpg" && extension != "png" &&  extension != "gif" &&  extension != "bmp"){
				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
				$("#ufile2").val("");
				}
			if ( fileSize > 1024 * 1024 * 2 ) {
				alert("파일크기는 2MB를 초과할 수 없습니다.");
				this.val("");
			}
		 });
	 
	 $('#ufile3').change(function(){
			var filename = $('#ufile3').val();
			var extension = filename.slice(filename.indexOf(".") + 1).toLowerCase();
			var fileSize = this.files[0].size;

			if(extension != "jpg" && extension != "png" &&  extension != "gif" &&  extension != "bmp"){
				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
				$("#ufile3").val("");
				}
			if ( fileSize > 1024 * 1024 * 2 ) {
				alert("파일크기는 2MB를 초과할 수 없습니다.");
				this.val("");
			}
		 });
	 
	

	 
});

!function(e){var t=function(t,n){this.$element=e(t),this.type=this.$element.data("uploadtype")||(this.$element.find(".thumbnail").length>0?"image":"file"),this.$input=this.$element.find(":file");if(this.$input.length===0)return;this.name=this.$input.attr("name")||n.name,this.$hidden=this.$element.find('input[type=hidden][name="'+this.name+'"]'),this.$hidden.length===0&&(this.$hidden=e('<input type="hidden" />'),this.$element.prepend(this.$hidden)),this.$preview=this.$element.find(".fileupload-preview");var r=this.$preview.css("height");this.$preview.css("display")!="inline"&&r!="0px"&&r!="none"&&this.$preview.css("line-height",r),this.original={exists:this.$element.hasClass("fileupload-exists"),preview:this.$preview.html(),hiddenVal:this.$hidden.val()},this.$remove=this.$element.find('[data-dismiss="fileupload"]'),this.$element.find('[data-trigger="fileupload"]').on("click.fileupload",e.proxy(this.trigger,this)),this.listen()};t.prototype={listen:function(){this.$input.on("change.fileupload",e.proxy(this.change,this)),e(this.$input[0].form).on("reset.fileupload",e.proxy(this.reset,this)),this.$remove&&this.$remove.on("click.fileupload",e.proxy(this.clear,this))},change:function(e,t){if(t==="clear")return;var n=e.target.files!==undefined?e.target.files[0]:e.target.value?{name:e.target.value.replace(/^.+\\/,"")}:null;if(!n){this.clear();return}this.$hidden.val(""),this.$hidden.attr("name",""),this.$input.attr("name",this.name);if(this.type==="image"&&this.$preview.length>0&&(typeof n.type!="undefined"?n.type.match("image.*"):n.name.match(/\.(gif|png|jpe?g)$/i))&&typeof FileReader!="undefined"){var r=new FileReader,i=this.$preview,s=this.$element;r.onload=function(e){i.html('<img src="'+e.target.result+'" '+(i.css("max-height")!="none"?'style="max-height: '+i.css("max-height")+';"':"")+" />"),s.addClass("fileupload-exists").removeClass("fileupload-new")},r.readAsDataURL(n)}else this.$preview.text(n.name),this.$element.addClass("fileupload-exists").removeClass("fileupload-new")},clear:function(e){this.$hidden.val(""),this.$hidden.attr("name",this.name),this.$input.attr("name","");if(navigator.userAgent.match(/msie/i)){var t=this.$input.clone(!0);this.$input.after(t),this.$input.remove(),this.$input=t}else this.$input.val("");this.$preview.html(""),this.$element.addClass("fileupload-new").removeClass("fileupload-exists"),e&&(this.$input.trigger("change",["clear"]),e.preventDefault())},reset:function(e){this.clear(),this.$hidden.val(this.original.hiddenVal),this.$preview.html(this.original.preview),this.original.exists?this.$element.addClass("fileupload-exists").removeClass("fileupload-new"):this.$element.addClass("fileupload-new").removeClass("fileupload-exists")},trigger:function(e){this.$input.trigger("click"),e.preventDefault()}},e.fn.fileupload=function(n){return this.each(function(){var r=e(this),i=r.data("fileupload");i||r.data("fileupload",i=new t(this,n)),typeof n=="string"&&i[n]()})},e.fn.fileupload.Constructor=t,e(document).on("click.fileupload.data-api",'[data-provides="fileupload"]',function(t){var n=e(this);if(n.data("fileupload"))return;n.fileupload(n.data());var r=e(t.target).closest('[data-dismiss="fileupload"],[data-trigger="fileupload"]');r.length>0&&(r.trigger("click.fileupload"),t.preventDefault())})}(window.jQuery)



</script>


<style type="text/css">
#div1 {
	display: none;
}

#div2 {
	display: none;
}

#div3 {
	display: none;
}

.clearfix:before, .clearfix:after {
	display: table;
	content: "";
	line-height: 0;
}

.clearfix:after {
	clear: both;
}

.hide-text {
	font: 0/0 a;
	color: transparent;
	text-shadow: none;
	background-color: transparent;
	border: 0;
}

.input-block-level {
	display: block;
	width: 100%;
	min-height: 30px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.btn-file {
	overflow: hidden;
	position: relative;
	vertical-align: middle;
}

.btn-file>input {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	transform: translate(-300px, 0) scale(4);
	font-size: 23px;
	direction: ltr;
	cursor: pointer;
}

.fileupload {
	margin-bottom: 9px;
}

.fileupload .uneditable-input {
	display: inline-block;
	margin-bottom: 0px;
	vertical-align: middle;
	cursor: text;
}

.fileupload .thumbnail {
	overflow: hidden;
	display: inline-block;
	margin-bottom: 5px;
	vertical-align: middle;
	text-align: center;
}

.fileupload .thumbnail>img {
	display: inline-block;
	vertical-align: middle;
	max-height: 100%;
}

.fileupload .btn {
	vertical-align: middle;
}

.fileupload-exists .fileupload-new, .fileupload-new .fileupload-exists {
	display: none;
}

.fileupload-inline .fileupload-controls {
	display: inline;
}

.fileupload-new .input-append .btn-file {
	-webkit-border-radius: 0 3px 3px 0;
	-moz-border-radius: 0 3px 3px 0;
	border-radius: 0 3px 3px 0;
}

.thumbnail-borderless .thumbnail {
	border: none;
	padding: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

.fileupload-new.thumbnail-borderless .thumbnail {
	border: 1px solid #ddd;
}

.control-group.warning .fileupload .uneditable-input {
	color: #a47e3c;
	border-color: #a47e3c;
}

.control-group.warning .fileupload .fileupload-preview {
	color: #a47e3c;
}

.control-group.warning .fileupload .thumbnail {
	border-color: #a47e3c;
}

.control-group.error .fileupload .uneditable-input {
	color: #b94a48;
	border-color: #b94a48;
}

.control-group.error .fileupload .fileupload-preview {
	color: #b94a48;
}

.control-group.error .fileupload .thumbnail {
	border-color: #b94a48;
}

.control-group.success .fileupload .uneditable-input {
	color: #468847;
	border-color: #468847;
}

.control-group.success .fileupload .fileupload-preview {
	color: #468847;
}

.control-group.success .fileupload .thumbnail {
	border-color: #468847;
}

th {
	width: 150px;
}

select {
	width: 100px;
	height: 35px;
}

.bordertable th {
	/* 	background-color: pink; */
	text-align: center;
}

.people {
	width: 60px;
}

#fileTd {
	width: 200px;
}

#filename {
	color: purple;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>퀘스트 작성하기</h3>
				<hr class="star-primary1">
			</div>
		</div>
		<div class="row">

			<form action="writeBoardProc.do" method="post"
				enctype="multipart/form-data">
				<table class="table table-bordered bordertable">
					<tr>
						<th><h5>게시판 구분</h5></th>
						<td colspan="5">
							<h4>
								<input type="radio" name="boardFlag" value="1" id="boardFlag">
								해주세요 <input type="radio" name="boardFlag" value="0"
									id="boardFlag"> 잘해요
							</h4>
						</td>
					</tr>
					<tr>
						<th><h5>제목</h5></th>
						<td colspan="3"><input type="text" placeholder="제목을 입력하세요. "
							name="title" class="form-control" id="title" />
							</td>
					</tr>
					<tr>
						<th><h5>장소</h5></th>
						<td colspan="3"><select name="sido" id="sido">
						</select> <select name="addrNo" id="gungu">
						</select></td>
					</tr>
					<tr>
						<th><h5>보상</h5></th>
						<td colspan="3">
							<table>
								<tr>
									<td><input type="text" placeholder="보상1" name="reward1"
										class="form-control input-sm" id="reward1"></td>
									<td>&nbsp;&nbsp;</td>

									<td><input type="text" placeholder="보상2" name="reward2"
										class="form-control input-sm" id="reward2"></td>
									<td>&nbsp;&nbsp;</td>

									<td><input type="text" placeholder="보상3" name="reward3"
										class="form-control input-sm" id="reward3"></td>
									<td><span id="rewardChk" style="color: red;"></span></td>

								</tr>
								<tr>
									<td id="fileTd"><br>
										<div class="fileupload fileupload-new"
											data-provides="fileupload" id="div1">
											<span class="btn btn-primary btn-file"><span
												class="fileupload-new">보상1 이미지</span> <span
												class="fileupload-exists">선택완료</span> <input type="file"
												name="ufile1" id="ufile1" /></span> <span
												class="fileupload-preview"></span> <a href="#"
												class="close fileupload-exists" data-dismiss="fileupload"
												style="float: none">×</a>
										</div></td>
									<td>&nbsp;&nbsp;</td>
									<td id="fileTd"><br>
										<div class="fileupload fileupload-new"
											data-provides="fileupload" id="div2">
											<span class="btn btn-primary btn-file"><span
												class="fileupload-new">보상2 이미지</span> <span
												class="fileupload-exists">선택완료</span> <input type="file"
												name="ufile2" id="ufile2" /></span> <span
												class="fileupload-preview"></span> <a href="#"
												class="close fileupload-exists" data-dismiss="fileupload"
												style="float: none">×</a>
										</div></td>
									<td>&nbsp;&nbsp;</td>
									<td id="fileTd"><br>
										<div class="fileupload fileupload-new"
											data-provides="fileupload" id="div3">
											<span class="btn btn-primary btn-file"><span
												class="fileupload-new">보상3 이미지</span> <span
												class="fileupload-exists">선택완료</span> <input type="file"
												name="ufile3" id="ufile3" /></span> <span
												class="fileupload-preview"></span> <a href="#"
												class="close fileupload-exists" data-dismiss="fileupload"
												style="float: none">×</a>
										</div></td>
									<td>&nbsp;&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<th><h5>필요인원</h5></th>
						<td colspan="3"><input type="text" placeholder="     명"
							name="people" class="form-control people" id="people"
							maxlength="3"> <span id="peoplechk" style="color: red;"></span>
					</tr>
					<tr>
						<th><h5>연락방법</h5></th>
						<td colspan="3"><input type="radio" name="contactNo"
							value="1">카톡&nbsp;&nbsp; <input type="radio"
							name="contactNo" value="2">이메일 &nbsp;&nbsp;<input
							type="radio" name="contactNo" value="3">전화&nbsp;&nbsp; <span
							id="contact" style="color: red"></span></td>
					</tr>

					<tr>
						<th><h5>희망시작시간</h5></th>
						<td><select name="stTime">
								<c:forEach var="i" begin="1" end="24">
									<option value=${i }>${i }시</option>
								</c:forEach>
						</select></td>
						<th><h5>소요예정시간</h5></th>
						<td><select name="playTime">
								<option value="30m">30분미만</option>
								<option value="3h">3시간 미만</option>
								<option value="over3h">3시간 이상</option>
						</select></td>
					</tr>
					<tr>
						<th height="100"><h5>내용</h5></th>
						<td colspan="3">
							<div id="summernote"></div>
						</td>
					</tr>
					<tr>

						<td colspan="4" align="right"><input type="hidden"
							name="content" id="content"> <input type="submit"
							class="btn btn-success btn-lg" value="퀘스트등록" id="btn"> <a
							class="btn btn-primary btn-lg"
							onclick="location.href='listBoard.do'">퀘스트목록 </a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : 300, // set minimum height of editor
			maxHeight : 300, // set maximum height of editor
			focus : true
		});
	</script>

</html>
