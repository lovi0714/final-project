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
						<p class="fw-bold">내 결재</p>
				</div>
				
				<div class="card-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">승인대기</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">승인완료</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">반려</a>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							<div class="row pt-3" style="background-color: #f2f7ff;">
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>프로젝트를 선택하세요</option>
											<c:forEach items="${WaitingProject}" var="project">
	                                    		<option value="${project.prjId}">${project.prjName}</option>
	                                    	</c:forEach>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group mb-3 justify-content-end">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary2" id="cancelBtn" onclick="MyApprovalCancel1();">회수</button>
									</div>
								</div>
							</div>
								
							<!-- Basic Tables start -->
							<table class="table" id="table1">
								<thead>	
									<tr>
										<th>
											<input type="checkbox" id="cbx_chkAll1" class="form-check-input">
										</th>
										<th>작업</th>
										<th>프로젝트</th>
										<th>승인자</th>
										<th>상태</th>
										<th>결재요청일</th>
									</tr>
								</thead>
								<tbody>
	                      			<c:forEach var="wait" items="${WaitingList}">
										<tr>
											<td>
												<input type="checkbox" id="checkbox1" name="chk1" class="form-check-input" value="${wait.taskId}">
											</td>
											<td onclick="taskDetail(${wait.taskId})" style="color: #435ebe; cursor: pointer">${wait.taskName}</td>
											<td>${wait.prjName}</td>
											<td>${wait.approver}</td>
											<td><span class="badge bg-secondary">${wait.apStatus}</span></td>
											<td><fmt:formatDate value="${wait.createAt}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
										</tr>
	                       			</c:forEach>	
			                    </tbody>				
							</table>
							<!-- Basic Tables end -->
						</div>
	
						<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							<div class="row pt-3" style="background-color: #f2f7ff;">
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>프로젝트를 선택하세요</option>
											<c:forEach items="${CompletedProject}" var="project">
	                                    		<option value="${project.prjId}">${project.prjName}</option>
	                                    	</c:forEach>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
							</div>
									
							<!-- Basic Tables start -->
							<table class="table" id="table2">
								<thead>
									<tr>
										<th>작업</th>
										<th>프로젝트</th>
										<th>승인자</th>
										<th>상태</th>
										<th>결재요청일</th>
										<th>결재승인일</th>
									</tr>
								</thead>
								<tbody>
	                      			<c:forEach var="complete" items="${CompletedList}">
										<tr>
											<td onclick="taskDetail(${complete.taskId})" style="color: #435ebe; cursor: pointer">${complete.taskName}</td>
											<td>${complete.prjName}</td>
											<td>${complete.approver}</td>
											<td><span class="badge bg-success">${complete.apStatus}</span></td>
											<td><fmt:formatDate value="${complete.createAt}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
											<td><fmt:formatDate value="${complete.approvalAt}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
										</tr>
	                       			</c:forEach>	
								</tbody>
							</table>
							<!-- Basic Tables end -->			
						</div>
							
						<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
							<div class="row pt-3" style="background-color: #f2f7ff;">
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>프로젝트를 선택하세요</option>
											<c:forEach items="${RejectedProject}" var="project">
	                                    		<option value="${project.prjId}">${project.prjName}</option>
	                                    	</c:forEach>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group mb-3 justify-content-end">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary2" onclick="MyApprovalCancel2();">회수</button>
									</div>
								</div>
							</div>
								
							<!-- Basic Tables start -->
							<table class="table" id="table3">
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="cbx_chkAll2" class="form-check-input">
										</th>
										<th>작업</th>
										<th>프로젝트</th>
										<th>승인자</th>
										<th>상태</th>
										<th>결재요청일</th>
										<th>결재반려일</th>
									</tr>
								</thead>
								<tbody>
	                      			<c:forEach var="reject" items="${RejectedList}">
										<tr>
											<td>
												<input type="checkbox" id="checkbox1" name="chk2" class="form-check-input" value="${reject.taskId}">
											</td>
											<td onclick="taskDetail(${reject.taskId})" style="color: #435ebe; cursor: pointer">${reject.taskName}</td>
											<td>${reject.prjName}</td>
											<td>${reject.approver}</td>
											<td><span class="badge bg-danger">${reject.apStatus}</span></td>
											<td><fmt:formatDate value="${reject.createAt}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
											<td><fmt:formatDate value="${reject.rejectAt}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
										</tr>
	                       			</c:forEach>
								</tbody>
							</table>
							<!-- Basic Tables end -->
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
							<form class="form">
								<div class="row">
									<div class="col-12">
									</div>
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
                                                name="progress" readonly>
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
											<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3" readonly style="background-color: white"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">닫기</span>
							</button>
						</div>
					</div>
					
					<div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab">
						<div class="modal-body">
							<form class="form" id="detail">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">닫기</span>
							</button>
						</div>
					</div>
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
		    {"className": "dt-center", "targets": "_all"},
		    {"orderable": false, "targets": 0},
		    {"width": "5%", "targets": 0},
		    {"width": "20%", "targets": 1},
		    {"width": "20%", "targets": 2}
		],
		"language": {
	        "zeroRecords": "승인 대기중인 결재가 없습니다."
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
		    {"width": "20%", "targets": 0},
		    {"width": "20%", "targets": 1}
		],
		"language": {
	        "zeroRecords": "승인 완료된 결재가 없습니다."
	    },
		"order": [5, 'desc']
	});
	
	$("#table3").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"orderable": false, "targets": 0},
		    {"width": "5%", "targets": 0},
		    {"width": "20%", "targets": 1},
		    {"width": "20%", "targets": 2}
		],
		"language": {
	        "zeroRecords": "반려된 결재가 없습니다."
	    },
		"order": [6, 'desc']
	});

	$(document).ready(function() {
		$("#cbx_chkAll1").click(function() {	
			if($("#cbx_chkAll1").is(":checked")) 
				$("input[name=chk1]").prop("checked", true);
			else 
				$("input[name=chk1]").prop("checked", false);
		});
			
		$("input[name=chk1]").click(function() {			
			let total = $("input[name=chk1]").length;
			let checked = $("input[name=chk1]:checked").length;
			
			if(total != checked) 
				$("#cbx_chkAll1").prop("checked", false);
			else 
				$("#cbx_chkAll1").prop("checked", true); 
		});
	});
	
	$(document).ready(function() {
		$("#cbx_chkAll2").click(function() {	
			if($("#cbx_chkAll2").is(":checked")) 
				$("input[name=chk2]").prop("checked", true);
			else 
				$("input[name=chk2]").prop("checked", false);
		});
			
		$("input[name=chk2]").click(function() {			
			let total = $("input[name=chk2]").length;
			let checked = $("input[name=chk2]:checked").length;
			
			if(total != checked) 
				$("#cbx_chkAll2").prop("checked", false);
			else 
				$("#cbx_chkAll2").prop("checked", true); 
		});
	});
		
	function taskDetail(taskId){
		$.ajax({
			url: "${path}/myTask/detail.do",
			type: 'GET',
			data: "taskId="+taskId,
			dataType: "json",
			success: function(data) {
				let myTaskDetail = data.myTaskDetail;
				let myOutputInfo = data.myOutputInfo;
				
				$("input[name=taskName]").val(myTaskDetail.taskName);
				$("input[name=pTitle]").val(myTaskDetail.pTitle);
				$("input[name=startAt]").val(myTaskDetail.startAt);
				$("input[name=endAt]").val(myTaskDetail.endAt);
				$("input[name=progress]").val(myTaskDetail.progress);
				$("input[name=pmName]").val(myTaskDetail.pmName);
				$("textarea[name=content]").val(myTaskDetail.content);
				
				var htmlStr = "";
				
				if (myOutputInfo.length == 0){
					htmlStr += "<p style=\"margin-bottom: 0px;\">등록된 산출물이 없습니다.</p>"	

					$("#detail").html(htmlStr);	
					$(".callModal").click();
					
				} else {
					for (var i=0; i<myOutputInfo.length; i++) {	
						htmlStr += "<div class=\"row\">";
						htmlStr += "<div class=\"form-group\">";
						htmlStr += "<details>";
						htmlStr += "<summary>";
						htmlStr += "<span class=\"fw-bold\">" + myOutputInfo[i].originalName + "</span>";
						htmlStr += "</summary>";
						htmlStr += "<div style=\"margin-top: 10px; padding: 10px 10px; background-color: #f2f7ff;\">";
						htmlStr += "<div class=\"row\">";
						htmlStr += "<div class=\"col-md-6 col-12\">";
						htmlStr += "<label for=\"first-name-column\" style=\"padding-bottom: 6px;\">산출물 카테고리</label>";
						
						if(myOutputInfo[i].category == "필수 산출물") {
							htmlStr += "<input type=\"text\" class=\"form-control\" id=\"first-name-column\" readonly value=\"필수 산출물\" style=\"background-color: white;\" >";
						} else {
							htmlStr += "<input type=\"text\" class=\"form-control\" id=\"first-name-column\" readonly value=\"추가 산출물\" style=\"background-color: white;\" >";
						}
						
						htmlStr += "</div>";
						htmlStr += "<div class=\"col-md-6 col-12\">";
						htmlStr += "<label for=\"first-name-column\" style=\"padding-bottom: 6px;\">산출물 종류</label>";
						htmlStr += "<input type=\"text\" class=\"form-control\" id=\"first-name-column\" value=" + myOutputInfo[i].outType + " readonly style=\"background-color: white;\">";
						htmlStr += "</div>";
						htmlStr += "<div class=\"col-12\">";
						htmlStr += "<label for=\"exampleFormControlTextarea1\" class=\"exampleFormControlTextarea1\" style=\"margin-top: 10px\">산출물 설명</label>";
						
						if(myOutputInfo[i].content == null) {
							htmlStr += "<textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" readonly rows=\"3\" style=\"background-color: white;\"></textarea>";
							} else {
							htmlStr += "<textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" readonly rows=\"3\" style=\"background-color: white;\">" + myOutputInfo[i].content + "</textarea>";
						}
						
						htmlStr += "</div>";
						htmlStr += "</div>";
						htmlStr += "</div>";
						htmlStr += "</details>"
						htmlStr += "</div>";
						htmlStr += "</div>"
						htmlStr += "</div>"
					}
					
					$("#detail").html(htmlStr);				
					$(".callModal").click();
				}
			}
		});	
	}

	function MyApprovalCancel1() {
		if($("input[name=chk1]").is(":checked")) {
			Swal.fire({
				title: '결재를 회수하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskIdValues = [];
					$("input[name=chk1]:checked").each(function(i) {
						taskIdValues.push($(this).val());
					});	
					
					let taskIdData = {"taskId": taskIdValues};
					
					$.ajax({
						url: "${path}/myTask/approvalCancel.do",
						type: 'GET',
						data: taskIdData,
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '결재가 회수되었습니다.' 
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
				title: '작업을 선택해주세요',
				icon: 'error'
			})
		}
	}
	
	function MyApprovalCancel2() {
		if($("input[name=chk2]").is(":checked")) {
			Swal.fire({
				title: '결재를 회수하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskIdValues = [];
					$("input[name=chk2]:checked").each(function(i) {
						taskIdValues.push($(this).val());
					});	
					
					let taskIdData = {"taskId": taskIdValues};
					
					$.ajax({
						url: "${path}/myTask/approvalCancel.do",
						type: 'GET',
						data: taskIdData,
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '결재가 회수되었습니다.' 
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
				title: '작업을 선택해주세요',
				icon: 'error'
			})
		}
	}
	

	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>