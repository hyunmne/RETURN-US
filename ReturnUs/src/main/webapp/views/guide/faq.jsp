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
	height: 100%; 
	padding: 45px 50px 0px 50px;
}

.accordion input[type="radio"] {
    display: none;
    width: 90%;
    height: 8%;
}
.accordion label {
    display: block;
    cursor: pointer;
    padding: 10px 20px;
    margin-bottom: 2px;
    border: 1px solid #D9D9D9;
}
.accordion div {
    display: none;
    padding: 10px 20px;
    background-color: #fff;
}
.accordion label:nth-child(odd) {
    background-color: #FAFCF8;
}
/* 짝수 번째 라벨 */
.accordion label:nth-child(even) {
    background-color: #FFFFFF;
}

	#emptyArea .btn {
		background: lightgray;
	}
	#emptyArea .select {
		background: lightblue;
	}
.Q{	
    color: rgb(26, 124, 255);
    margin-right: 2px;
    white-space: nowrap;	
    font-size: 28px;
    margin-right: 2%;
}
.A{
    font-size: 28px;
    line-height: 20px;
    letter-spacing: -0.2px;
    font-weight: 700;
    color: rgb(255, 0, 21);
    white-space: nowrap;
    flex-grow: 1; /* 텍스트가 확장되어 영역을 채우도록 설정 */
}    
.title{
	font-style: noto-sans;
	font-size: 28px;
	color: black;
} 
h5{
	display: inline;
	padding-bottom: 10px;
}
.content{
	font-size: 20px;
	flex-grow: 1;

}
.redemp{
	color: red;
	
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
							<%@include file="/views/common/guideSideBar.jsp"%>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">자주 묻는 질문</h3>
								<span style="color: #3E6D10;">&nbsp;</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">   									
								<div class="accordion" style="margin-bottom: 10%;padding-top: 1%l">
									<input type="radio" name="accordion" class="odd" id="answer01">
									<label for="answer01" style="border-top-left-radius: 13px; border-top-right-radius: 6px;"><span class="Q">Q</span><h5 class="noto-sans">포인트가 지급 되지 않았습니다.</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객님의 수거항목 수거를 완료하고 아직 리너터스 분류 장소에서 <strong>검수가 완료되지 않아 지급되지 않았을 수 있습니다</strong> 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검수 후 고객님께서 보내주신 수거항목이 <strong>지급 기준에 부합 할 시에 포인트가 지급 됩니다</strong> 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준에 <strong class="redemp">부합하지 않으면 포인트 지급이 반려</strong>될 수 있습니다
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준은 <strong>가이드 > 분리배출 가이드</strong>에서 확인하실 수 있습니다.  
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급은 수거 일자로부터 영업일기준 약 2~3일가량 소요됩니다 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주말 또는 연휴시에는 포인트 지급이 지연 될 수 있습니다		 							
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="even" id="answer02">
									<label for="answer02"><span class="Q">Q</span><h5 class="noto-sans">부분 반려는 무엇인가요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 가능한 고객님의 수거항목 중에 <strong class="redemp">포인트 지급 기준에 부적합한</strong> 항목이 있을경우
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검수 과정에서 그 <strong>항목을 제외하고 포인트를 지급해 드립니다</strong> 자세한 내용은 이용약관을 확인해주시기 바랍니다. 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준은 <strong>가이드 > 분리배출 가이드</strong>에서 확인하실 수 있습니다.							
		 							</span>
		 							</p></div>	
									<input type="radio" name="accordion" class="odd" id="answer03">
									<label for="answer03"><span class="Q">Q</span><h5 class="noto-sans">회원가입은 어떻게 하나요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입은 <strong>홈페이지 상단의 "회원가입" 버튼을 클릭</strong>한 후 필수 정보를 입력하여 진행할 수 있습니다. 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;또는 <strong>로그인 > 회원가입</strong>으로 회원가입이 가능합니다												 							
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="even" id="answer04">
									<label for="answer04"><span class="Q">Q</span><h5 class="noto-sans">아이디를 잊어버렸을 때 어떻게 찾을 수 있나요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디를 잊어버리셨을 경우 <strong>로그인 > 아이디 찾기</strong>를 통해 <strong>이름과 생년월일 이메일을 입력하여</strong> 확인하실 수 있습니다.						
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="odd" id="answer05">
									<label for="answer05"><span class="Q">Q</span><h5 class="noto-sans">비밀번호를 잊어버렸을 때 어떻게 복구하나요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객님의 수거항목 수거를 완료하고 아직 리너터스 분류 장소에서 <strong>검수가 완료되지 않아 지급되지 않았을 수 있습니다</strong> 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검수 후 고객님께서 보내주신 수거항목이 <strong>지급 기준에 부합 할 시에 포인트가 지급 됩니다</strong> 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준에 <strong class="redemp">부합하지 않으면 포인트 지급이 반려</strong>될 수 있습니다
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준은 <strong>가이드 > 분리배출 가이드</strong>에서 확인하실 수 있습니다.  
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급은 수거 일자로부터 영업일기준 약 2~3일가량 소요됩니다 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주말 또는 연휴시에는 포인트 지급이 지연 될 수 있습니다		 							
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="even" id="answer06">
									<label for="answer02"><span class="Q">Q</span><h5 class="noto-sans">부분 반려는 무엇인가요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 가능한 고객님의 수거항목 중에 <strong class="redemp">포인트 지급 기준에 부적합한</strong> 항목이 있을경우
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검수 과정에서 그 <strong>항목을 제외하고 포인트를 지급해 드립니다</strong> 자세한 내용은 이용약관을 확인해주시기 바랍니다. 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준은 <strong>가이드 > 분리배출 가이드</strong>에서 확인하실 수 있습니다.							
		 							</span>
		 							</p></div>	
									<input type="radio" name="accordion" class="odd" id="answer07">
									<label for="answer03"><span class="Q">Q</span><h5 class="noto-sans">회원가입은 어떻게 하나요?</h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입은 <strong>홈페이지 상단의 "회원가입" 버튼을 클릭</strong>한 후 필수 정보를 입력하여 진행할 수 있습니다. 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;또는 <strong>로그인 > 회원가입</strong>으로 회원가입이 가능합니다												 							
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="even" id="answer08">
									<label for="answer04"><span class="Q">Q</span><h5 class="noto-sans"></h5></label>						
									<div><p><span class="A">A</span> &nbsp;<span class="content">
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
		 							</span>
		 							</p></div>		
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="/views/common/footer.jsp" %>


<script>
document.addEventListener('DOMContentLoaded', function () {
    var labels = document.querySelectorAll('.accordion label');
    labels.forEach(function(label) {
        label.addEventListener('click', function() {
            var radio = this.previousElementSibling;
            var div = this.nextElementSibling;
            
            if (radio.checked) {
                radio.checked = false;
                div.style.display = 'none';
            } else {	
                var radios = document.querySelectorAll('input[type="radio"]');
                radios.forEach(function(radio) {
                    radio.checked = false;
                });
                var divs = document.querySelectorAll('.accordion div');
                divs.forEach(function(div) {
                    div.style.display = 'none';
                });
                radio.checked = true;
                div.style.display = 'block';
            }
        });
    });
});
</script>






</body>
</html>