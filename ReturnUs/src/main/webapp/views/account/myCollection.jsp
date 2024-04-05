<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Return:Us</title>
<style>	
	h4 {
		float:left;
	}
	button {
		float:right;
		border-radius: 20px;
	}
	.main-color-1 {
		color: #3E6D10;
	}
	.main-color-2 {
		color: #3D550C;
	}
	.col-form-label {
		font-weight: bold;
		color: #3D550C;		
		text-align: center;
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
	#left-text {
		float:left;
	}
	#information-board {
		border-radius: 20px;
	}
	#changeBtn {
		border-radius: 20px;
	}
	#colFormLabel {
		color: black;
	}
</style>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
					<%@include file="/views/common/accountSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div class=main-color-1 style="padding: 50px 0px 30px;">
								<h3 class="noto-sans main-color-1">신청 내역</h3>
								<span class="main-color-1"><!-- title --></span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<div class="row">
									<p><span>총 ${collectionCount}건의 신청내역이 있습니다. (</span><span style="color: #FB6714">수거준비중 ${collectionCountInPreparation}</span><span> / </span><span style="color: #40A23E">수거진행중 ${collectionCountInProgress}</span><span> / </span><span style="color: #3B83B7">수거완료 ${collectionCountFinished}</span> )</p>
								</div>
								<div class="row text-center mt-1 mb-5">
									<div class="col-12">
										<!-- table start -->
										<table class="table">
										  <thead>
										    <tr style="background-color:#f5f9f1">
										      <th scope="col">NO</th>
										      <th scope="col">신청번호</th>
										      <th scope="col">신청일</th>
										      <th scope="col">신청주소</th>
										      <th scope="col">상태</th>
										      <th scope="col">결과</th>
										    </tr>
										  </thead>
										  <tbody>
										  	<c:if test="${empty collectionList }">
										  		<tr>
										  			<td colspan="5">내역이 없습니다.</td>
										  		</tr>
										  	</c:if>
										  	<c:forEach items="${collectionList }" var="coll" varStatus="i">
										  		<tr onclick="location.href='col-detail?colNum=${coll.colNum}'" style="cursor: pointer">
										  		  <td>${i.count }</td>
											      <td>${coll.colNum }</td>
											      <td>${coll.colDate }</td>
											      <td>${coll.colAddr }</td>
											      <td>
											      	<c:choose>
												        <c:when test="${coll.colStatus eq '수거준비중'}">
												            <span style="color: #FB6714">${coll.colStatus}</span>
												        </c:when>
												        <c:when test="${coll.colStatus eq '수거진행중'}">
												            <span style="color: #40A23E">${coll.colStatus}</span>
												        </c:when>
												        <c:otherwise>
												            <span style="color: #3B83B7">${coll.colStatus}</span>
												        </c:otherwise>
												    </c:choose>
											      </td>
											      <td>
											      	<c:choose>
												        <c:when test="${coll.colResult eq '정상지급'}">
												            <span style="color: #4caf50">${coll.colResult}</span>
												        </c:when>
												        <c:when test="${coll.colResult eq '부분반려'}">
												            <span style="color: #f9aB25">${coll.colResult}</span>
												        </c:when>
												        <c:otherwise>
												            <span style="color: red">${coll.colResult}</span>
												        </c:otherwise>
												    </c:choose>
											      </td>
											    </tr>
										  	</c:forEach>								    
										  </tbody>
										</table>
										<!-- table end -->
										<!-- page start -->
										<div id="pageDiv" class="col-12">
		                                     <div class="pagination d-flex justify-content-center mt-5">
		                                     	<c:choose>
													<c:when test="${pageInfo.curPage == 1 }">
														<a class="rounded">&lt;</a>
													</c:when>
													<c:otherwise>
														<a href="my-collection?accId=${accId }&page=${pageInfo.curPage-1 }" class="rounded">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
													<c:choose>
														<c:when test="${i == pageInfo.curPage }">
															<a href="my-collection?accId=${accId }&page=${i }" class="rounded" style="background: #81c408;color: white;">${i}</a>
														</c:when>
														<c:otherwise>
															<a href="my-collection?accId=${accId }&page=${i }" class="rounded">${i}</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pageInfo.curPage == pageInfo.allPage }">
														<a class="rounded">&gt;</a>
													</c:when>
													<c:otherwise>
														<a href="my-collection?accId=${accId }&page=${pageInfo.curPage+1 }" class="rounded">&gt;</a>
													</c:otherwise>
												</c:choose>
		                                     </div>
		                                 </div>
										<!-- page end -->
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








	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>