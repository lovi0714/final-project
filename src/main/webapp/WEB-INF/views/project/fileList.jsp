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
	                <p class="fw-bold">프로젝트 산출물</p>
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
                        <div class="col-md-3">
   	                        <div class="input-group mb-3 justify-content-end">
                            	<button class="btn btn-primary" type="button" id="regBtn">산출물 등록</button>
                            </div>
                        </div>
                        
            		</div>
	                <table class="table" id="table1">
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
	                            <td><div><a href="#">필수스타일목록.txt</a></div><div>sysadmin on 2021-01-19 file size 2.8kb</div></td>
	                            <td>공공SI 사업 프로젝트</td>
	                        </tr>
	                        <tr>
	                            <td><span class="badge bg-secondary">선택</span></td>
	                            <td><div><a href="#">프로젝트 메뉴얼.pptx</a></div><div>sysadmin on 2021-01-19 file size 13.8mb</div></td>
	                            <td>공공SI 사업 프로젝트</td>
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