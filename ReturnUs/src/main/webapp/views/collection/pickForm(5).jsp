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
#title {
	color: #3E6D10;
    padding: 20px 20px 30px;
    font-size: larger;
    font-weight: 800;
}
#pntInfo{
	 text-align:center; 
	 vertical-align: middle; 
	 color:black;
	 border-color:#c3d7af;
}
.info tr {
  display: block;
  float: left;
/*   padding-left: 20px; */
}

.info th, .info td {
  display: block;
  padding: 10px;
  color:black;
}
.dd {
display:flex; 
justify-content:space-between; 
padding:0px 20px 20px;  
width:100%;
align-items:center;
font-size:larger; font-weight:600;
}
input[type='number']::-webkit-outer-spin-button,
input[type='number']::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
}
</style>
   
</head>
    
<body class="noto-sans">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!-- 헤더 파일 include -->
<%@include file="/views/common/header.jsp" %>
<input id="accName" type="hidden" name="accName" value="<%= request.getParameter("accName") %>" />
<input id="accTel" type="hidden" name="accTel" value="<%= request.getParameter("accTel") %>" />
<input id="accPostCode" type="hidden" name="accPostCode" value="<%= request.getParameter("accPostCode") %>" />
<input id="accAddr" type="hidden" name="accAddr" value="<%= request.getParameter("accAddr") %>" />
<input id="accDetailAddr" type="hidden" name="accDetailAddr" value="<%= request.getParameter("accDetailAddr") %>" />
<input id="boxSize" type="hidden" name="boxSize" value="<%= request.getParameter("boxSize") %>" />

