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
	padding: 55px 50px 150px 50px;
}
#title {
	color: #3E6D10;
    padding: 20px 20px 10px;
    font-size: larger;
    font-weight: 800;
}
#pntInfo{
	 text-align:center; 
	 vertical-align: middle; 
	 color:black;
	 border-color:#c3d7af;
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
							<%@include file="/views/common/colSideBar.jsp"%>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card" >
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">방문 수거 신청</h3>
								<span style="color: #3E6D10;">리터너스가 집 앞까지 찾아가 손쉽게 분리수거 해드립니다!</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card d-flex">
								<div class="col-12" style="padding-bottom:50px;">
									<h3 class="noto-sans" style="color:#3E6D10;">STEP 04<br>서비스 신청 완료!</h3>
								</div>	
								
								<div class="col-12" style="text-align:center; font-size:xx-large" >
									<div style="color:#45595b; font-size:xx-large;"><b>${acc.accName }</b> 님, </div> 
									방문 수거 서비스 신청이 완료되었습니다. <br>
									리터너스를 이용해주셔서 감사합니다. <br><br>
									<div style="font-size:large">
									<a href="main" style="text-decoration:underline;">메인으로 돌아가기</a> <br>
									<a href="#" style="text-decoration:underline;">신청 내역 확인하기</a>
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


<script>
window.onload = function(){
	//모든 tbody 안의 tr 태그를 선택합니다.
	var tableRows = document.querySelectorAll('tbody tr');
	// 총합을 저장할 변수를 초기화합니다.
	var totalSum = 0;
	// 각 테이블 행을 순회하면서 마지막 열의 값을 더합니다.
	tableRows.forEach(function(row) {
	    // 현재 행의 마지막 td 태그를 가져옵니다.
	    var lastCell = row.querySelector('td:last-child');
	
	    if (lastCell!==null){
		    var value = parseInt(lastCell.textContent.replace('p', '').trim()); // 'p'를 제거하고 공백 제거
	    } else {
	    	var value = 0;
	    }
	    // 해당 td 태그의 텍스트 값을 가져와서 숫자로 변환한 뒤 더합니다.
	    if (!isNaN(value)) { // value가 숫자면
	        totalSum += value;
	    }
	});
	document.getElementById('totalSum').textContent = totalSum+'p';
}
</script>

<script>
function nextBtn() {
    // 폼 생성
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'collect5';

    // 폼 데이터 추가
    function addHiddenInput(name, value) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        // 값이 null이면 0으로 대체
        input.value = value ? value : 0;
        form.appendChild(input);
    }

    function addColValue(name, classNm) {
        var elements = document.getElementsByClassName(classNm);
        if (elements.length > 0) {
            var cnt = elements[0].innerText.match(/\d+/)?.[0];
            addHiddenInput(name, cnt);
        } else {
            addHiddenInput(name, 0);
        }
    }

    addColValue('colPaper', 'paperCol');
    addColValue('colCan', 'canCol');
    addColValue('colBt190', 'bt190Col');
    addColValue('colBt400', 'bt400Col');
    addColValue('colBt1000', 'bt1000Col');
    addColValue('colBt1000Up', 'bt1000UpCol');
    addColValue('colPlastic', 'plasticCol');
    addColValue('colPtLid', 'ptLidCol');
    addColValue('colPtBody', 'ptBodyCol');
    addColValue('colPpack', 'paperPackCol');

    // 추가로 hidden 값들도 폼 데이터로 추가
    var hiddenInputs = document.querySelectorAll('input[type=hidden]');
    hiddenInputs.forEach(function(input) {
        addHiddenInput(input.name, input.value);
    });

    // 폼을 문서에 추가하고 전송
    document.body.appendChild(form);
    form.submit();
}
</script>





</body>
</html>