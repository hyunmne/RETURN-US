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
#pointContent {
    margin-top: 20px;
    margin-bottom: 90px;
    position: relative;
    display: flex;
}
#pointContent table {
    width: 50%;
}
#pointContent th, #pointContent td {
    padding: 10px;
    text-align: center;
}
#pointContent th {
    background-color: #f2f2f2;
}
#pointContent tr {
    border-bottom: 1px solid #dddddd;
}
#pickupManDiv {
    margin: -79px 0 0 54px;
    position: relative;
}
.pickupManBox {
    display: flex;
    margin: 20px 0 0 20px;
    border-radius: 15px;
    box-shadow: 3px 4px 9px rgba(0, 0, 0, 0.2);
    padding: 20px;
}
.pickupManBox img {
	height: 50px;
	width: 50px;
    border-radius: 50%;
}
.pickupManBox input[type="radio"] {
	margin-left: 30px;
}
#pickupManProfile {
	padding-right: 30px;
    padding-left: 20px;
}
#pickupManInfo span {
	font-size: smaller;
}
#pickupManInfo strong {
	font-size: medium;
    margin-right: 10px;
}
#rejectionDiv {
	margin-top: 40px;
    height: 70%;
    width: 100%;
}
#rejectionDiv textarea {
	width: 97%;
    height: 77%;
    margin: 20px 0 0 20px;
    border-radius: 15px;
    border: 1px solid #ccc;
    padding: 20px;
    outline: none;
    resize: none;
}
#btnDiv {
	position: absolute;
	right: 20px;
    bottom: -60px;
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
    background-color: #579934;
}
.highlightCnt {
    font-weight: 600;
    color: #0091ea;
}
.highlightFinCnt {
	font-weight: 500;
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
		                                 <td style="color: #3D550C;font-weight: 450;">${colDetail.colNum }</td>
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
		                                 <th>신청결과</th>
		                              </tr>
		                              <tr class="col-6">
		                                 <td>${colDetail.colStatus }</td>
		                                 <td>${colDetail.colPost }</td>
		                                 <td>${colDetail.colUsePnt }</td>
		                                 <td>${colDetail.colPrice }</td>
		                                 <td>
		                                 	<c:choose>
										        <c:when test="${colDetail.colResult eq '정상지급'}">
										            <span style="color: #4caf50">${colDetail.colResult}</span>
										        </c:when>
										        <c:when test="${colDetail.colResult eq '부분반려'}">
										            <span style="color: #f9aB25">${colDetail.colResult}</span>
										        </c:when>
										        <c:otherwise>
										            <span style="color: red">${colDetail.colResult}</span>
										        </c:otherwise>
										    </c:choose>
		                                 </td>
		                              </tr>
		                           </table>
		                        </div>
		                        <div id="title" style="margin-top: 30px;">
		                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;포인트 적립
		                        </div>
		                        <div id="pointContent">
		                        	<table>
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
									            <td class="colCnt">${colDetail.colPpack }</td>
									            <td class="colFinCnt">${colDetail.colPpackFin }</td>
									            <td>${colDetail.colPpackFin *30}p</td>
									        </tr>
									        <tr>
									            <th rowspan="2">페트병</th>
									            <td>페트병 몸체</td>
									            <td class="colCnt">${colDetail.colPtBody }</td>
									            <td class="colFinCnt">${colDetail.colPtBodyFin }</td>
									            <td>${colDetail.colPtBodyFin *50 }p</td>
									        </tr>
									        <tr>
											    <td>뚜껑</td>
											    <td class="colCnt">${colDetail.colPtLid }</td>
											    <td class="colFinCnt">${colDetail.colPtLidFin }</td>
											    <td>${colDetail.colPtLidFin *10}p</td>
											</tr>
											<tr>
									            <th rowspan="4">공병</th>
									            <td>190ml 이하</td>
									            <td class="colCnt">${colDetail.colBt190 }</td>
									            <td class="colFinCnt">${colDetail.colBt190Fin }</td>
									            <td>${colDetail.colBt190Fin *7}p</td>
									        </tr>
									        <tr>
											    <td>400ml 이하</td>
											    <td class="colCnt">${colDetail.colBt400 }</td>
											    <td class="colFinCnt">${colDetail.colBt400Fin }</td>
											    <td>${colDetail.colBt400Fin *10}p</td>
											</tr>
									        <tr>
											    <td>1000ml 이하</td>
											    <td class="colCnt">${colDetail.colBt1000 }</td>
											    <td class="colFinCnt">${colDetail.colBt1000Fin }</td>
											    <td>${colDetail.colBt1000Fin *13}p</td>
											</tr>
									        <tr>
											    <td>1000ml 이상</td>
											    <td class="colCnt">${colDetail.colBt1000Up }</td>
											    <td class="colFinCnt">${colDetail.colBt1000UpFin }</td>
											    <td>${colDetail.colBt1000UpFin *35}p</td>
											</tr>
											<tr>
									            <th>종이</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colPaper }</td>
									            <td class="colFinCnt">${colDetail.colPaperFin }</td>
									            <td>${colDetail.colPaperFin *500}p</td>
									        </tr>
											<tr>
									            <th>플라스틱</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colPlastic }</td>
									            <td class="colFinCnt">${colDetail.colPlasticFin }</td>
									            <td>${colDetail.colPlasticFin *20}p</td>
									        </tr>
											<tr>
									            <th>캔</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colCan }</td>
									            <td class="colFinCnt">${colDetail.colCanFin }</td>
									            <td>${colDetail.colCanFin *50}p</td>
									        </tr>
											<tr>
									            <th>합계</th>
									            <td></td>
									            <td id="totalCell" class="colCnt"></td>
									            <td id="totalCount" class="colFinCnt"></td>
									            <td id="totalPoint">${colDetail.colTotalPnt }p</td>
									        </tr>
									    </tbody>
									</table>
									<div id="pickupManDiv" class="col-5">
										<div id="title">
				                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;픽업맨
				                        </div>
										<div class="pickupManBox">
											<div id="pickupManProfile">
												<img alt="" src="${pmInfo.pmProfile }">
											</div>
											<div id="pickupManInfo">
												<strong>${pmInfo.pmName }</strong>
												<span style="color: #006cb7;">${pmInfo.pmStatus }</span>
												<br>
												<span>(${pmInfo.pmRegion })&nbsp;${pmInfo.pmTel }</span>
											</div>
										</div>
										<div id="rejectionDiv" class="col-5">
											<c:choose>
			                        		<c:when test="${empty colDetail.colRejection }">
												<div id="title">
						                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;포인트 지급
						                        </div>
												<textarea name="colRejection" readonly>포인트가 정상 지급되었습니다</textarea>
			                        		</c:when>
			                        		<c:otherwise>
												<div id="title">
						                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;반려사유
						                        </div>
												<textarea name="colRejection" readonly>${colDetail.colRejection }</textarea>
			                        		</c:otherwise>
			                        	</c:choose>
										</div>
									</div>
									<div id="btnDiv">
										<button id="modifyBtn" class="btnStyle" onclick="location.href='col-modify-mgt?colNum=${colDetail.colNum}'">수정</button>
										<button class="btnStyle" onclick="location.href='col-management?colStatus=수거완료'">목록으로</button>
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
	//신청수량, 수거수량 합계
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
	
	var totalFin = 0;
	totalFin += parseInt('${colDetail.colPpackFin }') || 0;
	totalFin += parseInt('${colDetail.colPtBodyFin }') || 0;
	totalFin += parseInt('${colDetail.colPtLidFin }') || 0;
	totalFin += parseInt('${colDetail.colBt190Fin }') || 0;
	totalFin += parseInt('${colDetail.colBt400Fin }') || 0;
	totalFin += parseInt('${colDetail.colBt1000Fin }') || 0;
	totalFin += parseInt('${colDetail.colBt1000UpFin }') || 0;
	totalFin += parseInt('${colDetail.colPaperFin }') || 0;
	totalFin += parseInt('${colDetail.colPlasticFin }') || 0;
	totalFin += parseInt('${colDetail.colCanFin }') || 0;
	
	var totalCount = document.getElementById('totalCount');
	totalCount.textContent = totalFin;
	
	//신청수량 0이 아닌 것만 강조(class 적용)
	var colCnt = document.querySelectorAll('.colCnt');

	colCnt.forEach(function(td) {
		console.log(td);
		var val = parseInt(td.textContent);
		if(val != 0) {
			td.classList.add('highlightCnt');
		}
	});
	
	//신청수량과 수거수량이 다른 것만 강조(class 적용)
	var colFinCnt = document.querySelectorAll('.colFinCnt');

 	for (var i = 0; i < colCnt.length; i++) {
        var val = parseInt(colCnt[i].textContent);
        var finVal = parseInt(colFinCnt[i].textContent);

        if (val !== finVal) {
        	colFinCnt[i].classList.add("highlightFinCnt");
        }
    }
	
</script>
</body>
</html>