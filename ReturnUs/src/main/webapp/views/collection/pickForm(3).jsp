<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
	padding: 45px 50px 0px 50px;
	min-height:auto;
}
</style>
   
</head>
    
<body class="noto-sans">

<!-- 헤더 파일 include -->
<%@include file="/views/common/header.jsp" %>
<input id="accName" type="hidden" name="accName" value="<%= request.getParameter("accName") %>" />
<input id="accTel" type="hidden" name="accTel" value="<%= request.getParameter("accTel") %>" />
<input id="accPostCode" type="hidden" name="accPostCode" value="<%= request.getParameter("accPostCode") %>" />
<input id="accAddr" type="hidden" name="accAddr" value="<%= request.getParameter("accAddr") %>" />
<input id="accDetailAddr" type="hidden" name="accDetailAddr" value="<%= request.getParameter("accDetailAddr") %>" />
<input id="boxSize" type="hidden" name="boxSize" value="<%= request.getParameter("boxSize") %>" />

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
									<h3 class="noto-sans" style="color:#3E6D10;">STEP 02 수거 물품 확인하기</h3>
									<span style="color: #3E6D10;">
										수거할 품목의 상태를 확인할 수 있도록 사진을 찍어 업로드 해주세요! <br>
										포인트로 환급 받을 수 있는 항목의 수량도 기입해주세요.
									</span>
									<br><br>
									<span style="color:black;">2-1. 배출 상자 고르고 서비스 금액 선택하기</span>
								</div>
								
								<div class="col-12 d-flex" style="padding:35px 40px 50px;">
								    <div id="mdBox" class="col-6 d-flex justify-content-center align-items-center flex-column" style="border-right: 3px solid #81A062;">
									    <div style="padding-bottom:30px;">
									        <h3 class="noto-sans">중</h3>
									    </div>
									    <div style="padding-bottom:30px;">
									        <i class="fas fa-box fa-10x" style="color:#CDE0BA;"></i>
									    </div>
									    <div style="padding-bottom:10px; display:flex; align-items:center;">
									        <h4 class="noto-sans">5000원</h4>
									    </div>
									    <div class="align-items-center" style="display:flex; flex-direction: column; align-items: center;">
									        <span>~ 120cm 이하</span>
									        <span>~ 10kg 이하</span>
									    </div>
									</div>
								
								    <div id="lgBox" class="col-6 d-flex justify-content-center align-items-center flex-column">
									    <div style="padding-bottom:30px;">
									        <h3 class="noto-sans">대</h3>
									    </div>
									    <div style="padding-bottom:30px;">
									        <i class="fas fa-box fa-10x" style="color:#CDE0BA;"></i>
									    </div>
									    <div style="padding-bottom:10px; display:flex; align-items:center;">
									        <h4 class="noto-sans">6000원</h4>
									    </div>
									    <div class="align-items-center" style="display:flex; flex-direction: column; align-items: center;">
									        <span>~ 160cm 이하</span>
									        <span>~ 20kg 이하</span>
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



	<%@ include file="/views/common/footer.jsp" %>

</body>

<script>
// 값 전달 폼 생성 및 전송하는 함수
function submitFormWithValues(boxSize) {
    var accName = document.getElementById('accName').value;
    var accTel = document.getElementById('accTel').value;
    var accPostCode = document.getElementById('accPostCode').value;
    var accAddr = document.getElementById('accAddr').value;
    var accDetailAddr = document.getElementById('accDetailAddr').value;

    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'collect3';

    function addHiddenInput(name, value) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = value;
        form.appendChild(input);
    }

    addHiddenInput('accName', accName);
    addHiddenInput('accTel', accTel);
    addHiddenInput('accPostCode', accPostCode);
    addHiddenInput('accAddr', accAddr);
    addHiddenInput('accDetailAddr', accDetailAddr);
    addHiddenInput('boxSize', boxSize);

    document.body.appendChild(form);
    form.submit();
}

// 상자 클릭 이벤트 처리
function handleBoxClick(boxSize) {
    submitFormWithValues(boxSize);
}

// mdBox와 lgBox에 클릭 이벤트 처리 추가
document.getElementById('mdBox').addEventListener('click', function() {
    handleBoxClick('5000');
});

document.getElementById('lgBox').addEventListener('click', function() {
    handleBoxClick('6000');
});
</script>



<!-- 마우스 토글  -->
<script>
    // mdBox에 마우스가 진입했을 때 이벤트 처리
    document.getElementById("mdBox").addEventListener("mouseenter", function() {
        this.style.backgroundColor = "#F5F9F1"; // 배경색 변경
    });

    // mdBox에서 마우스가 벗어났을 때 이벤트 처리
    document.getElementById("mdBox").addEventListener("mouseleave", function() {
        this.style.backgroundColor = "transparent"; // 배경색 원래대로
    });

    // lgBox에 마우스가 진입했을 때 이벤트 처리
    document.getElementById("lgBox").addEventListener("mouseenter", function() {
        this.style.backgroundColor = "#F5F9F1"; // 배경색 변경
    });

    // lgBox에서 마우스가 벗어났을 때 이벤트 처리
    document.getElementById("lgBox").addEventListener("mouseleave", function() {
        this.style.backgroundColor = "transparent"; // 배경색 원래대로
    });
</script>

</html>