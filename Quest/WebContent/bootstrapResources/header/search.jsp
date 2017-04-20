<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var A = [  "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
			"노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
			"송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
	var B = [  "가평군", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "광명시",
			"광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시 소사구", "부천시 오정구",
			"부천시 원미구", "성남시 분당구", "성남시 수정구", "성남시 중원구", "수원시 권선구", "수원시 영통구",
			"수원시 장안구", "수원시 팔달구", "시흥시", "안산시 단원구", "안산시 상록구", "안성시",
			"안양시 동안구", "안양시 만안구", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시 기흥구",
			"용인시 수지구", "용인시 처인구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시",
			"하남시", "화성시" ];
	var C = [ "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구",
			"옹진군", "중구" ]
	var D = [  "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군",
			"원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군",
			"횡성군" ];
	var E = [  "대덕구", "동구", "서구", "유성구", "중구" ];
	var F = [ "세종시" ];
	var G = [  "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시",
			"서천군", "아산시", "예산군", "천안시 동남구", "천안시 서북구", "청양군", "태안군", "홍성군" ];
	var H = [  "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군",
			"진천군", "청주시 상당구", "청주시 서원구", "청주시 청원구", "청주시 흥덕구", "충주시" ];
	var I = [  "강서구", "금정구", "기장군", "남구동", "구동래구", "부산진구", "북구", "사상구",
			"사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구" ];
	var J = [  "남구동", "구북구", "울주군", "중구" ];
	var K = [  "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군",
			"양산시", "의령군", "진주시", "창녕군", "창원시 마산합포구", "창원시 마산회원구", "창원시 성산구",
			"창원시 의창구", "창원시 진해구", "통영시", "하동군", "함안군", "함양군", "합천군" ];
	var L = [  "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군",
			"상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군",
			"울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시 남구", "포항시 북구" ];
	var M = [  "남구달", "서구", "달성군", "동구북구", "서구", "수성구", "중구" ];
	var N = [  "광산구", "남구동", "구북구", "서구" ];
	var O = [  "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시",
			"무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군",
			"장흥군", "진도군", "함평군", "해남군", "화순군" ];
	var P = [  "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군",
			"익산시", "임실군", "장수군", "전주시 덕진구", "전주시 완산구", "정읍시", "진안군" ];
	var Q = [  "서귀포시", "제주시" ];
	var R = [  "광산구", "남구", "동구", "북구", "서구" ];
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#sangseaBtn').click(function() {
			// 			alert("?");
			$('#sangsea').css('visibility', 'visible');
			// 			$('#sangsea').slideDown();
		});
		$('#closeBtn').click(function() {
			// 			alert("?");
			$('#sangsea').css('visibility', 'hidden');
			$("input:checkbox[name='area']").prop("checked", false);
			$('#sangseaArea').css('visibility', 'hidden');
			// 			$('#sangsea').slideDown();
		});	
	});
	function sch_area_si_chg(sido) {
		$('#sangseaArea').css('visibility', 'visible');
		//이동햇을때 체크 다 풀기 
		$("input:checkbox[name='area']").prop("checked", false);

		$('#sangseaArea').text("");
		if (sido == 'A') {
			$(A).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+A[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(A[index]);
			});
		}
		if (sido == 'B') {
			$(B).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+B[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(B[index]);
			});
		}
		if (sido == 'C') {
			$(C).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+C[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(C[index]);
			});
		}
		if (sido == 'D') {
			$(D).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+D[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(D[index]);
			});
		}
		if (sido == 'E') {
			$(E).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+E[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(E[index]);
			});
		}
		if (sido == 'F') {
			$(F).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+F[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(F[index]);
			});
		}
		if (sido == 'G') {
			$(G).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+G[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(G[index]);
			});
		}
		if (sido == 'H') {
			$(H).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+H[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(H[index]);
			});
		}
		if (sido == 'I') {
			$(I).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+I[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(I[index]);
			});
		}
		if (sido == 'J') {
			$(J).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+J[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(J[index]);
			});
		}
		if (sido == 'K') {
			$(K).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+K[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(K[index]);
			});
		}
		if (sido == 'L') {
			$(L).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+L[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(L[index]);
			});
		}
		if (sido == 'N') {
			$(N).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+N[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(N[index]);
			});
		}
		if (sido == 'M') {
			$(M).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+M[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(M[index]);
			});
		}
		if (sido == 'O') {
			$(O).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+O[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(O[index]);
			});
		}
		if (sido == 'P') {
			$(P).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+P[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(P[index]);
			});
		}
		if (sido == 'Q') {
			$(Q).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+Q[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(Q[index]);
			});
		}
		if (sido == 'R') {
			$(R).each(function(index) {
				var a = $('<input type ="checkbox" name="area" value="'+R[index]+'">');
				$('#sangseaArea').append(a);
				$('#sangseaArea').append(R[index]);
			});
		}

	}
</script>
<style type="text/css">
	table {
    width: 100%;
    border: 1px solid #bcbcbc;
  }
  .ls2 {
        letter-spacing: -1px;
        word-spacing: 3px;
      }
</style>
</head>
<body>
	<form action="ListBoard.do">
		<input type="text" name="searchKey"> 
		<input type="submit" value="검색" onclick="insertAreaList();">
	
	<input id="sangseaBtn" type = "button" value="상세검색">
	<div id="sangsea"
		style="visibility: hidden; overflow-x: hidden; width: 800px;">
		<table >
			<tr >
				<td><a href="javascript:sch_area_si_chg('A')">서울</a></td>
				<td><a href="javascript:sch_area_si_chg('B')">경기</a></td>
				<td><a href="javascript:sch_area_si_chg('C')">인천</a></td>
				<td><a href="javascript:sch_area_si_chg('D')">강원</a></td>
				<td><a href="javascript:sch_area_si_chg('E')">대전</a></td>
				<td><a href="javascript:sch_area_si_chg('F')">세종</a></td>
				<td><a href="javascript:sch_area_si_chg('G')">충남</a></td>
				<td><a href="javascript:sch_area_si_chg('H')">충북</a></td>
				<td><a href="javascript:sch_area_si_chg('I')">부산</a></td>
				<tr />
				<tr>
				<td><a href="javascript:sch_area_si_chg('J')">울산</a></td>
				<td><a href="javascript:sch_area_si_chg('K')">경남</a></td>
				<td><a href="javascript:sch_area_si_chg('L')">경북</a></td>
				<td><a href="javascript:sch_area_si_chg('M')">대구</a></td>
				<td><a href="javascript:sch_area_si_chg('N')">광주</a></td>
				<td><a href="javascript:sch_area_si_chg('O')">전남</a></td>
				<td><a href="javascript:sch_area_si_chg('P')">전북</a></td>
				<td><a href="javascript:sch_area_si_chg('Q')">제주</a></td>
				<td><button type = "button" id = "closeBtn">상세검색닫기</button></td>
				<tr />
			<tr>
				<td colspan="17" >
					<div id="sangseaArea" class ="ls2"
						style=" visibility: hidden; border: double; overflow-x: hidden; width: 800px;">
					</div>
				</td>
				
			</tr>
			</form>
		</table>
	</div>

</body>
</html>