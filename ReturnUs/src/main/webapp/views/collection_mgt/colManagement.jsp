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
					<%@include file="/views/common/sideBar_colMgt.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">신청내역 관리</h3>
								<span style="color: #3E6D10;">리터너스가 집 앞까지 찾아가 손쉽게 분리수거 해드립니다!</span>
							</div>
							<div id="sm" class="card">
								${colStatus} 페이지
								<table>
									<thead>
										<tr>
											<th>NO</th>
											<th>신청번호</th>
											<th>신청자</th>
											<th>주소</th>
											<th>상태</th>
											<th>작업</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${collectionList }" var="col" varStatus="i">
											<tr>
<%-- 												<td>${i + 1 }</td> --%>
<%-- 												<td>${col.colNum }</td> --%>
<%-- 												<td>${col.accName }</td> --%>
<%-- 												<td>${col.co }</td> --%>
<!-- 												<td></td> -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
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