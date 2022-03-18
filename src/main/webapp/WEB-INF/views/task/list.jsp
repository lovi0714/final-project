<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isTaskSide" value="active" />
	<jsp:param name="isTaskList" value="active" />
</jsp:include>

<link rel="stylesheet"
	href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet"
	href="${path}/resources/vendors/fontawesome/all.min.css">

<style>
.nav-tabs .nav-link.active {
	color: white;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	background-color: #435ebe;
}
</style>
 
<script>
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {	
			if($("#cbx_chkAll").is(":checked")) 
				$("input[name=chk]").prop("checked", true);
			else 
				$("input[name=chk]").prop("checked", false);
		});
			
		$("input[name=chk]").click(function() {			
			let total = $("input[name=chk]").length;
			let checked = $("input[name=chk]:checked").length;
			
			if(total != checked) 
				$("#cbx_chkAll").prop("checked", false);
			else 
				$("#cbx_chkAll").prop("checked", true); 
		});
	});
</script>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>내 작업</h3>
				</div>
			</div>
		</div>

		<section class="section">
			<div class="card">
				<div class="card-header">
					<p class="fw-bold">내 작업</p>
				</div>

				<div class="card-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">작업</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">산출물</a>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row pt-3" style="background-color: #f2f7ff;">
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>프로젝트를 선택하세요</option>
											<option>5G 수신환경</option>
											<option>빌링서비스 개발</option>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>작업상태를 선택하세요</option>
											<option>시작전</option>
											<option>정상진행</option>
											<option>지연진행</option>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3 justify-content-end">
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#primary2" id="regBtn">승인요청</button>
									</div>
								</div>

							</div>

							<!-- Basic Tables start -->
							<table class="table" id="table1">
								<thead>
									<tr>
										<th>작업명</th>
										<th>프로젝트명</th>
										<th>승인자</th>
										<th>상태</th>
										<th>시작일</th>
										<th>완료일</th>
										<th>진행률(%)</th>
										<th><input type="checkbox" id="cbx_chkAll"
											class="form-check-input"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="#primary" data-bs-toggle="modal"
											data-bs-target="#primary">시장 환경 조사</a></td>
										<td>빌링서비스 개발</td>
										<td>홍길동</td>
										<td><span class="badge bg-secondary">시작전</span></td>
										<td>2022-04-15</td>
										<td>2022-04-28</td>
										<td>
											<div class="progress progress-primary">
												<div class="progress-bar progress-bar-striped"
													role="progressbar" style="width: 0%" aria-valuenow="0"
													aria-valuemin="0" aria-valuemax="1000"></div>
											</div>
										</td>
										<td><input type="checkbox" id="checkbox1" name="chk"
											class="form-check-input"></td>
									</tr>
									<tr>
										<td>사업 모델 검토</td>
										<td>5G 수신환경</td>
										<td>김길동</td>
										<td><span class="badge bg-success">정상진행</span></td>
										<td>2022-03-18</td>
										<td>2022-04-01</td>
										<td>
											<div class="progress progress-primary">
												<div class="progress-bar progress-bar-striped"
													role="progressbar" style="width: 50%" aria-valuenow="50"
													aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</td>
										<td><input type="checkbox" id="checkbox1" name="chk"
											class="form-check-input"></td>
									</tr>
								</tbody>
							</table>
							<!-- Basic Tables end -->
						</div>

						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<div>
								<div class="row pt-3" style="background-color: #f2f7ff;">
									<div class="col-md-3">
										<fieldset class="form-group">
											<select class="form-select" id="basicSelect">
												<option>프로젝트를 선택하세요</option>
												<option>공공SI 사업 프로젝트</option>
											</select>
										</fieldset>
									</div>
									<div class="col-md-3">
										<fieldset class="form-group">
											<select class="form-select" id="basicSelect">
												<option>카테고리를 선택하세요</option>
												<option>필수 산출물</option>
												<option>추가 산출물</option>
											</select>
										</fieldset>
									</div>
									<div class="col-md-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												placeholder="검색어를 입력하세요">
											<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
										</div>
									</div>
									<div class="col-md-3">
										<div class="input-group mb-3 justify-content-end">
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#primary3"
												id="regBtn">산출물 등록</button>
										</div>
									</div>
								</div>

								<!-- Basic Tables start -->
								<table class="table" id="table2">
									<thead>
										<tr>
											<th>카테고리</th>
											<th>산출물 정보</th>
											<th>프로젝트</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><span class="badge bg-primary">필수</span></td>
											<td>
												<div>
													<a href="#">필수스타일목록.txt</a>
												</div>
												<div>sysadmin on 2021-01-19 file size 2.8kb</div>
											</td>
											<td>공공SI 사업 프로젝트</td>
										</tr>
										<tr>
											<td><span class="badge bg-secondary">선택</span></td>
											<td>
												<div>
													<a href="#">프로젝트 메뉴얼.pptx</a>
												</div>
												<div>sysadmin on 2021-01-19 file size 13.8mb</div>
											</td>
											<td>공공SI 사업 프로젝트</td>
										</tr>
									</tbody>
								</table>
								<!-- Basic Tables end -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 작업정보 modal -->
	<div class="modal fade text-left" id="primary" tabindex="-1"
		role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 0;">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home2" role="tab" aria-controls="home2" aria-selected="true">작업정보</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile2" role="tab" aria-controls="profile2" aria-selected="false">산출물</a>
						</li>
					</ul>
				</div>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home2" role="tabpanel" aria-labelledby="home-tab">
						<div class="modal-body">
							<form class="form">
								<div class="row">
									<div class="col-12">
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">작업</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="시장 환경 조사" name="fname-column" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">프로젝트</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="빌링서비스 개발" name="fname-column" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">시작일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="2022-04-15" name="fname-column" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">완료일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="2022-04-28" name="fname-column" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">완료율</label>
                                            <input type="number" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="0" name="fname-column">
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">승인자</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                value="홍길동" name="fname-column" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1" class="form-label">작업 세부내용</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1">
								<i class="bx bx-check d-block d-sm-none"></i>
								<span class="d-none d-sm-block">등록</span>
							</button>
							<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">취소</span>
							</button>
						</div>
					</div>
					
					<div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab">
						<div class="modal-body">
							<form class="form">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="first-name-vertical" class="form-label">파일</label>
											<input type="file" id="first-name-vertical"
												class="form-control" placeholder="산출물 제목을 입력하세요."
												name="pname" maxlength="120">
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="basicSelect">프로젝트</label>
											<fieldset class="form-group mt-2">
												<select class="form-select" id="basicSelect">
													<option>공공SI 프로젝트</option>
												</select>
											</fieldset>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="basicSelect">작업</label>
											<fieldset class="form-group mt-2">
												<select class="form-select" id="basicSelect">
													<option>공공SI 사업 기획서 작성</option>
												</select>
											</fieldset>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="basicSelect">산출물 카테고리</label>
											<fieldset class="form-group mt-2">
												<select class="form-select" id="basicSelect">
													<option>필수 산출물</option>
													<option>추가 산출물</option>
												</select>
											</fieldset>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="basicSelect">산출물 종류</label>
											<fieldset class="form-group mt-2">
												<select class="form-select" id="basicSelect">
													<option>사업기획서</option>
													<option>프로그램 메뉴얼</option>
													<option>프로젝트 리소스</option>
													<option>테스트 메뉴얼</option>
												</select>
											</fieldset>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1">
								<i class="bx bx-check d-block d-sm-none"></i>
								<span class="d-none d-sm-block">등록</span>
							</button>
							<button type="button" class="btn btn-light-secondary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">취소</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 승인요청 modal -->
	<div class="modal fade text-left" id="primary2" tabindex="-1"
		role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title white" id="myModalLabel160">승인요청</h5>
				</div>
				<div class="modal-body">
					<form class="form">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label for="exampleFormControlTextarea1" class="form-label">요청사항</label>
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1">
						<i class="bx bx-check d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">등록</span>
					</button>
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">취소</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 산출물 등록 modal -->
	<div class="modal fade text-left" id="primary3" tabindex="-1" role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title white" id="myModalLabel160">산출물 등록</h5>
				</div>
				<div class="modal-body">
					<form class="form">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label for="first-name-vertical" class="form-label">파일</label> <input
										type="file" id="first-name-vertical" class="form-control"
										placeholder="산출물 제목을 입력하세요." name="pname" maxlength="120">
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="basicSelect">프로젝트</label>
									<fieldset class="form-group mt-2">
										<select class="form-select" id="basicSelect">
											<option>공공SI 프로젝트</option>
										</select>
									</fieldset>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="basicSelect">작업</label>
									<fieldset class="form-group mt-2">
										<select class="form-select" id="basicSelect">
											<option>공공SI 사업 기획서 작성</option>
										</select>
									</fieldset>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="basicSelect">산출물 카테고리</label>
									<fieldset class="form-group mt-2">
										<select class="form-select" id="basicSelect">
											<option>필수 산출물</option>
											<option>추가 산출물</option>
										</select>
									</fieldset>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="basicSelect">산출물 종류</label>
									<fieldset class="form-group mt-2">
										<select class="form-select" id="basicSelect">
											<option>사업기획서</option>
											<option>프로그램 메뉴얼</option>
											<option>프로젝트 리소스</option>
											<option>테스트 메뉴얼</option>
										</select>
									</fieldset>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1">
						<i class="bx bx-check d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">등록</span>
					</button>
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">취소</span>
					</button>
				</div>
			</div>
		</div>
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
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"orderable": false, "targets": [-1]},
		],
		"order": [4, 'desc']
	});

	$("#table2").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    { "width": "55%", "targets": 1 }
		]
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>