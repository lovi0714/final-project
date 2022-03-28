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

<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<style>
.nav-tabs .nav-link.active {
	color: white;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	background-color: #435ebe;
}
</style>
 
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
						<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
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
										<input type="text" class="form-control" placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3 justify-content-end">
										<button type="button" class="btn btn-primary" id="regBtn" onclick="approvalRequest();">승인요청</button>
									</div>
								</div>
							</div>

							<!-- Basic Tables start -->
							<table class="table" id="table1">
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="cbx_chkAll" class="form-check-input">
										</th>
										<th>작업</th>
										<th>프로젝트</th>
										<th>승인자</th>
										<th>상태</th>
										<th>시작일</th>
										<th>완료일</th>
										<th>진행률(%)</th>
									</tr>
								</thead>
								<tbody>
	                      			<c:forEach var="myTask" items="${MyTaskList}">
										<tr>
											<td>
												<input type="checkbox" id="checkbox1" name="chk" class="form-check-input" value="${myTask.taskId}">
												<input type="hidden" name="pmId" value="${myTask.pmId}"/>
											</td>
				                            <td onclick="taskDetail(${myTask.taskId})" style="color: #435ebe; cursor: pointer">${myTask.taskName}</td>
				                            <td>${myTask.pTitle}</td>
				                            <td>${myTask.pmName}</td>
				                            <c:choose>
				                            	 <c:when test = "${myTask.status eq '시작전'}">
				                           			<td><span class="badge bg-secondary">${myTask.status}</span></td>
				                            	 </c:when>
				                            	 <c:when test = "${myTask.status eq '정상진행'}">
				                            	 	<td><span class="badge bg-success">${myTask.status}</span></td>
				                           		 </c:when>
				                            	 <c:when test = "${myTask.status eq '지연진행'}">
				                            	 	<td><span class="badge bg-danger">${myTask.status}</span></td>
				                           		 </c:when>
				                            </c:choose>
				                            <td><fmt:formatDate value="${myTask.startAt}" pattern="yyyy-MM-dd"/></td>
				                            <td><fmt:formatDate value="${myTask.endAt}" pattern="yyyy-MM-dd"/></td>
				                            <td>
												<div class="progress progress-primary">
													<div class="progress-bar progress-bar-striped" role="progressbar" style="width: ${myTask.progress}%" 
														aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
		                        		</tr>
	                       			</c:forEach>
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

	<!-- 작업정보 modal 버튼 -->
	<button type="button" class="callModal" data-bs-toggle="modal" data-bs-target="#primary" style="display: none"></button>
	
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
							<form class="form" id="taskDetail">
								<div class="row">
									<input type="hidden" name="taskId"/>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">작업</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="taskName" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">프로젝트</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="pTitle" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">시작일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="startAt" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">완료일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="endAt" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">진행률(%)</label>
                                            <input type="number" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="progress" min="0" max="100"/>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">승인자</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control"
                                                name="pmName" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1" class="form-label">작업 세부내용</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1" onclick="uptDetail()">
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
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reqContent"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1" onclick="approvalRequest();">
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
		"autoWidth" : false,
		"columnDefs": [
		    {"orderable": false, "targets": 0},
		    {"width": "20%", "targets": 1},
		    {"width": "20%", "targets": 2},
		    {"className": "dt-center", "targets": "_all"}
		],
		"language": {
	        "zeroRecords": "등록된 작업이 없습니다."
	    },
		"order": [5, 'desc']
	});

	$("#table2").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"width": "55%", "targets": 1}
		],
		"language": {
	        "zeroRecords": "등록한 산출물이 없습니다."
	    }
	});

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
	
	function taskDetail(taskId){
		$.ajax({
			url: "${path}/myTask/detail.do",
			type: 'GET',
			data: "taskId="+taskId,
			dataType: "json",
			success: function(data) {
				console.log(data);
				let myTaskDetail = data.myTaskDetail;
				
				$("input[name=taskId]").val(myTaskDetail.taskId);
				$("input[name=taskName]").val(myTaskDetail.taskName);
				$("input[name=pTitle]").val(myTaskDetail.pTitle);
				$("input[name=startAt]").val(myTaskDetail.startAt);
				$("input[name=endAt]").val(myTaskDetail.endAt);
				$("input[name=progress]").val(myTaskDetail.progress);
				$("input[name=pmName]").val(myTaskDetail.pmName);
				$("textarea[name=content]").val(myTaskDetail.content);
				
				$(".callModal").click();
				
			}
		});
	}
	
	function uptDetail() {		
		if($("input[name=progress]").val() >= 0 && $("input[name=progress]").val() <= 100) {
			Swal.fire({
				title: '작업정보를 등록하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskId = $("input[name=taskId").val();
					let progress = $("input[name=progress]").val();
					let content = $("textarea[name=content]").val();
					
					let taskDetail = {"taskId": taskId, "progress": progress, "content": content};
					
					$.ajax({
						url: "${path}/myTask/uptDetail.do",
						type: 'POST',
						data: taskDetail,
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '작업정보가 등록되었습니다.' 
								}).then((result) => {
									if(result.isConfirmed) {
										location.href = "${path}/myTask/list.do"
									}
								})
							}
						}
					});
				}
			})
		} else {
			Swal.fire({
				title: '진행률을 다시 입력해주세요',
				text: '0~100 사이의 숫자를 입력해주세요',
				icon: 'error'
			})
		}
	} 
	
	function approvalRequest() {	
		if($("input[name=chk]").is(":checked")) {
			Swal.fire({
				title: '승인을 요청하시겠습니까?',
				icon: 'question',
				input: 'textarea',
				inputPlaceholder: '승인요청 내용을 입력해주세요.',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskIdValues = [];
					let pmIdValues = [];
					let reqContent = result.value;
						
					$("input[name=chk]:checked").each(function(i) {
						taskIdValues.push($(this).val());
						pmIdValues.push($(this).next().val());
					});	
					
					let requestData = {
						taskId: taskIdValues,
						pmId: pmIdValues,
						reqContent: reqContent
					};
					
					console.log(taskIdValues);
					console.log(requestData);
					
					$.ajax({
						url: "${path}/myTask/approvalRequest.do",
						type: 'POST',
						contentType:'application/json; charset=UTF-8',
						dataType:'json',
						data: JSON.stringify(requestData), 
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '승인을 요청하였습니다.' 
								}).then((result) => {
									if(result.isConfirmed) {
										location.href = "${path}/myTask/approvalList.do"
									}
								})
							}
						}
					});
				}
			})
		} else {
			Swal.fire({
				title: '작업을 선택해주세요',
				icon: 'error'
			})
		}		
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>