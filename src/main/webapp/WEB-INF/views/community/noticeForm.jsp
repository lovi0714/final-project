<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isCommunitySide" value="active" />
	<jsp:param name="isCommunityList" value="active" />
</jsp:include>
<script src="${path}/resources/ckeditor5/build/ckeditor.js"></script>

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
							<h4 class="card-title">공지사항 등록</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form" id="noticeForm" enctype="multipart/form-data">
									<input type="hidden" name="writer" value="${emp.name}">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<input type="text" class="form-control" id="first-name-vertical" name="title" placeholder="제목을 입력하세요." onKeyup="javascript:textByte(this, 180)"/>
											</div>
										</div>
										<div class="col-12">
	                                    	<div class="form-group">
		                                    	<textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력하세요."></textarea>
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
		// ckeditor 설정
		ClassicEditor
		    .create(document.querySelector('#content'), {
		        language: 'ko' //언어설정
		    })
		    .catch( error => {
		        console.error(error);
		    } );
	
		// 등록
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
					if (result.isConfirmed) {
						$("#noticeForm").attr("action", "${path}/community/noticeInsert.do");
						$("#noticeForm").attr("method", "post");
						$("#noticeForm").submit();
					}
				});
			}
		});
	
		// 취소
		$('#cancelBtn').click(function() {
			location.href = '${path}/community/noticeList.do';
		});
	});
	
	// 글자수 입력 제한
	function textByte(obj, maxByte){
		let str = obj.value;
		let str_len = str.length;
		
		let rbyte = 0; 
		let rlen = 0; 
		
		let one_char = "";
		let str2 = "";
	
		// 문자 byte 계산
		for(var i=0; i<str_len; i++) {
			one_char = str.charAt(i); 
			
			if(escape(one_char).length > 4){ 
			    rbyte += 3; // 한글 3Byte
			} else {
			    rbyte++; // 그 외 1Byte
			}
	
			if(rbyte <= maxByte) { 
			    rlen = i+1;
			}
		}
	
		// 문자열 자르기
		if(rbyte > maxByte){
			Swal.fire({
				title: '입력 실패',
				text: '한글 ' + (maxByte/3) + '자 혹은 영문 ' + maxByte + '자를 초과할 수 없습니다.',
				icon: 'error'
			}).then((result) => {
				if (result.isConfirmed) {
					str2 = str.substr(0,rlen); 
				    obj.value = str2;
				    textByte(obj, maxByte);
				}
			});
		}
	}
</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>