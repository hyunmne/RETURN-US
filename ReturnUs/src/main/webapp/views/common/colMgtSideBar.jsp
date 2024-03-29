<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- side bar start -->

	<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-white" style="width: 280px; height: 100%;">		
		<ul class="nav nav-pills flex-column mb-auto">
			<li>
				<a href="col-management?colStatus=수거준비중" class="nav-link">
					<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home" /></svg> 장소검색
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거준비중" class="nav-link">
					<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2" /></svg> 수거준비중
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거진행중" class="nav-link">
					<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table" /></svg> 수거진행중
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거완료" class="nav-link">
					<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid" /></svg>수거 완료
				</a>
			</li>			
		</ul>	
	</div>

	<!-- side bar end -->