<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div id="main-content">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>개인 대시보드</h3>
				</div>
			</div>
		</div>
	</div>

	<!-- Basic Tables start -->
	<section class="section">
		<div class="card">
			<div class="card-header" style="display: flex; justify-content: space-between;">
				<h4>참여 프로젝트</h4>
				<a href="#">더보기</a>
			</div>
			<div class="card-body">
				<table style="width: 100%" class="table" id="table2">
					<thead>
						<tr>
							<th style="width: 15%">프로젝트코드</th>
							<th style="width: 25%">프로젝트명</th>
							<th style="width: 10%">부서</th>
							<th style="width: 10%">PM</th>
							<th style="width: 10%">상태</th>
							<th style="width: 15%">시작일</th>
							<th style="width: 15%">완료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="10" step="1">
						<tr>
							<td>프로젝트코드${i}</td>
							<td>프로젝트명${i}</td>
							<td>부서${i}</td>
							<td>PM${i}</td>
							<td><span class="badge bg-success">상태${i}</span></td>
							<td>시작일${i}</td>
							<td>완료일${i}</td>
						</tr>
						</c:forEach>
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
					<div class="card-header">
						<h4 class="card-title">작업 진행상태</h4>
					</div>
					<div class="card-content">
						<div class="card-body">
							<form class="form form-horizontal">
								<div class="form-body">
									<div class="row"></div>
									<div style="height: 300px">
										<canvas id="douChart3"></canvas>
									</div>
									<script>
										const ctx3 = document
												.getElementById('douChart3');
										const douChart3 = new Chart(
												ctx3,
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
			<div class="col-md-6 col-12">
				<div class="card">
					<div class="card-header" style="display: flex; justify-content: space-between;">
						<h4 class="card-title">리스크 현황</h4>
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
										<canvas id="douChart4"></canvas>
									</div>
									<script>
										const ctx4 = document
												.getElementById('douChart4');
										const douChart4 = new Chart(
												ctx4,
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>