<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isCommunitySide" value="active" />
	<jsp:param name="isCommunityList" value="active" />
</jsp:include>

<div id="main-content"> 
	<div class="page-heading">
		<section id="multiple-column-form">
			<div class="row match-height">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">공지사항 등록</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form" id="noticeForm" enctype="multipart/form-data">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<label for="first-name-vertical">제목</label>
												<input type="text" class="form-control" id="first-name-vertical" name="title" placeholder="제목을 입력하세요."/>
											</div>
										</div>
										<div class="col-12">
	                                    	<div class="form-group">
	                                    		<label for="exampleFormControlTextarea1">내용</label>
											    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="10" placeholder="내용을 입력하세요."></textarea>
	                   	                    </div>
										</div>
									    <div class="col-12">
                                        	<div class="form-group">
                                            	<input type="file" id="first-name-vertical" name="report" class="form-control">
                                        	</div>
                                    	</div>
										<div class="col-12 d-flex justify-content-end">
											<button type="button" class="btn btn-primary me-1 mb-1" id="regBtn">등록</button>
											<button type="button" class="btn btn-light-secondary me-1 mb-1" id="cancelBtn">취소</button>
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
	
<script>
	$(document).ready(function(){
		var msg = "${msg}";
		if (msg == "success") {
			Swal.fire({
		    	icon: 'success',
		    	title: '공지사항이 등록되었습니다.' 
			}).then((result) => {
				if(result.isConfirmed) {
					location.href = "${path}/community/noticeList.do"
				}
			})
		}
		
		$('#regBtn').click(function() {
			if($("input[name=title]").val() == "") {
				Swal.fire({
					title: '제목을 입력해주세요',
					icon: 'error'
				})
			} else {
				Swal.fire({
					title: '공지사항을 등록하시겠습니까?',
					icon: 'question',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					$("#noticeForm").attr("action", "${path}/community/noticeInsert.do");
					$("#noticeForm").attr("method", "post");
					$("#noticeForm").submit();
				});
			}
		});

		$('#cancelBtn').click(function() {
			location.href = '${path}/community/noticeList.do';
		});
	});	
</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>