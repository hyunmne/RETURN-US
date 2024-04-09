<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Return:Us</title>
<style>
.blurry-image {
    filter: blur(5px); 
}
.circle {
  width: 110px; /* 원의 지름 */
  height: 110px; /* 원의 지름 */
  background-color: #d3d3d34d; /* 배경색 */
  border-radius: 50%; /* 동그란 모양을 만들기 위해 반지름을 50%로 설정 */
  display: flex;
  justify-content: center;
  align-items: center;
}
i {
  color:#286c2b;
}
.t{
  padding: 20px 30px;
  font-size: medium;
  width:80%;
}
.part{
	display:flex;
	align-items:center;
	padding:20px;
	height:150px;
}
.review {
	grid-column-gap: 0rem;
    grid-row-gap: 0rem;
/*     background-color: #fff; */
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
    padding: 80px;
    display: flex;
}
.review.small {
    grid-column-gap: 2.4rem;
    grid-row-gap: 2.4rem;
    flex-direction: row;
    justify-content: space-between;
    max-width: 1400px;
    height: 250px;
    margin-top: 100px;
}
.review-column {
    flex-direction: column; 
    justify-content: space-around; 
    display: flex; 
} 
.info{
	padding-left:20px; 
	font-size:medium;
}
.name {
	font-weight:bold; 
	font-size:large
}
.content{
	padding:30px 20px; 
	font-size:initial; 
	font-style:italic
}
.divider{
    background-color: #286c2b82; 
	display:block;
    width: 1px;
    height: auto;
    max-height: none;
    margin-top: 0;
    margin-bottom: 0;
    align-self: stretch;
    padding-bottom: 0;
    padding-left: 0;
}
.section {
    background-image: url("./resources/img/office.jpg");
    background-position: 0 0;
    background-size: cover;
    background-attachment: fixed;
    justify-content: center;
    align-items: center;
    height:450px;
    padding-top: 100px;
    padding-bottom: 100px;
    display: flex;
}
.box-center {
    text-align: center;
    flex-direction: column;
    justify-content: space-between;
    align-self: auto;
    align-items: center;
    width: 100%;
    max-width: 1140px;
    margin: 0 30px;
    padding-left: 0;
    padding-right: 0;
    display: flex;
    position: static;
    top: auto;
    bottom: auto;
    left: auto;
    right: auto;
}
.logoBackground {
	z-index: 0;
    position: absolute;
    top: 41%;
    right: -38%;
    width: 194%;
}
.imgOpacity {
	opacity: 0.9;
}
</style>
</head>
<body class="noto-sans">
<%@include file="/views/common/header.jsp" %>

<div class="container-fluid py-5 mb-5" style="background-color:#fefcf7; margin-top:100px">
	<div class="container">
		<div class="row g-5 align-items-center">
<!-- 			<img src="./resources/img/logoBackground.png"> -->
              <div class="col-md-12 col-lg-7">
                  <h4 class="noto-sans mb-3 text-secondary">일상 속 지구를 지키는 작은 발걸음</h4>
                  <h1 class="noto-sans mb-5 display-3 text-primary">리터너스와 함께 <br>시작해보세요!</h1>
                  <c:choose>
			           	<c:when test="${not empty acc.accId}">
					        <a href="collect1">
		                 	 <input type="button" class="btn btn-primary" style="width:150px; height:45px; color:#fefcf7" value="방문수거 신청하기">
		                  </a>
			           	</c:when>
			           	<c:otherwise>
			           		<a href="login">
		                 	 <input type="button" class="btn btn-primary" style="width:150px; height:45px; color:#fefcf7" value="방문수거 신청하기">
		                  </a>
			           	</c:otherwise>
		           </c:choose>
              </div>
              <div class="col-md-12 col-lg-5">
                  <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                      <div class="carousel-inner" role="listbox" style="z-index: 1;">
                          <div class="carousel-item active rounded">
                              <img src="./resources/img/plant.jpg" class="img-fluid w-100 h-100 bg-secondary rounded imgOpacity"  alt="Second slide">
<!-- 								<div style="padding: 100px;"> -->
<!-- 									<h3 class="noto-sans">방문수거</h3> -->
<!-- 									<span>하하하하하하하하하하하하ㅏ</span> -->
<!-- 								</div> -->
                          </div>
                          <div class="carousel-item rounded">
                              <img src="./resources/img/recycle1.jpg" class="img-fluid w-100 h-100 rounded imgOpacity" alt="Second slide">
<!--                               <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
<!-- 								<span>2. 크크크</span> -->
                          </div>
                          <div class="carousel-item rounded">
                              <img src="./resources/img/recycle2.jpg" class="img-fluid w-100 h-100 rounded imgOpacity" alt="Second slide">
<!--                               <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
<!-- 								<span>3. 아아아아</span> -->
                          </div>
                          <div class="carousel-item rounded">
                              <img src="./resources/img/recycle3.jpg" class="img-fluid w-100 h-100 rounded imgOpacity" alt="Second slide">
<!--                               <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a> -->
<!-- 								<span>4. 히히히히</span> -->
                          </div>
                      </div>
                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev" style="border: 0;background-color: transparent;">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
<!--                           <span class="visually-hidden">Previous</span> -->
                      </button>
                      
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next" style="border: 0;background-color: transparent;">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
<!--                           <span class="visually-hidden">Next</span> -->
                      </button>
	                  <img src="./resources/img/logoBackground.png" class="logoBackground imgOpacity">
                  </div>
              </div>
          </div>
	</div>