<input id="colPaper" type="hidden" name="colPaper" value="<%= request.getParameter("colPaper") %>" />
<input id="colCan" type="hidden" name="colCan" value="<%= request.getParameter("colCan") %>" />
<input id="colBt190" type="hidden" name="colBt190" value="<%= request.getParameter("colBt190") %>" />
<input id="colBt400" type="hidden" name="colBt400" value="<%= request.getParameter("colBt400") %>" />
<input id="colBt1000" type="hidden" name="colBt1000" value="<%= request.getParameter("colBt1000") %>" />
<input id="colBt1000Up" type="hidden" name="colBt1000Up" value="<%= request.getParameter("colBt1000Up") %>" />
<input id="colPlastic" type="hidden" name="colPlastic" value="<%= request.getParameter("colPlastic") %>" />
<input id="colPtLid" type="hidden" name="colPtLid" value="<%= request.getParameter("colPtLid") %>" />
<input id="colPtBody" type="hidden" name="colPtBody" value="<%= request.getParameter("colPtBody") %>" />
<input id="colPpack" type="hidden" name="colPpack" value="<%= request.getParameter("colPpack") %>" />

	<div class="container-fluid fruite py-5"
	
	
		style="margin: 38px 100px; width: 90%;">
		<div class="col-lg-12">
			<div class="row g-4">
				<div class="col-6"></div>
			</div>
			<div class="row g-4">
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/colSideBar.jsp"%>
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
							<div id="sm" class="card d-flex">
								<div class="col-12" style="padding-bottom:50px; border-bottom: 1px solid lightgray">
									<h3 class="noto-sans" style="color:#3E6D10;">STEP 03 기입 내용 확인하고 결제하기</h3>
									<span style="color: #3E6D10;">
										신청한 뒤엔 신청 내용을 수정할 수 없으니 꼼꼼하게 확인해주세요!
									</span>
								</div>	
								
								<div class="col-12">
									<div id="title">
										<i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;수거 물품 확인
									</div>
									<div id="content" style="padding:10px 40px;">
										<table class="table table-hover" id="pntInfo">
										   <thead style="background-color:#F5F9F2; font-size:large; padding:10px; ">
										    <tr>
										      <th scope="col">분류</th>
										      <th scope="col">소분류</th>
										      <th scope="col">현재 포인트</th>
										      <th scope="col">신청 개수</th>
										      <th scope="col">총합 포인트</th>
										    </tr>
										  </thead>
										  <tbody style="background-color:#FDFEFC">
										    <tr id="paper">
										      <td>종이류</td>
										      <td></td>
										      <td>500p</td>
										      <td>${colPaper }kg</td>
										      <td>${colPaper * 500}p </td>
										    </tr>
										    <tr id="can">
										      <td>캔류</td>
										      <td></td>
										      <td>50p</td>
										      <td>${colCan }개</td>
										      <td>${colCan * 50 }p</td>
										    </tr>
										    <tr id="bottle">
										      <td>병류</td>
										      <td>
										      	~190ml<br>
										      	~400ml<br>
										      	~1000ml<br>
										      	1L 이상<br>
										      </td>
										      <td>
										      	7p<br>
										      	10P<br>
										      	13P<br>
										      	35P<br>
										      </td>
										      <td>
										      	${colBt190}개<br>
										      	${colBt400}개<br>
										      	${colBt1000}개<br>
										      	${colBt1000Up}개<br>
										      </td>
										      <td>
										      	${colBt190 * 7}p<br>
										      	${colBt400 * 10}p<br>
										      	${colBt1000*13}p<br>
										      	${colBt1000Up*35}p<br>
										      </td>
										      
										    </tr>
										    <tr id="plastic">
										      <td>플라스틱</td>
										      <td></td>
										      <td>20p</td>
										      <td>${colPlastic }개</td>
										      <td>${colPlastic * 20 }p</td>
										    </tr>
										    <tr id="pett">
										      <td>페트병</td>
										      <td>뚜껑 <br> 본체</td>
										      <td>10p<br>50p</td>
										      <td>${colPtLid }개<br>${colPtBody }개</td>
										      <td>${colPtLid*10 }p<br>${colPtBody*50 }p</td>
										    </tr>
										    <tr id="paperPack">
										      <td>종이팩</td>
										      <td></td>
										      <td>30p</td>
										      <td>${colPpack }개</td>
										      <td>${colPpack*30 }p</td>
										    </tr>
										  </tbody>
										 </table>
									  <div style="display:flex; justify-content: center; font-size: x-large; align-items:center; padding:30px">
									  	${acc.accName } 님께 환급될 포인트는&nbsp;&nbsp;
									  	<h4 class="noto-sans" id="totalSum" style="margin:0px"></h4>&nbsp;&nbsp; 입니다.
									  </div>
									</div>
									
							<div class="col-12 d-flex" style="padding:20px 20px">
								<div class="col-6">
									<div id="title">
										<i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;신청 정보
									</div>
									<div id="content" style="padding:5px 40px; font-size:large;">
										<table style="width:100%;" class="info">
											<tr style="border-right:1px solid lightgray" class="col-3">
												<th>이름</th>
												<th>전화번호</th>
												<th>우편번호</th>
												<th>주소</th>
											</tr>
											<tr class="col-9" style="padding-left:10px">
												<td>${acc.accName }</td>
												<td>${acc.accTel }</td>
												<td><%= request.getParameter("accPostCode") %></td>
												<td><%= request.getParameter("accAddr") %>&nbsp;&nbsp;<%= request.getParameter("accDetailAddr") %></td>
											</tr>
										</table>
									</div>
								</div>
								
								<div class="col-6">
									<div id="title">
										<i class="fas fa-grip-lines-vertical"></i>&nbsp;&nbsp;결제하기
									</div>
									<div id="content" style="padding:5px 40px;">
										<div class="d-flex align-items-center" style="flex-direction:column; ">
										<div class="dd">
											<div>원가</div>								
											<div class="money" style="display:flex; align-items:center; ">
												<span id="colPost" style="font-weight:300; padding-right:10px">${boxSize }</span>원
											</div>								
										</div>
										<div class="dd" style="padding:0px 20px">
											<div >사용 가능 포인트</div>								
											<div class="money">
												<span id="accPnt" style="font-weight:300; padding-right:10px">${acc.accPnt }</span>원
											</div>								
										</div>
										<div class="dd" style="padding:0px 15px 20px; font-weight:400; font-size:medium; justify-content:flex-end; flex-direction:row;">
											1,000p 이상부터 사용 가능합니다.							
										</div>
										<div class="dd" style="padding:0px 20px;">
											<div>사용 포인트</div>								
											<div class="money">
												<input oninput="updateTotal()" type="number" id="usePnt" value="0" min="1000" max="${acc.accPnt }" style="width:140px; margin-right:10px; padding-right:5px; text-align:right">원
											</div>
										</div>
										<div class="dd" id="msg" style="display:none; padding:0px 15px; font-weight:400; font-size:medium; color:red; justify-content:flex-end; flex-direction:row;">
											포인트의 최소 사용 금액은 1000p 입니다.		
										</div>
										<div class="dd" id="msgPnt" style="display:none; padding:0px 15px; font-weight:400; font-size:medium; color:red; justify-content:flex-end; flex-direction:row;">
											보유 포인트보다 많은 금액을 입력하셨습니다.
										</div>
										
										<div class="dd" style="background-color:#f5f9f1; border-radius:15px; padding:20px; margin-top: 30px;  ">
											<div>총 결제 금액</div>								
											<div class="money">
												<span id="colPrice" style="font-weight:300; padding-right:10px">${boxSize }</span>원
											</div>								
										</div>
										
<!-- 										결제 버튼  -->
										<div style="padding:30px 10px 0px">
											<button onclick="requestPay()" class="btn btn-success" style="width:300px">결제하기</button>
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
			</div>
		</div>
	</div>



	<%@ include file="/views/common/footer.jsp" %>


<script>
// 11. hidden input 데이터를 다시 받아오고 다시 데이터를 담아 collect5 doPost로 이동해서 DB에 데이터를 저장한다. 

var totalAmount;
var totalSum;
var usePnt;
var accPnt; 

