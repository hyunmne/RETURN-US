<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Return:us</title>
    </head>

    <body class="noto-sans">
<%@include file="/views/common/header.jsp" %>

        <!-- 404 Start -->
        <div class="container-fluid py-5">
            <div class="container py-5 text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <i class="bi bi-exclamation-triangle display-1 text-secondary"></i>
                        <h1 class="display-1">404</h1>
                        <h1 class="mb-4">${errTitle }</h1>
                        <p class="mb-4">${errContent }</p>
                        <a class="btn border-secondary rounded-pill py-3 px-5" href="main">Go Back To Home</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->

<%-- 	<%@ include file="/views/common/footer.jsp" %> --%>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    </body>

</html>