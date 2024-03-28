<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

.join_tool {
	display: flex; /* 플렉스 박스로 설정하여 내부 요소들을 정렬하기 쉽게 합니다 */

}

.left, .right {
    flex: 1; /* .left와 .right를 동일한 너비로 설정합니다 */
    align-items: flex-start; /* 내부 요소를 위쪽으로 정렬합니다 */
    margin-bottom: 100px;
    width: 50%; /* 부모 요소의 너비에 대한 백분율로 설정합니다 */
    
}
.left{
	margin-right: 5%; /* 오른쪽 여백을 10%로 설정합니다 */
	margin-left: 5%;
}
.right{
	margin-left: 5%; /* 왼쪽 여백을 10%로 설정합니다 */
	margin-right: 5%;
}
/* 
 요소 스타일 */


.all {
	width:100%;
	padding-bottom: 15px;
	padding-top: 10px;
	margin-top: 1%;
}
.allnbt{
	width:100%;
	padding-bottom: 15px;
	padding-top: 10px;
	margin-top: 1%;
}


.input {
	width: 69%;
	height: 50px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}
.inputnbt{
	width: 98%;
	height: 50px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}


.button {
	width: 25%;
	border: solid 0px;
	padding: 13px 13px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 600;
	font-size: 16px;
	line-height: 18px;
	background: #D1E7DD;
	flex: none;
	border-radius: 6px;
	color: #146C43;
	margin-left: 3%;
}

.email_tool {
	display: flex;
	vertical-align: center;
}

#email_id {
	width: 30%;
	height: 50px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}
.select {
	width: 34%;
	height: 50px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}

.form_w200 {
	width: 200px; /* input 요소의 너비를 지정합니다 */
}

.submit {
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
	border-radius: 6px;
	float: right;
	height: -150px;
	margin-top: 50px;
	margin-right: 2%;
}
.little-title{
	color: #000000;
    font-family: DM Sans; /* 글꼴 설정 (Arial 또는 sans-serif) */
    font-size: 18px; /* 글꼴 크기 설정 (16px) */
    margin-left: 4px;
    margin-bottom: 5px;
}

.joinBtn {
	color: #FFFFFF;
}

