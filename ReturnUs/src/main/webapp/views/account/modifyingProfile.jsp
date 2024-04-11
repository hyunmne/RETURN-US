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
									<form class="row g-3 border" id="information-board" action="modify-profile" method="post">
									  <div class="row mb-3 mt-4">								  	  
										  <label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
										  <div class="col-sm-4">
										    <input type="text" readonly class="form-control" name="accId" value="${sessionScope.acc.accId}">
										    <input type="hidden" class="form-control" id="accPasswordCheck" name="accPasswordCheck" value="${sessionScope.acc.accPassword}">
										  </div>
										  <label for="colFormLabel" class="col-sm-2 col-form-label">비밀번호</label>
										  <div class="col-sm-4">
										  	<input type="password" class="form-control" id="accPassword" name="accPassword" placeholder="비밀번호를 입력하세요."> 
										  </div>
									  </div>
									  <div class="row mb-3">
									  	  <label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
										  <div class="col-sm-4">
										  	<input type="text" class="form-control" id="accName" name="accName" value="${sessionScope.acc.accName}">
										  </div>										  
										  <label for="colFormLabel" class="col-sm-2 col-form-label">생년월일</label>
										  <div class="col-sm-4">
										  	<input type="date" class="form-control" id="accBirth" name="accBirth" value="${sessionScope.acc.accBirth}">
										  </div>
									  </div>
									  <div class="row mb-3">
									  	  <label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
										  <div class="col-sm-4">
										    <input type="text" class="form-control" id="accTel" name="accTel" value="${sessionScope.acc.accTel}">
										  </div>
										  <label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
										  <div class="col-sm-4">
										  	<input type="email" class="form-control" id="accEmail" name="accEmail" value="${sessionScope.acc.accEmail}">
										  </div>										  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">우편번호</label>
										  <div class="col-sm-2">
										  	<input type="text" readonly class="form-control" id="accPostCode" name="accPostCode" value="${sessionScope.acc.accPostCode}">								  	
										  </div>
										  <div class="col-sm-2">
										  	<button type="button" onclick="daumPostcode()" class="btn btn-success">주소 찾기</button>
										  </div>						  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">주소</label>
										  <div class="col-sm-10">
										  	<input type="text" readonly class="form-control" id="accAddr" name="accAddr" value="${sessionScope.acc.accAddr}">
										  </div>										  
									  </div>
									  <div class="row mb-3">
										  <label for="colFormLabel" class="col-sm-2 col-form-label">상세 주소</label>
										  <div class="col-sm-10">
										  	<input type="text" class="form-control" id="accDetailAddr" style="color:black" name="accDetailAddr" value="${sessionScope.acc.accDetailAddr}">
										  </div>										  
									  </div>
									  <div class="row mb-4">
									  	<div class="col-12">
									    	<button type="button" class="btn btn-outline-info" id="reviseBtn" onclick="checkForm()">저장하기</button>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		function checkForm() {
			var passwordCheck = document.getElementById("accPasswordCheck").value;
	    	var password = document.getElementById("accPassword").value;
	    	var name = document.getElementById("accName").value;
	    	var brith = document.getElementById("accBirth").value;
	    	var tel = document.getElementById("accTel").value;
	    	var email = document.getElementById("accEmail").value;
	    	var detailAddr = document.getElementById("accDetailAddr").value;
			
			Swal.fire({
		        title: "정보를 저장하시겠습니까?",
		        icon: "question",
		        showCancelButton: true,
		        confirmButtonColor: "#3085d6",
		        cancelButtonColor: "#d33",
		        confirmButtonText: '저장',
	            cancelButtonText: '취소'
		    }).then((result) => {		    	
		    	if (result.isConfirmed) {	
		    		if (!name || !brith || !tel || !email || !detailAddr) {
			        	Swal.fire({
			                title: "정보가 입력되지 않았습니다",
			                icon: "warning",
			                confirmButtonText: '확인',
			        	})
			        	return;
			        }
		    		
		    		if (!password) {
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
			        
		            Swal.fire({
		                title: "저장되었습니다!",
		                icon: "success",
		                confirmButtonText: '확인',
		            }).then(() => {
		            	document.getElementById("information-board").submit();
		            });
		        }
		    });
		}
		
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