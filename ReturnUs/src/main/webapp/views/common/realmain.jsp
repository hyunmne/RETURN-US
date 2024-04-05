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
            filter: blur(5px); /* 흐린 효과를 줍니다. */
        }
</style>
</head>
<body class="noto-sans">
<%@include file="/views/common/header.jsp" %>

<div class="container-fluid py-5 mb-5" style="background-color:#fefcf7; margin-top:100px">
	<div class="container">
		<div class="row g-5 align-items-center">
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
                      <div class="carousel-inner" role="listbox">
                          <div class="carousel-item active rounded">
                              <img src="./resources/img/earth.png" class="blurry-image img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                              <a href="#" class="btn px-4 py-2 text-white rounded">Earth</a>
                          </div>
                          <div class="carousel-item rounded">
                              <img src="./resources/img/earth.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                              <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                          </div>
                      </div>
                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                      </button>
                      
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                      </button>
                  </div>
              </div>
          </div>
	</div>
</div>

        
<%@include file="/views/common/footer.jsp" %>
</body>
</html>