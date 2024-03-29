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

#findPwForm{
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
	width: 550px;
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

#findPw{
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
.findPwfont{
	color: #FFFFFF;
}
.select {
	width: 120px;
	height: 40px;
	border: 0px solid #D0D0D0;
	border-radius: 6px;
}

.button {
	border: solid 0px;
	height: 40px;
	display: inline-block; /* 인라인-블록 요소로 설정 */
	vertical-align: top; /* 위쪽 정렬 */
	font-family: 'Inter';
	font-style: normal;
	font-weight: 600;
	font-size: 16px;
	line-height: 18px;
	flex-direction: row;
	align-items: flex-start;
	padding: 10px 10px;
	gap: 8px;
	background: #D1E7DD;
	border-radius: 6px;
	color: #146C43;
	margin-left: 15px;
}

#email_id{
	width: 130px;
}

#CerNum{
	width: 271px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	//비밀번호 입력란
	var passwordElement = $('#accPassword');
	// 비밀번호 확인 입력란
	var passwordCheckElement = $('#accPasswordcheck');
	// 비밀번호 유효성 조건에 대한 정규식
	var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{6,12})/;
	// 비밀번호 유효성 메시지를 표시할 요소
	var pwConditionMessage = $('#checkPw');
	// 비밀번호 일치성 메시지를 표시할 요소
	var pwCheckSameMessgae = $('#checkDoublePw');
	
	//비밀번호 확인 일치 여부 검사 및 메시지 표시
	function checkPasswordMatch() {
	    var password = passwordElement.val();
    	var passwordCheck = passwordCheckElement.val();
    	if (password !== passwordCheck) {
        	// 비밀번호 확인이 일치하지 않는 경우
       		pwCheckSameMessgae.text('비밀번호가 일치하지 않습니다.');
        	pwCheckSameMessgae.css('color', 'red');
    	} else {
       		// 비밀번호 확인이 일치하는 경우
        	pwCheckSameMessgae.text('비밀번호가 일치합니다.');
        	pwCheckSameMessgae.css('color', 'green');
    	}
	}


	// 비밀번호 유효성 검사 및 메시지 표시
	function checkPasswordValidity() {
    	var password = passwordElement.val();
    	if (!pwRegex.test(password)) {
        	// 비밀번호 유효성 조건을 만족하지 않는 경우
        	pwConditionMessage.text('특수문자를 포함한 영문 숫자로 이루어진 6~12자여야 합니다.');
        	pwConditionMessage.css('color', 'red');
    	} else {
        	// 비밀번호 유효성 조건을 만족하는 경우
        	pwConditionMessage.text('사용할 수 있는 비밀번호입니다.');
        	pwConditionMessage.css('color', 'green');
    	}
	}
	// 비밀번호 입력란에 입력할 때마다 비밀번호 유효성 검사 및 메시지 표시
	passwordElement.on('input', function() {
    	checkPasswordValidity();
	});

	// 비밀번호 확인 입력란에 입력할 때마다 비밀번호 확인 일치 여부 검사 및 메시지 표시
	passwordCheckElement.on('input', function() {
    	checkPasswordMatch();
	});
});

$(document).ready(function() {
    // 회원가입 양식 submit 이벤트
    $('#findPwForm').submit(function(e) {
    	 // 비밀번호 체크
        var pwMessage = $('#checkPw').text();
        if (pwMessage !== '사용할 수 있는 비밀번호입니다.') {
            alert('비밀번호를 확인해 주시기 바랍니다.');
            e.preventDefault(); 
            return;
        }
        
        // 비밀번호 확인 체크
        var pwCheckMessage = $('#checkDoublePw').text();
        if (pwCheckMessage !== '비밀번호가 일치합니다.') {
            alert('비밀번호를 확인해 주시기 바랍니다.');
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
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/sideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<div class="title">
									<div class="bgtitle" >
										<h1 id="bigtitle" class="noto-sans"style="color: #59981A">비밀번호 재설정</h1>
									</div>
								</div>
							</div>
							<hr class="hr-custom">
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
							
								<form id="findPwForm" action="findpw" method="post">
									<div class="input-container">
										<label for="name">현재 비밀번호<div class="star">*</div></label>
										<input type="password" id="accPassword"  value="${accPassword}" placeholder="6-12자 이내의 영문자, 숫자, 특수기호 (!,#,~@,^%,&*)...">
									</div>
									<br>
									<div class="input-container">
										<label for="name">새 비밀번호<div class="star">*</div></label>
										<input type="password" id="accPassword" name="accPassword" placeholder="6-12자 이내의 영문자, 숫자, 특수기호 (!,#,~@,^%,&*)...">
									</div>
									<font id="checkPw"></font>
									<br>
									<div class="input-container">
										<label for="name">새 비밀번호 확인<div class="star">*</div></label>
										<input type="password" id="accPasswordcheck" name="accPasswordcheck" placeholder="6-12자 이내의 영문자, 숫자, 특수기호 (!,#,~@,^%,&*)...">
									</div>
									<font id="checkDoublePw"></font>
									<br>
									<p>입력하신 새로운 비밀번호로 재설정하시겠습니까?</p>								
									
									<div>
										<button type="submit" class="submit" id="findPw"><div class="findPwfont">비밀번호 재설정하기</div></button>
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