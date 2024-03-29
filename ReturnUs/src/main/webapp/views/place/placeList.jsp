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
#listDiv {
    width: 100%;
    border-collapse: collapse;
    margin: auto;
    margin-top: 15px;
    margin-left: 25px;
}
#search {
	width: 95%;
    margin-top: 20px;
    margin-left: 15px;
    display: flex;
}
#pageDiv {
	    margin-top: -30px;
    margin-bottom: 30px;
}
#pageDiv button {
    padding: 10px 16px;
    text-decoration: none;
    transition: 0.5s;
    border: 1px solid var(--bs-light);
    margin: 0 4px;
    background: var(--bs-white);
}
#pageDiv button:hover {
	color: white;
	background: #81c408;
}
#pageDiv a {
	border: 1px solid var(--bs-light);
}
.typeTitle {
	color: #59981A;
    font-size: medium;
    font-weight: 500;
    margin: 5px 0 -5px 30px
}
.imgStyle {
	width: 2.5%; 
	margin-right: 5px;
}
.placeBox {
	width: 47%;
    border-radius: 10px;
    display: inline-block;
    margin-right: 20px;
    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.3);
    padding: 20px;
    margin-bottom: 20px;
}
.placeTitle {
    font-size: smaller;
}
#selectRegion, #selectDistrict {
    width: 17%;
    border-radius: 10px;
    height: 35px;
    text-align: center;
    margin-left: 15px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$('#selectRegion').change(function() {
			//'지역' 선택 전에는 '구' 선택 막아놓기
			var region = document.getElementById("selectRegion");
			var district = document.getElementById("selectDistrict");
			var selectedRegion = region.value;
			
			var thisRegion = $(this).val();
			var plaDistrict = $("#selectDistrict");
			//선택한 '지역'에 해당하는 data-key 속성을 가진 '구'만 보이도록 설정
			plaDistrict.find('option').hide();
			plaDistrict.find('option[data-key="' + thisRegion + '"]').show();
		});
		
		//지역,구 선택 후에도 값이 계속 유지되도록 selected 속성 true로 설정
		$('#selectRegion').val('${plaRegion}').prop("selected",true);
		$("#selectRegion").trigger("change");
		$('#selectDistrict').val('${plaDistrict}').prop("selected",true);
		
		$('#selectDistrict').change(function() {
			getPlaceList(1);
		});
	});
	
	//페이징 처리 함수
	function getPlaceList(page) {
		var region = $('#selectRegion').val();
		var district = $("#selectDistrict").val();
		var type = $('#plaType').val();
		
		//조건에 따라 넘겨줄 파라미터 설정 후 get방식으로 url넘기기
		var url = `placeList?plaType=\${type}&page=\${page}`;
		if(region!=null && region!=0)
			url += `&plaRegion=\${region}`;
		if(district!=null && district!=0)
			url += `&plaDistrict=\${district}`;
		document.location.href = url;
	}

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
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/sideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">장소 검색</h3>
								<span style="color: #3E6D10;">지구를 지키기위한 한 걸음, ${plaType }의 장소를 검색해보세요!</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<div id="map" style="width:100%;height:350px;"></div>
								<input type="hidden" id="plaType" value="${plaType}">
								<input type="hidden" id="placeList" value="${placeList}">
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=915b6a231e6d1e690f36f1c4ac84bde8"></script>
								<script>
									var placeList =  JSON.parse('${placeListJson}');
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = { 
									        center: new kakao.maps.LatLng(placeList[0].plaLat, placeList[0].plaLong), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									var positions = [];
									
									placeList.forEach(function(place) {
										var position = {
												title: place.plaName,
												latlng: new kakao.maps.LatLng(place.plaLat, place.plaLong),
												addr: place.plaAddr
										}
										positions.push(position);
									})
									
									var type = $('#plaType').val();
									// 마커 이미지의 이미지 주소입니다
									var imageSrc = "";
									if(type == "재활용정거장") {
										imageSrc = "./resources/img/mark_recycle_shadow.png";
									} else if(type == "의류수거함") {
										imageSrc = "./resources/img/mark_clothes_shadow.png";
									} else {
										imageSrc = "./resources/img/mark_battery_shadow.png";
									}
									
									
									for(var i = 0; i < positions.length; i++) {
										// 마커 이미지의 이미지 크기 입니다
									    var imageSize = new kakao.maps.Size(24, 35);
										
									 // 마커 이미지를 생성합니다    
									    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
									 // 마커를 생성합니다
									    var marker = new kakao.maps.Marker({
									        map: map, // 마커를 표시할 지도
									        position: positions[i].latlng, // 마커를 표시할 위치
									        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
									        image : markerImage // 마커 이미지 
									    });
									    
									 var prevInfowindow = false;
									 // 마커에 클릭 이벤트를 등록합니다
									    (function(marker, position) {
								            kakao.maps.event.addListener(marker, 'click', function() {
								                // 이전에 열렸던 인포윈도우 있으면 닫기
								                if (prevInfowindow) {
								                    prevInfowindow.close();
								                }
								                // 새 인포위도우 열기
								                var infowindow = new kakao.maps.InfoWindow({
								                    content: '<div style="padding:5px;"><strong>' + position.title + '</strong><br>' 
								                    			+ position.addr + '</div>',
								                    removable: true
								                });
								                infowindow.open(map, marker);
								                prevInfowindow = infowindow;
								            });
								        })(marker, positions[i]);
									}
									
									// 모든 마커를 포함하는 지도 범위 얻기
									var bounds = new kakao.maps.LatLngBounds();
									
									for(var i = 0; i < positions.length; i++) {
										bounds.extend(positions[i].latlng);
									}
									
									map.setBounds(bounds);
									
								</script>
								<hr style="margin-top: 30px;">
								<div class="typeTitle">
									<c:choose>
										<c:when test="${plaType eq '재활용정거장'}">
											<img class="imgStyle" src="./resources/img/icon_recycle.png">
											${plaType }
										</c:when>										
										<c:when test="${plaType eq '의류수거함'}">
											<img class="imgStyle" src="./resources/img/icon_clothe.png">
											${plaType }
										</c:when>										
										<c:when test="${plaType eq '폐건전지수거함'}">
											<img class="imgStyle" src="./resources/img/icon_battery.png">
											${plaType }
										</c:when>										
									</c:choose>
								</div>
								<div id="search">
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
								                <option value="${district}" data-key="${place.key}" style="display: none">${district}</option>
								            </c:forEach>
										</c:forEach>
									</select>
									<p style="margin-left: auto;margin-bottom: auto;margin-top: auto;font-size: 15px;">총 ${countByType }개의 검색 결과가 있습니다</p>
								</div>
								<div id="listDiv">
									<c:forEach items="${placeList }" var="places" varStatus="loop">
										<div class="placeBox">
											<div class="placeTitle">
												<b style="font-size: medium;">${places.plaName }</b> - ${places.plaRegion} ${places.plaDistrict }
											</div>
											<div class="placeContent">
												${places.plaAddr }
											</div>
										</div>
										<c:if test="${loop.index % 2 == 1 }">
											<br>
										</c:if>
									</c:forEach>
								</div>
								<div id="pageDiv" class="col-12">
                                       <div class="pagination d-flex justify-content-center mt-5">
                                       	<c:choose>
											<c:when test="${pageInfo.curPage == 1 }">
												<a class="rounded">&lt;</a>
											</c:when>
											<c:otherwise>
												<a href="placeList?plaType=${plaType }&page=${pageInfo.curPage-1 }" class="rounded">&lt;</a>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
											<c:choose>
												<c:when test="${i == pageInfo.curPage }">
													<button onclick="getPlaceList(${i});" class="rounded" style="background: #81c408;color: white;">${i}</button>
												</c:when>
												<c:otherwise>
													<button onclick="getPlaceList(${i});" class="rounded">${i}</button>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${pageInfo.curPage == pageInfo.allPage }">
												<a class="rounded">&gt;</a>
											</c:when>
											<c:otherwise>
												<a href="placeList?plaType=${plaType }&page=${pageInfo.curPage+1 }" class="rounded">&gt;</a>
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