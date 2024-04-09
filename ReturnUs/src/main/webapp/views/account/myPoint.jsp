<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Return:Us</title>
<style>
h4 {
	float: left;
}

button {
	float: right;
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

#point-board {
	height: 150px;
	border-radius: 20px;
}

#left-text {
	float: left;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body class="noto-sans">

	<!-- 헤더 파일 include -->
	<%@include file="/views/common/header.jsp"%>




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
								<h3 class="noto-sans main-color-1">포인트 내역</h3>
								<span class="main-color-1">
									<!-- title -->
								</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<!-- profile start -->
								<br>
								<div class="container">
									<div class="row g-3 border align-items-center" id="point-board">
										<div class="col-1"></div>
										<div class="col-1 mt-0">
											<img src='<c:url value="/resources/img/point.png"/>' />
										</div>
										<div class="col-3">
											<h4 class="noto-sans">
												포인트&nbsp;&nbsp;
												<fmt:formatNumber type="number"
													pattern="###,###,###,###,###,###"
													value="${sessionScope.acc.accPnt }" />
												P
											</h4>
										</div>
										<div class="col-1"></div>
										<div class="col-6 text-center"
											style="border-left: solid 1px #dadada">
											<div class="form-check form-check-inline">
												<c:choose>
													<c:when test="${pointType=='received'}">
														<input class="form-check-input" type="radio"
															name="pointRadio" id="inlineRadio1" value="received"
															checked="checked"
															onclick="document.getElementById('receivedClick').click();">
													</c:when>
													<c:otherwise>
														<input class="form-check-input" type="radio"
															name="pointRadio" id="inlineRadio1" value="received"
															onclick="document.getElementById('receivedClick').click();">
													</c:otherwise>
												</c:choose>
												<label class="form-check-label" for="inlineRadio1">
													<a href="${path}/my-point?accId=${accId }&pointType=received"
													id="receivedClick">지급내역 보기</a>
												</label>
											</div>
											<div class="form-check form-check-inline">
												<c:choose>
													<c:when test="${pointType=='used'}">
														<input class="form-check-input" type="radio"
															name="pointRadio" id="inlineRadio2" value="used"
															checked="checked"
															onclick="document.getElementById('usedClick').click();">
													</c:when>
													<c:otherwise>
														<input class="form-check-input" type="radio"
															name="pointRadio" id="inlineRadio2" value="used"
															onclick="document.getElementById('usedClick').click();">
													</c:otherwise>
												</c:choose>
												<label class="form-check-label" for="inlineRadio2">
													<a href="${path}/my-point?accId=${accId }&pointType=used" id="usedClick">사용내역
														보기</a>
												</label>
											</div>
										</div>
									</div>
								</div>
								<br>
								<br>
								<!-- profile end -->
								<div class="row text-center mt-1 mb-5">
									<div class="col-12">
										<div class="row">
											<div class="col-1"></div>
											<div class="col-10">
												<!-- table start -->
												<table class="table">
													<thead>
														<tr style="background-color:#f5f9f1">
															<th scope="col">날짜</th>
															<th scope="col">신청번호</th>
															<th scope="col">포인트</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty pointList }">
															<tr>
																<td colspan="3">내역이 없습니다.</td>
															</tr>
														</c:if>
														<c:choose>
															<c:when test="${pointType=='received'}">
																<c:forEach items="${pointList }" var="coll">
																	<c:if test="${coll.colGetpntDt ne null && coll.colTotalPnt ne 0}">
																		<tr>
																			<td>${coll.colGetpntDt }</td>
																			<td>${coll.colNum }</td>
																			<td style="color: blue">+<fmt:formatNumber
																					type="number" pattern="###,###,###,###,###,###"
																					value="${coll.colTotalPnt }" /></td>
																		</tr>
																	</c:if>																	
																</c:forEach>
															</c:when>
															<c:when test="${pointType=='used'}">
																<c:forEach items="${pointList }" var="coll">
																	<c:if test="${coll.colUsePnt ne 0}">
																		<tr>
																			<td>${coll.colDate }</td>
																			<td>${coll.colNum }</td>
																			<td style="color: red">-<fmt:formatNumber
																					type="number" pattern="###,###,###,###,###,###"
																					value="${coll.colUsePnt }" /></td>
																		</tr>
																	</c:if>																	
																</c:forEach>
															</c:when>
															<c:otherwise>
																<c:forEach items="${pointList }" var="coll">
																	<c:choose>
																		<c:when test="${coll.colTotalPnt ne 0 && coll.colUsePnt ne 0 && coll.colGetpntDt ne null}">
																			<tr>
																				<td>${coll.colGetpntDt }</td>
																				<td>${coll.colNum }</td>
																				<td style="color: blue">+<fmt:formatNumber
																						type="number" pattern="###,###,###,###,###,###"
																						value="${coll.colTotalPnt }" /></td>
																			</tr>
																			<tr>
																				<td>${coll.colDate }</td>
																				<td>${coll.colNum }</td>
																				<td style="color: red">-<fmt:formatNumber
																						type="number" pattern="###,###,###,###,###,###"
																						value="${coll.colUsePnt }" /></td>
																			</tr>
																		</c:when>
																		<c:when test="${coll.colGetpntDt ne null && coll.colTotalPnt ne 0}">
																			<tr>
																				<td>${coll.colGetpntDt }</td>
																				<td>${coll.colNum }</td>
																				<td style="color: blue">+<fmt:formatNumber
																						type="number" pattern="###,###,###,###,###,###"
																						value="${coll.colTotalPnt }" /></td>
																			</tr>
																		</c:when>
																		<c:when test="${coll.colUsePnt ne 0}">
																			<tr>
																				<td>${coll.colDate }</td>
																				<td>${coll.colNum }</td>
																				<td style="color: red">-<fmt:formatNumber
																						type="number" pattern="###,###,###,###,###,###"
																						value="${coll.colUsePnt }" /></td>
																			</tr>
																		</c:when>
																		<c:otherwise>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
												<!-- table end -->
											</div>
											<div class="col-1"></div>
										</div>
										<!-- page start -->
										<div id="pageDiv" class="col-12">
											<div class="pagination d-flex justify-content-center mt-5">
												<c:choose>
													<c:when test="${pointType == 'received'}">
														<c:choose>
															<c:when test="${pageInfo.curPage == 1 }">
																<a class="rounded">&lt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&pointType=received&page=${pageInfo.curPage-1 }"
																	class="rounded">&lt;</a>
															</c:otherwise>
														</c:choose>
														<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
															<c:choose>
																<c:when test="${i == pageInfo.curPage }">
																	<a href="my-point?accId=${accId }&pointType=received&page=${i }"
																		class="rounded"
																		style="background: #81c408; color: white;">${i}</a>
																</c:when>
																<c:otherwise>
																	<a href="my-point?accId=${accId }&pointType=received&page=${i }"
																		class="rounded">${i}</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:choose>
															<c:when test="${pageInfo.curPage == pageInfo.allPage }">
																<a class="rounded">&gt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&pointType=received&page=${pageInfo.curPage+1 }"
																	class="rounded">&gt;</a>
															</c:otherwise>
														</c:choose>
													</c:when>
													
													<c:when test="${pointType == 'used'}">
														<c:choose>
															<c:when test="${pageInfo.curPage == 1 }">
																<a class="rounded">&lt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&pointType=used&page=${pageInfo.curPage-1 }"
																	class="rounded">&lt;</a>
															</c:otherwise>
														</c:choose>
														<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
															<c:choose>
																<c:when test="${i == pageInfo.curPage }">
																	<a href="my-point?accId=${accId }&pointType=used&page=${i }"
																		class="rounded"
																		style="background: #81c408; color: white;">${i}</a>
																</c:when>
																<c:otherwise>
																	<a href="my-point?accId=${accId }&pointType=used&page=${i }"
																		class="rounded">${i}</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:choose>
															<c:when test="${pageInfo.curPage == pageInfo.allPage }">
																<a class="rounded">&gt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&pointType=used&page=${pageInfo.curPage+1 }"
																	class="rounded">&gt;</a>
															</c:otherwise>
														</c:choose>
													</c:when>
													
													<c:otherwise>
														<c:choose>
															<c:when test="${pageInfo.curPage == 1 }">
																<a class="rounded">&lt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&page=${pageInfo.curPage-1 }"
																	class="rounded">&lt;</a>
															</c:otherwise>
														</c:choose>
														<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
															<c:choose>
																<c:when test="${i == pageInfo.curPage }">
																	<a href="my-point?accId=${accId }&page=${i }"
																		class="rounded"
																		style="background: #81c408; color: white;">${i}</a>
																</c:when>
																<c:otherwise>
																	<a href="my-point?accId=${accId }&page=${i }"
																		class="rounded">${i}</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:choose>
															<c:when test="${pageInfo.curPage == pageInfo.allPage }">
																<a class="rounded">&gt;</a>
															</c:when>
															<c:otherwise>
																<a
																	href="my-point?accId=${accId }&page=${pageInfo.curPage+1 }"
																	class="rounded">&gt;</a>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
												
												
												<%-- <c:choose>
													<c:when test="${pageInfo.curPage == 1 }">
														<a class="rounded">&lt;</a>
													</c:when>
													<c:otherwise>
														<a
															href="my-point?accId=${accId }&page=${pageInfo.curPage-1 }"
															class="rounded">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
													<c:choose>
														<c:when test="${i == pageInfo.curPage }">
															<a href="my-point?accId=${accId }&page=${i }"
																class="rounded"
																style="background: #81c408; color: white;">${i}</a>
														</c:when>
														<c:otherwise>
															<a href="my-point?accId=${accId }&page=${i }"
																class="rounded">${i}</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pageInfo.curPage == pageInfo.allPage }">
														<a class="rounded">&gt;</a>
													</c:when>
													<c:otherwise>
														<a
															href="my-point?accId=${accId }&page=${pageInfo.curPage+1 }"
															class="rounded">&gt;</a>
													</c:otherwise>
												</c:choose> --%>
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

	<%@ include file="/views/common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>