</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    // 아이디 입력란
    var inputIdElement = $('#accId');
    // 아이디 생성자 조건에 대한 정규식
    var idRegex = /^[a-zA-Z0-9]{6,12}$/;
    // 아이디 중복체크 버튼
    var doubleIdCheckButton = $('#AccountDoubleId');
    // 아이디 생성자 조건 메시지를 표시할 요소
    var idConditionMessage = $('#checkId');
    // 비밀번호 입력란
    var passwordElement = $('#accPassword');
    // 비밀번호 확인 입력란
    var passwordCheckElement = $('#accPasswordcheck');
    // 비밀번호 유효성 조건에 대한 정규식
    var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{6,12})/;
    // 비밀번호 유효성 메시지를 표시할 요소
    var pwConditionMessage = $('#checkPw');
    // 비밀번호 일치성 메시지를 표시할 요소
    var pwCheckSameMessgae = $('#checkDoublePw');
    
    // 아이디 생성자 조건을 체크하여 중복체크 버튼 활성/비활성화 및 메시지 표시
    function checkIdCondition() {
        var id = inputIdElement.val();
        if (idRegex.test(id)) {
            // 아이디 생성자 조건을 만족하는 경우
            doubleIdCheckButton.prop('disabled', false);
            idConditionMessage.text('');
        } else if(id === ''){
        	doubleIdCheckButton.prop('disabled', false);
            idConditionMessage.text('');	        	
        }else {
            // 아이디 생성자 조건을 만족하지 않는 경우
            doubleIdCheckButton.prop('disabled', true);
            idConditionMessage.text('영문자와 숫자로 이루어진 6~12자여야합니다.');
            idConditionMessage.css('color', 'red');
        }
    }

    // 비밀번호 확인 일치 여부 검사 및 메시지 표시
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
        if(password === ''){
        	pwConditionMessage.text('');
        }else if (!pwRegex.test(password)) {
            // 비밀번호 유효성 조건을 만족하지 않는 경우
            pwConditionMessage.text('특수문자를 포함한 영문 숫자로 이루어진 6~12자여야 합니다.');
            pwConditionMessage.css('color', 'red');
        }else {
            // 비밀번호 유효성 조건을 만족하는 경우
            pwConditionMessage.text('사용할 수 있는 비밀번호입니다.');
            pwConditionMessage.css('color', 'green');
        }
    }
    
    // 아이디 입력란에 입력할 때마다 아이디 생성자 조건 체크
    inputIdElement.on('input', function() {
        checkIdCondition();
    });
    
    // 비밀번호 입력란에 입력할 때마다 비밀번호 유효성 검사 및 메시지 표시
    passwordElement.on('input', function() {
        checkPasswordValidity();
    });
    
    // 비밀번호 확인 입력란에 입력할 때마다 비밀번호 확인 일치 여부 검사 및 메시지 표시
    passwordCheckElement.on('input', function() {
        checkPasswordMatch();
    });
    
    // 중복체크 버튼 클릭 시
    doubleIdCheckButton.click(function(e) {
    	e.preventDefault();
        // 중복체크 로직 수행
        $.ajax({
            url: 'accountdoubleid',
            type: 'post',
            async: true,
            dataType: 'text',
            data: { accId: inputIdElement.val() },
            success: function(result) {
                // 중복체크 결과에 따라 메시지 업데이트
                if (result == 'true') {
                    idConditionMessage.text('중복된 아이디입니다.');
                    idConditionMessage.css('color', 'red');
                } else {
                    idConditionMessage.text('사용할 수 있는 아이디입니다.');
                    idConditionMessage.css('color', 'green');
                }
            },
            error: function(result) {
                // 중복체크 오류 발생 시
                idConditionMessage.text('아이디 중복 체크 오류');
                idConditionMessage.css('color', 'red');
            }
        });
    });
    
    // 초기에 아이디 생성자 조건 체크 및 비밀번호 유효성 검사 및 메시지 표시
    checkIdCondition();
    checkPasswordValidity();
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('accPostCode').value = data.zonecode;
                document.getElementById("accAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("accDetailAddr").focus();
            }
        }).open();
    }
</script>
<script>

