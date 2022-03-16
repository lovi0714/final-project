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
				<!-- 
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>종합 대시보드</h3>
					<p class="text-subtitle text-muted"></p>
				</div>
				 -->
				<!-- 
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">대시보드</a></li>
							<li class="breadcrumb-item active" aria-current="page">종합
								대시보드</li>
						</ol>
					</nav>
				</div>
				-->
			</div>
		</div>

		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4>공지사항</h4>
					<a href="${path}/community/notice.do"><p
							style="text-align: right; margin-bottom: 0;">더보기</p></a>
				</div>
				<div class="card-body">
					<table style="width: 100%;" class="table" id="table1">
						<thead>
							<tr>
								<th style="width: 60%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 20%">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Graiden</td>
								<td>vehicula.aliquet@semconsequat.co.uk</td>
								<td>076 4820 8838</td>
							</tr>
							<tr>
								<td>Dale</td>
								<td>fringilla.euismod.enim@quam.ca</td>
								<td>0500 527693</td>
							</tr>
							<tr>
								<td>Nathaniel</td>
								<td>mi.Duis@diam.edu</td>
								<td>(012165) 76278</td>
							</tr>
							<tr>
								<td>Darius</td>
								<td>velit@nec.com</td>
								<td>0309 690 7871</td>
							</tr>
							<tr>
								<td>Oleg</td>
								<td>rhoncus.id@Aliquamauctorvelit.net</td>
								<td>0500 441046</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- Basic Tables end -->

		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4>프로젝트 현황</h4>
					<a href="#"><p style="text-align: right; margin-bottom: 0;">더보기</p></a>
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
							<tr>
								<td>Graiden</td>
								<td>vehicula.aliquet@semconsequat.co.uk</td>
								<td>076 4820</td>
								<td>Offenburg</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Dale</td>
								<td>fringilla.euismod.enim@quam.ca</td>
								<td>0500</td>
								<td>New Quay</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Nathaniel</td>
								<td>mi.Duis@diam.edu</td>
								<td>(012165)</td>
								<td>Grumo Appula</td>
								<td><span class="badge bg-danger">Inactive</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Darius</td>
								<td>velit@nec.com</td>
								<td>0309 690</td>
								<td>Ways</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Oleg</td>
								<td>rhoncus.id@Aliquamauctorvelit.net</td>
								<td>0500</td>
								<td>Rossignol</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Kermit</td>
								<td>diam.Sed.diam@anteVivamusnon.org</td>
								<td>(01653)</td>
								<td>Patna</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Jermaine</td>
								<td>sodales@nuncsit.org</td>
								<td>0800</td>
								<td>Mold</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Ferdinand</td>
								<td>gravida.molestie@tinciduntadipiscing.org</td>
								<td>(016977)</td>
								<td>Marlborough</td>
								<td><span class="badge bg-danger">Inactive</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Kuame</td>
								<td>Quisque.purus@mauris.org</td>
								<td>(0151) 561</td>
								<td>Tresigallo</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>
							<tr>
								<td>Deacon</td>
								<td>Duis.a.mi@sociisnatoquepenatibus.com</td>
								<td>07740</td>
								<td>Karapınar</td>
								<td><span class="badge bg-success">Active</span></td>
								<td>076 4820</td>
								<td>Offenburg</td>
							</tr>

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
							<h4 class="card-title">월별 프로젝트</h4>
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
																	'Red',
																	'Blue',
																	'Yellow',
																	'Green',
																	'Purple',
																	'Orange' ],
															datasets : [ {
																label : '# of Votes',
																data : [ 12,
																		19, 3,
																		5, 2,
																		3, 12,
																		19, 3,
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
															responsive: true,
															maintainAspectRatio: false,
															scales : {
																y : {
																	beginAtZero : true
																}
															},
															plugins: {
																legend: {
																	position: 'bottom'
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
						<div class="card-header">
							<h4 class="card-title">리스크 현황</h4>
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
											const ctx2 = document
													.getElementById('douChart');
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
																data : [ 300,
																		50, 100 ],
																backgroundColor : [
																		'rgb(255, 99, 132)',
																		'rgb(54, 162, 235)',
																		'rgb(255, 205, 86)' ],
																hoverOffset : 4
															} ],
														},
														options: {
															responsive: true,
															maintainAspectRatio: false,
															plugins: {
																legend: {
																	position: 'bottom'
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>