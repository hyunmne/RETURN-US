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
	padding: 45px 50px;
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
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/sideBar.jsp"%>
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
									<h4 class="noto-sans" style="color:#3E6D10;">신청 시 주의사항</h4>
									<span style="color: gray;">
										안내된 사항을 숙지하지 않고 발생하는 불이익에 대해서는 리터너스는 책임지지 않고 있습니다. <br>
										이용 약관을 꼭 확인하시고 서비스 신청을 진행해주세요. <br>
										자세한 분리수거 가이드는 <b>여기</b>를 확인하세요. <br>
									</span>
								</div>
 								<div class="col-12" style="padding:35px 40px 20px"> <!-- 약관 div -->
 									<div class="col-12 " style="display: flex; justify-content: right; margin-bottom:5px;" >
										<a href="collection-guide" style="color:#198754; ">
										    <i class="fas fa-info-circle"></i><span class="ms-2" style="text-decoration: underline;">분리수거 가이드 보기</span>
										</a>
									</div>
									<div class="card" style="padding: 10px 10px; max-height:300px; overflow-y: auto;"> 
										<%@include file="/views/collection/NewFile.jsp" %>
									</div>
									
<!-- 									2. 다음 버튼을 누르면 form action 타고 collect1의 doPost로 이동 (method가 post) -->
									<form id="myForm" action="collect1" method="post">
									<div style="display:flex; justify-content:right; margin:10px 0px; align-items:center;" >
									 <label>
								        <input type="radio" id="agreeRadio" style="accent-color: #198754;"> 상기 주의사항을 전부 숙지하였으며 동의합니다.
								     </label>
									</div>
								    <div id="validationMessage" style="display: none; color: red; text-align:right;">동의 여부를 선택해주세요.</div>
									<div style="display:flex; justify-content:right; margin:10px 0px; padding-right:10px;" >
										<button class="btn btn-success" type="submit">다음</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/footer.jsp" %>

</body>



<script>
    document.getElementById("myForm").onsubmit = function() {
        var agreeRadio = document.getElementById("agreeRadio");
        if (!agreeRadio.checked) {
//             alert("동의 여부를 선택해주세요.");
            document.getElementById("validationMessage").style.display = "block"; // 문구 표시
            return false; // 폼 제출 막기
        }
    };
</script>

</html>