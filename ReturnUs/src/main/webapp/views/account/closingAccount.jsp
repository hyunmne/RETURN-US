<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Return:Us</title>
<style>	
	h4 {
		float:left;
		color: #3D550C;
	}
	button {
		float:right;
		border-radius: 20px;
	}
	.main-color-1 {
		color: #3E6D10;
	}
	.main-color-2 {
		color: #3D550C;
	}
	.col-form-label {
		font-weight: bold;
		color: #3D550C;		
		text-align: center;
	}
		   
	#big {
		background-color: #F5F9F1; 
		height: 100%; 
		padding: 0px 50px 0px 50px;
	}   
	
	#sm {
		background-color: white; 
		height: 100%; 
		padding: 45px 50px 0px 50px;
	}
	#left-text {
		float:left;
	}
	#information-board {
		border-radius: 20px;
	}
	#removeBtn {
		border-radius: 20px;
	}
	#colFormLabel {
		color: black;
	}
</style>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/accountSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div class=main-color-1 style="padding: 50px 0px 30px;">
								<h3 class="noto-sans main-color-1">회원 탈퇴</h3>
								<span class="main-color-1"><!-- title --></span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<!-- drawal start -->	
								<div class="title">
									<h4 class="main-color-2"><!-- 소제목 --></h4>
								</div><br>
								<div class="container">
									<form class="row g-3 needs-validation" id="information-board" action="close-account" method="post" novalidate>
									  <div class="row mb-3 mt-4">
									  	  <div class="col-sm-3"></div>							  	  
										  <div class="col-sm-6">
										  	<img src='<c:url value="/resources/img/earth.png"/>' alt="earth"/>									  	
										  </div>
										  <div class="col-sm-3"></div>										  
									  </div>
									  <div class="row mb-3 mt-4 text-center">					  	  
										  <p>탈퇴하시면 리터너스의 서비스를 더 이상 이용할 수 없습니다.<br>정말 탈퇴하시겠습니까?</p>									  
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>							  	  
										  <label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
										  <div class="col-sm-6">
										    <input type="text" readonly class="form-control" name="accId" value="${sessionScope.acc.accId}">
										  </div>
										  <div class="col-sm-2"></div>										  
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>
									  	  <label for="colFormLabel" class="col-sm-2 col-form-label">비밀번호</label>
										  <div class="col-sm-6">
										  	<div class="input-group has-validation">
										    	<input type="password" class="form-control" id="colFormLabel" name="accPassword" placeholder="비밀번호를 입력하세요." required> 
										  		<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
										  	</div>
										  </div>
										  <div class="col-sm-2"></div>
									  </div>
									  <div class="row mb-5 mt-4">
									  	<div class="col-5"></div>
									  	<div class="col-2">
									  		<div>
									  			<button type="submit" class="btn btn-outline-info" id="removeBtn">탈퇴하기</button>
									  		</div>									    	
									    </div>
									    <div class="col-5"></div>
									  </div>											  
									</form>
								</div>
								<!-- drawal end -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<%@ include file="/views/common/footer.jsp" %>








	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		(() => {
		  'use strict'
	
		  const forms = document.querySelectorAll('.needs-validation')
	
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }
	
		      form.classList.add('was-validated')
		    }, false)
		  })
		})()		
	</script>
</body>
</html>