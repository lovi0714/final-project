<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isProjectSide" value="active" />
	<jsp:param name="isList" value="active" />
</jsp:include>

<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
	    <div class="page-title">
	        <div class="row">
	            <div class="col-12 col-md-6 order-md-1 order-last">
	                <h3>프로젝트</h3>
	            </div>
	        </div>
	    </div>
	
	    <!-- Basic Tables start -->
	    <section class="section">
	        <div class="card">
	            <div class="card-header">
	                <p class="fw-bold">프로젝트 작업승인</p>
	            </div>
	          
	            <div class="card-body">
	            	<div class="row pt-3" style="background-color: #f2f7ff;">
		                <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
		                            <option>프로젝트를 선택하세요.</option>
		                            <option>공공SI 사업 프로젝트</option>
		                        </select>
		                    </fieldset>
		                </div>
                         <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
   		                            <option>카테고리를 선택하세요.</option>
                                    <option>필수 산출물</option>
                                    <option>추가 산출물</option>
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
	                <table class="table" id="table1">
	                    <thead>
	                        <tr>
	                            <th>작업명</th>
	                            <th>프로젝트</th>
	                            <th>결재상태</th>
	                            <th>요청자</th>
	                            <th>결재요청일</th>
	                            <th></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach var="approval" items="${list}">
		                    	<tr>
		                            <td><div><a href="#">${approval.taskName}</a></div></td>
		                            <td><div>${approval.projectName}</div></td>
		                            <td>
		                            	<c:choose>
		                            		<c:when test="${approval.statusId eq '1'}">
		                            			<span class="badge bg-secondary">승인대기</span>
		                            		</c:when>
		                            		<c:when test="${approval.statusId eq '2'}">
		                            			<span class="badge bg-success">승인완료</span>
		                            		</c:when>
		                            		<c:when test="${approval.statusId eq '3'}">
		                            			<span class="badge bg-danger">반려</span>
		                            		</c:when>
		                            		<c:when test="${approval.statusId eq '4'}">
		                            			<span class="badge bg-warning">회수</span>
		                            		</c:when>
		                            	</c:choose>
		                            </td>
		                            <td>${approval.empName}</td>
		                            <td><javatime:format value="${approval.approvalDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
   		                            <td>
		                            <c:choose>
		                            	<c:when test="${approval.statusId eq '1'}">
			                            	<button type="button" id="approvalBtn" class="btn btn-success" data-id="${approval.approvalId}">승인</button>
			                            	<button type="button" id="rejectBtn" class="btn btn-danger" data-id="${approval.approvalId}">반려</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<span></span>
		                            	</c:otherwise>
		                            </c:choose>
		                            </td>
		                        </tr>
	                    	</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	
	    </section>
	    <!-- Basic Tables end -->
	</div>
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
<script>
	//Jquery Datatable
	$("#table1").DataTable({
		"searching": false,
		"info" : false,
		"lengthChange": false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"}
		]
	});
	
	$(function() {
		$('#approvalBtn').click(function() {
			Swal.fire({
			  title: '작업을 승인 처리하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonText: '승인',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
					  url: "${path}/approval/approval/" + $(this).data("id"),
					  method: "post",
					}).done(function(msg) {
						console.log(msg);
					  	Swal.fire('승인 완료', '승인 처리되었습니다.', 'success');
						location.href = '${path}/approval/list.do';
					}).fail(function(error) {
						console.log(error);
				  	});
			    
			  } else if (result.isDenied) {
			    Swal.fire('취소', '취소합니다.', 'info')
			  }
			});
		});
		
		$('#rejectBtn').click(function() {
			Swal.fire({
			  title: '작업을 반려 처리하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonText: '반려',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
					  url: "${path}/approval/reject/" + $(this).data("id"),
					  method: "post",
					}).done(function(msg) {
					  	Swal.fire('반려 완료', '반려 처리되었습니다.', 'success');

						location.href = '${path}/approval/list.do';
					}).fail(function(error) {
						console.log(error);
				  	});
			    
			  } else if (result.isDenied) {
			    Swal.fire('취소', '취소합니다.', 'info')
			  }
			});
		});
	});
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>