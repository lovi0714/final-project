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
		                        <select class="form-select" id="projectId">
		                            <option value="">프로젝트를 선택하세요.</option>
									<c:forEach var="p" items="${projectList}">
										<option value="${p.projectId}">${p.projectName}</option>
									</c:forEach>
		                        </select>
		                    </fieldset>
		                </div>
   		                <div class="col-md-3">
	                        <div class="input-group mb-3">
	                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword">
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
	                            <th>처리</th>
	                        </tr>
	                    </thead>
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
	$(function() {
		//Jquery Datatable
		$("#table1").DataTable({
			"searching": false,
			"info" : false,
			"lengthChange": false,
			"serverSide": true,
		    "processing": true, // 서버와 통신 시 응답을 받기 전이라는 ui를 띄울 것인지 여부
		    "columns" : [
		        {data: "taskName", render: function(c) {
		        	return '<div><a href="#">' + c + '</a></div>';
		        }},
		        {data: "projectName"},
		        {data: "statusId", render: function(c) {
		        	return getStatusBadge(c);
		        }},
		        {data: "empName"},
		        {data: "approvalDate", render: function(c) {
		        	if (c[5] === undefined) c[5] = '00';
		        	return dateFormat(new Date(c[0], c[1], c[2], c[3], c[4], c[5]));
		        }},
		        {data: "approvalId", render: function(data, type, row) {
		        	if (row.statusId === 1)
		        		return '<button type="button" id="approvalBtn" class="btn btn-success" data-id="'+ data + '">승인</button><button type="button" id="rejectBtn" class="btn btn-danger" data-id="' + data + '">반려</button>';
		        	else 
	        			return '<span></span>';
		        }}
		 	],
			"columnDefs": [
			    {"className": "dt-center", "targets": "_all"}
			],
			"language": {
		        "zeroRecords": "승인 요청이 없습니다."
		    },
		    "ajax": {
		       url: '${path}/approval/api/list.do',
		       type: "GET",
		       data: function (data) {
		    	   data.projectId = $('#projectId').val();
		    	   data.keyword = $('#keyword').val();
		           return data;
		       }
		   	 }
		});
		
		$('#searchBtn').on('click', function() {
			$('#table1').DataTable().ajax.reload();
		});
		
		$('#keyword').on('keydown', function(e) {
			if (e.keyCode === 13) {
				$('#table1').DataTable().ajax.reload();
			}
		});
		
	});
	
	$(document).on('click', '#rejectBtn', function() {
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
					  	Swal.fire('반려 완료', '반려 처리되었습니다.', 'success')
					  	.then(() => {
							location.href = '${path}/approval/list.do';
					  	});

					}).fail(function(error) {
						console.log(error);
				  	});
			    
			  } else if (result.isDenied) {
			    Swal.fire('취소', '취소합니다.', 'info')
			  }
		});
	});
	
	$(document).on('click', '#approvalBtn', function() {
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
					  	Swal.fire('승인 완료', '승인 처리되었습니다.', 'success')
					  	.then(() => {
							location.href = '${path}/approval/list.do';
					  	});
					}).fail(function(error) {
						console.log(error);
				  	});
			    
			  } else if (result.isDenied) {
			    Swal.fire('취소', '취소합니다.', 'info')
			  }
		});
	});
	
	const getStatusBadge = (statusId) => {
		let html = '';
		
		switch (statusId) {
		case 1:
			html = '<span class="badge bg-secondary">승인대기</span>';
			break;
		case 2:
			html = '<span class="badge bg-success">승인완료</span>';
			break;
		case 3:
			html = '<span class="badge bg-danger">반려</span>';
			break;
		case 4:
			html = '<span class="badge bg-warning">회수</span>';
			break;
		}
		
		return html;
	}
	
	const getStatusBtn = (data, row) => {
		if (row.statusId === 1)
			return '<button type="button" id="approvalBtn" class="btn btn-success" data-id="'+ data + '">승인</button><button type="button" id="rejectBtn" class="btn btn-danger" data-id="' + data + '">반려</button>';
	};
	
	const dateFormat = (date) => {
		let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	};
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>