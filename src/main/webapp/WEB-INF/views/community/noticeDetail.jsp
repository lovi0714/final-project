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
											<span class="badge bg-success"><fmt:formatDate value="${NoticeDetailList.createAt}" pattern="yyyy-MM-dd"/></span> 
											<span class="badge bg-secondary">
												<span class="fa-fw select-all fas"></span> ${NoticeDetailList.viewCount}
											</span>
                        				</p>
									</div>
								    <div class="col-12">
								    	<p style="height: 300px; border: 1px solid #dce7f1; border-radius: 0.25rem; padding: 15px 15px;">${NoticeDetailList.content}</p>
                                   	</div>
                                   	<c:if test="${NoticeFileInfo.originalName ne null}">
	                                   	<div class="col-12">
	                                   		<div class="form-group">
												<label for="file" class="form-label">첨부파일</label>
												<input onclick="downFile('${NoticeFileInfo.originalName}')" type="text" id="file" class="form-control" value="${NoticeFileInfo.originalName}" readonly style="background-color: white; cursor: pointer;"/>
											</div>
										</div>
									</c:if>
									<div class="col-12 d-flex justify-content-end">
										<button type="button" class="btn btn-primary me-1 mb-1" id="uptBtn">수정</button>
										<button type="button" class="btn btn-secondary me-1 mb-1" id="cancelBtn">삭제</button>
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	
<script>
	$('#uptBtn').click(function() {
		location.href = '${path}/community/noticeUpdateForm.do?noticeId=${NoticeDetailList.noticeId}';
	});

	$('#cancelBtn').click(function() {
		Swal.fire({
			title: '공지사항을 삭제하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				let noticeId = ${NoticeDetailList.noticeId};
				console.log(noticeId);
				
				$.ajax({
					url: "${path}/community/noticeDelete.do",
					type: 'GET',
					data: {noticeId: noticeId},
					success: function(result) {
						console.log(result);
						if(result == "success") {
							Swal.fire({
						    	icon: 'success',
						    	title: '삭제가 완료되었습니다.' 
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
	});

	function downFile(fname) {
		console.log(fname);
		location.href="${path}/community/noticeFileDownload.do?fname=" + fname;
	}
	
</script>
    
        
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>