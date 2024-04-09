<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	String cookieHeader = request.getHeader("Cookie");
	boolean autologin = false;
	String id = "";
	String password = "";
	if(cookieHeader!=null){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("autologin")) {
				if (cookie.getValue().equals("true"))
					autologin = true;
				else autologin = false;
			} else if (cookie.getName().equals("accId")) {
				id = cookie.getValue();
			} else if (cookie.getName().equals("accPassword")){
				password = cookie.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Return:Us</title>
<style type = "text/css">
   
.logBox {
    display: flex;
    flex-direction: column; /* 요소들을 세로로 정렬합니다 */
    align-items: center; /* 가로 방향 가운데 정렬합니다 */
}

.input {
    width: 400px; /* 부모 요소의 너비에 맞추기 위해 100% 지정 */
    height: 65px; /* 높이 조정 */
    margin-bottom: 15px; /* 각 입력 요소의 하단 여백 */
    padding: 10px; /* 내부 패딩 값 */
    border: 1px solid #D0D0D0;
    border-radius: 10px;
    font-size: 16px; /* 폰트 크기 조정 */
}

.button {
	margin-left: 75%;
    width: 25%; /* 버튼의 너비 조정 */
    height: 40px; /* 버튼의 높이 조정 */
    background-color: #59981A; /* 배경색 설정 */
    color: white; /* 글자색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 10px; /* 버튼 모서리를 둥글게 만듦 */
    font-size: 18px; /* 폰트 크기 조정 */
    cursor: pointer; /* 커서 스타일 변경 */
    margin-top: -10%;
}

/* 추가로 필요한 스타일 */
.title {
    text-align: center; /* 제목 가운데 정렬 */
    margin-bottom: 20px; /* 제목과 폼 사이의 간격 조정 */
}
#linked{
	margin-top: 40px;
}
.blank{
	margin-left: 8%;
	margin-right: 8%;
}
#linked a {
	color: #AFAFAF;
    font-size: 18px; /* 글꼴 크기 설정 (16px) */
}
.submit_box span{
	color: #AFAFAF;
}
#joinhref{
	/* margin-left: 34px; */
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function() {
	$("#login").click(function(e){
		if($("#accId").val().trim() == "") {
			 Swal.fire({
                 title: "아이디를 입력하세요",
                 icon: "warning",
                 timer: 1500,
                 showConfirmButton: false
               });	
			 $("#accId").focus();
			 return false;
		} 
		if($("#accPassword").val().trim() == "") {
			 Swal.fire({
                 title: "비밀번호를 입력하세요",
                 icon: "warning",
                 timer: 1500,
                 showConfirmButton: false
               });		
			 $("#accPassword").focus();
			 return false;
		}
		var login = {}
		login.accId = $("#accId").val();
		login.accPassword = $("#accPassword").val();
		login.autologin = $("#autologin").val();
		console.log(login);
		$.ajax({
			url : "login",
			type: "post",
			async: true,
			data:{login:JSON.stringify(login)},
			success:function(result){
				console.log(result)
				if(result=='true'){
					location.href="main";
				}else{
					/* alert(result); */	
					 Swal.fire({
		                 title: result,
		                 icon: "warning",
		                 timer: 1500,
		                 showConfirmButton: false
		               });
				}
			},
			error:function(result){
				alert("로그인실패");
			}
		})
	})
	
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
				<div class="col-lg-12 logBox">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big">
							<div style="padding: 50px 0px 30px; /* color: #3E6D10; */">
								<div class="title">
									<div class="bgtitle" >
										<h1 class="noto-sans"style="color: #59981A">반갑습니다!</h1>
									</div>
									<div class="smtitle">
										<p class="noto-sans" style="color: #59981A">로그인하고 리터너스의 서비스를 누려보세요!<p>
									</div>
								</div>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm">
								<div id="id">
									<input type="text" class="input" id="accId" name="accId" value="<%=id %>" placeholder="ID를 입력하세요..." required="required"/>
								</div>
									<br>
								<div id="password">
									<input type="password" class="input" id="accPassword" name="accPassword" value="<%=password %>" placeholder="비밀번호를 입력하세요.." required="required"/>
								</div>
								<br>
								<div id="loginbox" class="login_box">
								<%if(autologin) { %>
									<input type="checkbox" id="autologin" value="true" name="autologin" checked="checked">&nbsp;&nbsp;<span>자동로그인</span> 
								<%} else { %>
									<input type="checkbox" id="autologin" value="true" name="autologin">&nbsp;&nbsp;<span>자동로그인</span>
								<%} %>
									<button type="submit" class="button" id="login">로그인</button>
								</div>
								<div id="linked">
									<a id="joinhref" href="join">회원가입</a><a class="blank"></a><a href="findid">아이디 찾기</a><a class="blank"></a><a href="findpw">비밀번호 찾기</a>
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