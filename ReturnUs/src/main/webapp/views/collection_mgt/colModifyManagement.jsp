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
#listDiv {
	width: 100%;
	text-align: center;
}
#title {
   	color: #3E6D10;
    padding: 20px 20px 10px;
    font-size: larger;
    font-weight: 800;
}
#content {
	padding:5px 40px; 
	font-size:medium;
	display: flex;
	width: 100%;
}
#firstTable {
	width: 60%;
}
#secondTable {
	width: 40%;
}
.info tr {
  display: block;
  float: left;
}
.info th, .info td {
  display: block;
  padding: 6px;
  color:black;
}
#pointDiv {
    margin-top: 20px;
    margin-bottom: 50px;
    position: relative;
}
#pointDiv table {
    width: 50%;
}
#pointDiv th, #pointDiv td {
    padding: 8px;
    text-align: center;
}
#pointDiv th {
    background-color: #f2f2f2;
}
#pointDiv tr {
    border-bottom: 1px solid #dddddd;
}
#btnDiv {
	position: absolute;
	right: 0;
	bottom: 0;
}
.btnStyle {
	font-size: small;
    border-radius: 10px;
    background-color: #3D550C;
    color: white;
    padding: 5px 15px;
    border: none;
}
.btnStyle:hover {
    background-color: #45a049;
    color: white;
}

