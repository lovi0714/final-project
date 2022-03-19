<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<script src="${path}/resources/ckeditor5/build/ckeditor.js"></script>
<script src="${path}/resources/ckeditor5/build/traslations/ko.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isCommunitySide" value="active" />
	<jsp:param name="isCommunityList" value="active" />
</jsp:include>

<style>
	.ck-editor__editable {
	    min-height: 350px;
	}
	
	.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
		border-color: #e7eff5;
	}
	
	.ck.ck-toolbar {
		border: 1px solid #e7eff5;
	}
	
</style>

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
								<form class="form">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<input type="text" id="first-name-vertical" class="form-control" placeholder="제목을 입력하세요." value="자율 재택근무 관련 공지" name="pname" maxlength="120">
											</div>
										</div>
										<div class="col-12">
	                                    	<div class="form-group">	                            				
											    <div id="classic">
											    </div>
	                   	                        <!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea> -->
	                                        </div>
										</div>
									    <div class="col-12">
                                        	<div class="form-group">
                                            	<input type="file" id="first-name-vertical" class="form-control" placeholder="산출물 제목을 입력하세요." name="pname" maxlength="120">
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

<script src="${path}/resources/vendors/quill/quill.min.js"></script>
<script src="${path}/resources/js/pages/form-editor.js"></script>
<script>
	ClassicEditor
    	.create( document.querySelector( '#classic' ), {
        	language: 'ko' //언어설정
    	})
        .catch( error => {
        	console.error( error );
        });
	
	$(function() {
		$('#cancelBtn').click(function() {
			location.href = '${path}/community/noticeList.do';
		});
	});
</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>