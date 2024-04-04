<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
		
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="./resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./resources/css/style.css" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
		<style>
			.noto-sans {
			  font-family: "Noto Sans KR", sans-serif;
			  font-optical-sizing: auto;
			  font-weight: <weight>;
			  font-style: normal;
			}
			.menu{
			  width:200px; 
			  text-align:center;
			}
		</style>
</head>


<body>


        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <div class="container-fluid fixed-top">
            <div class="topbar d-lg-block" style="background-color:#579934; margin: 0px 83px">
                    <c:choose>
                    	<c:when test="${not empty acc.accId}">
			                <div class="d-flex justify-content-between">
			                    <div class="top-info ps-2">
			                        <small class="me-2"><i class="fas fa-globe-americas text-secondary"></i> 
			                        <span class="text-white">&nbsp;&nbsp;리터너스와 지구를 지킨 지 ${acc.accJoinDays }일 째</span></small>
			                    </div>
			                    <div class="top-link pe-2">
				                        <a href="#" class="text-white"><i class="fas fa-user text-secondary"></i><small class="text-white mx-2">${acc.accName} 님</small>/</a>
				                        <a href="logout" class="text-white"><small class="text-white ms-2">로그아웃 </small></a>
			                    </div>
			                </div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="d-flex justify-content-between">
			                    <div class="top-info ps-2">
			                        <small class="me-2"><i class="fas fa-globe-americas text-secondary"></i> 
			                        <span class="text-white">리터너스와 함께 지구를 지켜주세요!</span></small>
			                    </div>
			                    <div class="top-link pe-2">
			                    		<i class="fas fa-user text-secondary"></i>
				                        <a href="login" class="text-white"><small class="text-white ms-2"> &nbsp;&nbsp;로그인 </small>&nbsp;/</a>
				                        <a href="join" class="text-white"><small class="text-white ms-2">회원가입 </small></a>
			                    </div>
			                </div>
                    	</c:otherwise>
                    </c:choose>
            </div>
            <div class="px-0" style="margin: 0px 83px">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
<!--                     <a href="index.jsp" class="navbar-brand"><h1 class="text-primary display-6">Return:us</h1></a> -->
                    <a href="main" class="navbar-brand"><img src="./resources/img/logo.png" style="width:180px" class="img-fluid" alt="logo"></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                        	<c:choose>
                        		<c:when test="${adminCheck eq 'admin' }">
		                            <a href="col-management?colStatus=수거준비중" class="nav-item nav-link menu"><b>신청내역 관리</b></a>
                        		</c:when>
                        		<c:otherwise>
		                            <a href="collect1" class="nav-item nav-link menu"><b>방문수거 신청</b></a>
                        		</c:otherwise>
                        	</c:choose>
                            <a href="recycling-guide" class="nav-item nav-link menu"><b>가이드</b></a>
                            <a href="placeList?plaType=재활용정거장" class="nav-item nav-link menu"><b>주변탐색</b></a>
                            <c:choose>
		                    	<c:when test="${not empty acc.accId}">
					                <a href="modify-profile" class="nav-item nav-link menu"><b>마이페이지</b></a>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a href="login" class="nav-item nav-link menu"><b>마이페이지</b></a>
		                    	</c:otherwise>
		                    </c:choose>
                            
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Single Page Header start -->
        <div class="container-fluid py-5">
        </div>
        <!-- Single Page Header End -->
        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./resources/lib/easing/easing.min.js"></script>
    <script src="./resources/lib/waypoints/waypoints.min.js"></script>
    <script src="./resources/lib/lightbox/js/lightbox.min.js"></script>
    <script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="./resources/js/main.js"></script>
    
    <script>
    
    $(document).ready(function() {
        
        var curURL = window.location.href;
        
        $('.menu').each(function() {
            var link = $(this).attr('href'); // 현재 URL link 반환
            
            if (link.includes('plaType=')) {
                var placeLink = link.split('plaType=')[0];
                if (curURL.includes(placeLink)) {
                    $(this).addClass('active');
                }
            } else {
                if (curURL.includes(link)) {
                    $(this).addClass('active');
                }
            }
        });
    });
    </script>
</body>

</html>