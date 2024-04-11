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
	.form-control {
		color: black;
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
	#changeBtn {
		border-radius: 20px;
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
								<h3 class="noto-sans main-color-1">비밀번호 변경</h3>
								<span class="main-color-1"><!-- title --></span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<!-- drawal start -->	
								<div class="title">
									<h4 class="main-color-2"><!-- 소제목 --></h4>
								</div><br>
								<div class="container">
									<form class="row g-3" id="password-board" action="change-password" method="post">
									  <div class="row mb-5 mt-4 text-center">					  	  
										  <h4 class="noto-sans" style="color:black">비밀번호 변경 후에는 다시 로그인 하시기 바랍니다.</h4>									  
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>							  	  
										  <label for="colFormLabel" class="col-sm-3 col-form-label">아이디</label>
										  <div class="col-sm-5">
										    <input type="text" readonly class="form-control" name="accId" value="${sessionScope.acc.accId}">
										    <input type="hidden" class="form-control" id="accPasswordCheck" name="accPasswordCheck" value="${sessionScope.acc.accPassword}">
										  </div>										    
										  <div class="col-sm-2"></div>										  
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>
									  	  <label for="colFormLabel" class="col-sm-3 col-form-label">기존 비밀번호</label>
										  <div class="col-sm-5">
										  	<input type="password" class="form-control" id="accPassword" name="accPassword" placeholder="비밀번호를 입력하세요."> 							  	
										  </div>
										  <div class="col-sm-2"></div>
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>
									  	  <label for="colFormLabel" class="col-sm-3 col-form-label">새 비밀번호</label>
										  <div class="col-sm-5">
										  	<input type="password" class="form-control" id="accNewPassword" name="accNewPassword" placeholder="비밀번호를 입력하세요."> 
										  </div>
										  <div class="col-sm-2"></div>
									  </div>
									  <div class="row mb-3">
									  	  <div class="col-sm-2"></div>
									  	  <label for="colFormLabel" class="col-sm-3 col-form-label">새 비밀번호 확인</label>
										  <div class="col-sm-5">
										  	<input type="password" class="form-control" id="accNewPasswordConfirmation" name="accNewPasswordConfirmation" placeholder="비밀번호를 입력하세요.">
										  </div>
										  <div class="col-sm-2"></div>
									  </div>
									  <div class="row mb-5 mt-4">
									  	<div class="col-5"></div>
									  	<div class="col-2">
									  		<div>
									  			<button type="button" class="btn btn-outline-info" id="changeBtn" onclick="checkForm()">변경</button>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		function checkForm() {
			var passwordCheck = document.getElementById("accPasswordCheck").value;
	    	var password = document.getElementById("accPassword").value;
	    	var newPassword = document.getElementById("accNewPassword").value;
	    	var newPasswordConfirmation = document.getElementById("accNewPasswordConfirmation").value;
			
			Swal.fire({
		        title: "정보를 수정하시겠습니까?",
		        icon: "question",
		        showCancelButton: true,
		        confirmButtonColor: "#3085d6",
		        cancelButtonColor: "#d33",
		        confirmButtonText: '수정',
	            cancelButtonText: '취소'
		    }).then((result) => {		    	
		    	if (result.isConfirmed) {	
		    		if (!passwordCheck || !password || !newPassword || !newPasswordConfirmation) {
			        	Swal.fire({
			                title: "비밀번호가 입력되지 않았습니다",
			                icon: "warning",
			                confirmButtonText: '확인',
			        	})
			        	return;
			        }
		    		
			        if (passwordCheck != password) {
			        	Swal.fire({
			                title: "비밀번호가 틀립니다",
			                icon: "error",
			                confirmButtonText: '확인',
			        	})
			        	return;
			        }
			        
			        if (newPassword != newPasswordConfirmation) {
			        	Swal.fire({
			                title: "새 비밀번호가 서로 다릅니다",
			                icon: "error",
			                confirmButtonText: '확인',
			        	})
			        	return;
			        }      
			        
		            Swal.fire({
		                title: "수정되었습니다. 다시 로그인 해주십시오",
		                icon: "success",
		                confirmButtonText: '확인',
		            }).then(() => {
		            	document.getElementById("password-board").submit();
		            });
		        }
		    });
		}
	</script>
</body>
</html>