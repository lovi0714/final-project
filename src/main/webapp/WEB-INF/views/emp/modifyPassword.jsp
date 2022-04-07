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
	                <h3>비밀번호 변경</h3>
	            </div>
	        </div>
	    </div>
	<section id="basic-horizontal-layouts">
        <div class="row match-height" style="margin-left: -62px;">
            <div class="col-md-6 col-12" style="margin-left: 50px">
                <div class="card">
                    <div class="card-header">
                        <p class="card-title">비밀번호 변경</p>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form id="passwordForm" class="form form-horizontal" action="${path}/emp/modifyPassword.do" method="post">
                                <div class="form-body">
                                    <div class="row">
                                        
										<div class="col-md-4">
                                            <label>새로운 비밀번호</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="password" id="password" class="form-control" name="password"
                                                placeholder="새로운 비밀번호를 입력해주세요.">
                                        </div><div class="col-md-4">
                                            <label>비밀번호 확인</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="password" id="checkPassword" class="form-control" name="CheckPassword"
                                                placeholder="비밀번호를 확인해주세요.">
                                        </div>
                                                                            
                                        <div class="col-sm-12 d-flex justify-content-end">
                                            <button type="button" class="btn btn-primary me-1 mb-1" id="changeBtn">변경</button>
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

$(function() {
	$('#changeBtn').click(function(e) {
		e.preventDefault();
		
		const password = $('#password').val().replace(/\s/gi, "");
		const checkPassword = $('#checkPassword').val().replace(/\s/gi, "");
		
		if (password === '') {
			Swal.fire({
  			  icon: 'error',
  			  title: '변경할 패스워드를 입력하세요.',
  			});
			
			return false;
		}
		
		if (checkPassword === '') {
			Swal.fire({
  			  icon: 'error',
  			  title: '패스워드 확인 입력하세요.',
  			});
			
			return false;
		}
		
		if (checkPassword !== password) {
			Swal.fire({
  			  icon: 'error',
  			  title: '동일한 패스워드를 입력하세요.',
  			});
			
			return false;
		}
		
		if (password === checkPassword) {
			$('#passwordForm').submit();
		}
		
	});
});
</script>      
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 