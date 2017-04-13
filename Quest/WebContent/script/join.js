/**
 * 회원가입시 유효성 검사
 */

window.onload = function() {
 
	var userid = document.getElementById("userid");
	var useridspan = document.getElementById("useridspan");
	var password = document.getElementById("password");
	var passwordspan = document.getElementById("passwordspan");
	var pwd_check = document.getElementById("pwd_check");
	var pwd_checkspan = document.getElementById("pwd_checkspan");
	var nickname = document.getElementById("nickname");
	var nicknamespan = document.getElementById("nicknamespan");

	var check = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,20}/;
//	var email = /^([a-z0-9_+.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	var email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	password.addEventListener('keyup', function() {
		if (!check.test(password.value)) {
			passwordspan.innerHTML = "영문 대소문자/특수문자/숫자 포함 8자";
		} else {
			passwordspan.innerHTML = "올바른 비밀번호 입니다.";
		}
	});
		
	pwd_check.addEventListener('keyup', function() {
		if (pwd_check.value!=password.value){
			pwd_checkspan.innerHTML = "동일한 비밀번호를 입력하세요." ;
		} else {
			pwd_checkspan.innerHTML = "동일한 비밀번호 입니다." ;
		}
	});
	
	userid.addEventListener('keyup', function(e) {
		if (!email.test(userid.value)) {
			useridspan.innerHTML = "올바른 이메일을 입력하세요";
		} else {
			var http = new XMLHttpRequest();
			http.open('get', 'idCheck.do?userid=' + userid.value);
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) 
				{
					if (http.responseText == 0)
					{
						useridspan.innerHTML = "사용가능한 아이디(이메일) 입니다.";
					}
					else 
					{
						useridspan.innerHTML = "아이디(이메일)이 중복입니다";
					}
				}	
			}		
			http.send();
		}
	});
		
	nickname.addEventListener('keyup', function(e) {
		var http = new XMLHttpRequest();
		http.open('get', 'nicknameCheck.do?nickname=' + nickname.value);
		http.onreadystatechange = function() {
			if (http.readyState == 4 && http.status == 200) 
			{
				if (http.responseText == 0)
				{
					nicknamespan.innerHTML = "사용가능한 닉네임 입니다";
				}
				else 
				{
					nicknamespan.innerHTML = "닉네임이 중복입니다";
				}
			}	
		}
		http.send();
	});
}