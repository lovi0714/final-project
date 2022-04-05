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

<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<style>
.error {
	color: #f44336 !important;
}
</style>
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
		                        <select class="form-select" id="projectId">
		                            <option value="">프로젝트를 선택하세요.</option>
		                        	<c:forEach var="p" items="${project}">
			                            <option value="${p.projectId}">${p.projectName}</option>
		                        	</c:forEach>
		                        </select>
		                    </fieldset>
		                </div>
                         <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="outputCategory">
   		                            <option value="">카테고리를 선택하세요.</option>
   		                            <c:forEach var="c" items="${category}">
	                                    <option value="${c.categoryId}">${c.categoryName}</option>
		                        	</c:forEach>
                                </select>
		                    </fieldset>
		                </div>
   		                <div class="col-md-3">
	                        <div class="input-group mb-3">
	                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword">
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
                <form id="outputForm" name="output" class="form" action="${path}/output/save.do" method="post" enctype="multipart/form-data">
                   <div class="row">
                       <div class="col-12">
                           <div class="form-group">
                               <label for="first-name-vertical" class="form-label">파일</label>
                               <input type="file" name="file" id="first-name-vertical" class="form-control" >
                           </div>
                       </div>
                       <div class="col-md-6 col-12">
                       <div class="form-group">
                               <label for="basicSelect">프로젝트</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="projectSelect" name="projectId">
                                 <c:forEach var="p" items="${project}">
		                            <option value="${p.projectId}">${p.projectName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       	<div class="form-group">
                               <label for="basicSelect">작업</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="taskSelect" name="taskId">
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       <div class="form-group">
                               <label for="basicSelect">산출물 카테고리</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="basicSelect" name="categoryId">
                                 <c:forEach var="c" items="${category}">
                                    <option value="${c.categoryId}">${c.categoryName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       	<div class="form-group">
                               <label for="basicSelect">산출물 종류</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="basicSelect" name="outputType">
                                 <c:forEach var="t" items="${type}">
                                    <option value="${t.typeId}">${t.typeName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                       <div class="col-12">
                       	<div class="form-group">
                               <label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
               				<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
                           </div>
                   	</div>
                   </div>
               </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="saveBtn" class="btn btn-primary ml-1" >
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

<%-- 상세 정보 --%>
<div class="modal fade text-left" id="detail" tabindex="-1" role="dialog" data-bs-backdrop="static" aria-labelledby="myModalLabel160" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title white" id="myModalLabel160">산출물 정보
                </h5>
            </div>
            <div class="modal-body">
            	<input type="hidden" id="outputId" value="">
                <form id="outputForm2" id="outputInfoForm" name="output" class="form" method="post">
                   <div class="row">
                       <div class="col-12">
                           <div class="form-group">
                               <label for="fileName" class="form-label">파일 정보</label>
                               <div><a href="#" id="fileName"></a></div>
                           </div>
                       </div>
                       <div class="col-md-6 col-12">
                       <div class="form-group">
                               <label for="basicSelect">프로젝트</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="projectSelect_m" disabled>
                                 <c:forEach var="p" items="${project}">
		                            <option value="${p.projectId}">${p.projectName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       	<div class="form-group">
                               <label for="basicSelect">작업</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="taskSelect_m" name="taskId" disabled>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       <div class="form-group">
                               <label for="basicSelect">산출물 카테고리</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="category" name="categoryId" disabled>
                                 <c:forEach var="c" items="${category}">
                                    <option value="${c.categoryId}">${c.categoryName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                   	<div class="col-md-6 col-12">
                       	<div class="form-group">
                               <label for="basicSelect">산출물 종류</label>
                         <fieldset class="form-group mt-2">
                             <select class="form-select" id="outputType" name="outputType" disabled>
                                 <c:forEach var="t" items="${type}">
                                    <option value="${t.typeId}">${t.typeName}</option>
	                        	 </c:forEach>
                             </select>
                         </fieldset>
                           </div>
                   	</div>
                       <div class="col-12">
                       	<div class="form-group">
                               <label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
               				<textarea class="form-control" id="content" name="content" rows="3" disabled></textarea>
                           </div>
                   	</div>
                   </div>
               </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeBtn" class="btn btn-light-secondary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
<script>
	const authId = ${emp.authId};
	const empId = ${emp.empId};
	
	$(function() {
		//Jquery Datatable
		$("#table1").DataTable({
			"searching": false,
			"info" : false,
			"lengthChange": false,
			"serverSide": true,
	        "processing": true, // 서버와 통신 시 응답을 받기 전이라는 ui를 띄울 것인지 여부
	        "columns" : [
	            {data: "categoryId", render: function(c) {
	         			return getCategory(c);
	    			}
	            },
	            {data: "originalName", render: function(data, type, row, meta) {
	            		return '<div><a href="javascript:outputDetail(' + row.outputId + ')">' + row.originalName + '</a></div><div>' + row.empName + ' on ' + dateFormat(new Date(row.updateAt[0], row.updateAt[1], row.updateAt[2])) + ' file size' + row.volumeText + '</div>';
	            	}
	            },
	            {data: "projectName"}
	     	],
			"columnDefs": [
			    {"className": "dt-center", "targets": "_all"}
			],
			"language": {
		        "zeroRecords": "등록된 작업이 없습니다."
		    },
		    "ajax": {
	           url: '${path}/output/api/list.do',
	           type: "GET",
	           data: function (data) {
	        	   console.log(data);
	        	   data.projectId = $('#projectId').val();
	        	   data.outputCategory = $('#outputCategory').val();
	        	   data.keyword = $('#keyword').val();
	               return data;
	           }
	       	 }
		});
		
		let isEdit = false;
		
		getTasks();

		$('#projectSelect').change(() => {
			getTasks();
		});
		
		$('#projectSelect_m').change(() => {
			getMdoalTasks();
		});
		
		$(document).on('click', '#closeBtn', function() {
			toggleModelForm(true);
		});
		
		$(document).on('click', '#updateBtn', function() {
			
			const result = $('#outputForm2').valid();
			
			if (isEdit && result) {
				let data = {
					"outputId": parseInt($('#outputId').val()),
					"outputType": parseInt($('#outputType').val()),
					"categoryId":parseInt( $('#category').val()),
					"taskId": parseInt($('#taskSelect_m').val()),
					"content": $('#content').val()
				}
					
				$.ajax({
		            type: "POST",
		            url: "${path}/output/update/" + $('#outputId').val(),
		            data: data,
				  	dataType: 'json',
		            success: function(result) {
		            	console.log(result);
		            	if (result === 'success') {
		            		Swal.fire({
	            			  icon: 'success',
	            			  title: '수정 성공',
	            			  text: '산출물을 수정하였습니다.'
	            			}).then((result) => {
	           				  if (result.isConfirmed) {
	      	            		location.href = '${path}/output/list.do';
	   						  };
	           				})
		            	}
		            },
		            error: function(error) {
		            	console.log(error);
		            	if (error === 'fail') {
		            		Swal.fire({
	            			  icon: 'error',
	            			  title: '수정 실패',
	            			  text: '산출물 수정에 실패하였습니다.'
	            			});
		            	}
		            }
		        });
				
			}
		});
		
		$(document).on('click', '#editBtn', function() {
			isEdit = true;
			toggleModelForm(false);
		});
		
		$(document).on('click', '#delBtn', function() {
			 $.ajax({
	            type: "POST",
	            url: "${path}/output/delete/" + $('#outputId').val(),
			  	dataType: 'json',
	            success: function(result) {
	            	console.log(result);
	            	if (result === 'success') {
	            		Swal.fire({
	        			  icon: 'success',
	        			  title: '삭제 성공',
	        			  text: '산출물을 삭제하였습니다.'
	        			}).then((result) => {
	       				  if (result.isConfirmed) {
	  	            		location.href = '${path}/output/list.do';
							  };
	       				})
	            	}
	            },
	            error: function(error) {
	            	console.log(error);
	            	if (error === 'fail') {
	            		Swal.fire({
	        			  icon: 'error',
	        			  title: '삭제 실패',
	        			  text: '산출물 삭제에 실패하였습니다.'
	        			});
	            	}
	            }
	        });
		});
		
		$(document).on('click', '#saveBtn', function() {
			const result = $('#outputForm').valid();
			
			if (result) {
				var form = $("#outputForm");
				
			    // you can't pass Jquery form it has to be javascript form object
			    var formData = new FormData(form[0]);
			    $.ajax({
		            type: "POST",
		            url: $(form).prop("action"),
		            //dataType: 'json', //not sure but works for me without this
		            data: formData,
		            contentType: false, //this is requireded please see answers above
		            processData: false, //this is requireded please see answers above
		            //cache: false, //not sure but works for me without this
		            error: function(error) {
		            	console.log(error);
		            	if (error === 'fail') {
		            		Swal.fire({
		        			  icon: 'error',
		        			  title: '등록 실패',
		        			  text: '산출물 등록에 실패하였습니다.'
		        			});
		            	}
		            },
		            success: function(result) {
		            	console.log(result);
		            	if (result === 'success') {
		            		Swal.fire({
		        			  icon: 'success',
		        			  title: '등록 성공',
		        			  text: '산출물을 등록하였습니다.'
		        			}).then((result) => {
		       				  if (result.isConfirmed) {
		  	            		location.href = '${path}/output/list.do';
								  };
		       				})
		            	}
		            }
		        });
			}
		});
		
		$('#searchBtn').on('click', function() {
			$('#table1').DataTable().ajax.reload();
		});
		
		$('#keyword').on('keydown', function(e) {
			if (e.keyCode === 13) {
				$('#table1').DataTable().ajax.reload();
			}
		});
		
	});
	
	const getCategory = (c) => {
		if (c === 1)
			return '<span class="badge bg-primary">필수</span>';
		else
			return '<span class="badge bg-secondary">선택</span>';
	}
	
	const getTasks = () => {
		$.ajax({
			  url: "${path}/project/api/wbs/" + $('#projectSelect').val(),
			  method: "get",
			  dataType: 'json',	
			  contentType: 'application/json; charset=utf-8'
			}).done(function(result) {
				$('#taskSelect').empty();
				if (result.length == 0) $('#taskSelect').append(`<option selected disabled>작업이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	$('#taskSelect').append(`<option value="\${data.id}">\${data.text}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const getMdoalTasks = () => {
		$.ajax({
			  url: "${path}/project/api/wbs/" + $('#projectSelect_m').val(),
			  method: "get",
			  dataType: 'json',
			  async: false,
			  contentType: 'application/json; charset=utf-8'
			}).done(function(result) {
				$('#taskSelect_m').empty();
				if (result.length == 0) $('#taskSelect_m').append(`<option selected disabled>작업이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	$('#taskSelect_m').append(`<option value="\${data.id}">\${data.text}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const outputDetail = (id) => {
		$('#editBtn').remove();
		$('#delBtn').remove();
		$('#updateBtn').remove();
		
		$.ajax({
		  	url: "${path}/output/detail/" + id,
		  	method: "get",
		  	dataType: 'json',	
			contentType: 'application/json; charset=utf-8'
			}).done(function(data) {
				console.log(data);
				$('#fileName').attr('href', '${path}/output/attach/' + data.outputFileId);
				
				$('#fileName').text(data.originalName);
				$('#projectSelect_m').val(data.projectId);
				getMdoalTasks();
				$('#taskSelect_m').val(data.taskId);
				$('#category').val(data.categoryId);
				$('#outputType').val(data.typeId);
				$('#content').val(data.content);
				$('#outputId').val(data.outputId);
				
				if (authId !== 1 || empId === data.empId) {
					$('#closeBtn').before(
							`<button type="button" id="editBtn" class="btn btn-primary ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">수정</span>
		                </button>
		                <button type="button" id="updateBtn" style="display: none;" class="btn btn-primary ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">저장</span>
		                </button>
		                <button type="button" id="delBtn" class="btn btn-danger ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">삭제</span>
		                </button>`);
				}
				
			}).fail(function(error) {
				console.log(error);
		});
		
		$('#detail').modal('show');	
	};
	
	const toggleModelForm = (isDisabled) => {
		$('#projectSelect_m').attr('disabled', isDisabled);
		$('#taskSelect_m').attr('disabled', isDisabled);
		$('#category').attr('disabled', isDisabled);
		$('#outputType').attr('disabled', isDisabled);
		$('#content').attr('disabled', isDisabled);
		
		if (isDisabled) {
			$('#editBtn').show();
			$('#updateBtn').hide();
		} else {
			$('#editBtn').hide();
			$('#updateBtn').show();
		}
	};
	
	const dateFormat = (date) => {
        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day;
	};
	
	$('#outputForm').validate({
		rules: {
			file: {
				required: true
			},
			taskId: {
				required: true
			},
			projectId: {
				required: true
			},
			categoryId: {
				required: true
			},
			outputType: {
				required: true
			}
		},
		messages : {
			file : {
                required : '파일을 첨부하세요.',
            },
            taskId : {
                required : '작업을 선택하세요.'
            },
            projectId : {
            	required : '프로젝트를 선택하세요.'
            },
            categoryId : {
            	required : '산출물 카테고리를 선택하세요.'
            },
            outputType : {
            	required : '산출물 유형을 선택하세요.'
            }
	    }
	});
	
	$('#outputForm2').validate({
		rules: {
			taskId: {
				required: true
			},
			categoryId: {
				required: true
			},
			outputType: {
				required: true
			}
		},
		messages : {
            taskId : {
                required : '작업을 선택하세요.'
            },
            categoryId : {
            	required : '산출물 카테고리를 선택하세요.'
            },
            outputType : {
            	required : '산출물 유형을 선택하세요.'
            }
	    }
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>