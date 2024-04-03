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
	min-height: auto;
}
#insertDiv {
	width:80%;
	padding:10px;
}
#garo {
	display:flex;
	align-items:center;
	flex-direction:row;
	height:50px;
	justify-content:center;
	padding: 60px 20px; 
	margin: 0px 30px;
}
#info {
	text-align : right;
	color : #3E6D10;
	text-decoration:underline;
	padding-bottom:10px;
}
.fa-genderless{
	padding:0px 10px;
	font-size:small;
}
.selected {
	background-color: #D4E0C8;
}
table {
	width: 100%; /* 테이블의 너비를 조정할 수 있습니다. */
	border-collapse: collapse;
	background-color: #F3F8EE;
	color:black;
}
td {
	border: 1px solid black;
	text-align: center;
	padding: 10px;
}
.rounded-input {
        border-radius: 5px; /* 원하는 반지름 값을 설정합니다. */
        border: 1px solid #ccc; /* 테두리 스타일을 지정합니다. */
        padding: 5px 10px; /* 내부 여백을 지정합니다. */ 
        box-sizing: border-box; /* 테두리와 내부 여백을 포함한 요소의 전체 크기를 지정합니다. */
    }
.card ul{
list-style: none; 
font-weight: normal; 
font-size: smaller; 
color:gray; 
padding-left:23px; 
margin-bottom:5px
} 
.title {
	display:flex;
	align-items:center;
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
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/sideBar.jsp"%>
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
									<span style="color:black;"><b>2-2. 포인트 환급 대상 항목 수량 기입</b></span>
								</div>
								<div class="col-12 d-flex" style="padding:35px 40px 30px;">
									<div class="col-3 d-flex justify-content-center" style="border-right:2px dashed #3E6D10">
										<div class="card" id="insertDiv">
											<h5 class="noto-sans" style="text-align:center; color:#3E6D10; padding-bottom:5px;">추가된 항목</h5>
											<div style="font-size:large; color:black;">
												<div class="title" id="paperCnt" ><i class="fas fa-genderless"></i>종이류</div>
												<div class="title" id="canCnt"><i class="fas fa-genderless"></i>캔류</div>
												<div class="title"><i class="fas fa-genderless"></i>병류</div>
														<ul >
															<li id="bt190Cnt">~ 190ml</li>
															<li id="bt400Cnt">~ 400ml</li>
															<li id="bt1000Cnt">~ 1000ml</li>
															<li id="bt1000UpCnt">1L 이상</li>
														</ul>
												<div class="title" id="plasticCnt"><i class="fas fa-genderless"></i>플라스틱</div>
												<div class="title" id="paperPackCnt"><i class="fas fa-genderless"></i>종이팩</div>
												<div class="title"><i class="fas fa-genderless"></i>페트병</div>
											    	<ul>
														<li id="ptBodyCnt">본품</li>
														<li id="ptLidCnt">뚜껑</li>
													</ul>
											</div>
										</div>
									</div>
									<div class="col-9 d-flex " style="flex-direction: column; padding:5px;">
										<div id="tableDiv" style="margin-left:30px; margin-bottom:30px; width:90%">
										<div id="info">
											<a href="javascript:;" data-bs-toggle="modal" data-bs-target="#getPointModal" style="color : #3E6D10;">
												<i class="fas fa-check-circle"></i>&nbsp;포인트 환급 대상 및 배출 가이드 
											</a>
										</div>
											<table>
											    <tr>
												    <td id="paper" style="border-right:1px solid #C3D2B2; border-bottom:1px solid #C3D2B2;" onclick="showEtcDiv()">종이류</td>
													<td id="bottle"style="border-right:1px solid #C3D2B2; border-bottom:1px solid #C3D2B2;" onclick="showBtDiv()">병류</td>
													<td id="can" style="border-bottom:1px solid #C3D2B2;" onclick="showEtcDiv()">캔류</td>
											    </tr>
											    <tr>
													<td id="plastic" style="border-right:1px solid #C3D2B2" onclick="showEtcDiv()">플라스틱</td>
													<td id="paperPack"style="border-right:1px solid #C3D2B2" onclick="showEtcDiv()">종이팩</td>
													<td id="pett" onclick="showPtDiv()">페트병</td>
											    </tr>
											</table>
										</div>
										
										<div id="noticeDiv" class="justify-content-center" style="margin:0px 50px; color: #3E6D10;">
											캔, 플라스틱, 종이팩은 <span style="color:#FF0000">갯수</span>로 계산하여 환급되며, 
											종이류는 <span style="color:#FF0000">kg</span> 단위로 계산하여 환급됩니다. <br>
											이 점 주의하여 신청해주시기 바랍니다. <br>
											포인트 환급 대상이 포함되지 않는 항목을 신청하실 경우 
											<a href="#" style="color:#3E6D10;text-decoration: underline;font-weight: bold;">여기</a>를 눌러 넘겨주세요.
										</div>
										<div id="chkDiv" class="d-flex" style="height:200px; align-items:center; ">
											
										</div>
									</div>
								</div>
								<div class="d-flex col-12" style="padding:0px 40px 50px;">
									<div class="d-flex col-6" style="justify-content:flex-start;"> 
										<h5 class="noto-sans"><a href="collect3" style="color:#3E6D10; text-decoration:underline;">이전</a></h5>
									</div>
									<div class="d-flex col-6" style="justify-content:flex-end;" onclick="nextBtn()"> 
										<h5 class="noto-sans"><a style="color:#3E6D10; text-decoration:underline;">다음</a></h5>
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


   <!-- 모달 -->
   <div class="modal fade" id="getPointModal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
<!--             modal header -->
            <div class="modal-header">
               <h5 class="modal-title noto-sans" >RETURN:US 포인트 환급 기준</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            
            <!--          모달 본문  -->
            <div class="modal-body" style="padding: 20px; max-height:400px; overflow-y: auto; ">
            	<a href="recycling-guide"></a>
               <p style="color:red">※ 배출 가이드에 따르지 않은 물건들은 포인트 지급 대상에서 제외됩니다.</p>
               <ul>
                   <li><b>종이류</b> - 무게 당 500p</li>
                   <span>
                     1. 물에 젖지 않게 해주세요. <br>
                     2. 테이프 등 다른 재질을 제거해주세요.<br>
                     3. 차곡차곡 쌓아서 배출해주세요. <br>
                   </span>
               </ul>
               <ul>
                   <li><b>캔류</b> - 개당 50p</li>
                   <span>
                     1. 내용물을 비워주세요. <br>
                     2. 물로 깨끗하게 씻어주세요.<br>
                     3. 담배 등 이물질을 넣지 않고 배출해주세요. <br>
                   </span>
               </ul>
               <ul>
                   <li><b>병류</b> - 용량 별 상이</li>
                   <span>
                  -  ~190ml : 70p, ~400ml : 100p <br>
                    &nbsp; ~1000ml : 130p, ~1L 초과 : 350p <br>
                     1. 물로 깨끗하게 씻어주세요. <br>
                     2. 유리병이 깨지지 않게 주의해주세요.<br>
                     3. 담배 등 이물질을 넣지 않고 배출해주세요. <br>
                   </span>
               </ul>
               <ul>
                   <li><b>종이팩</b> - 개당 30p</li>
                   <span>
                     1. 물로 깨끗하게 씻어주세요.  <br>
                     2. 팩을 펼쳐주세요.<br>
                     3. 물기를 말려주세요. <br>
                     4. 차곡차곡 쌓아서 배출해주세요.
                   </span>
               </ul>
               <ul>
                   <li><b>플라스틱</b> - 개당 20p</li>
                   <span>
                     1. 물로 깨끗하게 씻어주세요. <br>
                     2. 라벨을 제거하여 배출해주세요.
                   </span>
               </ul>
               <ul>
                   <li><b>페트병</b> - 부분 지급</li>
                   <span>
                   	- 뚜껑 : 10p, 본체 : 50p <br>
                     1. 물로 깨끗하게 씻어주세요.<br>
                     2. 라벨을 제거해주세요. <br>
                     3. 물기를 말려주세요. <br>
                     4. 압축해서 배출해주세요. 
                   </span>
               </ul>
         
   
            </div>
            
<!--             modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>


<div id="etcDiv" style="display:none">
<div class="d-flex align-items-center" style="min-width:100%">
	<div id="garo" class="col-12" style="">
		<div id="title" class="d-flex col-4">
			<h5 class="noto-sans" style="margin-right: 50px">수량 / 무게</h5>
		</div>
		<div id="content" class="d-flex col-4 align-items-center">
			<input id="etcCnt" type="number" min="0" class="rounded-input" placeholder="0" style="width: 100px; text-align: right;" />&nbsp;&nbsp;
			<h6 class="noto-sans">개 / kg</h6>
		</div>
		<div id="btn" class="d-flex col-4 align-items-right">
			<input type="button" class="btn btn-success" onclick="getCntBtn()" value="등록하기" />
		</div>
	</div>
</div>
</div>

<div id="BtDiv" style="display:none">
<div class="d-flex" style="min-width:100%; flex-direction:column">
	<div id="garo" class="d-flex  align-items-left" >
		<div id="title" class="d-flex col-3">
			<h5 class="noto-sans" style="margin-right: 50px">용량</h5>
		</div>
		<div id="content" class="d-flex col-9">
			<label> 
				<input type="radio" name="group" id="bt190" style="accent-color: #198754;" value="" /> ~190ml &nbsp;&nbsp; 
				<input type="radio" name="group" id="bt400" style="accent-color: #198754;" value="" /> ~400ml &nbsp;&nbsp; 
				<input type="radio" name="group" id="bt1000"style="accent-color: #198754;" value="" /> ~1000ml &nbsp;&nbsp; 
				<input type="radio" name="group" id="bt1000Up" style="accent-color: #198754;" value="" /> 1000ml ~
			</label>
		</div>
	</div>
	<div id="garo" style="padding: 0px 20px;">
		<div id="title" class="col-3 d-flex">
			<h5 class="noto-sans">수량</h5>
		</div>
		<div id="content" class="d-flex col-6 align-items-center">
			<input id="btCnt" type="number" min="0" class="rounded-input" placeholder="0" style="width: 100px; text-align: right;" />&nbsp;&nbsp;
			<h6 class="noto-sans">개</h6>
		</div>
		<div id="btn" class="d-flex col-3 align-items-right">
			<input type="button" onclick="getCntBtn()" class="btn btn-success" value="등록하기" />
		</div>
	</div>
</div>
</div>

<div id="PtDiv" style="display:none">
<div class="d-flex" style="min-width:100%; flex-direction:column">
	<div id="garo" class="d-flex  align-items-left" >
		<div id="title" class="d-flex col-3">
			<h5 class="noto-sans" style="margin-right: 50px">구분</h5>
		</div>
		<div id="content" class="d-flex col-9">
			<label> 
				<input type="radio" name="group" id="ptLid" style="accent-color: #198754;" value="" /> 뚜껑 &nbsp;&nbsp;
				<input type="radio" name="group" id="ptBody" style="accent-color: #198754;" value="" /> 본체
			</label>
		</div>
	</div>
	<div id="garo" style="padding: 0px 20px;">
		<div id="title" class="col-3 d-flex">
			<h5 class="noto-sans">수량</h5>
		</div>
		<div id="content" class="d-flex col-6 align-items-center">
			<input type="number" min="0" id="ptCnt" class="rounded-input" placeholder="0" style="width: 100px; text-align: right;" />&nbsp;&nbsp;
			<h6 class="noto-sans">개</h6>
		</div>
		<div id="btn" class="d-flex col-3 align-items-right">
			<input type="button" onclick="getCntBtn()" class="btn btn-success" value="등록하기" />
		</div>
	</div>
</div>
</div>


<script>
function getCntBtn() {
    // 입력된 수량 가져오기
    var count;
    count = parseInt(document.getElementById("etcCnt").value) ? parseInt(document.getElementById("etcCnt").value) : 0;
    var selCelId = document.querySelector("td.selected").id;
    // 세부 항목이 있는 카테고리는 라디오 버튼의 선택 값을 가져옴
    
    if (selCelId === "pett") {
        selCelId = document.querySelector('input[type="radio"]:checked').id;
        count = parseInt(document.getElementById("ptCnt").value) ? parseInt(document.getElementById("ptCnt").value) : 0;
    } else if (selCelId === "bottle") {
        selCelId = document.querySelector('input[type="radio"]:checked').id;
        count = parseInt(document.getElementById("btCnt").value) ? parseInt(document.getElementById("btCnt").value) : 0;
    }
    var targetDiv = document.getElementById(selCelId + "Cnt");

    // 기존에 추가된 div가 있다면 숫자 부분만 업데이트
    var exSpan = targetDiv.querySelector("span"); // targetDiv의 첫번째 span 요소를 가르킴
    
    if (exSpan !== null) { // exSpan의 요소가 있으면 
        var exText = exSpan.textContent.trim(); // span의 텍스트를 공백 제거 해서 받음 > ㅁ개
        var exNum = parseInt(exText.match(/\d+/)[0]); // 텍스트에서 숫자만 골라냄 > 기존 수량 ㅁ 
//         var updateNum = exNum + count; // 기존 값과 새 입력 값을 더함
        exSpan.textContent = exText.replace(/\d+/, count); // 숫자였던 부분 자리를 updateNum으로 변경 
    } else {
    	var newSpan = document.createElement('span');
    	
    	newSpan.textContent = (selCelId === "paper") ? count + "kg" : count + "개";
    	newSpan.classList.add(selCelId+'Col')
        newSpan.style.cssText = "font-size: small; font-weight: bold; padding-left: 10px; color: red;";
        targetDiv.appendChild(newSpan);
    }
}

</script>

<!-- 누르는 셀에 따라 chkDiv 속 div 변경 -->
<script>
    function showEtcDiv() {
        document.getElementById("chkDiv").innerHTML = document.getElementById("etcDiv").innerHTML;
    }
    function showBtDiv() {
        document.getElementById("chkDiv").innerHTML = document.getElementById("BtDiv").innerHTML;
    }
    function showPtDiv() {
        document.getElementById("chkDiv").innerHTML = document.getElementById("PtDiv").innerHTML;
    }
    window.onload = function() {
        // 초기 설정: chkDiv에 etcDiv 표시
        showEtcDiv();
        document.getElementById('paper').click();
    };
</script>

<!-- 테이블 셀 눌렀을 때 색 변경 -->
<script>
    var prevCellId = null; // 이전에 클릭된 셀의 id를 저장하기 위한 변수

    function changeCell(cellId) {
    	var curCell = document.getElementById(cellId);
        // 이전에 클릭된 셀이 있다면 그 셀의 색상을 원래대로 변경하고 selected 클래스 제거
        if (prevCellId !== null) {
            var prevCell = document.getElementById(prevCellId);
            prevCell.classList.remove('selected');
        }

        // 현재 클릭된 셀에 selected 클래스 추가
        curCell.classList.add('selected');
        prevCellId = cellId;
    }

    // 각 셀에 이벤트 리스너 추가
    var cells = document.getElementsByTagName('td');
    for (var i = 0; i < cells.length; i++) {
        cells[i].addEventListener('click', function() {
            changeCell(this.id);
        });
    }
</script>

<script>
// 9. input hidden의 데이터와 새로 입력 받은 데이터(수거물품수량)를 다시 input hidden으로 collect4 doPost로 보낸다.
function nextBtn() {
    // 폼 생성
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'collect4';

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

    addColValue('colPaper', 'paperCol'); // newSpan의 값에서 텍스트를 가지고 옴,,, 
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
</html>

