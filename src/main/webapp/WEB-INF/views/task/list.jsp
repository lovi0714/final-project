<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">

<div id="main-content">

	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>내 작업</h3>
				</div>
			</div>
		</div>
	</div>
	<section class="section">
		<div class="card">
			<div class="card-header" style="padding-bottom: 0">
				<h4 class="card-title">내 작업</h4><hr>
			</div>
			<div class="card-body">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="home-tab" data-bs-toggle="tab"
						href="#home" role="tab" aria-controls="home" aria-selected="true">작업</a>
					</li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">산출물</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<!-- 테이블 시작 -->
						<table class="table" id="table2">
							<thead>
								<tr>
									<th style="width: 5%">선택</th>
									<th style="width: 20%">작업명</th>
									<th style="width: 25%">프로젝트명</th>
									<th style="width: 10%">승인자</th>
									<th style="width: 10%">상태</th>
									<th style="width: 10%">시작일</th>
									<th style="width: 10%">완료일</th>
									<th style="width: 10%">완료율</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="20" step="1">
									<tr>
										<td>선택${i}</td>
										<td>작업명${i}</td>
										<td>프로젝트명${i}</td>
										<td>승인자${i}</td>
										<td>상태${i}</td>
										<td>시작일${i}</td>
										<td>완료일${i}</td>
										<td>완료율${i}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 테이블 끝 -->
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<!-- 테이블 시작 -->
						<table class="table" id="table3">
							<thead>
								<tr>
									<th>카테고리</th>
									<th>산출물 정보</th>
									<th>프로젝트</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="20" step="1">
									<tr>
										<td>카테고리${i}</td>
										<td>산출물정보${i}</td>
										<td>프로젝트${i}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 테이블 끝 -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="${path}/resources/vendors/jquery/jquery.min.js"></script>
	<script
		src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
	<script
		src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
	<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
	<script>
		// Jquery Datatable
		// let jquery_datatable = $("#table2").DataTable()
		$("#table2").DataTable({
			lengthChange : false,
			searching : false,
			info : false
		/* columnDefs: [{ 
			targets: 0, 
			orderable: false
		}] */
		});

		$("#table3").DataTable({
			lengthChange : false,
			searching : false,
			info : false
		});
	</script>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>