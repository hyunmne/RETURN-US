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
    text-align: center; /* 내용을 가운데 정렬합니다 */
}	

.hr-custom {
	height: 20px;
	background-color: #59981A;
}

.title {
	text-align: center;
	margin-bottom: 20px;
}

#bigtitle {
	text-align: center;
	margin-right: 20px;
	margin-bottom: 10px;
}

.smtitle {
	text-align: center;
	margin: 5px;
	margin-bottom: -40px;
}

.smt {
	color: #AFAFAF;
}

.account {
	display: inline-block;
	color: #FF0000;
	text-align: center;
}

.button {
	display: inline-block;
	width: 190px;
	height: 55px;
	margin: 0 30px;
	background-color: #3E6D10;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 100px;
}

.buttonfont {
	color: #FFFFFF;
	font-weight: 800;
    font-size: 24px; /* 폰트 크기 설정 */
    line-height: 40px; /* 버튼 높이와 맞추기 위해 줄 높이 설정 */
}
.hr-custom2{
	height: 20px;
    background-color: #59981A;
    margin-bottom: 100px; /* margin-bottom을 여기서 설정합니다 */
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
										<h1 id="bigtitle" class="noto-sans"style="color: #59981A">아이디 찾기</h1>
									</div>
									<div class="smtitle">
										<p class="smt"></p>
									</div>
								</div>
							</div>
							<hr class="hr-custom">
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
								<p style="font-size: 22px; color: black; font-weight: 500;">
									등록된 이메일로 새로운 비밀번호를 발송해 드렸습니다
									<br>이메일을 확인해주시기 바랍니다.
								
								</p>
								<div style="margin-top: 40px;">
								<a href="login"><button id="findid" class="button"><div class="buttonfont">로그인</div></button></a>
								<a href="changepassword"><button id="join" class="button"><div class="buttonfont">비밀번호변경</div></button></a>
							</div>
							</div>
							<hr class="hr-custom2" style="margin-bottom:100px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<%@ include file="/views/common/footer.jsp"%>









</body>
</html>