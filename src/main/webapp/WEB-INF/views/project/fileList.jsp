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
                            	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary" id="regBtn">산출물 등록</button>
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

<div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" data-bs-backdrop="static" aria-labelledby="myModalLabel160" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title white" id="myModalLabel160">산출물 등록
                </h5>
            </div>
            <div class="modal-body">
                <form class="form">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">파일</label>
                                            <input type="file" id="first-name-vertical" class="form-control" placeholder="산출물 제목을 입력하세요." name="pname" maxlength="120">
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
                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
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
		
	});
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>