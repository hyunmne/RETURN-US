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
#listDiv {
	width: 100%;
	text-align: center;
}
#listDiv table{
	width: 100%;
}
#listDiv table th{
	padding-bottom: 10px;
	border-bottom: solid 1px #3E6D10;
}
#listDiv table td{
	padding: 7px;
    border-bottom: 1px solid #ddd;
}
.collectionBtn {
	font-size: small;
    border-radius: 10px;
    background-color: #3D550C;
    color: white;
    padding: 5px 15px;
    border: none;
}
.collectionBtn:hover {
    background-color: #45a049;
}
#pageDiv {
    margin-top: -15px;
    margin-bottom: 30px;
}
#pageDiv a {
	border: 1px solid var(--bs-light);
}
#pageDiv a:hover {
	color: white;
	background: #81c408;
	border: 1px solid var(--bs-light);
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
					<%@include file="/views/common/colMgtSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">신청내역 관리</h3>
								<span style="color: #3E6D10;">리터너스가 집 앞까지 찾아가 손쉽게 분리수거 해드립니다!</span>
							</div>
							<div id="sm" class="card" style="height: 640px;">
								<div id="listDiv">
									<table>
										<thead>
											<tr>
												<th>NO</th>
												<th>신청번호</th>
												<th>신청자</th>
												<th>주소</th>
												<th>상태</th>
												<th>
													<c:if test="${colStatus eq '수거준비중' || colStatus eq '수거진행중' }">작업</c:if>
													<c:if test="${colStatus eq '수거완료' }">결과</c:if>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty collectionList }">
												<tr>
													<td colspan="6">현재 '${colStatus}' 상태의 내역이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach items="${collectionList }" var="col" varStatus="i">
												<tr>
													<td>${i.index + 1 }</td>
													<td>${col.colNum }</td>
													<td>${col.accName }</td>
													<td>${col.colAddr }</td>
													<td>${col.colStatus }</td>
													<td>
														<c:if test="${col.colStatus eq '수거준비중'}">
															<button class="collectionBtn" onclick="location.href='col-detail-mgt?colNum=${col.colNum}'">수거 진행</button>
														</c:if>
														<c:if test="${col.colStatus eq '수거진행중'}">
															<button class="collectionBtn" onclick="location.href='col-modify-mgt?colNum=${col.colNum}'">수거 완료</button>
														</c:if>
														<c:if test="${col.colStatus eq '수거완료'}">
															<c:choose>
														        <c:when test="${col.colResult eq '정상지급'}">
														            <span style="color: green">${col.colResult}</span>
														        </c:when>
														        <c:when test="${col.colResult eq '부분반려'}">
														            <span style="color: darkorange">${col.colResult}</span>
														        </c:when>
														        <c:otherwise>
														            <span style="color: red">${col.colResult}</span>
														        </c:otherwise>
														    </c:choose>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="pageDiv" class="col-12">
                                     <div class="pagination d-flex justify-content-center mt-5">
                                     	<c:choose>
											<c:when test="${pageInfo.curPage == 1 }">
												<a class="rounded">&lt;</a>
											</c:when>
											<c:otherwise>
												<a href="col-management?colStatus=${colStatus }&page=${pageInfo.curPage-1 }" class="rounded">&lt;</a>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
											<c:choose>
												<c:when test="${i == pageInfo.curPage }">
													<a href="col-management?colStatus=${colStatus }&page=${i }" class="rounded" style="background: #81c408;color: white;">${i}</a>
												</c:when>
												<c:otherwise>
													<a href="col-management?colStatus=${colStatus }&page=${i }" class="rounded">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${pageInfo.curPage == pageInfo.allPage }">
												<a class="rounded">&gt;</a>
											</c:when>
											<c:otherwise>
												<a href="col-management?colStatus=${colStatus }&page=${pageInfo.curPage+1 }" class="rounded">&gt;</a>
											</c:otherwise>
										</c:choose>
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