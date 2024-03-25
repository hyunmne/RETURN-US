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
		.nav-pills > .nav-item > .active{
			background-color: #F3F8EE;
		}
		
		.nav-pills > .nav-item > .nav-link{
			border-radius: 0px;
			border: 1px solid green;
			color: black;
		}
		.step-title{
			color: #2B5203
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
							<%@include file="/views/common/sideBar.jsp"%>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">분리배출 가이드</h3>
								<span style="color: #3E6D10;">가이드를 준수하면 포인트를 환급 받을 수 있습니다</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->						  	
							<div id="sm" class="card"><br>
								<!-- tab start -->
								<ul class="nav nav-pills nav-fill" id="pills-tab" role="tablist">
								  <li class="nav-item" role="presentation">
								    <button class="nav-link active" id="pills-paper-tab" data-bs-toggle="pill" data-bs-target="#pills-paper" type="button" role="tab" aria-controls="pills-paper" aria-selected="true">종이류</button>
								  </li>
								  <li class="nav-item" role="presentation">
								    <button class="nav-link" id="pills-can-tab" data-bs-toggle="pill" data-bs-target="#pills-can" type="button" role="tab" aria-controls="pills-can" aria-selected="false">캔류</button>
								  </li>
								  <li class="nav-item" role="presentation">
								    <button class="nav-link" id="pills-bottle-tab" data-bs-toggle="pill" data-bs-target="#pills-bottle" type="button" role="tab" aria-controls="pills-bottle" aria-selected="false">병류</button>
								  </li>								
								  <li class="nav-item" role="presentation">
								    <button class="nav-link" id="pills-pet-tab" data-bs-toggle="pill" data-bs-target="#pills-pet" type="button" role="tab" aria-controls="pills-pet" aria-selected="false">페트병</button>
								  </li>
								  <li class="nav-item" role="presentation">
								    <button class="nav-link" id="pills-pack-tab" data-bs-toggle="pill" data-bs-target="#pills-pack" type="button" role="tab" aria-controls="pills-pack" aria-selected="false">종이팩</button>
								  </li>
								  <li class="nav-item" role="presentation">
								    <button class="nav-link" id="pills-plastic-tab" data-bs-toggle="pill" data-bs-target="#pills-plastic" type="button" role="tab" aria-controls="pills-plastic" aria-selected="false">플라스틱</button>
								  </li>									  
								</ul><br><br><br><br><br>
								<div class="tab-content" id="pills-tabContent">
								  <div class="tab-pane fade show active" id="pills-paper" role="tabpanel" aria-labelledby="pills-paper-tab" tabindex="0">
								  	<!-- grid start -->
									<div class="container text-center">
									  <div class="row">
										<div class="col-4">
											<img src='<c:url value="/resources/img/paper1.png"/>' class="pills-img" alt="paper">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">물에 젖지않게 해주세요</p>
										</div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/paper2.png"/>' class="pills-img" alt="paper">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">테이프 등 다른 재질을 제거해주세요</p>
									    </div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/paper3.png"/>' class="pills-img" alt="paper">
									    	<h3 class="step-title">STEP 3</h3>
											<p class="step-content">차곡차곡 쌓아서 배출해주세요</p>
									    </div>									    						  
									  </div>
									</div>							
									<!-- grid end -->
								  </div>
								  <div class="tab-pane fade" id="pills-can" role="tabpanel" aria-labelledby="pills-can-tab" tabindex="0">
								  	<!-- grid start -->
									<div class="container text-center">
									  <div class="row">
										<div class="col-4">
											<img src='<c:url value="/resources/img/can1.png"/>' class="pills-img" alt="can">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">내용물을 비워주세요</p>
										</div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/can2.png"/>' class="pills-img" alt="can">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">물로 깨끗하게 씻어주세요</p>
									    </div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/can3.png"/>' class="pills-img" alt="can">
									    	<h3 class="step-title">STEP 3</h3>
											<p class="step-content">담배 등의 이물질을 넣지않고 배출해주세요</p>
									    </div>									    						  
									  </div>
									</div>											
									<!-- grid end -->
								  </div>
								  <div class="tab-pane fade" id="pills-bottle" role="tabpanel" aria-labelledby="pills-bottle-tab" tabindex="0">
								  	<!-- grid start -->
									<div class="container text-center">
									  <div class="row">
										<div class="col-4">
											<img src='<c:url value="/resources/img/bottle1.png"/>' class="pills-img" alt="bottle">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">물로 깨끗하게 씻어주세요</p>
										</div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/bottle2.png"/>' class="pills-img" alt="bottle">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">유리병이 깨지지않게 주의해주세요</p>
									    </div>
									    <div class="col-4">
									    	<img src='<c:url value="/resources/img/bottle3.png"/>' class="pills-img" alt="bottle">
									    	<h3 class="step-title">STEP 3</h3>
											<p class="step-content">담배 등의 이물질을 넣지않고 배출해주세요</p>
									    </div>									    						  
									  </div>
									</div>											
									<!-- grid end -->
								  </div>
								  <div class="tab-pane fade" id="pills-pet" role="tabpanel" aria-labelledby="pills-pet-tab" tabindex="0">
								  	<div class="container text-center">
									  <div class="row">
									    <div class="col-3">
											<img src='<c:url value="/resources/img/pet1.png"/>' class="pills-img" alt="pet">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">물로 깨끗하게 씻어주세요</p>
										</div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pet2.png"/>' class="pills-img" alt="pet">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">라벨을 제거해주세요</p>
									    </div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pet3.png"/>' class="pills-img" alt="pet">
									    	<h3 class="step-title">STEP 3</h3>
											<p class="step-content">물기를 말려주세요</p>
									    </div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pet4.png"/>' class="pills-img" alt="pet">
									    	<h3 class="step-title">STEP 4</h3>
											<p class="step-content">압축하여 보내주세요</p>
									    </div>
									  </div>								  
									</div>								
									<!-- grid end -->
								  </div>
								  <div class="tab-pane fade" id="pills-pack" role="tabpanel" aria-labelledby="pills-pack-tab" tabindex="0">
								  	<div class="container text-center">
									  <div class="row">
									    <div class="col-3">
											<img src='<c:url value="/resources/img/pack1.png"/>' class="pills-img" alt="pack">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">물로 깨끗하게 씻어주세요</p>
										</div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pack2.png"/>' class="pills-img" alt="pack">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">팩을 펼쳐주세요</p>
									    </div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pack3.png"/>' class="pills-img" alt="pack">
									    	<h3 class="step-title">STEP 3</h3>
											<p class="step-content">물기를 말려주세요</p>
									    </div>
									    <div class="col-3">
									    	<img src='<c:url value="/resources/img/pack4.png"/>' class="pills-img" alt="pack">
									    	<h3 class="step-title">STEP 4</h3>
											<p class="step-content">차곡차곡 쌓아주세요</p>
									    </div>
									  </div>								  
									</div>								
									<!-- grid end -->
								  </div>
								  <div class="tab-pane fade" id="pills-plastic" role="tabpanel" aria-labelledby="pills-plastic-tab" tabindex="0">
								  	<!-- grid start -->
									<div class="container text-center">
									  <div class="row">
										<div class="col-6">
											<img src='<c:url value="/resources/img/plastic1.png"/>' class="pills-img" alt="plastic">
											<h3 class="step-title">STEP 1</h3>
											<p class="step-content">물로 깨끗하게 씻어주세요</p>
										</div>
									    <div class="col-6">
									    	<img src='<c:url value="/resources/img/plastic2.png"/>' class="pills-img" alt="plastic">
									    	<h3 class="step-title">STEP 2</h3>
											<p class="step-content">라벨을 제거하여 배출해주세요</p>
									    </div>									    								    						  
									  </div>
									</div>											
									<!-- grid end -->
								  </div>
								</div>
								<!-- tab end -->
								
								
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