<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>
<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
	    <div class="page-title">
	        <div class="row">
	            <div class="col-12 col-md-6 order-md-1 order-last">
	                <h3>관리자</h3>
	            </div>
	        </div>
	    </div>
	<section id="basic-horizontal-layouts">
        <div class="row match-height" style="margin-left: -62px;">
            <div class="col-md-6 col-12" style="margin-left: 50px">
                <div class="card">
                    <div class="card-header">
                        <h6 class="card-title">사원 추가</h6>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-horizontal" action="${path}/emp/addEmp.do" method="post">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>발신자 이름</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="first-name" class="form-control" name="senderName"
                                                value="CPMS 관리자" readonly>
                                        </div>
                                        <div class="col-md-4">
                                            <label>발신자 이메일</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="email" id="email-id" class="form-control" name="senderMail"
                                                value="dahoonEmailTest@gmail.com" readonly>
                                        </div>
                                        <div class="col-md-4">
                                            <label>사원 이메일</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="email" id="contact-info" class="form-control" name="empEmail"
                                                placeholder="이메일을 입력해주세요." required>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <label>이름</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="contact-info" class="form-control" name="name"
                                                placeholder="이름을 입력해주세요." required>
                                        </div>
                                        <div class="col-md-4">
                                            <label>전화번호</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="contact-info" class="form-control" name="phone" minlength="11"
                                                placeholder="전화번호를 입력해주세요." required>
                                        </div>
                                        <div class="col-md-4">
                                            <label>권한</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect" name="authId" required>
		                                            <option value="">권한을 선택해주세요.</option>
		                                            <option value="1">실무진</option>
		                                            <option value="2">PM</option>
		                                            <option value="3">관리자</option>
		                                        </select>
		                                    </fieldset>
		                                </div>
		                                <div class="col-md-4">
                                            <label>부서</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect" name="deptId" required>
		                                            <option value="">부서를 선택해주세요.</option>
		                                            <option value="1">인사</option>
		                                            <option value="2">회계</option>
		                                            <option value="3">경영지원</option>
		                                            <option value="4">기술지원</option>
		                                            <option value="5">생산관리</option>
		                                            <option value="6">연구개발</option>
		                                        </select>
		                                    </fieldset>
		                                </div>
		                                <div class="col-md-4">
                                            <label>직급</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect" name="posId" required>
		                                            <option value="">직급을 선택해주세요.</option>
		                                            <option value="1">사원</option>
		                                            <option value="2">대리</option>
		                                            <option value="3">팀장</option>
		                                            <option value="4">과장</option>
		                                            <option value="5">PM</option>
		                                        </select>
		                                    </fieldset>
		                                </div>							                            
                                        
                                         
                                        <div class="col-sm-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">사원추가</button>
                                        </div>
                                       </div> 
                                    </div>
                                </form>    
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
         </section> 
      </div>
      
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>    
<script>
// Jquery Datatable
let jquery_datatable = $("#table1").DataTable({
	"searching" : false,
	"lengthChange" : false,
	"info" : false,
});




</script>     
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 