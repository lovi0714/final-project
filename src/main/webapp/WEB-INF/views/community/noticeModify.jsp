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
							<h4 class="card-title">공지사항 수정</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form" id="noticeForm">
									<div class="row">
										<input type="hidden" name="noticeId" value="${NoticeDetailList.noticeId}"/>
										<div class="col-12">
											<div class="form-group">
												<label for="first-name-vertical">제목</label>
												<input type="text" id="first-name-vertical" name="title" class="form-control" value="${NoticeDetailList.title}"/>
											</div>
										</div>
										<div class="col-12">
	                                    	<div class="form-group">	  
	                                    		<label for="exampleFormControlTextarea1">내용</label>                          				
											    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="10">${NoticeDetailList.content}</textarea>
	                                        </div>
										</div>
									    <div class="col-12">
                                        	<div class="form-group">
                                        		<input type="file" id="first-name-vertical" class="form-control">
                                        	</div>
                                    	</div>
										<div class="col-12 d-flex justify-content-end">
											<button type="button" class="btn btn-primary me-1 mb-1" id="regBtn" onclick="updateNotice();">등록</button>
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

	function updateNotice() {
		if($("input[name=title]").val() == "") {
			Swal.fire({
				title: '제목을 입력해주세요',
				icon: 'error'
			})
		} else {
			Swal.fire({
				title: '공지사항을 수정하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					var params = jQuery("#noticeForm").serialize();
					
					$.ajax({
						url: "${path}/community/noticeUpdate.do",
						type: 'POST',
						data: params,
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType: 'text',
						success: function(result) {
							console.log(result);
							if(result == '"success"') {
								Swal.fire({
							    	icon: 'success',
							    	title: '수정이 완료되었습니다.' 
								}).then((result) => {
									if(result.isConfirmed) {
										location.href = "${path}/community/noticeList.do"
									}
								})
							}
						}
					});
				}
			});
		}
	}

	$('#cancelBtn').click(function() {
		location.href = '${path}/community/noticeList.do';
	});
</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>