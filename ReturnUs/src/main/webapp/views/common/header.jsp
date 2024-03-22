<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		</style>
</head>


<body>


        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <div class="container-fluid fixed-top">
            <div class="container topbar d-none d-lg-block" style="background-color:#579934">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-2"><i class="fas fa-globe-americas text-secondary"></i> <a href="#" class="text-white">리터너스와 지구를 지킨 지 **일 째</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><i class="fas fa-user"></i><small class="text-white mx-2">박회원 님</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">회원가입 </small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">로그인 </small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">로그아웃 </small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
<!--                     <a href="index.jsp" class="navbar-brand"><h1 class="text-primary display-6">Return:us</h1></a> -->
                    <a href="index.jsp" class="navbar-brand"><img src="./resources/img/logo.png" style="width:180px" class="img-fluid" alt=""></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.jsp" class="nav-item nav-link active" style="width:200px; text-align:center;"><b>방문수거 신청</b></a>
                            <a href="shop-detail.jsp" class="nav-item nav-link" style="width:200px; text-align:center;"><b>가이드</b></a>
                            <a href="shop.jsp" class="nav-item nav-link" style="width:200px; text-align:center;"><b>주변탐색</b></a>
                            <a href="contact.jsp" class="nav-item nav-link" style="width:200px; text-align:center;"><b>마이페이지</b></a>
                        </div>
<!--                         <div class="d-flex m-3 me-0"> -->
<!--                             <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button> -->
<!--                             <a href="#" class="position-relative me-4 my-auto"> -->
<!--                                 <i class="fa fa-shopping-bag fa-2x"></i> -->
<!--                                 <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span> -->
<!--                             </a> -->
<!--                             <a href="#" class="my-auto"> -->
<!--                                 <i class="fas fa-user fa-2x"></i> -->
<!--                             </a> -->
<!--                         </div> -->
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Single Page Header start -->
        <div class="container-fluid py-5">
<!--             <h1 class="text-center text-white display-6">Shop</h1> -->
<!--             <ol class="breadcrumb justify-content-center mb-0"> -->
<!--                 <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--                 <li class="breadcrumb-item"><a href="#">Pages</a></li> -->
<!--                 <li class="breadcrumb-item active text-white">Shop</li> -->
<!--             </ol> -->
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
</body>

</html>