$(document).ready(function() {
    // 회원가입 양식 submit 이벤트
    $('#signUpForm').submit(function(e) {
        // 아이디 체크
        var idMessage = $('#checkId').text();
        if (idMessage !== '사용할 수 있는 아이디입니다.') {
            alert('아이디를 확인해주시기 바랍니다.');
            e.preventDefault(); 
            return;
        }
        
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
        
        // 주소 체크
        var address = $('#accAddr').val();
        var detailAddress = $('#accDetailAddr').val();
        if (address === '' || detailAddress === '') {
            alert('주소를 입력해주시기 바랍니다.');
            e.preventDefault(); 
            return;
        }
        
        // 우편번호 체크
        var postCode = $('#accPostCode').val();
        if (postCode.length !== 5 || isNaN(postCode)) {
            alert('우편번호를 확인해주시기 바랍니다.');
            e.preventDefault(); 
            return;
        }
        
        // 이름 체크
        var name = $('#accName').val();
        if (name === '' || !isNaN(name)) {
            alert('이름을 확인해주시기 바랍니다.');
            e.preventDefault(); 
            return;
        }
        
        // 생년월일 체크
        var birth = $('#accBirth').val();
        if (birth === '') {
            alert('생년월일을 입력해주시기 바랍니다.');
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
        
        // 이메일 체크
        var emailId = $('#email_id').val();
        var emailDomain = $('#select').val();
        if (emailId === '' || emailDomain === '') {
            alert('이메일을 확인해주시기 바랍니다.');
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
				<div class="col-lg-2">
					<div class="row g-4 shadow-sm">
						<div class="col-lg-12">
							<%@include file="/views/common/sideBar.jsp"%>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<div class="title">
									<div class="bgtitle" >
										<h1 class="noto-sans"style="color: #59981A">환영합니다!</h1>
									</div>
									<div class="smtitle">
										<h4 class="noto-sans" style="color: #59981A">리터너스와 함께 지구를 지켜보아요!</h4>
									</div>
								</div>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
							<form id="signUpForm" action="join" method="post">
								<div class="join_tool">
										<div class="left">
											<div id="id" class="all">
												<div class="little-title">아이디<div class="star" id="star">*</div></div>
												<input type="text" class="input" id="accId" name="accId" placeholder=" 6-12글자 이내로 작성해주세요" autofocus>
												<button class="button" id="AccountDoubleId">중복체크</button><br>
												<font id="checkId" class="checkId" name="checkId"></font>
											</div>
											<div id="password"class="allnbt">
												<div class="little-title">비밀번호<div class="star" id="star">*</div></div>
												<p><input type="password" class="inputnbt" id="accPassword" name="accPassword" placeholder=" 6-12자 이내, 특수문자 포함"autofocus></p>
												<font id="checkPw"></font>
											</div>
											<div id="password2" class="allnbt">
												<div class="little-title">비밀번호 확인<div class="star" id="star">*</div></div>
												<p><input type="password" class="inputnbt" id="accPasswordcheck" name="accPasswordcheck" placeholder=" 6-12자 이내, 특수문자 포함"autofocus></p>
												<font id="checkDoublePw"></font>
											</div>
											<div id="postcode_bar" class="all">
												<div class="little-title">우편번호<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="accPostCode" name="accPostCode" placeholder=" 우편번호" >
												<input type="button" class="button" onclick="daumPostcode()" value="주소 찾기"></p>
											</div>
											<div id="addr" class="allnbt">
												<div class="little-title">주소<div class="star" id="star">*</div></div>
												<p><input type="text" class="inputnbt" id="accAddr" name="accAddr" placeholder="주소" autofocus></p>
												<p><input type="text" class="inputnbt" id="accDetailAddr" name="accDetailAddr" placeholder=" 상세주소" autofocus></p>
											</div>
										</div>
										<div class="right">
											<div id="name" class="allnbt">
												<div class="little-title">이름<div class="star" id="star">*</div></div>
												<p><input type="text" class="inputnbt" id="accName" name="accName"placeholder=" 이름" autofocus></p>
											</div>
											<div id="birth" class="allnbt">
   												 <div class="little-title">생년월일<div class="star" id="star">*</div></div>
   												 <input type="date" class="inputnbt" id="accBirth" name="accBirth" min="1901-01-01" placeholder="연도-월-일" required>
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
											<div id="tel" class="allnbt">
												<div class="little-title">전화번호<div class="star" id="star">*</div></div>
												<p><input type="text" class="inputnbt" id="accTel" name="accTel" placeholder=" -를 제외하고 입력해주세요." autofocus></p>
											</div>
											<div id="eamil" class="all">
												<div class="little-title">이메일 <div class="star" id="star">*</div></div>
												<p class="email_tool" style="display:flex; align-items:center;">
												<input type="text" id="email_id" name="accEmail" value=""title="이메일 아이디" placeholder=" 이메일" maxlength="18" />&nbsp;&nbsp;@&nbsp;
												<select class ="select" id="select" name="accEmailDo" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
														<option value=""> --------선택--------</option>
														<option value="naver.com">naver.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="korea.com">korea.com</option>
														<option value="nate.com">nate.com</option>
														<option value="yahoo.com">yahoo.com</option>
													</select>
													<button type="button" class="button" id="checkedemail">메일발송</button>
												</p>
											
											</div>
											<div id="cernum" class="all">
												<div class="little-title">인증번호<div class="star" id="star">*</div></div>
												<input type="text" class="input" id="cernum_input" placeholder=" 인증번호" >
												<button type="button" class="button" id="checkemail">본인인증</button>
											</div>										
											<div>
											<button type="submit" class="submit"><div class="joinBtn">회원가입</div></button>
											</div>											
										</div>
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