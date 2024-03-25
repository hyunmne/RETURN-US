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
	align-items: center;
	width: auto;
}

.left, .right {
	flex: 1; /* .left와 .right를 동일한 너비로 설정합니다 */
	align-items: flex-start; /* 내부 요소를 위쪽으로 정렬합니다 */
}

.left {
	width: 450px;
	margin-right: 50px; /* .left와 .right 사이의 간격을 조정합니다 */
	float: left;
}

.right {
	margin-left: 50px; /* .left와 .right 사이의 간격을 조정합니다 */
	float: right;
	align-items: flex-start; /* 내부 요소를 위쪽으로 정렬합니다 */
	/* 	margin-bottom: 88px;  */
}

/* select 요소 스타일 */


.all {
	padding-bottom: 15px;
	padding-top: 10px;
}

.input {
	width: 250px;
	height: 40px;
	border: 1px solid #D0D0D0;
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
	margin-left: 10px;
}

.email_tool {
	display: flex;
	vertical-align: center;
}

#email_id {
	width: 150px;
	height: 40px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}
.select {
	width: 180px;
	height: 40px;
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
										<h1 class="noto-sans"style="color: #59981A">환영합니다!</h1>
									</div>
									<div class="smtitle">
										<h4 class="noto-sans" style="color: #59981A">리터너스와 함께 지구를 지켜보아요!</h4>
									</div>
								</div>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
								<div class="join_tool">
										<div class="left">
											<div id="id" class="all">
												<div class="little-title">아이디<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="id_input" name="id_input"placeholder=" 6-12글자 이내로 작성해주세요" autofocus><button type="button" class="button" id="checkedId">중복검색</button></p>
												<div id="dobIDcheckMesg"></div>
											</div>
											<div id="password"class="all">
												<div class="little-title">비밀번호<div class="star" id="star">*</div></div>
												<p><input type="password" class="input" id="password_input"name="password" placeholder=" 6-12자 이내, 특수문자 포함하여"autofocus></p>
											</div>
											<div id="password2" class="all">
												<div class="little-title">비밀번호 확인<div class="star" id="star">*</div></div>
												<p><input type="password" class="input" id="password_input"name="password_input" placeholder=" 6-12자 이내, 특수문자 포함하여"autofocus></p>
												<div id="dobPWcheckMesg"></div>
											</div>
											<div id="postcode" class="all">
												<div class="little-title">우편번호<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="postcode_input"name="postcode_input" placeholder=" 우편번호" autofocus><button type="button" class="button" id="checkedPos">검색하기</button></p>
											</div>
											<div id="addr" class="all">
												<div class="little-title">주소<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="addr_input" name="addr_input"placeholder="주소" autofocus></p>
												<p><input type="text" class="input" id="detail_addr_input"name="detail_addr_input" placeholder=" 상세주소" autofocus></p>
											</div>
										</div>
										<div class="right">
											<div id="name" class="all">
												<div class="little-title">이름<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="name_input" name="name_input"placeholder=" 이름" autofocus></p>
											</div>
											<div id="birth" class="all">
												<div class="little-title"> 생년월일<div class="star" id="star">*</div></div>
												<input type="date" class="input" id="birth_input" max="${now_utc}"min="1901-01-01" value="${now_utc}" placeholder=" 연도-월-일"> </label>
											</div>
											<div id="tel" class="all">
												<div class="little-title">전화번호<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="tel_input" name="tel_input"placeholder=" -를 제외하고 입력해주세요." autofocus><button type="button" class="button" id="checkedtel">본인인증</button></p>
											</div>
											<div id="cernum" class="all">
												<div class="little-title">인증번호<div class="star" id="star">*</div></div>
												<p><input type="text" class="input" id="cernum_input" name="cernum_input"placeholder=" 인증번호" autofocus></p>
											</div>
											<div id="eamil" class="all">
												<div class="little-title">이메일 <div class="star" id="star">*</div></div>
												<p class="email_tool" style="display:flex; align-items:center;">
												<input type="text" id="email_id" value=""title="이메일 아이디" placeholder=" 이메일" maxlength="18" />&nbsp;&nbsp;@&nbsp;
												<select class ="select" id="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
														<option value=""> --------선택--------</option>
														<option value="naver.com">naver.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="korea.com">korea.com</option>
														<option value="nate.com">nate.com</option>
														<option value="yahoo.com">yahoo.com</option>
													</select>
												</p>
											</div>
											<div>
											<button type="submit" class="submit"><a class="joinBtn">회원가입</a></button>
											</div>
										</div>
								</div>
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