<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  a{
  	   padding: .5rem 1rem;
  	   display:block;
  	   color:black;
  }
  a:hover {
    color: #59981A; 
  }
</style>

<div class="flex-shrink-0 bg-white" style="width: 280px; height:100%; padding:30px">
	<h5 class="noto-sans" style="padding-bottom:10px; color:#81B622">신청내역 관리</h5>		
		<ul class="nav nav-pills flex-column mb-auto">
			<li>
				<a href="col-management?colStatus=수거준비중">
					<i class="fas fa-seedling" style="color: #59981A"></i>&nbsp;&nbsp;&nbsp;신청내역 관리
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거준비중">
					<i class="fas fa-seedling" style="color: #59981A"></i>&nbsp;&nbsp;&nbsp;수거 준비 중
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거진행중">
					<i class="fas fa-seedling" style="color: #59981A"></i>&nbsp;&nbsp;&nbsp;수거 진행 중
				</a>
			</li>
			<li>
				<a href="col-management?colStatus=수거완료">
					<i class="fas fa-seedling" style="color: #59981A"></i>&nbsp;&nbsp;&nbsp;수거 완료
				</a>
			</li>			
		</ul>	
	</div>

