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
<style>
.error {
	color: #f44336 !important;
}
</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

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
                                            <input type="text" id="projectTitle" class="form-control" placeholder="프로젝트 제목을 입력하세요." name="title" maxlength="120" required>
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
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1" id="cancelBtn">취소</button>
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
			
			$('#prjForm').validate({
				rules: {
					title: {
						required: true,
						maxlength: 120
					},
					pmId: {
						required: true
					},
					pmoId: {
						required: true
					},
					startAt: {
						required: true,
						date: true
					},
					endAt: {
						required: true,
						date: true
					}
				},
				messages : {
					title : {
		                required : '프로젝트명을 입력하세요',
		                maxlength : '프로젝트명은 최대 120자까지 입력가능합니다.'
		            },
		            pmId : {
		                required : '프로젝트 관리자를 지정하세요'
		            },
		            pmoId : {
		            	required : '프로젝트 담당자를 지정하세요'
		            },
		            startAt : {
		            	required : '시작날짜를 지정하세요.',
		            	date: '날짜형식을 확인하세요.'
		            },
		            endAt : {
		            	required : '완료날짜를 지정하세요.',
		            	date: '날짜형식을 확인하세요.'
		            }
			    }
			});
			
			const result = $('#prjForm').valid();
			
			if (result) {
				var data = {
						title: $('#projectTitle').val(),
						statusId: '1',
						typeId: $('#projectTypeId').val(),
			            rndTypeId: $('#rndTypeId').val(),
			            pmId: $('#projectPmId').val(),
			            pmoId: $('#projectPmoId').val(),
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
					Swal.fire({
						  title: '프로젝트가 등록 성공',
						  text: '프로젝트가 등록되었습니다.',
						  icon: 'success',
						  cancelButtonColor: '#d33',
						  cancelButtonText: '확인'
						}).then(() => {
							location.href = '${path}/project/list.do';
						});
				}).fail(function(error) {
					console.log(error);
				});
			}
		});
		
		$('#cancelBtn').click(function() {
			location.href = '${path}/project/list.do';
		});
	});

</script>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>