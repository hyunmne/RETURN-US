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

.accordion input[type="radio"] {
    display: none;
    width: 90%;
    height: 8%;
}
.accordion label {
    display: block;
    cursor: pointer;
    padding: 10px 20px;
    margin-bottom: 2px;
    border: 1px solid #D9D9D9;
}
.accordion div {
    display: none;
    padding: 10px 20px;
    background-color: #fff;
}
.accordion label:nth-child(odd) {
    background-color: #FAFCF8;
}
/* 짝수 번째 라벨 */
.accordion label:nth-child(even) {
    background-color: #FFFFFF;
}

	#emptyArea .btn {
		background: lightgray;
	}
	#emptyArea .select {
		background: lightblue;
	}
.Q{	
    color: rgb(26, 124, 255);
    margin-right: 2px;
    white-space: nowrap;	
    font-size: 28px;
    margin-right: 2%;
}
.A{
    font-size: 28px;
    line-height: 20px;
    letter-spacing: -0.2px;
    font-weight: 700;
    color: rgb(255, 0, 21);
    white-space: nowrap;
    flex-grow: 1; /* 텍스트가 확장되어 영역을 채우도록 설정 */
}    
.title{
	font-style: noto-sans;
	font-size: 28px;
	color: black;
} 
h4{
	display: inline;
	padding-bottom: 10px;
}
.content{


}
p{
	font-size: 20px;
	flex-grow: 1;
}
.redemp{
	color: red;
	
}

.button{
	width: 10%;
	border: solid 0px;
	padding: 8px 8px;
	font-weight: 600;
	font-size: 18px;
	line-height: 18px;
	background: #D1E7DD;
	flex: none;
	border-radius: 6px;
	color: #146C43;

}
#emptyArea { margin: auto; width: 800px; text-align: center; }
	#emptyArea a {
		display: inline-block;
		width: 20px;
		height: 20px;
		text-decoration: none;
	}
	#emptyArea .btn {
		background: lightgray;
	}
	#emptyArea .select {
		background: lightblue;
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
								<h3 class="noto-sans" style="color: #3E6D10;">자주 묻는 질문</h3>
								<span style="color: #3E6D10;">&nbsp;</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<c:if test="${admin eq 'admin' }">
									<a href="writefaq"><button class="button">글쓰기</button></a>
								</c:if>  								
								<c:forEach items="${faqList }" var="faq">
									<div class="accordion" style="padding-top: 1%">
										<input type="radio" name="accordion" >
										<label for="answer?faqNo=${faq.faqNo }"><span class="Q">Q</span><h4 class="noto-sans" >${faq.faqTitle }</h4>
										<c:if test="${admin eq 'admin' }">
										<a href="faqmodify?faqNo=${faq.faqNo }"><button class="button" style="float: right; ">수정</button></a>
										</c:if>
										<c:if test="${admin eq 'admin' }">
										<a href="deletefaq?faqNo=${faq.faqNo }"><button class="button" style="float: right; margin-right:1%;">삭제</button></a>
										</c:if>  
										</label>						
										<div><p><span class="A">A</span><br>
										<span class="content">${faq.faqContent }</span>
		 								</p></div>
		 							</div>
		 						</c:forEach>	
		 						<div id="emptyArea" style="margin-top: 10%; margin-bottom: 5%;">
									<a>&lt;</a>
										<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
											<c:choose>
												<c:when test="${i==pageInfo.curPage}">
													<a href="faq?page=${i}" class="select">${i }</a>
												</c:when>
												<c:otherwise>
													<a href="faq?page=${i}" class="btn">${i }</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									<a>&gt;</a>
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
document.addEventListener('DOMContentLoaded', function () {
    var labels = document.querySelectorAll('.accordion label');
    labels.forEach(function(label) {
        label.addEventListener('click', function() {
            var radio = this.previousElementSibling;
            var div = this.nextElementSibling;
            
            if (radio.checked) {
                radio.checked = false;
                div.style.display = 'none';
            } else {	
                var radios = document.querySelectorAll('input[type="radio"]');
                radios.forEach(function(radio) {
                    radio.checked = false;
                });
                var divs = document.querySelectorAll('.accordion div');
                divs.forEach(function(div) {
                    div.style.display = 'none';
                });
                radio.checked = true;
                div.style.display = 'block';
            }
        });
    });
});
</script>






</body>
</html>