// 최종 결제 금액 계산하기 
async function updateTotal() {
    usePnt = parseInt(document.getElementById("usePnt").value); // 고객이 입력한 사용 포인트 값을 받아옴
    accPnt = parseInt(document.getElementById("accPnt").innerText);
    
    if (usePnt > accPnt) { // 사용포인트 > 보유 포인트 > 실행 ㄴㄴ 
    	document.getElementById("msgPnt").style.display="flex";
    } else {
    	document.getElementById("msgPnt").style.display="none";
    }
    	
    if (usePnt >= 1000 || usePnt === 0) {
        var colPost = parseInt(document.getElementById("colPost").innerText); // 원가
        totalAmount = colPost - usePnt; // 최종 결제 금액
        document.getElementById("colPrice").innerText = ""; // 기존 입력 값 제거 
        document.getElementById("colPrice").innerText = totalAmount; 
		document.getElementById("msg").style.display="none"; // 경고 문구 제거 
    } else {
		document.getElementById("msg").style.display="flex";
    }
	
}

// 결제 api 
function requestPay() {
  IMP.init('imp60400838'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid : 'merchant_'+new Date().getTime(),
    name : 'Return:Us 수거 신청',
    amount : $("#colPrice").text(), // 가격
    buyer_name: $("#accName").val(),
    buyer_tel: $("#accTel").val(),
    buyer_addr: $("#accAddr").val(), // accDetailAddr를 포함하지 않습니다.
    buyer_postcode: $("#accPostCode").val()
  }, function (rsp) { // callback
	  console.log(rsp);
      if (rsp.success) {
        // 결제 성공 시 로직
        let timerInterval;
        Swal.fire({
          icon:"success",	 	
          title: "결제 완료!",
          html: "<b></b>초 후에 메인으로 이동합니다.",
          timer: 3000,
          timerProgressBar: true,
          didOpen: () => {
            Swal.showLoading();
            const timer = Swal.getPopup().querySelector('b');
            const timerInterval = setInterval(() => {
              const remainingTime = Math.ceil(Swal.getTimerLeft() / 1000);
              timer.textContent = remainingTime;
            }, 100);
            Swal.getPopup().querySelector('#timer').textContent = Swal.getTimerLeft();
          },
          willClose: () => {
            clearInterval(timerInterval);
          }
        }).then((result) => {
          if (result.dismiss === Swal.DismissReason.timer) { // 모달이 타이머에 의해 닫혔을 때
            location.href="main"
            requestCol();
          }
        });
      } else { // 결제 실패 
        let timerInterval;
        Swal.fire({
          icon:"error",
          title: "결제 실패!",
          html: "실패 사유 : "+ rsp.error_msg + "<br> <b></b>초 후 결제 전으로 이동합니다.",
          timer: 3000,
          timerProgressBar: true,
          didOpen: () => {
            Swal.showLoading();
            const timer = Swal.getPopup().querySelector('b');
            const timerInterval = setInterval(() => {
              const remainingTime = Math.ceil(Swal.getTimerLeft() / 1000);
              timer.textContent = remainingTime;
            }, 100);
            Swal.getPopup().querySelector('#timer').textContent = Swal.getTimerLeft();
          },
          willClose: () => {
            clearInterval(timerInterval);
          }
        }).then((result) => {
          if (result.dismiss === Swal.DismissReason.timer) {
            console.log("I was closed by the timer");
          }
//           location.href="collect5"
        });
      }
  });
}


// 총합 포인트 계산
window.onload = function(){
	var tableRows = document.querySelectorAll('tbody tr'); // tbody안의 tr 태그 선택
	totalSum = 0; // 변수 초기화
	
	tableRows.forEach(function(row) { // 테이블 행(세로)를 순회하며 마지막 열의 값을 더함
	    var lastCell = row.querySelector('td:last-child'); // td의 마지막 행
	    if (lastCell !== null) {
            // 텍스트를 <br>로 분리하여 배열로 만듭니다.
            var values = lastCell.innerHTML.split('<br>');
            // 각 값을 처리하면서 총합을 계산합니다.
            values.forEach(function(value) {
                // 숫자로 변환하고 'p'를 제거하고 공백을 제거합니다.
                var numericValue = parseInt(value.replace('p', '').trim());
                // 숫자이면 총합에 더합니다.
                if (!isNaN(numericValue)) {
                    totalSum += numericValue;
                }
            });
        }
	    
	});
	document.getElementById('totalSum').textContent = totalSum+'p';
}

function requestCol() {
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

    function addColValue(name, idName) {
        var element = document.getElementById(idName);
        if (element !== null) {
            var cnt = element.value; // input 요소의 값은 value 속성을 통해 가져옵니다.
            addHiddenInput(name, cnt);
        } else {
            addHiddenInput(name, 0);
        }
    }

    addColValue('colPaper', 'colPaper');
    addColValue('colCan', 'colCan');
    addColValue('colBt190', 'colBt190');
    addColValue('colBt400', 'colBt400');
    addColValue('colBt1000', 'colBt1000');
    addColValue('colBt1000Up', 'colBt1000Up');
    addColValue('colPlastic', 'colPlastic');
    addColValue('colPtLid', 'colPtLid');
    addColValue('colPtBody', 'colPtBody');
    addColValue('colPpack', 'colPpack');
    
    addHiddenInput('colTotalPnt', totalSum);    
	addHiddenInput('colPrice', $("#colPrice").text());    
	addHiddenInput('colUsePnt', usePnt);    

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