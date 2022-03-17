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
	                        <tr>
	                            <td><div><a href="#">SI사업 기획서 작성</a></div></td>
	                            <td><div>공공 SI사업 프로젝트</div></td>
	                            <td>승인중</td>
	                            <td>홍길동</td>
	                            <td>2022-03-10 04:40</td>
	                            <td>
	                            	<button type="button" class="btn btn-success">승인</button>
	                            	<button type="button" class="btn btn-danger">반려</button>
	                            </td>
	                        </tr>
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
		$('#regBtn').click(function() {
			location.href = '${path}/project/create.do';
		});
	});
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>