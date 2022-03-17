<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section id="basic-horizontal-layouts">
        <div class="row match-height">
            <div class="col-md-6 col-12" style="margin-left: 50px">
                <div class="card">
                    <div class="card-header">
                        <h6 class="card-title">사용자 추가</h6>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-horizontal">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>이메일</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="first-name" class="form-control" name="fname"
                                                placeholder="이메일을 입력해주세요.">
                                        </div>
                                        <div class="col-md-4">
                                            <label>번호</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="email" id="email-id" class="form-control" name="email-id"
                                                placeholder="번호를 입력해주세요.">
                                        </div>
                                        <div class="col-md-4">
                                            <label>이름</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="number" id="contact-info" class="form-control" name="contact"
                                                placeholder="이름을 입력해주세요.">
                                        </div>
                                        <div class="col-md-4">
                                            <label>권한</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>실무진</option>
		                                            <option>PM</option>
		                                            <option>관리자</option>
		                                        </select>
		                                    </fieldset>
		                                </div>
		                                <div class="col-md-4">
                                            <label>부서</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>인사</option>
		                                            <option>회계</option>
		                                            <option>경영지원</option>
		                                            <option>기술지원</option>
		                                            <option>생산관리</option>
		                                            <option>연구개발</option>
		                                        </select>
		                                    </fieldset>
		                                </div>
		                                <div class="col-md-4">
                                            <label>직급</label>
                                        </div>
                                        <div class="col-md-8 form-group">	                                    
		                                    <fieldset class="form-group">
		                                        <select class="form-select" id="basicSelect">
		                                            <option>사원</option>
		                                            <option>대리</option>
		                                            <option>팀장</option>
		                                            <option>과장</option>
		                                            <option>PM</option>
		                                        </select>
		                                    </fieldset>
		                                </div>							                            
                                        </div>
                                         
                                        <div class="col-sm-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">이메일 전송</button>
                                            
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 