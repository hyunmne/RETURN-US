<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Return:Us</title>
<style>
   
.rounded-input {
        border-radius: 5px; /* 원하는 반지름 값을 설정합니다. */
        border: 1px solid #ccc; /* 테두리 스타일을 지정합니다. */
        padding: 10px 15px; /* 내부 여백을 지정합니다. */
        height: 50px;
        box-sizing: border-box; /* 테두리와 내부 여백을 포함한 요소의 전체 크기를 지정합니다. */
        margin:10px;
    }
#nextBtn {
        display: flex; /* 수평 정렬을 위해 flex로 설정 */
        padding: 10px;
        margin: 10px;
    }
</style>
   
</head>
    
<body class="noto-sans">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<form id="joinPick" method="post" action="joinPick" enctype="multipart">
		<div class="col-12 d-flex justify-content-center">
			<div style="width:700px;">
			
				<div class="col-11 d-flex" style="justify-content: center; padding-bottom:35px">
					<img src="./resources/img/avatar.jpg" id="profile" style="width:150px; height:150px; border-radius: 50%;">
				</div>
				
				<!-- 이름 div -->
				<div class="d-flex" style="align-items:center;">
					<div class="col-4 d-flex" style="padding:5px;">
						<h5 class="noto-sans" style="margin:10px;">이름</h5>
					</div>
					<div class="col-7 d-flex justify-content-center">
						<input type="text" class="rounded-input" placeholder="이름" name="pmName" id="pmName">
					</div>
				</div>
				
				<!-- 전화번호 div -->
				<div class="d-flex" style="align-items:center;">
					<div class="col-4 d-flex " style="padding:5px;">
						<h5 class="noto-sans" style="margin:10px;">전화번호</h5>
					</div>
					<div class="col-7 d-flex justify-content-center">
						<input type="text" class="rounded-input" placeholder="전화번호" name="pmTel" id="pmTel" onkeyup="autoHyphen(this)">
					</div>
				</div>
				
				<div class="d-flex" style="align-items:center;">
					<div class="col-4 d-flex" style="padding:5px;">
						<h5 class="noto-sans" style="margin:10px;">관할 지역</h5>
					</div>
					<div class="col-7 d-flex justify-content-center">
						<select class="rounded-input" id="pmRegion" name="pmRegion" style="width:247px;">
							<option value="none"> 관할 지역 선택 </option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
						</select>
					</div>
				</div>
				
				<div class="d-flex" style="align-items:center;">
					<div class="col-4 d-flex" style="padding:5px;">
						<h5 class="noto-sans" style="margin:10px;">프로필 사진</h5>
					</div>
					<div class="col-7 d-flex justify-content-center">
						<input type="file" id="pmProfile" name="pmProfile" accept="image/*" style="width:247px"/>
					</div>
				</div>
				
				<div class="col-10 d-flex" style="padding:30px 10px 10px; justify-content: center">
					<button onclick="subBtn()" type="button" id="nextBtn" class="btn btn-success" style="color: #fefcf7;">등록하기</button>
				</div>
			</div>
		</div>
	</form>



<script>
function subBtn() {
	Swal.fire({
        title: "픽업맨 생성 완료 되었습니다.",
        icon: "success",
        confirmButtonText: '확인',
    }).then(() => {
    	document.getElementById("joinPick").submit();
    });
}
</script>


<script>
    function autoHyphen(element) {
        // 입력된 전화번호에서 하이픈(-)을 제외한 숫자만 추출
        var phoneNumber = element.value.replace(/[^0-9]/g, '');
        
        // 전화번호가 10자리 이상일 때만 하이픈 삽입
        if (phoneNumber.length >= 10) {
            // 010-1234-5678 형식으로 하이픈 삽입
            var formattedNumber = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3, 7) + '-' + phoneNumber.substring(7);
            element.value = formattedNumber;
        }
    }
</script>

<script>
// 파일 입력 요소 가져오기
const fileInput = document.getElementById('pmProfile');
// 이미지 미리 보기 요소 가져오기
const profile = document.getElementById('profile');

// 파일 선택 시 이벤트 처리
fileInput.addEventListener('change', function() {
    // 선택한 파일이 있는지 확인
    if (fileInput.files && fileInput.files[0]) {
        // FileReader 객체 생성
        const reader = new FileReader();

        // 파일 읽기가 완료된 경우 실행되는 이벤트 처리
        reader.onload = function(e) {
            // 미리 보기 이미지의 src 속성에 선택한 파일의 데이터 설정
            profile.src = e.target.result;
            // 미리 보기 이미지 표시
            profile.style.display = 'block';
        }

        // 선택한 파일을 읽기 시작
        reader.readAsDataURL(fileInput.files[0]);
    }
});
</script>






</body>
</html>