input[type="number"] {
    width: 70px;
    text-align: center;
}
#modifyForm {
	display: flex;
}
#rejectionDiv {
    margin: -79px 0 0 54px;
    position: relative;
}
#rejectionDiv input[type="text"] {
	width: 97%;
    height: 77%;
    margin: 20px 0 0 20px;
    border-radius: 15px;
    border: 1px solid #ccc;
    padding: 10px;
    outline: none;
}
#rejectionDiv input[type="text"]::placeholder {
	position: absolute;
	left: 0;
	top: 0;
	padding: 20px;
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
					<%@include file="/views/common/colMgtSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">수거신청 상세내역</h3>
								<span style="color: #3E6D10;">신청 번호 '${colNum }'의 상세 내역입니다</span>
							</div>
							<div id="sm" class="card">
								<div id="title">
		                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;신청 정보
		                        </div>
		                        <div id="content">
		                           <table id="firstTable" class="info">
		                              <tr class="col-3">
		                                 <th>신청번호</th>
		                                 <th>신청일</th>
		                                 <th>신청자</th>
		                                 <th>연락처</th>
		                                 <th>신청주소</th>
		                              </tr>
		                              <tr class="col-9">
		                                 <td style="color: blue;">${colDetail.colNum }</td>
		                                 <td>${colDetail.colDate }</td>
		                                 <td>${colDetail.accName }</td>
		                                 <td>${colDetail.accTel }</td>
		                                 <td>${colDetail.colAddr }</td>
		                              </tr>
		                           </table>
		                           <table id="secondTable" class="info">
		                              <tr class="col-5">
		                                 <th>수거상태</th>
		                                 <th>택배비용</th>
		                                 <th>포인트할인</th>
		                                 <th>결제금액</th>
		                              </tr>
		                              <tr class="col-6">
		                                 <td>${colDetail.colStatus }</td>
		                                 <td>${colDetail.colPost }</td>
		                                 <td>${colDetail.colUsePnt }</td>
		                                 <td>${colDetail.colPrice }</td>
		                              </tr>
		                           </table>
		                        </div>
		                        <div id="title" style="margin-top: 30px;">
		                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;포인트 적립
		                        </div>
		                        <div id="pointDiv">
		                        	<form id="modifyForm" action="col-modify-mgt" method="POST">
		                        		<input type="hidden" value="${colNum }" name="colNum">
		                        		<input type="hidden" value="수거완료" name="colStatus">
		                        		<input type="hidden" id="totalPointInput" name="colTotalPnt">
		                        		<!-- 수량 변경 전 데이터도 같이 넘겨주기 (변경 여부 판단하기 위해) -->
		                        		<input type="hidden" id="prevColPpack" name="prevColPpack" value="${colDetail.colPpack }">
		                        		<input type="hidden" id="prevColPtBody" name="prevColPtBody" value="${colDetail.colPtBody }">
		                        		<input type="hidden" id="prevColPtLid" name="prevColPtLid" value="${colDetail.colPtLid }">
		                        		<input type="hidden" id="prevColBt190" name="prevColBt190" value="${colDetail.colBt190 }">
		                        		<input type="hidden" id="prevColBt400" name="prevColBt400" value="${colDetail.colBt400 }">
		                        		<input type="hidden" id="prevColBt1000" name="prevColBt1000" value="${colDetail.colBt1000 }">
		                        		<input type="hidden" id="prevColBt1000Up" name="prevColBt1000Up" value="${colDetail.colBt1000Up }">
		                        		<input type="hidden" id="prevColPaper" name="prevColPaper" value="${colDetail.colPaper }">
		                        		<input type="hidden" id="prevColPlastic" name="prevColPlastic" value="${colDetail.colPlastic }">
		                        		<input type="hidden" id="prevColCan" name="prevColCan" value="${colDetail.colCan }">
			                        	<table class="col-5">
										    <thead>
										        <tr>
										            <th></th>
										            <th>구분</th>
										            <th>신청수량</th>
										            <th>수거수량</th>
										            <th>적립포인트</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <th>종이팩</th>
										            <td></td>
										            <td>${colDetail.colPpack }</td>
										            <td><input type="number" id="colPpack" name="colPpack" value="${colDetail.colPpack }" onchange="updatePoints('colPpack', 300)"></td>
										            <td id="colPpackPoint">${colDetail.colPpack *300}p</td>
										        </tr>
										        <tr>
										            <th rowspan="2">페트병</th>
										            <td>페트병 몸체</td>
										            <td>${colDetail.colPtBody }</td>
										            <td><input type="number" id="colPtBody" name="colPtBody" value="${colDetail.colPtBody }" onchange="updatePoints('colPtBody', 500)"></td>
										            <td id="colPtBodyPoint">${colDetail.colPtBody *500}p</td>
										        </tr>
										        <tr>
												    <td>뚜껑</td>
												    <td>${colDetail.colPtLid }</td>
										            <td><input type="number" id="colPtLid" name="colPtLid" value="${colDetail.colPtLid }" onchange="updatePoints('colPtLid', 100)"></td>
										            <td id="colPtLidPoint">${colDetail.colPtLid *100}p</td>
												</tr>
												<tr>
										            <th rowspan="4">공병</th>
										            <td>190ml 이하</td>
										            <td>${colDetail.colBt190 }</td>
										            <td><input type="number" id="colBt190" name="colBt190" value="${colDetail.colBt190 }" onchange="updatePoints('colBt190', 70)"></td>
										            <td id="colBt190Point">${colDetail.colBt190 *70}p</td>
										        </tr>
										        <tr>
												    <td>400ml 이하</td>
												    <td>${colDetail.colBt400 }</td>
										            <td><input type="number" id="colBt400" name="colBt400" value="${colDetail.colBt400 }" onchange="updatePoints('colBt400', 100)"></td>
										            <td id="colBt400Point">${colDetail.colBt400 *100}p</td>
												</tr>
										        <tr>
												    <td>1000ml 이하</td>
												    <td>${colDetail.colBt1000 }</td>
										            <td><input type="number" id="colBt1000" name="colBt1000" value="${colDetail.colBt1000 }" onchange="updatePoints('colBt1000', 130)"></td>
										            <td id="colBt1000Point">${colDetail.colBt1000 *130}p</td>
												</tr>
										        <tr>
												    <td>1000ml 이상</td>
												    <td>${colDetail.colBt1000Up }</td>
										            <td><input type="number" id="colBt1000Up" name="colBt1000Up" value="${colDetail.colBt1000Up }" onchange="updatePoints('colBt1000Up', 350)"></td>
										            <td id="colBt1000UpPoint">${colDetail.colBt1000Up *350}p</td>
												</tr>
												<tr>
										            <th>종이</th>
										            <td></td>
										            <td>${colDetail.colPaper }</td>
										            <td><input type="number" id="colPaper" name="colPaper" value="${colDetail.colPaper }" onchange="updatePoints('colPaper', 5000)"></td>
										            <td id="colPaperPoint">${colDetail.colPaper *5000}p</td>
										        </tr>
												<tr>
										            <th>플라스틱</th>
										            <td></td>
										            <td>${colDetail.colPlastic }</td>
										            <td><input type="number" id="colPlastic" name="colPlastic" value="${colDetail.colPlastic }" onchange="updatePoints('colPlastic', 200)"></td>
										            <td id="colPlasticPoint">${colDetail.colPlastic *200}p</td>
										        </tr>
												<tr>
										            <th>캔</th>
										            <td></td>
										            <td>${colDetail.colCan }</td>
										            <td><input type="number" id="colCan" name="colCan" value="${colDetail.colCan }" onchange="updatePoints('colCan', 500)"></td>
										            <td id="colCanPoint">${colDetail.colCan *500}p</td>
										        </tr>
												<tr>
										            <th>합계</th>
										            <td></td>
										            <td id="totalCell"></td>
										            <td id="totalCount"></td>
										            <td id="totalPoint"></td>
										        </tr>
										    </tbody>
										</table>
										<div id="rejectionDiv" class="col-5">
											<div id="title">
					                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;반려사유
					                        </div>
											<input type="text" name="colRejection" placeholder="반려사유를 입력하세요">
										</div>
										<div id="btnDiv">
											<button type="submit" id="collectionBtn" class="btnStyle">수거완료</button>
											<a href="col-management?colStatus=수거진행중" class="btnStyle">목록으로</a>
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
<script>
	//신청수량 합계
	var total = 0;
	total += parseInt('${colDetail.colPpack }') || 0;
	total += parseInt('${colDetail.colPtBody }') || 0;
	total += parseInt('${colDetail.colPtLid }') || 0;
	total += parseInt('${colDetail.colBt190 }') || 0;
	total += parseInt('${colDetail.colBt400 }') || 0;
	total += parseInt('${colDetail.colBt1000 }') || 0;
	total += parseInt('${colDetail.colBt1000Up }') || 0;
	total += parseInt('${colDetail.colPaper }') || 0;
	total += parseInt('${colDetail.colPlastic }') || 0;
	total += parseInt('${colDetail.colCan }') || 0;
	
	var totalCell = document.getElementById('totalCell');
	totalCell.textContent = total;
	
	var collectionBtn = document.getElementById('collectionBtn');
	collectionBtn.addEventListener("click", function() {
		confirmAlert = confirm("수거를 진행하시겠습니까?");
		if(confirmAlert) {
			window.location.href = 'col-management?colStatus=수거진행중';
		} else {
			window.location.href = 'col-detail-mgt?colNum=${colDetail.colNum}';
		}
	})
	
	//수거수량 변경될 때마다 해당 적립 포인트도 변경
	function updatePoints(inputId, pointNum) {
		const input = document.getElementById(inputId);
		const point = document.getElementById(inputId + 'Point');
		
		const inputVal = parseInt(input.value);
		const points = inputVal * pointNum;
		
		point.textContent = points + 'p';
	}

	document.addEventListener("DOMContentLoaded", function() {
    	const inputs = document.querySelectorAll("input[type='number']");
        inputs.forEach(input => {
            input.addEventListener("change", function() {
            	updateTotal();
            });
        });
        updateTotal();
    });
	
	//수거수량, 적립포인트 합계
	function updateTotal(inputId, pointNum) {
		const countInput = document.querySelectorAll("input[type='number']");
		let totalCount = 0;
        let totalPoint = 0;
        countInput.forEach(input => {
        	//수거수량 합계
        	const count = parseInt(input.value) || 0;
        	totalCount += count;
        	//적립포인트 합계
        	const pointId = input.id + 'Point';
        	const point = document.getElementById(pointId);
        	const colPoint = parseInt(point.textContent) || 0;
        	const points = colPoint;
        	totalPoint += points;
        })
        document.getElementById('totalCount').textContent = totalCount;
        document.getElementById('totalPoint').textContent = totalPoint + 'p';
	}
	
    function setTotalPointInput() {
        const totalPointStr = document.getElementById('totalPoint').textContent;
        const totalPoint = parseInt(totalPointStr.replace('p', ''), 10);
        document.getElementById('totalPointInput').value = totalPoint;
    }
    document.getElementById('modifyForm').addEventListener('submit', setTotalPointInput);
	
</script>
</body>
</html>