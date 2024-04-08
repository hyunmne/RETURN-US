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
    padding: 8px;
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
#pickupManList {
    margin: 20px 0 0 20px;
    height: 86%;
    border-radius: 15px;
    box-shadow: 3px 4px 9px rgba(0, 0, 0, 0.2);
    padding: 20px;
    outline: none;
    max-height: 495px;
    overflow-y: auto;
    overflow-x: hidden;
}
.pickupManBox {
	padding: 13px;
    display: flex;
    border-bottom: solid 1px #ddd;
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
#btnDiv {
	position: absolute;
    right: 70px;
    bottom: 30px;
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
    font-weight: 500;
    color: #0091ea;
}
</style>
</head>
<body class="noto-sans">
<script src="sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
		                        <div id="pointContent">
		                        	<table>
									    <thead>
									        <tr>
									            <th></th>
									            <th>구분</th>
									            <th>신청수량</th>
									        </tr>
									    </thead>
									    <tbody>
									        <tr>
									            <th>종이팩</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colPpack }</td>
									        </tr>
									        <tr>
									            <th rowspan="2">페트병</th>
									            <td>페트병 몸체</td>
									            <td class="colCnt">${colDetail.colPtBody }</td>
									        </tr>
									        <tr>
											    <td>뚜껑</td>
											    <td class="colCnt">${colDetail.colPtLid }</td>
											</tr>
											<tr>
									            <th rowspan="4">공병</th>
									            <td>190ml 이하</td>
									            <td class="colCnt">${colDetail.colBt190 }</td>
									        </tr>
									        <tr>
											    <td>400ml 이하</td>
											    <td class="colCnt">${colDetail.colBt400 }</td>
											</tr>
									        <tr>
											    <td>1000ml 이하</td>
											    <td class="colCnt">${colDetail.colBt1000 }</td>
											</tr>
									        <tr>
											    <td>1000ml 이상</td>
											    <td class="colCnt">${colDetail.colBt1000Up }</td>
											</tr>
											<tr>
									            <th>종이</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colPaper }</td>
									        </tr>
											<tr>
									            <th>플라스틱</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colPlastic }</td>
									        </tr>
											<tr>
									            <th>캔</th>
									            <td></td>
									            <td class="colCnt">${colDetail.colCan }</td>
									        </tr>
											<tr>
									            <th>합계</th>
									            <td></td>
									            <td id="totalCell" class="colCnt"></td>
									        </tr>
									    </tbody>
									</table>
									<div id="pickupManDiv" class="col-5">
										<div id="title">
				                            <i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;픽업맨
				                        </div>
										<div id="pickupManList">
											<c:forEach items="${pmList }" var="pm">
												<div class="pickupManBox">
													<div id="pickupManProfile">
														<img alt="" src="${pm.pmProfile }">
													</div>
													<div id="pickupManInfo">
														<strong>${pm.pmName }</strong>
														<c:choose>
										                    <c:when test="${empty pm.pmStatus}">
										                        <span style="color: blue">수거준비</span>
										                    </c:when>
										                    <c:when test="${pm.pmStatus == '수거중'}">
										                        <span class="pmProgress" style="color: #109010;">${pm.pmStatus}</span>
										                    </c:when>
										                    <c:when test="${pm.pmStatus == '수거완료'}">
										                        <span style="color: #006cb7;">${pm.pmStatus}</span>
										                    </c:when>
										                </c:choose>
														<br>
														<span>(${pm.pmRegion })&nbsp;${pm.pmTel }</span>
													</div>
												 	<input type="radio" id="pmNo" name="pmNo" value="${pm.pmNo}">
												 	<input type="hidden" id="colNum" name="colNum" value="${colNum }">
												 	<input type="hidden" id="pmStatus" name="pmStatus" value="수거중">
												</div>
											</c:forEach>
										</div>
									</div>
		                        </div>
								<div id="btnDiv">
									<button type="button" id="collectionBtn" class="btnStyle" onclick="colProgress()">수거진행</button>
									<button class="btnStyle" onclick="location.href='col-management?colStatus=수거준비중'">목록으로</button>
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
	
	var colPpack = parseInt('${colDetail.colPpack }');
	var colPtBoby = parseInt('${colDetail.colPtBody }');
	var colPtLid = parseInt('${colDetail.colPtLid }');
	var colBt190 = parseInt('${colDetail.colBt190 }');
	var colBt400 = parseInt('${colDetail.colBt400 }');
	var colBt1000 = parseInt('${colDetail.colBt1000 }');
	var colBt1000Up = parseInt('${colDetail.colBt1000Up }');
	var colPaper = parseInt('${colDetail.colPaper }');
	var colPlastic = parseInt('${colDetail.colPlastic }');
	var colCan = parseInt('${colDetail.colCan }');
	total += (colPpack + colPtBoby + colPtLid + colBt190 + colBt400 + colBt1000 + colBt1000Up + colPaper + colPlastic +colCan);
	
	var totalCell = document.getElementById('totalCell');
	totalCell.textContent = total;
	
	//신청수량 0이 아닌 것만 강조(class 적용)
	var colCnt = document.querySelectorAll('.colCnt');

	colCnt.forEach(function(td) {
		var val = parseInt(td.textContent);
		if(val != 0) {
			td.classList.add('highlightCnt');
		}
	});
	
	//수거진행 버튼 클릭시
	function colProgress() {
		Swal.fire({
	        title: "수거를 진행하시겠습니까?",
	        icon: "question",
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: '확인',
            cancelButtonText: '취소'
	    }).then((result) => {
	    	if (result.isConfirmed) {
				var pickman = {};
				pickman.pmNo = $('input[name=pmNo]:checked').val();
				pickman.colNum = $('#colNum').val();
				pickman.pmStatus = $('#pmStatus').val();
				
				$.ajax({
					url:'col-detail-mgt',
					type:'post',
					async:true,
					data:{pickman:JSON.stringify(pickman)},
					success:function(data) {
						Swal.fire({
			                title: "수거 진행 완료",
			                icon: "success",
			                confirmButtonText: '확인',
			            }).then(() => {
		                    window.location.href = 'col-management?colStatus=수거준비중';
			            });
					},
					error:function(err) {
						alert("에러");
					}
				})
	        }
	    });
	}
	
	//'수거중'인 것들은 선택 못하게
	var pmProgress = document.querySelectorAll('.pmProgress');
	pmProgress.forEach(function(element) {
	    var box = element.closest('.pickupManBox');
	    box.style.backgroundColor = '#f1f3f5';
	    var radioBtn = box.querySelector('input[type="radio"]');
	    radioBtn.disabled = true;
	});

</script>
</body>
</html>