<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	background-color: white; 
/* 	height: 100%;  */
	min-height:auto;
	padding: 45px 50px 0px 50px;
}
.rounded-input {
        border-radius: 5px; /* 원하는 반지름 값을 설정합니다. */
        border: 1px solid #ccc; /* 테두리 스타일을 지정합니다. */
        padding: 10px 15px; /* 내부 여백을 지정합니다. */
        height: 40px;
/*         width: 200px;  */
        box-sizing: border-box; /* 테두리와 내부 여백을 포함한 요소의 전체 크기를 지정합니다. */
        margin:10px;
    }
</style>
   
</head>
    
<body class="noto-sans">

<!-- 헤더 파일 include -->
<%@include file="/views/common/header.jsp" %>




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
								<h3 class="noto-sans" style="color: #3E6D10;">방문 수거 신청</h3>
								<span style="color: #3E6D10;">리터너스가 집 앞까지 찾아가 손쉽게 분리수거 해드립니다!</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<div class="col-12">
									<h3 class="noto-sans" style="color:#3E6D10;">STEP 01 정보 작성</h3>
									<span style="color: #3E6D10;">신청 시 입력된 정보는 추후 수정이 불가하오니, 신중하게 작성 부탁드립니다.</span>
								</div>
								
								<form method="post" action="" enctype="multipart/form-data">
									<div class="col-12 d-flex justify-content-center" style="padding:35px 40px 50px">
										<div style="width:700px; padding:50px;">
										
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:10px; background-color:yellow;">
													<h5 class="noto-sans" style="margin:10px;">이름</h5>
												</div>
												<div class="col-7 d-flex justify-content-center" style="background-color:green;">
													<input type="text" class="rounded-input">
												</div>
											</div>
											
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:10px; background-color:yellow;">
													<h5 class="noto-sans" style="margin:10px;">전화번호</h5>
												</div>
												<div class="col-7 d-flex justify-content-center" style="background-color:green;">
													<input type="text" class="rounded-input">
												</div>
											</div>
											
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:10px; background-color:yellow;">
													<h5 class="noto-sans" style="margin:10px;">주소지 이름</h5>
												</div>
												<div class="col-7 d-flex justify-content-center" style="background-color:green;">
													<input type="text" class="rounded-input">
												</div>
											</div>
											
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:10px; background-color:yellow;">
													<h5 class="noto-sans" style="margin:10px;">우편번호</h5>
												</div>
												<div class="col-7 d-flex justify-content-center" style="background-color:green;">
													<input type="text" class="rounded-input">
												</div>
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






	<%@ include file="/views/common/footer.jsp" %>









</body>
</html>