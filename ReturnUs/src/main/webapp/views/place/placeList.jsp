<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageList}" var="pageInfo"/>
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
#listDiv table {
    width: 100%;
    border-collapse: collapse;
    margin: auto;
    margin-top: 40px;
    border: 1px solid lightgray;
}

#pageDiv {
	margin: auto;
	width: 800px;
	text-align: center;
	margin-bottom: 50px;
}
#pageDiv a {
	display: inline-block;
	width: 20px;
	height: 20px;
	text-decoration: none;
}
#pageDiv .pageBtn {
	background: lightgray;
}
#pageDiv .pageSelect {
	background: lightblue;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	window.onload = function() {
		var district = document.getElementById("selectDistrict");
		district.disabled = true;
	};
	
	function getPlaceList(page) {
		var region = $('#selectRegion').val();
		var district = $("#selectDistrict").val();
		var type = $('#plaType').val();
		console.log("지역 : " + region);
		console.log("구 : " + district);
		console.log("타입 : " + type);
		
		var url = `placeList?plaType=\${type}&page=\${page}`;
		if(region!=null && region!=0)
			url += `&plaRegion=\${region}`;
		if(district!=null && district!=0)
			url += `&plaDistrict=\${district}`;
		document.location.href = url
	}
	
	$(function() {
		$('#selectRegion').change(function() {
			//'지역' 선택 전에는 '구' 선택 막아놓기
			var region = document.getElementById("selectRegion");
			var district = document.getElementById("selectDistrict");
			var selectedRegion = region.value;
			
			if(selectedRegion !== '0') {
				district.disabled = false;
			} else {
				district.disabled = true;
			}
			
			var thisRegion = $(this).val();
			var plaDistrict = $("#selectDistrict");

			plaDistrict.find('option').hide();
			plaDistrict.find('option[data-key="' + thisRegion + '"]').show();
			
		});
		
		$('#selectRegion').val('${plaRegion}').prop("selected",true);
		$('#selectDistrict').val('${plaDistrict}').prop("selected",true);
		
		$('#selectDistrict').change(function() {
			getPlaceList(1);
		});
	});

</script>
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
								<div id="map" style="width:100%;height:350px;"></div>
								<input type="hidden" id="plaType" value="${plaType}">
								<p><em>${plaType }</em></p> 
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=915b6a231e6d1e690f36f1c4ac84bde8"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = { 
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };
								
								var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								  
								// 마커를 표시할 위치입니다 
								var position =  new kakao.maps.LatLng(33.450701, 126.570667);
								
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								  position: position,
								  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								});
								
								// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
								// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								// marker.setClickable(true);
								
								// 마커를 지도에 표시합니다.
								marker.setMap(map);
								
								// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
								
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});
								
								// 마커에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, marker);  
								});
								</script>
								
								<div id="search" style="width:100%;">
									<select name="region" id="selectRegion" value=${plaRegion }>
										<option value="0"> 특별 / 광역시 </option>
										<c:forEach items="${regionCategory }" var="region">
											<option value="${region }">${region }</option>
										</c:forEach>
									</select>
									<select name="district" id="selectDistrict" value=${plaDistrict }>
										<option value="0"> 군,구 </option>
										<c:forEach items="${districtCategory }" var="place">
								            <c:forEach items="${place.value}" var="district">
								                <option value="${district}" data-key="${place.key}">${district}</option>
								            </c:forEach>
										</c:forEach>
									</select>
								</div>
								<div id="listDiv">
									<table>
										<thead class="table-light">
											<tr>
												<th>장소명</th>
												<th>주소</th>
												<th>유형</th>
												<th>특별/광역시</th>
												<th>군/구</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${plaTypeList }" var="places">
												<tr>
													<td>${places.plaName }</td>
													<td>${places.plaAddr }</td>
													<td>${places.plaType }</td>
													<td>${places.plaRegion }</td>
													<td>${places.plaDistrict }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="pageDiv">
									<c:choose>
										<c:when test="${pageInfo.curPage == 1 }">
											<a>&lt;</a>
										</c:when>
										<c:otherwise>
											<a href="placeList?plaType=${plaType }&page=${pageInfo.curPage-1 }">&lt;</a>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
										<c:choose>
											<c:when test="${i == pageInfo.curPage }">
												<button onclick="getPlaceList(${i});" class="pageSelect">${i }</button>
											</c:when>
											<c:otherwise>
												<button onclick="getPlaceList(${i});" class="pageBtn">${i }</button>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pageInfo.curPage == pageInfo.allPage }">
											<a>&gt;</a>
										</c:when>
										<c:otherwise>
											<a href="placeList?plaType=${plaType }&page=${pageInfo.curPage+1 }">&gt;</a>
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
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>