</div>


<div class="container-fluid py-5">
	<div class="d-flex align-items-center" style="padding:0px 300px;">
		<div class="col-lg-6">
			<h1 class="noto-sans">복잡한 분리수거와의 이별, <br> 편안한 일상 살기</h1>
		</div>
		<div class="col-lg-6" style="font-size:large">
			<span>일상에서 쓰레기 처리가 힘들었던 적 있나요? <br>
				커버링은 그 모든 걱정을 덜어주고 여러분의 소중한 시간을 찾아줍니다.</span>
		</div>
	</div>
</div>

<div class="container-fluid mb-5 d-flex" style="padding:50px 170px 50px 222px">
	<div class="col-lg-12 " style="display:flex; padding:50px 0px 0px 35px">
		<div class="col-lg-6"> 
	    	<div class="part">
	    		<div class="circle"><i class="far fa-trash-alt fa-4x"></i></div>
	    		<div class="t">
	    			<h3 class="noto-sans">번거로운 분리수거는 이제 그만</h3>
	    			<span>상자에 모두 담아서 문 밖에 두기만 하면 분리수거 끝!</span>
	    		</div>
	    	</div>
	    	<div class="part">
	    		<div class="circle "><i class="fas fa-recycle fa-4x"></i></div>
	    		<div class="t">
	    			<h3 class="noto-sans">사소한 움직임으로 지구를 지켜요</h3>
	    			<span>수거된 물품들은 리터너스에서 엄격한 처리를 통해 <br> 재활용이 됩니다</span>
	    		</div>
	    	</div>
		</div>
		<div class="col-lg-6">
	    	<div class="part" >
	    		<div class="circle"><i class="fas fa-history fa-4x"></i></div>
	    		<div class="t">
	    			<h3 class="noto-sans">24/7 원할 때면 언제든지</h3>
	    			<span>바쁜 일상 속, 골칫덩어리인 분리수거를 간단하게 도와드릴게요</span>
	    		</div>
	    	</div>
	    	<div class="part">
	    		<div class="circle"><i class="fas fa-people-carry fa-3x"></i></div>
	    		<div class="t">
	    			<h3 class="noto-sans">문 앞에 두세요</h3>
	    			<span>신청한 일자에 맞춰 리터너스가 집 앞까지 찾아가 수거합니다.</span>
	    		</div>
	    	</div>
		</div>
	</div>
</div>

<div class="container-fluid mb-5 py-5 review">
	<h1 class="noto-sans">“쓰레기 없이 생활 중인 얼리어답터들의 리뷰”</h1>
	<div class="review small">
		<div class="review-column">
			<div class="d-flex align-items-center">
				<img src="./resources/img/mimo3.jpg" style="width:120px">
				<div class="info">
					<div class="name">현빵이</div>
					<div>리터너스 이용 3년차</div>
				</div>
			</div>
			<div class="content">
			“재활용 분리배출 하기 어렵기도 하고 시간도 꽤 걸리는데 한번에 처리해주셔서 좋고! 팔쓰기 힘든 상황이라 무거운 물건 들고 내려가기 어려웠는데 넘 편합니다.”
			</div>
		</div>
		
		<div class="divider"></div>
		
		<div class="review-column">
			<div class="d-flex align-items-center">
				<img src="./resources/img/mimo2.jpg" style="width:120px">
				<div class="info">
					<div class="name">샘샘이</div>
					<div>리터너스 이용 2년차</div>
				</div>
			</div>
			<div class="content">
			“일단 너무너무 편하고, 분리수거라는 자체가 굉장하게 번거로운데 한번에 빠른수거 및 처리해주시는 부분이 참 편하고 더불어 부담스럽지않은 가격에 이용해볼수잇어 좋습니다.”
			</div>
		</div>
		
		<div class="divider"></div>
		
		<div class="review-column">
			<div class="d-flex align-items-center">
				<img src="./resources/img/mimo1.jpg" style="width:120px">
				<div class="info">
					<div class="name">안경잽이</div>
					<div>리터너스 이용 1년차</div>
				</div>
			</div>
			<div class="content">
			“냉장고 정리하는게 죽을만큼 싫었는데 예전부터 상상하던 수거 서비스가 나와서 너무 좋습니다 감사합니다ㅠㅠ 없어지면 안돼요 자취생 필수앱인것 같아요.”
			</div>
		</div>
	</div>
</div>

<section class="section mb-5">
	<div class="box-center">
		<h1 class="noto-sans" style="color:#fff">비즈니스 고객도 <br> 오피스, 빌딩, 이용 가능</h1>
		<div style="padding-top:20px">
			<span style="font-size:large; font-style:bold; color:#fff">일상은 집에서만 이루어지지 않으니까 업무 속 <br> 번거로운 정리도 리터너스에게 맡기세요.</span>
			<div style="padding-top:20px">
			<c:choose>
			           	<c:when test="${not empty acc.accId}">
					        <a href="collect1">
		                 	 <input type="button" class="btn btn-primary" style="width:150px; height:45px; color:#fefcf7" value="방문수거 신청하기">
		                  </a>
			           	</c:when>
			           	<c:otherwise>
			           		<a href="login">
		                 	 <input type="button" class="btn btn-primary" style="width:150px; height:45px; color:#fefcf7" value="방문수거 신청하기">
		                  </a>
			           	</c:otherwise>
		           </c:choose>
			</div>
		</div>
	</div>
</section>

<%@include file="/views/common/footer.jsp" %>
</body>
</html>