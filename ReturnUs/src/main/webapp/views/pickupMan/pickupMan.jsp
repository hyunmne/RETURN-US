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
	padding: 45px 50px 50px 50px;
	display:flex;
	flex-direction:row;
}
.rounded-input {
        border-radius: 5px; /* 원하는 반지름 값을 설정합니다. */
        border: 1px solid #ccc; /* 테두리 스타일을 지정합니다. */
        padding: 10px 15px; /* 내부 여백을 지정합니다. */
        height: 50px;
        box-sizing: border-box; /* 테두리와 내부 여백을 포함한 요소의 전체 크기를 지정합니다. */
        margin:10px;
    }
#nextBtn {
        display: flex; /* 수평 정렬을 위해 flex로 설정 */
        padding: 10px;
        margin: 10px;
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
					<%@include file="/views/common/pickSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">픽업맨</h3>
							</div>
							<div id="sm" class="card">
								<div class="col-lg-5" id="joinPM">
								</div>
								
								<div class="col-lg-7" id="selectPmList">
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
$(function() {
	getJoinPM();
	getPmList();
})

function getJoinPM() {
	let settings = {
			url : "joinPick",
			method : "get",
			dataType : "html",
			success : function(resp) {
				$(joinPM).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
	};
	$.ajax(settings);
};


function getPmList() {
	let settings = {
			url : "selectPick",
			method : "get",
			dataType : "html",
			success : function(resp) {
				$(selectPmList).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
	};
	$.ajax(settings);
};
</script>




</body>
</html>