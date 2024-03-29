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
}
.A{
    font-size: 18px;
    line-height: 20px;
    letter-spacing: -0.2px;
    font-weight: 700;
    color: rgb(255, 0, 21);
    white-space: nowrap;
    flex-grow: 1; /* 텍스트가 확장되어 영역을 채우도록 설정 */
}     
.content{
	flex-grow: 1;
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
								<h3 class="noto-sans" style="color: #3E6D10;">자주 묻는 질문</h3>
								<span style="color: #3E6D10;">총 1개의 게시물이 있습니다</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">   									
								<div class="accordion">
									<input type="radio" name="accordion" class="odd" id="answer01">
									<label for="answer01"><span class="Q">Q</span>포인트가 지급 되지 않았습니다.</label>						
									<div><p><span class="A">A</span class="content"> &nbsp;<span><br>
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객님의 수거항목 수거를 완료하고 아직 리너터스 분류 장소에서 검수가 완료되지 않아 지급되지 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;않았을 수 있습니다 
									<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검수 후 고객님께서 보내주신 수거항목이 지급 기준에 부합 할 시에 포인트가 지급 됩니다 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급 기준에 부합하지 않으면 포인트 지급이 반려될 수 있습니다  
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수거신청에서 반려와 부분반려를 확인하실 수 있습니다
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트 지급은 수거 일자로부터 영업일기준 약 2~3일가량 소요됩니다 
		 							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주말 또는 연휴시에는 포인트 지급이 지연 될 수 있습니다		 							
		 							</span>
		 							</p></div>
		 							<input type="radio" name="accordion" class="even" id="answer02">
									<label for="answer02"><span class="Q">Q</span>포인트가 지급 되지 않았습니다.</label>
									<div><p><span class="A">A</span> &nbsp;1.고객님의 수거항목 수거를 완료하고 아직 리터너스 분류장소에서 <br>검수가 완료되지 않아 지급되지 않았을 수 있습니다.
		 								<br>2.검수 후 고객님께서 보내주신 수거항목이 지급 기준에 부합 하지 않았을 수 있습니다. 
		 								<br>포인트 지급 기준은 가이드> 분리배출 가이드에서 확인실 수 있습니다.
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