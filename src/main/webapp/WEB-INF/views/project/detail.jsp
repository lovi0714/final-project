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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<style>
.nav-tabs .nav-link.active {
	color: white;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	background-color: #435ebe;
}

.nav {
	padding-left: 10px;
}

.error {
	color: #f44336 !important;
}
</style>
<div id="main-content">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>프로젝트</h3>
				</div>
			</div>
		</div>

		<section class="section">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<a class="nav-link active" href="${path}/project/detail.do?projectId=${param.projectId}">기본정보</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="${path}/project/resource.do?projectId=${param.projectId}">리소스</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="${path}/project/wbs.do?projectId=${param.projectId}">WBS</a>
				</li>
			</ul>
			<div class="card">
				<div class="card-body">
					
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div class="col-12 d-flex justify-content-end">
							<c:if test="${emp.authId ne '1' }">
	                           <button type="button" id="modBtn" class="btn btn-primary me-1 mb-1">편집모드</button>
							</c:if>
                      	</div>
						<form class="form" id="prjForm" action="${path}/project/create.do" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">프로젝트 제목</label>
                                            <input type="text" id="projectTitle" class="form-control" placeholder="프로젝트 제목을 입력하세요." name="title" maxlength="120" value='<c:out value="${project.title}"></c:out>' disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                    <div class="form-group">
                                            <label for="basicSelect">프로젝트 유형</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectTypeId" name="typeId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">R&D 구분</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="rndTypeId" name="rndId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 관리자</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="pmDeptType" name="deptId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectPmId" name="pmId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">PMO</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="pmoDeptType" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="projectPmoId" name="pmoId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 시작일</label>
                                   			<input type="date" id="projectStartAt" class="form-control mt-2" name="startAt" value="${project.startAt}" disabled>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 완료일</label>
                                          	<input type="date" id="projectEndAt" class="form-control mt-2" name="endAt" value="${project.endAt}" disabled>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 상태</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="statusId" name="statusId" disabled>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                    <div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">프로젝트 설명</label>
                            				<textarea class="form-control" id="projectContent" rows="3" name="content" disabled><c:out value="${project.content}"></c:out></textarea>
                                        </div>
                                	</div>
                                	<c:if test="${emp.authId ne '1'}">
	                                    <div id="btnWrap" class="col-12 d-flex justify-content-end" style="display: none;">
	                                        <button type="button" id="deleteBtn" class="btn btn-danger me-1 mb-1">삭제</button>
	                                        <button type="button" id="saveBtn" class="btn btn-primary me-1 mb-1">수정</button>
	                                        <button type="button" id="cancleBtn" class="btn btn-light-secondary me-1 mb-1">취소</button>
	                                    </div>
                                    </c:if>
                                </div>
                            </form>
					</div>
				</div>
			</div>
		</section>
                </div>
