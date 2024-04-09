<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageList }" var="pageInfo" />
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>Return:Us</title>
<style>
#tableDiv {
	width: 100%;
	text-align: center;
}

#tableDiv table {
	width: 100%;
}

#tableDiv table th {
	padding: 8px;
	border-bottom: 1px solid rgba(62, 109, 16, 0.5);
	background-color: rgba(129, 182, 34, 0.2);
}

#tableDiv table td {
	padding: 9px;
	border-bottom: 1px solid #ddd;
}
</style>

</head>

		<div style="display: flex; justify-content: flex-end; padding-bottom: 20px">
			<select class="rounded-input" id="selRegion" name="selRegion">
				<option value="none">관할 지역 선택</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="광주">광주</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
			</select>
		</div>
		<div id="tableDiv" style="overflow-y: scroll; height:450px">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>작업 상태</th>
						<th>관할구역</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pmList }" var="pml" varStatus="i">
						<tr>
							<td>${pml.pmNo }</td>
							<td>${pml.pmName }</td>
							<td>${pml.pmTel }</td>
							<c:choose>
								<c:when test="${empty pml.pmStatus }">
									<td>수거준비</td>
								</c:when>
								<c:when test="${pml.pmStatus == '수거중' }">
									<td style="color:red;">${pml.pmStatus }</td>
								</c:when>
								<c:when test="${pml.pmStatus == '수거완료' }">
									<td style="color:green;">${pml.pmStatus }</td>
								</c:when>
							</c:choose>
							<td>${pml.pmRegion }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

<script>
document.getElementById('selRegion').addEventListener('change', function() {
	const region = this.value;
	var tableBody = document.querySelector('#tableDiv table tbody');
	
	 var rows = tableBody.getElementsByTagName('tr');
     for (var i = 0; i < rows.length; i++) {
         rows[i].style.display = 'none';
     }
     
     var selectedRows = document.querySelectorAll('tbody tr td:last-child');
     for (var i = 0; i < selectedRows.length; i++) {
         if (selectedRows[i].innerText === region) {
             selectedRows[i].parentNode.style.display = '';
         }
     }
});


</script>


</body>
</html>