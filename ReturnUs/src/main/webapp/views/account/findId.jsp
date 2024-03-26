<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Return:Us</title>
<style>
#big {
	background-color: #F5F9F1;
	height: 100%;
	padding: 0px 50px 0px 50px;
	
}

#sm {
	background-color: #F5F9F1;
	height: 100%;
	padding: 45px 50px 0px 50px;
	display: flex; /* 부모 요소를 플렉스 박스로 설정하여 내부 요소들을 정렬하기 쉽게 합니다 */
    flex-direction: column; /* 요소들을 세로로 정렬합니다 */
    align-items: center; /* 가로 방향 가운데 정렬합니다 */
}
.hr-custom{
	height: 20px;
	background-color: #59981A;
}
#container {
	display: flex; /* 부모 요소를 플렉스 박스로 설정하여 내부 요소들을 정렬하기 쉽게 합니다 */
	flex-direction: column; /* 요소들을 세로로 정렬합니다 */
	align-items: center; /* 가로 방향 가운데 정렬합니다 */
}

.star {
	color: red;
	display: inline;
}

.title {
	text-align: center; /* 가운데 정렬 설정 */
	margin-bottom: 20px; /* 제목과 폼 사이의 간격 조정 */
}

#bigtitle{
	text-align: center;
	margin-right: 20px;
}
.smtitle{
	text-align: center;
	margin : 5px
	
}

.smt{
	margin-top: -20px;
	color: black;
	font-weight: 500;
    font-family: sans-serif; /* 글꼴 설정 (Arial 또는 sans-serif) */
    font-size: 20px; /* 글꼴 크기 설정 (16px) */
}
.input-container {
	width: 400px;
	height:85px;
    display: inline-block; /* 인라인-블록 요소로 설정하여 가로로 나열 */
    background-color: #ffffff; /* 하얀색 배경 설정 */
    border: 1px solid #ccc; /* 테두리 추가 */
    border-radius: 12px; /* 둥근 테두리 설정 */
    padding: 10px; /* 내부 여백 추가 */
    margin-bottom: 10px;
}

.input-container label {
	color: black;
    display: block; /* 블록 요소로 설정하여 세로로 배치 */
    margin-bottom: 5px; /* 레이블 아래 여백 추가 */
    margin-left: 8px;
}

.input-container input {
    width: 100%; /* 입력 필드의 너비를 부모 요소에 맞춤 */
    box-sizing: border-box; /* 테두리와 여백을 포함하여 너비 설정 */
    padding: 8px; /* 내부 여백 추가 */
    border: 0;
}

#findId{
	height: 50px;
	width: 400px;
	border: solid 0px;
	padding: 13px 13px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 600;
	font-size: 16px;
	line-height: 18px;
	background: #146C43;
	flex: none;
	order: 0;
	flex-grow: 0;
	border-radius: 10px;
	margin-bottom: 100px;

}
.findIdfont{
	color: #FFFFFF;
}



</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	 $('#findIdForm').submit(function(e) {
		// 이름 체크
	        var name = $('#accName').val();
	        if (name === '' || !isNaN(name)) {
	            alert('이름을 확인해주시기 바랍니다.');
	            e.preventDefault(); 
	            return;
	        }
	        
	     // 전화번호 체크
	        var tel = $('#accTel').val();
	        if (tel.length < 10 || tel.length > 11 || isNaN(tel)) {
	            alert('전화번호를 확인해주시기 바랍니다.');
	            e.preventDefault(); 
	            return;
	        }
     });
}); 
</script>
</head>

<body class="noto-sans">

	<!-- 헤더 파일 include -->
	<%@include file="/views/common/header.jsp"%>




	<div class="container-fluid fruite py-5"
		style="margin: 38px 100px; width: 90%;">
		<div class="col-lg-12">
			<div class="row g-4">
				<div class="col-6"></div>
			</div>
			<div class="row g-4">

				<div class="col-lg-12">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<div class="title">
									<div class="bgtitle" >
										<h1 id="bigtitle" class="noto-sans"style="color: #59981A">아이디 찾기</h1>
									</div>
								</div>
							</div>
							<hr class="hr-custom">
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
								<div class="smtitle">
									<p class="smt">리터너스 회원정보에 등록되어 있는 <br>휴대전화 번호와 생년월일로 ID를 찾을 수 있습니다.</p>
								</div>
								<form id="findIdForm" action="findid" method="post">
									<div class="input-container">
										<label for="name">성명<div class="star">*</div></label>
										<input type="text" id="accName" name="accName" value="${accName }" placeholder="성명 입력">
									</div>
									<br>
									<div class="input-container">
										<label for="birth">생년월일<div class="star">*</div></label>
										<input type="date" id="accBirth" name="accBirth" value="${accBirth }" placeholder="생년월일 8자리 (ex. YYYYMMDD)"required>
									</div>
									<script>
    									// 현재 날짜를 가져오는 함수
    										function getCurrentDate() {
        										var today = new Date();
        										var year = today.getFullYear(); // 연도
        										var month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월 (0부터 시작하기 때문에 +1 필요)
        										var day = today.getDate().toString().padStart(2, '0'); // 일
        										return year + '-' + month + '-' + day;
    										}

    										// 최대 날짜 설정
    										document.getElementById('accBirth').setAttribute('max', getCurrentDate());
										</script>
									<br>
									<div class="input-container">
										<label for="tel">휴대전화번호<div class="star">*</div></label>
										<input type="text" id="accTel" name="accTel" value="${accTel }" placeholder="-를 제외하고 입력해주세요">
									</div>
									<div>
										<button type="submit" class="submit" id="findId"><div class="findIdfont">아이디 찾기</div></button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<%@ include file="/views/common/footer.jsp"%>









</body>
</html>