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

<style>
	.ck-editor__editable {
	    min-height: 350px;
	}
</style>

<div id="main-content"> 
	<div class="page-heading">
		<section id="multiple-column-form">
			<div class="row match-height">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">공지사항</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										<p class="fw-bold">${NoticeDetailList.title}</p>
									</div>
									<div class="col-12">
										<p class="fw-bold">
											<span class="badge bg-primary">${NoticeDetailList.writer}</span>
											<span class="badge bg-secondary"><fmt:formatDate value="${NoticeDetailList.createAt}" pattern="yyyy-MM-dd"/></span> 
											<span class="badge bg-secondary">
												<span class="fa-fw select-all fas"></span> ${NoticeDetailList.viewCount} <hr>
											</span>
                        				</p>
									</div>
								    <div class="col-12">
								    	<p style="height: 300px">${NoticeDetailList.content}</p><hr>
                                   	</div>
								    <div class="col-12">
								    	<p>첨부파일 영역</p>
                                   	</div>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit" class="btn btn-primary me-1 mb-1" id="updateBtn">수정</button>
										<button type="button" class="btn btn-secondary me-1 mb-1" data-bs-toggle="modal" data-bs-target="#primary">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- 삭제 modal -->
	<div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title white" id="myModalLabel160">공지사항 삭제</h5>
				</div>
				<div class="modal-body">
					게시글을 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1">
						<i class="bx bx-check d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">확인</span>
					</button>
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">취소</span>
					</button>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
		$('#updateBtn').click(function() {
			location.href = '${path}/community/noticeUpdate.do';
		});
	});

	$(function() {
		$('#cancelBtn').click(function() {
			location.href = '${path}/community/noticeList.do';
		});
	});
</script>
    
        
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>