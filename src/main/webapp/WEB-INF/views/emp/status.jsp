<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
	    <div class="page-title">
	        <div class="row"> 
	            <div class="col-12 col-md-6 order-md-1 order-last">
	                <h3>사용자 현황</h3>
	            </div>
	        </div>
	    </div>
	
	    <!-- Basic Tables start -->
	    <section class="section">
	        <div class="card">
	            <div class="card-header">
	                <p class="fw-bold">사용자 현황</p>
	            </div>
	          
	            <div class="card-body">
	            	<div class="row pt-3" style="background-color: #f2f7ff;">
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
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
		                            <option>직급를 선택하세요.</option>
                                    <option>사원</option>
                                    <option>대리</option>
                                    <option>팀장</option>
                                    <option>과장</option>
                                    <option>PM</option>
                                   
		                        </select>
		                    </fieldset>
		                </div>    	    		              
   		                <div class="col-md-3">
	                        <div class="input-group mb-3">
	                            <input type="text" class="form-control" placeholder="이름">
   	                            <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
	                        </div>
                        </div>                                             
            		</div>
	                <table class="table" id="table1">
	                    <thead>
	                        <tr>
	                            <th>이름</th>
	                            <th>부서</th>
	                            <th>직급</th>
	                            <th>번호</th>
	                            <th>프로젝트 참여수</th>	                            
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>홍길동</td>
	                            <td>인사</td>
	                            <td>대리</td>
	                            <td>010-1234-1234</td>                          
	                            <td>
	                            	<div class="avatar bg-info me-3">
					                    <span class="avatar-content">4</span>
					                </div>
                				</td>
	                        </tr>
	                         <tr>
	                            <td>김길동</td>
	                            <td>경영관리</td>
	                            <td>사원</td>
	                            <td>010-1234-4321</td>	                            	                           
	                            <td>
	                            	<div class="avatar bg-info me-3">
					                    <span class="avatar-content">2</span>
					                </div>
                				</td>
	                        </tr>
	                        <tr>
	                            <td>신길동</td>
	                            <td>인사</td>
	                            <td>PM</td>
	                            <td>010-1234-1345</td>	                            	                           
	                            <td>
	                            	<div class="avatar bg-info me-3">
					                    <span class="avatar-content">2</span>
					                </div>
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
		
	});

    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>