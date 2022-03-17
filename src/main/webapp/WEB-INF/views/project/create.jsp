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
                            <form class="form">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">프로젝트 제목</label>
                                            <input type="text" id="first-name-vertical" class="form-control" placeholder="프로젝트 제목을 입력하세요." name="pname" maxlength="120">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                    <div class="form-group">
                                            <label for="basicSelect">프로젝트 유형</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>선행개발</option>
		                                            <option>고객개발</option>
		                                            <option>양산개발</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">R&D 구분</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>장비개발</option>
		                                            <option>SW 개발</option>
		                                            <option>플랫폼 개발</option>
		                                            <option>QA 테스트</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 관리자</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>인사</option>
		                                            <option>회계</option>
		                                            <option>경영지원</option>
		                                            <option>생산관리</option>
		                                            <option>기술지원</option>
		                                            <option>연구개발</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>홍길동 사원</option>
		                                            <option>김길동 대리</option>
		                                            <option>고길동 팀장</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">PMO</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>인사</option>
		                                            <option>회계</option>
		                                            <option>경영지원</option>
		                                            <option>생산관리</option>
		                                            <option>기술지원</option>
		                                            <option>연구개발</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect"></label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>홍길동 사원</option>
		                                            <option>김길동 대리</option>
		                                            <option>고길동 팀장</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 시작일</label>
                                   			<input type="date" id="first-name-vertical" class="form-control mt-2" name="start_at">
                                        </div>
                                	</div>
                                	<div class="col-md-3 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트 완료일</label>
                                          	<input type="date" id="first-name-vertical" class="form-control mt-2" name="end_at">
                                        </div>
                                	</div>
                                    <div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">프로젝트 설명</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                        </div>
                                	</div>
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">등록</button>
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
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>