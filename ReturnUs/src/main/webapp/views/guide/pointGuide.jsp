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
  		.card-img-top {
  			position: relative;			
  		}
  		
  		.text-list {
  			text-align: left;
  			font-size: 0.85em;
  		}
  				
		.card-title-wh {
			position: absolute;
			top: 110px;
			left: 30px;
			color: white;
			text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;
			font-weight: bold;
		}
		
		.card-title {
			position: absolute;
			top: 110px;
			left: 30px;
			text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;
			font-weight: bold;
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
					<%@include file="/views/common/guideSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">포인트 지급 안내</h3>
								<span style="color: #3E6D10;">포인트 부여대상 및 지급기준을 안내해드립니다</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->						  	
							<div id="sm" class="card"><br>
								<!-- grid start -->
							  		<div class="container">
									  <div class="row">
									    <div class="col-md-4">
									    
									    <!-- card start -->
										<div id="guide" class="card" style="width: 17rem;">
										  	<img src='<c:url value="/resources/img/point-type4.png"/>' class="card-img-top" alt="can"/>
										  	<div class="card-body">
											    <h4 class="card-title-wh noto-sans">캔 (50P)</h4>
											    <ul class="text-list">
												  <li>캔 1개당 50P 지급</li>
												  <li>음료수캔, 통조림, 참치캔 가능</li>
												  <li>이물질이 묻어있는 캔 불가능</li>
												  <li>폭발 위험이 있는 캔종류 불가능</li>
												</ul>  
										  	</div>
										</div>
										<!-- card end -->
									    
									    </div>
									    <div class="col-md-4">
									    
									    <!-- card start -->
										<div id="guide" class="card" style="width: 17rem;">
										  	<img src='<c:url value="/resources/img/point-type5.png"/>' class="card-img-top" alt="paper">
										  	<div class="card-body">
											    <h4 class="card-title noto-sans">종이 (500P)</h4>
											    <ul class="text-list">
												  <li>종이 1kg 당 500P 지급</li>
												  <li>코팅된 종이 불가능</li>
												  <li>종이컵, 컵라면 용기 불가능</li>
												  <li>재사용 가능한 책 불가능</li>
												</ul>  
										  	</div>
										</div>
										<!-- card end -->
									    
									    </div>
									    <div class="col-md-4">
									    
										<!-- card start -->
										<div id="guide" class="card" style="width: 17rem;">
										  	<img src='<c:url value="/resources/img/point-type6.png"/>' class="card-img-top" alt="plastic">
										  	<div class="card-body">
											    <h4 class="card-title-wh noto-sans">플라스틱 (20P)</h4>
										    	<ul class="text-list">
												  <li>플라스틱 1개당 20P 지급</li>
												  <li>모든 플라스틱 가능</li>
												  <li>스티커 등이 부착된 플라스틱 불가능</li>
												  <li>이물질이 묻어있는 플라스틱 불가능</li>
												</ul>  
										  	</div>
										</div>
										<!-- card end -->									    
									    
									    </div>
									  </div><br><br>
									  <div class="row">
									    <div class="col-md-4">
									    
									    <!-- card start -->
											<div id="guide" class="card" style="width: 17rem;">
											  	<img src='<c:url value="/resources/img/point-type1.png"/>' class="card-img-top" alt="pet">
											  	<div class="card-body">
												    <h4 class="card-title noto-sans">페트병 (60P)</h4>
											    	<ul class="text-list">
													  <li>페트병 본체 1개당 50P 지급</li>
													  <li>페트병 뚜껑 1개당 10P 지급</li>
													  <li>섞이지 않은 단일 재질 페트만 가능</li>
													  <li>PETE, PET 종류 가능</li>
													  <li>세제통, 음료수병, 화장품용기 가능</li>
													  <li>뚜껑에 있는 다른재질 제거</li>
													</ul>						    
											  	</div>
											</div>
										<!-- card end -->
										
									    </div>
									    <div class="col-md-4">
									    
										<!-- card start -->
										<div id="guide" class="card" style="width: 17rem;">
										  	<img src='<c:url value="/resources/img/point-type2.png"/>' class="card-img-top" alt="paper-pack">
										  	<div class="card-body">
											    <h4 class="card-title noto-sans">종이팩 (50P)</h4>
											    <ul class="text-list">
												  <li>종이팩 1개당 50P 지급</li><br>
												  <li>우유, 주스 등의 일반 종이팩 수거</li><br>
												  <li>내부가 호일인 멸균팩 수거</li>					  
												</ul>  
										  	</div>
										</div>
										<!-- card end -->		    
							
									    </div>
									    <div class="col-md-4">
									    
									    <!-- card start -->
										<div id="guide" class="card" style="width: 17rem;">
										  	<img src='<c:url value="/resources/img/point-type3.png"/>' class="card-img-top" alt="bottle">
										  	<div class="card-body">
											    <h4 class="card-title-wh noto-sans">공병</h4>
											    <ul class="text-list">
												  <li>공병 190ml 이하 1개당 10P 지급</li>
												  <li>공병 400ml 이하 1개당 50P 지급</li>
												  <li>공병 1000ml 이하 1개당 100P 지급</li>
												  <li>공병 1000ml 이상 1개당 200P 지급</li>
												  <li>이물질이 묻어있는 공병 불가능</li>
												</ul>  
										  	</div>
										</div>
										<!-- card end -->
							
									    </div>
									  </div><br><br><br>
									</div>
							  	<!-- grid end -->
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