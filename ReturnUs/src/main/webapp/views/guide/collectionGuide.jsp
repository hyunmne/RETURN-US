<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>포인트안내</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		p {
			margin: 0px 0px 8px 0px;
			color: #3D550C;
		}
		h4 {
			color: #3D550C;
		}
		h6 {
			color: #3D550C;
			font-weight: bold;
		}
		.box {
			height: 150px;
			width: 150px;
			border-radius: 20px;
			font-size: 0.9em;			
			display:table-cell;
			vertical-align:middle;
			box-shadow: 0px 0px 10px #ACACAC;
		}
		.notice {
			text-align: left;
		}
		#last {
			color: #FFFFFF;
		}
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
		
		#guide{
			box-shadow: 0px 0px 10px #dbdbdb;
			border:0 solid black;
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
								<h3 class="noto-sans" style="color: #3E6D10;">방문수거 안내</h3>
								<span style="color: #3E6D10;">수거 절차와 비용을 안내해드립니다</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->						  	
							<div id="sm" class="card">
								<!-- grid start -->
								<h4>수거 절차</h4><br>
								<div class="container text-center">
									<div class="row">
										<div class="col-sm-1"></div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#F9FDDD">
								    			<p>준비 STEP 1</p>
								    			<h6>내용물 비우기<br>비닐 제거</h6>
								    		</div>									    		
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#F5FBBE">
								    			<p>준비 STEP 2</p>
								    			<h6>깨끗이<br>세척하기</h6>
								    		</div>
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#F0F99E">
								    			<p>준비 STEP 3</p>
								    			<h6>건조하고<br>부피 줄이기</h6>
								    		</div>
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#ECF87F">
								    			<p>준비 STEP 4</p>
								    			<h6>모아서<br>포장하기</h6>
								    		</div>
								    	</div>
								    	<div class="col-sm-2"></div>
								    	<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
								    	<div class="col-sm-1"></div>
								    	<div class="col-sm-2"></div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#D4E5C4">
									    		<p>STEP 1</p>
									    		<h6>박스 포장</h6>
									    		<p>보낼 수량에 맞는<br>박스 준비 및 포장</p>
									    	</div>
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#ABCB8B">
									    		<p>STEP 2</p>
									    		<h6>수거 신청</h6>
									    		<p>방문 택배 상품을<br>결제해주세요</p>
									    	</div>
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#82B153">
									    		<p>STEP 3</p>
									    		<h6>방문 수거</h6>
									    		<p>포장한 박스를<br>문 앞에 놓아주세요</p>
									    	</div>
								    	</div>
								    	<div class="col-sm-2">
								    		<div class="box" style="background-color:#59981A">
									    		<p id="last">STEP 4</p>
									    		<h6 id="last">수거 완료</h6>
									    		<p id="last">품목 수량만큼<br>포인트 적립</p>
									    	</div>
								    	</div>
								    	<div class="col-sm-1"></div>
									</div>
								</div><br><br>
								<!-- grid end -->
								<!-- price guide start -->
								<h4>수거 비용</h4><br>
								<div class="container text-center">
									<div class="row">
										<div class="col-4">
									    	<img src='<c:url value="/resources/img/box.png"/>' alt="box" />
									    </div>
									    <div class="col-7">
									    	<table class="table">
											  <thead>
											    <tr>
											      <th scope="col">사이즈</th>
											      <th scope="col">가로 + 세로 + 높이</th>
											      <th scope="col">중량</th>
											      <th scope="col">비용</th>
											    </tr>
											  </thead>
											  <tbody>
											    <tr>
											      <td>중</td>
											      <td>120cm 이하</td>
											      <td>10kg 이하</td>
											      <td>5000원</td>
											    </tr>
											    <tr>
											      <td>대</td>
											      <td>160cm 이하</td>
											      <td>20kg 이하</td>
											      <td>6000원</td>
											    </tr>											    
											  </tbody>
											</table><br>
											<ul class="notice">
												<li>물품은 꼭 박스에 넣어주세요</li>
												<li>박스의 크기와 중량 모두 확인해주세요</li>
												<li>사이즈 대 이상일 경우 수거가 불가능합니다</li>
											</ul>
									    </div>
									    <div class="col-1"></div>
									</div>
								</div>
									
								<!-- price guide end -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp" %>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>