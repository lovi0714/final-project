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
            <div id="main-content">

                <div class="page-heading">
                    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">프로젝트 등록</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" id="prjForm" action="${path}/project/create.do" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">프로젝트 제목</label>
                                            <input type="text" id="projectTitle" class="form-control" placeholder="프로젝트 제목을 입력하세요." name="title" maxlength="120">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                    <div class="form-group">
                                            <label for="basicSelect">프로젝트 유형</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectTypeId" name="typeId">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">R&D 구분</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="rndTypeId" name="rndId">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 관리자</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="pmDeptType" name="deptId">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectPmId" name="pmId">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">PMO</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="pmoDeptType">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectPmoId" name="pmoId">
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 시작일</label>
                                   			<input type="date" id="projectStartAt" class="form-control mt-2" name="startAt">
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 완료일</label>
                                          	<input type="date" id="projectEndAt" class="form-control mt-2" name="endAt">
                                        </div>
                                	</div>
                                    <div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">프로젝트 설명</label>
                            				<textarea class="form-control" id="projectContent" rows="3" name="content"></textarea>
                                        </div>
                                	</div>
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1" id="regBtn">등록</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
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
<script type="text/javascript">
	$(function() {
		
		
		$('#pmDeptType').change(() => {
			$.ajax({
				  url: "${path}/project/api/pm/" + $('#pmDeptType').val() +".do",
				  method: "get",
				}).done(function(result) {
					$('#projectPmId').empty();
					if (result.length == 0) $('#projectPmId').append(`<option selected disabled>사원이 없습니다.</option>`);
				    result.map((data, idx) => {
				    	$('#projectPmId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
				    });
				}).fail(function(error) {
					console.log(error);
			});
		});
		
		$('#pmoDeptType').change(() => {
			$.ajax({
				  url: "${path}/project/api/pmo/" + $('#pmoDeptType').val() +".do",
				  method: "get",
				}).done(function(result) {
					$('#projectPmoId').empty();
					if (result.length == 0) $('#projectPmoId').append(`<option selected disabled>사원이 없습니다.</option>`);
				    result.map((data, idx) => {
				    	$('#projectPmoId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
				    });
				}).fail(function(error) {
					console.log(error);
			});
		});
		
		$.ajax({
			  url: "${path}/project/api/deptType.do",
			  method: "get",
			}).done(function(result) {
			    result.map((data, idx) => {
			    	console.log(data);
			    	$('#pmDeptType').append(`<option value="\${data.deptId}">\${data.deptName}</option>`);
			    	$('#pmoDeptType').append(`<option value="\${data.deptId}">\${data.deptName}</option>`);
			    });
			    
			    $.ajax({
					  url: "${path}/project/api/pm/" + $('#pmDeptType').val() +".do",
					  method: "get",
					}).done(function(result) {
						$('#projectPmId').empty();
						if (result.length == 0) $('#projectPmId').append(`<option selected disabled>사원이 없습니다.</option>`);
					    result.map((data, idx) => {
					    	$('#projectPmId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
					    });
					}).fail(function(error) {
						console.log(error);
				});
			    
			    $.ajax({
					  url: "${path}/project/api/pmo/" + $('#pmoDeptType').val() +".do",
					  method: "get",
					}).done(function(result) {
						$('#projectPmoId').empty();
						if (result.length == 0) $('#projectPmoId').append(`<option selected disabled>사원이 없습니다.</option>`);
					    result.map((data, idx) => {
					    	$('#projectPmoId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
					    });
					}).fail(function(error) {
						console.log(error);
				});
			    
			}).fail(function(error) {
				console.log(error);
		});
		
		
		
		$.ajax({
			  url: "${path}/project/api/projectType.do",
			  method: "get",
			}).done(function(result) {
			    result.map((data, idx) => {
			    	$('#projectTypeId').append(`<option value="\${data.projectTypeId}">\${data.projectType}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
			});
		
		$.ajax({
			  url: "${path}/project/api/rndType.do",
			  method: "get",
			}).done(function(result) {
			    result.map((data, idx) => {
			    	$('#rndTypeId').append(`<option value="\${data.rndId}">\${data.rndType}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
			});
		
		$('#regBtn').click(function(e) {
			e.preventDefault();

			 var data = {
					title: $('#projectTitle').val(),
					statusId: '1',
					typeId: $('#projectTypeId').val(),
		            rndTypeId: $('#rndTypeId').val(),
		            projectDept: $('#projectDept').val(),
		            pmId: $('#projectPmId').val(),
		            pmoId: $('#projectPmoId').val(),
		            projectPmoId: $('#projectPmoId').val(),
		            startAt: $('#projectStartAt').val(),
		            endAt: $('#projectEndAt').val(),
		            content: $('#projectContent').val()
		            };
			 
			$.ajax({
			  url: "${path}/project/create.do",
			  method: "post",
			  contentType: "application/json; charset=utf-8",
			  data: JSON.stringify(data)
			}).done(function(msg) {
				alert('프로젝트를 등록하였습니다.');
				location.href = '${path}/project/list.do';
			}).fail(function(error) {
				console.log(error);
			});
		});
	});
</script>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>