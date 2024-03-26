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
	min-height:auto;
}
table {
            width: 50%; /* 테이블의 너비를 조정할 수 있습니다. */
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 10px;
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
									<span style="color:black;">2-2. 포인트 환급 대상 항목 수량 기입</span>
								</div>

								<div class="col-12 d-flex" style="padding:35px 40px 50px;">
									<div class="col-4 d-flex" style="background-color:skyblue;">
										<div class="card-body">
											기입 항목... 
										</div>
									</div>
									<div class="col-8 d-flex" style="background-color:pink;">
										<table>
										    <tr>
										        <th>열 1</th>
										        <th>열 2</th>
										        <th>열 3</th>
										    </tr>
										    <tr>
										        <td>데이터 1-1</td>
										        <td>데이터 1-2</td>
										        <td>데이터 1-3</td>
										    </tr>
										</table>
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



</html>