<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Return:Us</title>   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
   <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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

#FaqNo {
	width: 3%;
	height: 30px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}
#FaqTitle {
	width: 100%;
	height: 50px;
	border: 1px solid #D0D0D0;
	border-radius: 6px;
}
.button{
	width: 10%;
	height: 40px;
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
				<div class="col-lg-2">
					<div class="row g-4 shadow-sm">
						<div class="col-lg-12">
							<%@include file="/views/common/guideSideBar.jsp"%>
						</div>
					</div>
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
								<form id="faqform" action="faqmodify" method="post">
									<input id="FaqNo" name="faqNo" value="${faq.faqNo }" readonly="readonly">   									
									<input id="FaqTitle" name="faqTitle" value="${faq.faqTitle }" style="margin-bottom: 2%;">
									<div id="editor">${faq.faqContent }</div>
									<input type="hidden" name="faqContent" id="faqContent" value="${faq.faqContent }">
								<button type="submit" class="button" style="float: right; margin-top:2%;">게시글 수정</button>
								</form>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="/views/common/footer.jsp" %>







<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
 <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
			initialEditType:'wysiwyg',
            height: '500px',
        });
		
        $('#faqform').submit(function(e){
        	$('#faqContent').val(editor.getHTML());
        })
    </script>
</body>
</html>