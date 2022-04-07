<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	                <p class="fw-bold">프로젝트 현황</p>
	            </div>
	          
	            <div class="card-body">
	            	<div class="row pt-3" style="background-color: #f2f7ff;">
		                <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="projectStatusId">
		                            <option value="">프로젝트 상태를 선택하세요.</option>
		                            <option value="1">시작전</option>
		                            <option value="2">정상진행</option>
		                            <option value="3">지연진행</option>
		                            <option value="4">완료</option>
		                            <option value="5">중단</option>
		                        </select>
		                    </fieldset>
		                </div>
                         <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="projectTypeId">
   		                            <option value="">프로젝트 유형을 선택하세요.</option>
                                    <option value="1">선행개발</option>
                                    <option value="2">고객개발</option>
                                    <option value="3">양산개발</option>
                                </select>
		                    </fieldset>
		                </div>
   		                <div class="col-md-3">
	                        <div class="input-group mb-3">
	                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword">
   	                            <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
	                        </div>
                        </div>
                        <div class="col-md-3">
   	                        <div class="input-group mb-3 justify-content-end">
   	                        	<c:if test="${emp.authId ne '1'}">
                            		<button class="btn btn-primary" type="button" id="regBtn">프로젝트 등록</button>
                            	</c:if>
                            </div>
                        </div>
                        
            		</div>
	                <table class="table" id="table1">
	                    <thead>
	                        <tr>
	                            <th>프로젝트 코드</th>
	                            <th>프로젝트</th>
	                            <th>시작일</th>
	                            <th>완료일</th>
	                            <th>진행상태</th>
	                        </tr>
	                    </thead>
	                    <tbody>
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
	$(function() {
		//Jquery Datatable
		$("#table1").DataTable({
			"searching": false,
			"info" : false,
			"lengthChange": false,
			"serverSide": true,
	        "processing": true, // 서버와 통신 시 응답을 받기 전이라는 ui를 띄울 것인지 여부
	        "columns" : [
                   {data: "projectId", render: function(c) {
                		return '<a href="${path}/project/detail.do?projectId=' + c + '">' + c + '</a>';
           			}
                   },
                   {data: "title"},
                   {data: "startAt", render: function(c) {
                    	return dateFormat(new Date(c[0], c[1], c[2]));
                   	}
                   },
                   {data: "endAt", render: function(c) {
                    	return dateFormat(new Date(c[0], c[1], c[2]));
                   	}
                   },
                   {data: "statusId", render: function(c) {
                   		return getProjectStatus(c);
                   	}
                   }
            ],
			"columnDefs": [
			    {"className": "dt-center", "targets": "_all"}
			],
			"order": [0, 'desc']
			,
			"language": {
		        "zeroRecords": "등록된 프로젝트가 없습니다."
		    },
		    "ajax": {
	           url: '${path}/project/api/list.do',
	           type: "GET",
	           data: function (data) {
	        	   console.log(data);
	        	   data.projectStatusId = $('#projectStatusId').val();
	        	   data.projectTypeId = $('#projectTypeId').val();
	        	   data.keyword = $('#keyword').val();
	             return data;
	           }
	         },
	        

		});
		
		function getProjectStatus(statusId) {
			let html = '';
    		switch(statusId) {
    			case 1:
    				html = '<td><span class="badge bg-secondary">시작전</span></td>';
    				break;
    			case 2:
    				html = '<td><span class="badge bg-success">정상진행</span></td>';
    				break;
    			case 3:
    				html = '<td><span class="badge bg-danger">지연진행</span></td>';
    				break;
    			case 4:
    				html = '<td><span class="badge bg-primary">완료</span></td>';
    				break;
    			case 5:
    				html = '<td><span class="badge bg-warning">중단</span></td>';
    				break;
    		}
    		
        	return html;
		}
		
		function dateFormat(date) {
	        let month = date.getMonth();
	        let day = date.getDate();

	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;

	        return date.getFullYear() + '-' + month + '-' + day;
		}
		
		$('#regBtn').click(function() {
			console.log('click')
			location.href = '${path}/project/create.do';
		});
		
		$('#searchBtn').on('click', function() {
			$('#table1').DataTable().ajax.reload();						// reload 를 받드시해야한다
		});
		
		$('#keyword').on('keydown', function(e) {
			if (e.keyCode === 13) {
				$('#table1').DataTable().ajax.reload();						// reload 를 받드시해야한다
			}
		});
	});
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>