<script type="text/javascript">
$(function() {
	let beforeData = undefined;

	$('#btnWrap').attr('style', 'display: none !important');
	
	$('#saveBtn').click(function() {
		const result = $('#prjForm').valid();
		
		if (result) {
			Swal.fire({
				  title: '변경사항을 저장하시겠습니까?',
				  text: '변경사항이 저장됩니다.',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니오',
				}).then((result) => {
				  if (result.isConfirmed) {
					  
				  	 var data = {
				  		projectId: '${param.projectId}',
						title: $('#projectTitle').val(),
						typeId: $('#projectTypeId').val(),
			            rndTypeId: $('#rndTypeId').val(),
			            pmId: $('#projectPmId').val(),
			            pmoId: $('#projectPmoId').val(),
			            startAt: $('#projectStartAt').val(),
			            endAt: $('#projectEndAt').val(),
			            content: $('#projectContent').val(),
			            statusId: $('#statusId').val()
			    	  };
							
				  	toggleDisabled(true);
				  	
					$.ajax({
					  url: "${path}/project/api/modify.do",
					  method: "post",
					  contentType: "application/json; charset=utf-8",
					  data: JSON.stringify(data)
					}).done(function(msg) {
						Swal.fire('저장되었습니다.', '', 'success')
					}).fail(function(error) {
						console.log(error);
						Swal.fire('오류가 발생하여 저장하지 못했습니다.', '', 'info')
					});
		  		}
			})
		}
		
	});
	
	$('#modBtn').click(function() {
		setBeforeData();
		toggleDisabled(false);
	});
	
	$('#deleteBtn').click(function() {
		Swal.fire({
		  title: '프로젝트 정말 삭제하시겠습니까?',
		  text: '삭제후 복구가 불가능 합니다.',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소',
		}).then((result) => {
		  if (result.isConfirmed) {
			  $.ajax({
				  url: "${path}/project/api/delete",
				  method: "post",
				  data: {"projectId": '${param.projectId}'}
				}).done(function(msg) {
					Swal.fire('삭제되었습니다.', '', 'success')
					.then(() => {
						location.href="${path}/project/list.do";
					});
				}).fail(function(error) {
					console.log(error);
					Swal.fire('오류가 발생하여 삭제하지 못했습니다.', '', 'info')
				});
  			}
		});
	});
	
	$('#cancleBtn').click(function() {
		Swal.fire({
			  title: '편집을 취소하시겠습니까?',
			  text: '변경사항이 저장되지 않습니다.',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '예',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.isConfirmed) {
			  	  $('#projectTitle').val(beforeData.title);
				  $('#projectTypeId').val(beforeData.rndTypeId);
		          $('#rndTypeId').val(beforeData.rndTypeId);
		          $('#pmDeptType').val(beforeData.pmDeptType);
		          $('#pmoDeptType').val(beforeData.pmoDeptType);
		          $('#projectStartAt').val(beforeData.startAt);
		          $('#projectEndAt').val(beforeData.endAt);
		          $('#projectContent').val(beforeData.content);
		          $('#statusId').val(beforeData.statusId);
				  getPmList(beforeData.pmId);
				  getPmoList(beforeData.pmoId);
				
		  		  toggleDisabled(true);
	  		}
		})
	});
	
	const setBeforeData = () => {
		beforeData = {
			title: $('#projectTitle').val(),
			// statusId: '1',
			typeId: $('#projectTypeId').val(),
            rndTypeId: $('#rndTypeId').val(),
            pmDeptType: $('#pmDeptType').val(),
            pmId: $('#projectPmId').val(),
            pmoDeptType: $('#pmoDeptType').val(),
            pmoId: $('#projectPmoId').val(),
            startAt: $('#projectStartAt').val(),
            endAt: $('#projectEndAt').val(),
            content: $('#projectContent').val(),
            statusId: $('#statusId').val()
		};
	}
	
	const toggleDisabled = (isDisabled) => {
		if (isDisabled) 
			$('#btnWrap').attr('style', 'display: none !important');
		else
			$('#btnWrap').attr('style', 'display: flex !important');

	 	$('#modBtn').attr('disabled', !isDisabled);
		  
		$('#projectTitle').attr('disabled', isDisabled);
		$('#projectTypeId').attr('disabled', isDisabled);
        $('#rndTypeId').attr('disabled', isDisabled);
        $('#pmDeptType').attr('disabled', isDisabled);
        $('#projectPmId').attr('disabled', isDisabled);
        $('#pmoDeptType').attr('disabled', isDisabled);
        $('#projectPmoId').attr('disabled', isDisabled);
        $('#projectStartAt').attr('disabled', isDisabled);
        $('#projectEndAt').attr('disabled', isDisabled);
        $('#projectContent').attr('disabled', isDisabled);
        $('#statusId').attr('disabled', isDisabled);
	}
	
	const getPmoList = (id) => {
		$.ajax({
			  url: "${path}/project/api/pmo/" + $('#pmoDeptType').val() +".do",
			  method: "get",
			}).done(function(result) {
				$('#projectPmoId').empty();
				if (result.length == 0) $('#projectPmoId').append(`<option selected disabled>사원이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	if (data.pmId === Number(id)) 
			    		$('#projectPmoId').append(`<option value="\${data.pmId}" selected>\${data.pmName}</option>`);
			    	else 
			    		$('#projectPmoId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const getPmList = (id) => {
		$.ajax({
			  url: "${path}/project/api/pm/" + $('#pmDeptType').val() +".do",
			  method: "get",
			}).done(function(result) {
				$('#projectPmId').empty();
				if (result.length == 0) $('#projectPmId').append(`<option selected disabled>사원이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	if (data.pmId === Number(id))
			    		$('#projectPmId').append(`<option value="\${data.pmId}" selected>\${data.pmName}</option>`);
			    	else 
			    		$('#projectPmId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const getProjectStatus = () => {
		$.ajax({
			  url: "${path}/project/api/status.do",
			  method: "get"
			}).done(function(result) {
				$('#statusId').empty();
				if (result.length == 0) $('#statusId').append(`<option selected disabled>프로젝트 상태 에러.</option>`);
			    result.map((data, idx) => {
			    	if (data.statusId === ${project.statusId})
			    		$('#statusId').append(`<option value="\${data.statusId}" selected>\${data.status}</option>`);
			    	else 
			    		$('#statusId').append(`<option value="\${data.statusId}">\${data.status}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	$('#pmDeptType').change(() => {
		getPmList();
	});
	
	$('#pmoDeptType').change(() => {
		getPmoList();
	});
	
	$.ajax({
		  url: "${path}/project/api/deptType.do",
		  method: "get",
		}).done(function(result) {
		    result.map((data, idx) => {
		    	if (data.deptId === ${pm.deptId})
		    		$('#pmDeptType').append(`<option value="\${data.deptId}" selected>\${data.deptName}</option>`);
		    	else
		    		$('#pmDeptType').append(`<option value="\${data.deptId}">\${data.deptName}</option>`);
		    	
		    	if (data.deptId === ${pmo.deptId})
			    	$('#pmoDeptType').append(`<option value="\${data.deptId}" selected>\${data.deptName}</option>`);
		    	else
		    		$('#pmoDeptType').append(`<option value="\${data.deptId}">\${data.deptName}</option>`);
		    });
		    
		    $.ajax({
				  url: "${path}/project/api/pm/" + $('#pmDeptType').val() +".do",
				  method: "get",
				}).done(function(result) {
			    	if (result.length == 0) $('#projectPmId').append(`<option selected disabled>사원이 없습니다.</option>`);
				    result.map((data, idx) => {
				    	if (data.pmId === ${pm.pmId})
				    		$('#projectPmId').append(`<option value="\${data.pmId}" selected>\${data.pmName}</option>`);
				    	else 
				    		$('#projectPmId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
				    });
				}).fail(function(error) {
					console.log(error);
			});
		    
		    $.ajax({
				  url: "${path}/project/api/pmo/" + $('#pmoDeptType').val() +".do",
				  method: "get",
				}).done(function(result) {
			    	if (result.length == 0) $('#projectPmoId').append(`<option selected disabled>사원이 없습니다.</option>`);
				    result.map((data, idx) => {
				    	$('#projectPmoId').append(`<option value="\${data.pmId}">\${data.pmName}</option>`);
				    });
				}).fail(function(error) {
					console.log(error);
			});
		    getProjectStatus();
		    
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
	
	jQuery.validator.addMethod("greaterStart", function (value, element, params) {
	    return this.optional(element) || new Date(value) >= new Date($(params).val());
	},'Must be greater than start date.');
	
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
				date: true,
				greaterStart: "#projectStartAt"
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
            	required : '종료날짜를 지정하세요.',
            	date: '날짜형식을 확인하세요.',
            	greaterStart: '종료일은 시작일보다 커야합니다.'
            }
	    }
	});
	
	
});

</script>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>