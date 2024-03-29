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
	#profile-board {
		height: 150px;
		border-radius: 20px;
	}
	#information-board {
		border-radius: 20px;
	}
	#reviseBtn {
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
								<h3 class="noto-sans main-color-1">정보 수정</h3>
								<span class="main-color-1"><!-- title --></span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<!-- profile start -->
								<div class="title">
									<h4 class="main-color-2">프로필</h4>
									<button type="button" class="btn btn-outline-success" id="removeBtn" onclick="location.href='close-account'">회원 탈퇴</button>
								</div><br>
								<div class="container">
									<div class="row g-3 border align-items-center" id="profile-board">
										<div class="col-1"></div>
										<div class="col-2 mt-0">										
											<img src='<c:url value="/resources/img/avatar.jpg"/>' />							
										</div>
										<div class="col-2">
											<h5>${sessionScope.acc.accName}&nbsp;님</h5>
											<p>>&nbsp;&nbsp;&nbsp;${sessionScope.acc.accId}</p>																			
										</div>
										<div class="col-1"></div>
										<div class="col-6 text-center" style="border-left: solid 1px #dadada">
											<p>가입일 >&nbsp;&nbsp;&nbsp;${sessionScope.acc.accJoinDt}</p>
											<p>${sessionScope.acc.accJoinDays} days with Return Us</p>					
										</div>
									</div>
								</div><br><br>
								<!-- profile end -->
								<!-- information start -->	
								<div class="title">
									<h4 class="main-color-2">개인정보</h4>
								</div><br>
								<div class="container">
									<form class="row g-3 border needs-validation" id="information-board" action="modify-profile" method="post" novalidate>
									  <div class="row mb-3 mt-4">								  	  
										  <label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
										  <div class="col-sm-4">
										    <input type="text" class="form-control" name="accId" value="${sessionScope.acc.accId}">
										  </div>
										  <label for="colFormLabel" class="col-sm-2 col-form-label">비밀번호</label>
										  <div class="col-sm-4">
										  	<div class="input-group has-validation">
										    	<input type="password" class="form-control" id="colFormLabel" name="accPassword" placeholder="비밀번호를 입력하세요." required> 
										  		<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
										  	</div>
										  </div>
									  </div>
									  <div class="row mb-3">
									  	  <label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
										  <div class="col-sm-4">
										  	<div class="input-group has-validation">
										    	<input type="text" class="form-control" id="colFormLabel" name="accName" value="${sessionScope.acc.accName}" required>
										  		<div class="invalid-feedback">이름을 입력하세요.</div>
										  	</div>
										  </div>										  
										  <label for="colFormLabel" class="col-sm-2 col-form-label">생년월일</label>
										  <div class="col-sm-4">
										  	<div class="input-group has-validation">
										    	<input type="date" class="form-control" id="colFormLabel" name="accBirth" value="${sessionScope.acc.accBirth}" required>
										  		<div class="invalid-feedback">생년월일을 입력해주세요.</div>
										  	</div>
										  </div>
									  </div>
									  <div class="row mb-3">
									  	  <label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
										  <div class="col-sm-4">
										    <div class="input-group has-validation">
										    	<input type="text" class="form-control" id="colFormLabel" name="accTel" value="${sessionScope.acc.accTel}" required>
										  		<div class="invalid-feedback">전화번호를 입력해주세요.</div>
										  	</div>
										  </div>
										  <label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
										  <div class="col-sm-4">
										  	<div class="input-group has-validation">
										    	<input type="email" class="form-control" id="colFormLabel" name="accEmail" value="${sessionScope.acc.accEmail}" required>
										  		<div class="invalid-feedback">이메일을 입력해주세요.</div>
										  	</div>
										  </div>										  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">우편번호</label>
										  <div class="col-sm-2">
										  	<input type="text" class="form-control" name="accPostCode" value="${sessionScope.acc.accPostCode}">								  	
										  </div>
										  <div class="col-sm-2">
										  	<button type="button" onclick="daumPostcode()" class="btn btn-success">우편번호 찾기</button>
										  </div>						  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">주소</label>
										  <div class="col-sm-10">
										  	<input type="text" class="form-control" name="accAddr" value="${sessionScope.acc.accAddr}">
										  </div>										  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">상세 주소</label>
										  <div class="col-sm-10">
										  	<div class="input-group has-validation">
										    	<input type="text" class="form-control" style="color:black" name="accDetailAddr" value="${sessionScope.acc.accDetailAddr}" required>
										  		<div class="invalid-feedback">상세 주소를 입력해주세요.</div>
										  	</div>
										  </div>										  
									  </div>
									  <div class="row mb-4">
									  	<div class="col-12">
									    	<button type="submit" class="btn btn-outline-info" id="reviseBtn">저장하기</button>
									    </div>
									  </div>											  
									</form>
								</div>
								<!-- information end -->
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
		
	function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
                
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                document.getElementById("accPostCode").value = data.zonecode;
                document.getElementById("accAddr").value = addr;
                
                document.getElementById("accDetailAddr").value = null;
                document.getElementById("accDetailAddr").focus();                
            }
        }).open();
    }
	</script>
</body>
</html>