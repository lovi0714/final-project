<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="currentTime"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<fmt:requestEncoding value="utf-8"/>     
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

 <div id="main-content">

                <div class="page-heading">
                    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">리스크 수정</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" name="modify" id="modify" action="${path}/risk/save.do" onsubmit="return isValidForm()" enctype="multipart/form-data" method="post">
                                <div class="row">
       								<input type="hidden" name="riskId" value="${risk.riskId}"/>
       								<input type="hidden" name="rFileId" value="${fileInfo.rFileId}"/>
                                  	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">리스크 제목</label>
                                            <input type="text" value="${risk.title }" id="first-name-vertical" class="form-control" placeholder="리스크 제목을 입력하세요." name="title" required maxlength="120">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">유형</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="rTypeId" name="rTypeId" required>
		                                        	<option value="">유형을 선택하세요</option>
		                                            <option value="1">고객변심</option>
		                                            <option value="2">일정지연</option>
		                                            <option value="3">품질문제</option>
		                                             <option value="4">기타사유</option>
		                                        </select>
		                    					<script>
		                    						$('#rTypeId').val('${risk.rTypeId}').prop("selected",true);
		                    					</script>
		                                    </fieldset>
		                    
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">프로젝트명</label>
		                                    <fieldset class="form-group mt-2">
		                                         <select class="form-select" id="prjId" name="prjId" required>
		                                        	<option value="">프로젝트를 선택하세요</option>
		                                            <c:forEach items="${prj}" var="prj">
		                                            	<option value="${prj.projectId }"><c:out value="${prj.title }"/></option>
		                                            </c:forEach>                  
		                                        </select>
		                                        <script>
		                    						$('#prjId').val('${risk.prjId}').prop("selected",true);
		                    					</script>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">작업</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="tName" name="tName" required>
									            	<option value="">작업을 선택하세요</option>
		                                            <c:forEach items="${task}" var="task">
		                                            	<option><c:out value="${task.taskName }"/></option>
		                                            </c:forEach> 
		                                        </select>
		                    					<script>
		                    						$('#tName').val('${risk.tName}').prop("selected",true);
		                    					</script>		                                        
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" name="rContent" rows="3" required>${risk.rContent}</textarea>
                                        </div>
                                	</div>                          
                                	<div class="col-md-6 col-12">
                                    <div class="form-group">
                                            <label for="basicSelect">조치자</label>
		                                    <fieldset class="form-group mt-2">
		                                        <select class="form-select" id="activator" name="activator">
		                                        	<option value="">조치자를 선택하세요</option>
		                                            <c:forEach items="${emp}" var="emp">
		                                            	<option><c:out value="${emp.name }"/></option>
		                                            </c:forEach>
		                                        </select>
		                                        <script>
		                    						$('#activator').val('${risk.activator}').prop("selected",true);
		                    					</script>
		                                    </fieldset>
                                        </div>
                                	</div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">조치 희망일</label>
                                          	<input type="date" id="dueAt" class="form-control mt-2" name="dueAt" min="${currentTime}" value="${risk.dueAt }" required>
                                          	
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">조치내용</label>
                            				<textarea class="form-control" id="aContent" name="aContent" rows="3" maxlength="900">${risk.aContent }</textarea>
                                        </div>
                                	</div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">파일</label>
                                            <input type="file" id="file" name="file" class="form-control" >
                                        </div>
                                    </div>
                                    <div class="col-md-1">
					                    <fieldset class="form-group">
					                    <label for="basicSelect">진행 상태</label>
					                        <select class="form-select" id="rStatusId" name="rStatusId" style="background-color:white; margin-top:5px;" required>
					                      		<option value="">진행 상태</option>
					                      		<option value="1">오픈</option>
					                            <option value="2">진행</option>
					                            <option value="3">취소</option>
					                            <option value="4">홀드</option>
					                            <option value="5">조치완료</option>
					                        </select>
					                        <script>
		                    						$('#rStatusId').val('${risk.rStatusId}').prop("selected",true);	
		                    						function isValidForm(){
		                    							var rv = true;
		                    							if($('#rStatusId').val()=="5" && $('#activator').val()==""){
		                    								 Swal.fire({
		                    					                    icon: 'error',
		                    					                    title: '조치자를 입력해주세요.',
		                    					                   
		                    					                });
		                    								return rv = false;
		                    							}
		                    						}
		                    						
		                    						document.getElementById('modify').onsubmit = function(){
		                    							return isValidForm();
		                    						};
		                    						
		                    						
		                    				</script>
					                	</fieldset>
					                </div>
                                    <div class="col-12 d-flex justify-content-end">
                                    <input type="hidden" name="empId" id="empId" value="${sessionScope.emp.empId}"/>
					                <input type="hidden" name="presenter" id="presenter" value="${sessionScope.emp.name}"/>
                                        <button type="submit" class="btn btn-primary me-1 mb-1" onclick="checkActivator()">등록</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1" onclick="window.history.back()">취소</button>
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