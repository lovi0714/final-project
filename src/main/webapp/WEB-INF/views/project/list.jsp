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
		                        <select class="form-select" id="basicSelect">
		                            <option>프로젝트 상태를 선택하세요.</option>
		                            <option>시작전</option>
		                            <option>정상진행</option>
		                            <option>지연진행</option>
		                            <option>완료</option>
		                            <option>중단</option>
		                        </select>
		                    </fieldset>
		                </div>
                         <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
   		                            <option>부서를 선택하세요.</option>
                                    <option>인사</option>
                                    <option>회계</option>
                                    <option>경영지원</option>
                                    <option>생산관리</option>
                                    <option>기술지원</option>
                                    <option>연구개발</option>
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
                            	<button class="btn btn-primary" type="button" id="regBtn">프로젝트 등록</button>
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
	                            <th>진행률(%)</th>
	                            <th>산출물</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                      	<c:choose>
	                      		<c:when test="${list.size() > 0}">
	                      			<c:forEach var="project" items="${list}">
									<tr>
			                            <td><a href="${path}/project/detail.do?projectId=${project.projectId}">${project.projectId}</a></td>
			                            <td>${project.title}</td>
			                            <td>${project.startAt}</td>
			                            <td>${project.endAt}</td>
			                            <td>
			                            	<div class="progress progress-primary">
						                    <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
						                	</div>			
		                				</td>
			                            <td>
			                            	<div class="avatar bg-info me-3">
							                    <span class="avatar-content">4</span>
							                </div>
		                				</td>
	                        		</tr>
	                       			</c:forEach>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<tr><td colspan="6" style="text-align: center;"><h6>등록된 프로젝가 없습니다.</h6></td></tr>
	                      		</c:otherwise>
	                      	</c:choose>
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
		let listSize = ${list.size()};
		
		if (listSize > 0) {
			$("#table1").DataTable({
				"searching": false,
				"info" : false,
				"lengthChange": false,
				"columnDefs": [
				    {"className": "dt-center", "targets": "_all"}
				]
			});
		}
			
		$('#regBtn').click(function() {
			console.log('click')
			location.href = '${path}/project/create.do';
		});
	});
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>