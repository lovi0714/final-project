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
                        <h4 class="card-title">리스크 등록</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
       
                                  	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">리스크 제목</label>
                                            <input type="text" value=${risk.title } id="first-name-vertical" class="form-control" placeholder="리스크 제목을 입력하세요." name="Rname" maxlength="120">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">유형</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                        	<option selected>유형을 선택하세요</option>
		                                            <option>고객 변심</option>
		                                            <option>일정 지연</option>
		                                            <option>품질 문제</option>
		                                            <option>기타 사유</option>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트명</label>
		                                    <fieldset class="form-group mt-2">
		                                         <select class="form-select" id="basicSelect">
		                                        	<option selected>프로젝트를 선택하세요</option>
		                                            <c:forEach items="${prj}" var="prj">
		                                            	<option><c:out value="${prj.title }"/></option>
		                                            </c:forEach>                  
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">작업</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
									            	<option selected>작업을 선택하세요</option>
		                                            <c:forEach items="${task}" var="task">
		                                            	<option><c:out value="${task.taskName }"/></option>
		                                            </c:forEach> 
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${risk.rContent }</textarea>
                                        </div>
                                	</div>                          
                                	<div class="col-md-6 col-12">
                                    <div class="form-group">
                                            <label for="basicSelect">조치자</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="basicSelect">
		                                        	<option selected>조치자를 선택하세요</option>
		                                            <c:forEach items="${emp}" var="emp">
		                                            	<option><c:out value="${emp.name }"/></option>
		                                            </c:forEach>
		                                        </select>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">조치 희망일</label>
                                          	<input type="date" id="first-name-vertical" class="form-control mt-2" name="end_at">
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">조치내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${risk.aContent }</textarea>
                                        </div>
                                	</div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">파일</label>
                                            <input type="file" id="first-name-vertical" class="form-control" placeholder="산출물 제목을 입력하세요." name="pname" maxlength="120">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
					                    <fieldset class="form-group">
					                    <label for="basicSelect">진행 상태</label>
					                        <select class="form-select" id="basicSelect" style="background-color:white; margin-top:5px;">
					                      		<option selected>진행 상태</option>
					                      		<option>오픈</option>
					                            <option>진행</option>
					                            <option>취소</option>
					                            <option>홀드</option>
					                            <option>조치완료</option>
					                        </select>
					                    </fieldset>
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