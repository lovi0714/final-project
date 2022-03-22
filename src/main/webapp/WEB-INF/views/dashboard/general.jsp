<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>종합 대시보드</h3>
				</div>
			</div>
		</div>

		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">공지사항</p>
					<a href="${path}/community/noticeList.do">더보기</a>
				</div>
				<div class="card-body">
					<table class="table" id="table1">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
	                      		<c:when test="${NoticeList.size() > 0}">
	                      			<c:forEach var="notice" items="${NoticeList}">
										<tr>
				                            <td>${notice.title}</td>
				                            <td>${notice.writer}</td>
				                            <td><fmt:formatDate value="${notice.createAt}" pattern="yyyy-MM-dd"/></td>
		                        		</tr>
	                       			</c:forEach>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<tr>
	                      				<td colspan="6" style="text-align: center;"><h6>등록된 공지사항이 없습니다.</h6></td>
	                      			</tr>
	                      		</c:otherwise>
	                      	</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- Basic Tables end -->
	
		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">프로젝트 현황</p>
					<div style="display: flex; justify-content: flex-end;">
						<select class="form-select" style="width: 150px;">
							<option selected>부서</option>
							<option value="1">인사</option>
							<option value="2">회계</option>
							<option value="3">경영지원</option>
							<option value="4">생산관리</option>
							<option value="5">기술지원</option>
							<option value="6">연구개발</option>
						</select> 
						<select class="form-select" style="width: 150px; margin: 0 10px;">
							<option selected>상태</option>
							<option value="1">시작전</option>
							<option value="2">정상진행</option>
							<option value="3">지연진행</option>
							<option value="4">완료</option>
							<option value="5">중단</option>
						</select> 
						<a href="${path}/project/list.do" style="margin-top: 7px">더보기</a>
					</div>
				</div>
				<div class="card-body">
					<table class="table" id="table2">
						<thead>
							<tr>
								<th>프로젝트코드</th>
								<th>프로젝트명</th>
								<th>부서</th>
								<th>PM</th>
								<th>상태</th>
								<th>시작일</th>
								<th>완료일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
	                      		<c:when test="${ProjectList.size() > 0}">
	                      			<c:forEach var="project" items="${ProjectList}">
										<tr>
				                            <td>${project.projectId}</td>
				                            <td>${project.title}</td>
				                            <td>${project.pmDeptName}</td>
				                            <td>${project.pmName}</td>
				                            <td>${project.status}</td>
				                            <td><fmt:formatDate value="${project.startAt}" pattern="yyyy-MM-dd"/></td>
				                            <td><fmt:formatDate value="${project.endAt}" pattern="yyyy-MM-dd"/></td>
		                        		</tr>
	                       			</c:forEach>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<tr>
	                      				<td colspan="6" style="text-align: center;"><h6>등록된 프로젝트가 없습니다.</h6></td>
	                      			</tr>
	                      		</c:otherwise>
	                      	</c:choose>
						</tbody>
					</table>
				</div>
			</div>
	
		</section>
		<!-- Basic Tables end -->
	
		<section id="basic-horizontal-layouts">
			<div class="row match-height">
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
							<p class="fw-bold">월별 프로젝트</p>
							<select class="form-select" style="width: 150px;">
								<option value="1">종합</option>
								<option value="2">선행개발</option>
								<option value="3">고객선행</option>
								<option value="4">양산개발</option>
							</select>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div style="height: 300px">
											<canvas id="myChart" width="200px" height="200px"></canvas>
										</div>
										<script>
											const ctx = document
													.getElementById('myChart');
											const myChart = new Chart(
													ctx,
													{
														type : 'bar',
														data : {
															labels : [ 'Red',
																	'Blue',
																	'Yellow',
																	'Green',
																	'Purple',
																	'Orange',
																	'Red', 'Blue',
																	'Yellow',
																	'Green',
																	'Purple',
																	'Orange' ],
															datasets : [ {
																label : '# of Votes',
																data : [ 12, 19, 3,
																		5, 2, 3,
																		12, 19, 3,
																		5, 2, 3 ],
																backgroundColor : [
																		'rgba(255, 99, 132, 0.2)',
																		'rgba(54, 162, 235, 0.2)',
																		'rgba(255, 206, 86, 0.2)',
																		'rgba(75, 192, 192, 0.2)',
																		'rgba(153, 102, 255, 0.2)',
																		'rgba(255, 159, 64, 0.2)',
																		'rgba(255, 99, 132, 0.2)',
																		'rgba(54, 162, 235, 0.2)',
																		'rgba(255, 206, 86, 0.2)',
																		'rgba(75, 192, 192, 0.2)',
																		'rgba(153, 102, 255, 0.2)',
																		'rgba(255, 159, 64, 0.2)' ],
																borderColor : [
																		'rgba(255, 99, 132, 1)',
																		'rgba(54, 162, 235, 1)',
																		'rgba(255, 206, 86, 1)',
																		'rgba(75, 192, 192, 1)',
																		'rgba(153, 102, 255, 1)',
																		'rgba(255, 159, 64, 1)',
																		'rgba(255, 99, 132, 1)',
																		'rgba(54, 162, 235, 1)',
																		'rgba(255, 206, 86, 1)',
																		'rgba(75, 192, 192, 1)',
																		'rgba(153, 102, 255, 1)',
																		'rgba(255, 159, 64, 1)', ],
																borderWidth : 1
															} ]
														},
														options : {
															responsive : true,
															maintainAspectRatio : false,
															scales : {
																y : {
																	beginAtZero : true
																}
															},
															plugins : {
																legend : {
																	position : 'bottom'
																}
															}
														}
													});
										</script>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
							<p class="fw-bold">리스크 현황</p>
							<select class="form-select" style="width: 150px;">
								<option value="1">상태별</option>
								<option value="2">유형별</option>
							</select>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div style="height: 300px">
											<canvas id="douChart"></canvas>
										</div>
										<script>
											const ctx2 = document.getElementById('douChart');
											const douChart = new Chart(
													ctx2,
													{
														type : 'doughnut',
														data : {
															labels : [ 'Red',
																	'Blue',
																	'Yellow' ],
															datasets : [ {
																label : 'My First Dataset',
																data : [ 300, 50,
																		100 ],
																backgroundColor : [
																		'rgb(255, 99, 132)',
																		'rgb(54, 162, 235)',
																		'rgb(255, 205, 86)' ],
																hoverOffset : 4
															} ],
														},
														options : {
															responsive : true,
															maintainAspectRatio : false,
															plugins : {
																legend : {
																	position : 'bottom'
																}
															}
														}
													});
										</script>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>	

<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>

<script>
	// Jquery Datatable
	$("#table1").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false, 
		"paging": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"width": "50%", "targets": 0},
		],
		"order": [2, 'desc']
	});
	
	$("#table2").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false, 
		"paging": false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"}
		],
		"order": [5, 'desc']
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>