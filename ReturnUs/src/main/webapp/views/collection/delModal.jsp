<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal</title>
</head>
<body>

	모달 jsp ... wpqkf ...
	${acc.accId }
	${acc.accName }
	${cnt }
	
	<c:forEach items="${delList }" var="del">
		${del.delName }
		${del.delPostCode }
	</c:forEach>
	
	
	<form method="post" action="delivery">
		<input id="accId" type="hidden" name="accId" />
		<c:forEach items="${del }" var="del">
			<div class="modal-body col-12 d-flex justify-content-center" >
				<div style="width: 700px;">
					<!-- 이름 div -->
					<div class="col-12 d-flex" style="max-height: 300px; overflow-y: auto;">
						<div class="col-3 d-flex justify-content-center align-items-center"
							style="padding: 5px; border-right: 3px solid lightgray">${del.delName }</div>
						<div class="col-9 d-flex justify-content-center" style="padding: 5px;">
							<div class="d-flex justify-content-center" style="flex-direction: column; width: 100%">
								<div class="d-flex col-10">
									<div class="col-5" style="padding-right: 10px;">${del.delPostCode }</div>
									<div class="col-5" style="background-color: red">${del.delTel }</div>
								</div>
								<div class="col-10" style="background-color: blue">${del.delAddr }</div>
								<div class="col-10" style="background-color: yellow">${del.delDetailAddr }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</form>
</body>
</html>