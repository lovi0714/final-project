<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

 
 <div id="main-content">

                <div class="page-heading">
                    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">리스크 상세보기</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                                <div class="row">
       
                                  	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">리스크 제목</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="title" maxlength="120" style="background-color:white;" value="${detail.title }" >
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">유형</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rType" maxlength="120" style="background-color:white;" value="${detail.rType }" >
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">프로젝트명</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rProject" maxlength="120" style="background-color:white;" value="${detail.pName }" >
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">작업</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rTask" maxlength="120" style="background-color:white;" value="${detail.tName }" >
                                        </div>
                                    </div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="background-color:white;">${detail.rContent}</textarea>
                                        </div>
                                	</div>                          
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">조치자</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rActivator" maxlength="120" style="background-color:white;" value="${detail.activator }" >
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">조치 희망일</label>
                                          	<input type="date" id="first-name-vertical" class="form-control mt-2" name="end_at" readonly style="background-color:white;" value="${detail.dueAt }">
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">조치내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="background-color:white;">${detail.aContent}</textarea>
                                        </div>
                                	</div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">파일</label>
                                            <input type="file" id="file" name="file" class="form-control" maxlength="120" disabled style="background-color:white;">
                                        </div>
                                    </div>
			                        <div class="col-md-1">
					                    <fieldset class="form-group">
					                    <label for="basicSelect">진행 상태</label>
					                       <select class="form-select" id="basicSelect" disabled style="background-color:white; margin-top:5px;">
					                            <option>${detail.rStatus}</option>
					                        </select>
					                    </fieldset>
					                </div>
                                    <div class="col-12 d-flex justify-content-end">
                                    <c:if test="${detail.rStatus!='조치완료'}">
                                        <button type="button" class="btn btn-primary me-1 mb-1" onclick="location='modify.do?riskId='+${detail.riskId}">수정</button>
                                    </c:if>
                                        <button type="button" class="btn btn-danger me-1 mb-1" onclick="location='delete.do?riskId='+${detail.riskId}">삭제</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
                                    </div>
                                    
                                </div>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>