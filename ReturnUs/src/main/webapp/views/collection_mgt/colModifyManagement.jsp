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
	right: 7px;
    bottom: -7px;
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
#rejectionDiv textarea {
	width: 97%;
    height: 78%;
    margin: 20px 0 0 20px;
    border-radius: 15px;
    border: 1px solid #ccc;
    padding: 20px;
    outline: none;
    resize: none;
}
#rejectionDiv textarea::placeholder {
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
		                                 <td style="color: #0091ea;">${colDetail.colNum }</td>
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
		                        		<input type="hidden" name="colPpack" value="${colDetail.colPpack }">
		                        		<input type="hidden" name="colPtBody" value="${colDetail.colPtBody }">
		                        		<input type="hidden" name="colPtLid" value="${colDetail.colPtLid }">
		                        		<input type="hidden" name="colBt190" value="${colDetail.colBt190 }">
		                        		<input type="hidden" name="colBt400" value="${colDetail.colBt400 }">
		                        		<input type="hidden" name="colBt1000" value="${colDetail.colBt1000 }">
		                        		<input type="hidden" name="colBt1000Up" value="${colDetail.colBt1000Up }">
		                        		<input type="hidden" name="colPaper" value="${colDetail.colPaper }">
		                        		<input type="hidden" name="colPlastic" value="${colDetail.colPlastic }">
		                        		<input type="hidden" name="colCan" value="${colDetail.colCan }">
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
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colPpack" name="colPpackFin" value="${colDetail.colPpack }" 
												            		min="0" max="${colDetail.colPpack }" onchange="checkInput('colPpack', 30, this.min, this.max)">
										            		</td>
												            <td id="colPpackPoint">${colDetail.colPpack *30}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colPpackFin" name="colPpackFin" value="${colDetail.colPpackFin }" 
												            		min="0" max="${colDetail.colPpack }" onchange="checkInput('colPpackFin', 30, this.min, this.max)">
										            		</td>
												            <td id="colPpackFinPoint">${colDetail.colPpackFin *30}p</td>
										            	</c:otherwise>
										            </c:choose>
										        </tr>
										        <tr>
										            <th rowspan="2">페트병</th>
										            <td>페트병 몸체</td>
										            <td>${colDetail.colPtBody }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colPtBody" name="colPtBodyFin" value="${colDetail.colPtBody }" 
												            		min="0" max="${colDetail.colPtBody }" onchange="checkInput('colPtBody', 50, this.min, this.max)">
										            		</td>
												            <td id="colPtBodyPoint">${colDetail.colPtBody *50}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colPtBodyFin" name="colPtBodyFin" value="${colDetail.colPtBodyFin }" 
												            		min="0" max="${colDetail.colPtBody }" onchange="checkInput('colPtBodyFin', 50, this.min, this.max)">
										            		</td>
												            <td id="colPtBodyFinPoint">${colDetail.colPtBodyFin *50}p</td>
										            	</c:otherwise>
										            </c:choose>
										        </tr>
										        <tr>
												    <td>뚜껑</td>
												    <td>${colDetail.colPtLid }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colPtLid" name="colPtLidFin" value="${colDetail.colPtLid }" 
												            		min="0" max="${colDetail.colPtLid }" onchange="checkInput('colPtLid', 10, this.min, this.max)">
										            		</td>
												            <td id="colPtLidPoint">${colDetail.colPtLid *10}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colPtLidFin" name="colPtLidFin" value="${colDetail.colPtLidFin }" 
												            		min="0" max="${colDetail.colPtLid }" onchange="checkInput('colPtLidFin', 10, this.min, this.max)">
										            		</td>
												            <td id="colPtLidFinPoint">${colDetail.colPtLidFin *10}p</td>
										            	</c:otherwise>
										            </c:choose>
												</tr>
												<tr>
										            <th rowspan="4">공병</th>
										            <td>190ml 이하</td>
										            <td>${colDetail.colBt190 }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colBt190" name="colBt190Fin" value="${colDetail.colBt190 }" 
												            		min="0" max="${colDetail.colBt190 }" onchange="checkInput('colBt190', 7, this.min, this.max)">
										            		</td>
												            <td id="colBt190Point">${colDetail.colBt190 *7}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colBt190Fin" name="colBt190Fin" value="${colDetail.colBt190Fin }" 
												            		min="0" max="${colDetail.colBt190 }" onchange="checkInput('colBt190Fin', 7, this.min, this.max)">
										            		</td>
												            <td id="colBt190FinPoint">${colDetail.colBt190Fin *7}p</td>
										            	</c:otherwise>
										            </c:choose>
										        </tr>
										        <tr>
												    <td>400ml 이하</td>
												    <td>${colDetail.colBt400 }</td>
							                        <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colBt400" name="colBt400Fin" value="${colDetail.colBt400 }" 
												            		min="0" max="${colDetail.colBt400 }" onchange="checkInput('colBt400', 10, this.min, this.max)">
										            		</td>
												            <td id="colBt400Point">${colDetail.colBt400 *10}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colBt400Fin" name="colBt400Fin" value="${colDetail.colBt400Fin }" 
												            		min="0" max="${colDetail.colBt400 }" onchange="checkInput('colBt400Fin', 10, this.min, this.max)">
										            		</td>
												            <td id="colBt400FinPoint">${colDetail.colBt400Fin *10}p</td>
										            	</c:otherwise>
										            </c:choose>
												</tr>
										        <tr>
												    <td>1000ml 이하</td>
												    <td>${colDetail.colBt1000 }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colBt1000" name="colBt1000Fin" value="${colDetail.colBt1000 }" 
												            		min="0" max="${colDetail.colBt1000 }" onchange="checkInput('colBt1000', 13, this.min, this.max)">
										            		</td>
												            <td id="colBt1000Point">${colDetail.colBt1000 *13}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colBt1000Fin" name="colBt1000Fin" value="${colDetail.colBt1000Fin }" 
												            		min="0" max="${colDetail.colBt1000 }" onchange="checkInput('colBt1000Fin', 13, this.min, this.max)">
										            		</td>
												            <td id="colBt1000FinPoint">${colDetail.colBt1000Fin *13}p</td>
										            	</c:otherwise>
										            </c:choose>
												</tr>
										        <tr>
												    <td>1000ml 이상</td>
												    <td>${colDetail.colBt1000Up }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colBt1000Up" name="colBt1000UpFin" value="${colDetail.colBt1000Up }" 
												            		min="0" max="${colDetail.colBt1000Up }" onchange="checkInput('colBt1000Up', 35, this.min, this.max)">
										            		</td>
												            <td id="colBt1000UpPoint">${colDetail.colBt1000 *35}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colBt1000UpFin" name="colBt1000UpFin" value="${colDetail.colBt1000UpFin }" 
												            		min="0" max="${colDetail.colBt1000Up }" onchange="checkInput('colBt1000UpFin', 35, this.min, this.max)">
										            		</td>
												            <td id="colBt1000UpFinPoint">${colDetail.colBt1000UpFin *35}p</td>
										            	</c:otherwise>
										            </c:choose>
												</tr>
												<tr>
										            <th>종이</th>
										            <td></td>
										            <td>${colDetail.colPaper }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colPaper" name="colPaperFin" value="${colDetail.colPaper }" 
												            		min="0" max="${colDetail.colPaper }" onchange="checkInput('colPaper', 500, this.min, this.max)">
										            		</td>
												            <td id="colPaperPoint">${colDetail.colPaper *500}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colPaperFin" name="colPaperFin" value="${colDetail.colPaperFin }" 
												            		min="0" max="${colDetail.colPaper }" onchange="checkInput('colPaperFin', 500, this.min, this.max)">
										            		</td>
												            <td id="colPaperFinPoint">${colDetail.colPaperFin *500}p</td>
										            	</c:otherwise>
										            </c:choose>
										        </tr>
												<tr>
										            <th>플라스틱</th>
										            <td></td>
										            <td>${colDetail.colPlastic }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colPlastic" name="colPlasticFin" value="${colDetail.colPlastic }" 
												            		min="0" max="${colDetail.colPlastic }" onchange="checkInput('colPlastic', 20, this.min, this.max)">
										            		</td>
												            <td id="colPlasticPoint">${colDetail.colPlastic *20}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colPlasticFin" name="colPlasticFin" value="${colDetail.colPlasticFin }" 
												            		min="0" max="${colDetail.colPlastic }" onchange="checkInput('colPlasticFin', 20, this.min, this.max)">
										            		</td>
												            <td id="colPlasticFinPoint">${colDetail.colPlasticFin *20}p</td>
										            	</c:otherwise>
										            </c:choose>
										        </tr>
												<tr>
										            <th>캔</th>
										            <td></td>
										            <td>${colDetail.colCan }</td>
										            <c:choose>
										            	<c:when test="${empty colDetail.colResult }">
												            <td>
												            	<input type="number" id="colCan" name="colCanFin" value="${colDetail.colCan }" 
												            		min="0" max="${colDetail.colCan }" onchange="checkInput('colCan', 50, this.min, this.max)">
										            		</td>
												            <td id="colCanPoint">${colDetail.colCan *50}p</td>
										            	</c:when>
										            	<c:otherwise>
												            <td>
												            	<input type="number" id="colCanFin" name="colCanFin" value="${colDetail.colCanFin }" 
												            		min="0" max="${colDetail.colCan }" onchange="checkInput('colCanFin', 50, this.min, this.max)">
										            		</td>
												            <td id="colCanFinPoint">${colDetail.colCanFin *50}p</td>
										            	</c:otherwise>
										            </c:choose>
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
					                        <c:choose>
			                        		<c:when test="${empty colDetail.colRejection }">
												<textarea name="colRejection" placeholder="반려사유를 입력하세요"></textarea>
			                        		</c:when>
			                        		<c:otherwise>
												<textarea name="colRejection">${colDetail.colRejection }</textarea>
			                        		</c:otherwise>
			                        		</c:choose>
										</div>
										<div id="btnDiv">
											<c:choose>
												<c:when test="${empty colDetail.colResult }">
													<button type="submit" id="collectionBtn" class="btnStyle">수거완료</button>
													<a href="col-management?colStatus=수거진행중" class="btnStyle">목록으로</a>
												</c:when>
												<c:otherwise>
													<button type="submit" id="modifyBtn" class="btnStyle">저장</button>
												</c:otherwise>
											</c:choose>
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
	
	//수거 완료 버튼
	var collectionBtn = document.getElementById('collectionBtn');
	if(collectionBtn) {
		collectionBtn.addEventListener("click", function() {
			confirmAlert = confirm("수거를 완료하시겠습니까?");
			if(confirmAlert) {
				window.location.href = 'col-management?colStatus=수거진행중';
			} else {
				event.preventDefault();
				window.location.href = 'col-modify-mgt?colNum=${colDetail.colNum}';
			}
		})
	}

	//저장 버튼 (수정 폼일때)
	var modifyBtn = document.getElementById('modifyBtn');
	if(modifyBtn) {
		modifyBtn.addEventListener("click", function() {
			confirmAlert = confirm("변경된 내용을 저장하시겠습니까?");
			if(confirmAlert) {
				window.location.href = 'col-completion?colNum=${col.colNum}';
			} else {
				event.preventDefault();
				window.location.href = 'col-completion?colNum=${col.colNum}';
			}
		})
	}
	
	//수거수량 변경시
	function checkInput(inputId, pointNum, min, max) {
		var input = document.getElementById(inputId);
        var inputVal = parseInt(input.value);
        
        if (inputVal < min || inputVal > max) {
            alert('신청수량 범위를 벗어났습니다');
            input.value = max;
            return;
        }
        updatePoints(inputId, pointNum);
	}
	
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
    
    //input태그 입력 후 엔터 누를시 폼 전송 막기
    document.addEventListener('keydown', function(event) {
   	  if (event.keyCode === 13) {
   	    event.preventDefault();
   	  };
   	}, true);
	
</script>
</body>
</html>