<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isTaskSide" value="active"/>
	<jsp:param name="isTaskList" value="active"/>
</jsp:include>
<style>
.nav-tabs .nav-link.active {
	color: white;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	background-color: #435ebe;
}
</style>
 
<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>내 작업</h3>
				</div>
			</div>
		</div>
		<section class="section">
			<div class="card">
				<div class="card-header">
					<p class="fw-bold">내 작업</p>
				</div>
				<div class="card-body">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="task-tab" data-bs-toggle="tab" href="#task" role="tab" aria-controls="task" aria-selected="true">작업</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="output-tab" data-bs-toggle="tab" href="#output" role="tab" aria-controls="output" aria-selected="false">산출물</a>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent2">
						<!-- 작업 tap start -->
						<div class="tab-pane fade show active" id="task" role="tabpanel" aria-labelledby="task-tab">
							<div class="row pt-3" style="background-color: #f2f7ff;">
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>프로젝트를 선택하세요</option>
											<c:forEach var="p" items="${taskProject}">
	                                    		<option value="${p.projectId}">${p.title}</option>
	                                    	</c:forEach>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<fieldset class="form-group">
										<select class="form-select" id="basicSelect">
											<option>작업상태를 선택하세요</option>
											<c:forEach var="s" items="${status}" >
	                                    		<option value="${s.statusId}">${s.status}</option>
	                                    	</c:forEach>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="검색어를 입력하세요">
										<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3 justify-content-end">
										<button type="button" class="btn btn-primary" onclick="approvalRequest();">승인요청</button>
									</div>
								</div>
							</div>
							<table class="table" id="myTask">
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="checkAll" class="form-check-input">
										</th>
										<th>작업</th>
										<th>프로젝트</th>
										<th>승인자</th>
										<th>상태</th>
										<th>시작일</th>
										<th>완료일</th>
										<th>진행률(%)</th>
									</tr>
								</thead>
								<tbody>
	                      			<c:forEach var="tl" items="${taskList}">
										<tr>
											<td>
												<input type="checkbox" id="checkbox1" name="chk" class="form-check-input" value="${tl.taskId}">
												<input type="hidden" name="pmId" value="${tl.pmId}"/>
											</td>
				                            <td onclick="taskDetail(${tl.taskId})" style="color: #435ebe; cursor: pointer">${tl.taskName}</td>
				                            <td>${tl.pTitle}</td>
				                            <td>${tl.pmName}</td>
				                            <c:choose>
				                            	 <c:when test = "${tl.status eq '시작전'}">
				                           			<td><span class="badge bg-secondary">${tl.status}</span></td>
				                            	 </c:when>
				                            	 <c:when test = "${tl.status eq '정상진행'}">
				                            	 	<td><span class="badge bg-success">${tl.status}</span></td>
				                           		 </c:when>
				                            	 <c:when test = "${tl.status eq '지연진행'}">
				                            	 	<td><span class="badge bg-danger">${tl.status}</span></td>
				                           		 </c:when>
				                           		 <c:when test = "${tl.status eq '완료'}">
				                            	 	<td><span class="badge bg-primary">${tl.status}</span></td>
				                           		 </c:when>
				                            	 <c:when test = "${tl.status eq '중단'}">
				                            	 	<td><span class="badge bg-warning">${tl.status}</span></td>
				                           		 </c:when>
				                            </c:choose>
				                            <td><fmt:formatDate value="${tl.startAt}" pattern="yyyy-MM-dd"/></td>
				                            <td><fmt:formatDate value="${tl.endAt}" pattern="yyyy-MM-dd"/></td>
				                            <td>
												<div class="progress progress-primary">
													<div class="progress-bar progress-bar-striped" role="progressbar" style="width: ${tl.progress}%" 
														aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
		                        		</tr>
	                       			</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 작업 tap end -->
						
						<!-- 산출물 tap start -->
						<div class="tab-pane fade" id="output" role="tabpanel"
							aria-labelledby="output-tab">
							<div>
								<div class="row pt-3" style="background-color: #f2f7ff;">
									<div class="col-md-3">
										<fieldset class="form-group">
											<select class="form-select" id="basicSelect">
												<option>프로젝트를 선택하세요</option>
												<c:forEach var="op" items="${outputProject}">
		                                    		<option value="${op.projectId}">${op.title}</option>
		                                    	</c:forEach>
											</select>
										</fieldset>
									</div>
									<div class="col-md-3">
										<fieldset class="form-group">
											<select class="form-select" id="basicSelect">
												<option>카테고리를 선택하세요</option>
			   		                            <c:forEach var="c" items="${category}">
				                                    <option value="${c.categoryId}">${c.categoryName}</option>
					                        	</c:forEach>
											</select>
										</fieldset>
									</div>
									<div class="col-md-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												placeholder="검색어를 입력하세요">
											<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
										</div>
									</div>
									<div class="col-md-3">
										<div class="input-group mb-3 justify-content-end">
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary">산출물 등록</button>
										</div>
									</div>
								</div>
								<table class="table" id="myOutput">
									<thead>
										<tr>
											<th>카테고리</th>
											<th>산출물 정보</th>
											<th>프로젝트</th>
										</tr>
									</thead>
									<tbody>
			                  			<c:forEach var="list" items="${outputList}">
											<tr>
					                           <td><span class="badge bg-${list.categoryId == 1 ? 'primary">필수' : 'secondary">선택'}</span></td>
					                           <td><div><a href="javascript:outputDetail(${list.outputId})">${list.originalName}</a></div>
					                           <div>${list.empName} on ${list.updateAt} file size ${list.volumeText}</div></td>
					                           <td>${list.projectName}</td>
			                    			</tr>
			                   			</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 산출물 tap end -->
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 작업정보 modal button -->
	<button type="button" class="callModal" data-bs-toggle="modal" data-bs-target="#primary2" style="display: none"></button>
	
	<!-- 작업정보 modal start -->
	<div class="modal fade text-left" id="primary2" tabindex="-1" role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 0;">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="taskInfo-tab" data-bs-toggle="tab" href="#taskInfo" role="tab" aria-controls="taskInfo" aria-selected="true">작업정보</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="outputInfo-tab" data-bs-toggle="tab" href="#outputInfo" role="tab" aria-controls="outputInfo" aria-selected="false">산출물</a>
						</li>
					</ul>
				</div>
				<div class="tab-content" id="myTabContent">
					<!-- 작업정보 tap start -->
					<div class="tab-pane fade show active" id="taskInfo" role="tabpanel" aria-labelledby="taskInfo-tab">
						<div class="modal-body">
							<form class="form" id="taskDetail">
								<div class="row">
									<input type="hidden" name="taskId"/>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">작업</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control" name="taskName" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">프로젝트</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control" name="pTitle" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">시작일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control" name="startAt" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">완료일</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control" name="endAt" readonly>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column" style="padding-bottom: 6px;">진행률(%)</label>
                                            <input type="number" style="background-color: white;" id="first-name-column" class="form-control" name="progress" min="0" max="100"/>
										</div>
									</div>
									<div class="col-md-6 col-12">
										<div class="form-group">
											<label for="first-name-column"  style="padding-bottom: 6px;">승인자</label>
                                            <input type="text" style="background-color: white;" id="first-name-column" class="form-control" name="pmName" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1" class="form-label">작업 세부내용</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" name="taskContent" rows="3"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1" onclick="uptDetail()">
								<i class="bx bx-check d-block d-sm-none"></i>
								<span class="d-none d-sm-block">등록</span>
							</button>
							<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">취소</span>
							</button>
						</div>
					</div>
					<!-- 작업정보 tap end -->
					
					<!-- 산출물 tap start -->
					<div class="tab-pane fade" id="outputInfo" role="tabpanel" aria-labelledby="outputInfo-tab">
						<div class="modal-body">
							<button type="button" class="btn btn-outline-primary" id="outputBtn" onclick="formClick();" style="margin-bottom: 10px">산출물 등록</button>
							<div id="outputFormDiv" style="border: solid 1px #E6EAEE; border-radius: 5px; padding: 10px 10px; margin-bottom: 10px; display: none;">
								<form id="outputForm" name="output" class="form" action="${path}/output/save.do" method="post" enctype="multipart/form-data">
		                   			<input type="hidden" name="taskId">
		                   		<div class="row">
		                       		<div class="col-12">
		                           		<div class="form-group">
		                               		<label for="first-name-vertical" class="form-label">파일</label>
		                               		<input type="file" name="file" id="first-name-vertical" class="form-control" >
		                           </div>
		                       	</div>
		                   		<div class="col-md-6 col-12">
		                       	<div class="form-group">
		                        	<label for="basicSelect">산출물 카테고리</label>
		                         	<fieldset class="form-group mt-2">
		                             	<select class="form-select" id="basicSelect" name="categoryId">
		                                	<c:forEach var="c" items="${category}">
		                                    	<option value="${c.categoryId}">${c.categoryName}</option>
			                        	 	</c:forEach>
		                             	</select>
		                         	</fieldset>
		                    	</div>
		                   		</div>
			                   	<div class="col-md-6 col-12">
			                       	<div class="form-group">
			                       		<label for="basicSelect">산출물 종류</label>
			                         	<fieldset class="form-group mt-2">
			                            	<select class="form-select" id="basicSelect" name="outputType">
			                                	<c:forEach var="t" items="${type}">
			                                    	<option value="${t.typeId}">${t.typeName}</option>
				                        	 	</c:forEach>
			                            	 </select>
			                         	</fieldset>
			                    	</div>
			                   	</div>
		                       	<div class="col-12">
		                       		<div class="form-group">
		                          		<label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
		               					<textarea class="form-control" id="exampleFormControlTextarea2" name="content" rows="3"></textarea>
		                           </div>
		                   		</div>
		                  	</div>
		               		</form>
							<button type="button" id="saveBtn" class="btn btn-primary ml-1">
								<i class="bx bx-check d-block d-sm-none"></i>
								<span class="d-none d-sm-block">등록</span>
							</button>
							<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">취소</span>
							</button>
	               		</div>
	               		<form class="form" id="detail">
						</form>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">닫기</span>
							</button>
						</div>
					</div>
					<!-- 산출물 tap end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 작업정보 modal end -->
	
	<!-- 승인요청 modal start -->	
	<div class="modal fade text-left" id="primary2" tabindex="-1" role="dialog" data-bs-backdrop="static"
		aria-labelledby="myModalLabel160" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title white" id="myModalLabel160">승인요청</h5>
				</div>
				<div class="modal-body">
					<form class="form">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label for="exampleFormControlTextarea1" class="form-label">요청사항</label>
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reqContent"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1" onclick="approvalRequest();">
						<i class="bx bx-check d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">등록</span>
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
	<!-- 승인요청 modal end -->
	
	<!-- 산출물 정보 modal start -->
	<div class="modal fade text-left" id="detail" tabindex="-1" role="dialog" data-bs-backdrop="static" aria-labelledby="myModalLabel160" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header bg-primary">
	                <h5 class="modal-title white" id="myModalLabel160">산출물 정보
	                </h5>
	            </div>
	            <div class="modal-body">
	            	<input type="hidden" id="outputId" value="">
	                <form id="outputForm" id="outputInfoForm" name="output" class="form" method="post">
	                   <div class="row">
	                       <div class="col-12">
	                           <div class="form-group">
	                               <label for="fileName" class="form-label">파일 정보</label>
	                               <div><a href="#" id="fileName"></a></div>
	                           </div>
	                       </div>
	                       <div class="col-md-6 col-12">
	                       <div class="form-group">
	                    	   <label for="basicSelect">프로젝트</label>
	                       	   <fieldset class="form-group mt-2">
	                               <select class="form-select" id="projectSelect_m" disabled>
	                                   <c:forEach var="p" items="${project}">
			                               <option value="${p.projectId}">${p.projectName}</option>
		                        	   </c:forEach>
	                               </select>
	                           </fieldset>
	                        </div>
	                   	</div>
	                   	<div class="col-md-6 col-12">
	                       	<div class="form-group">
	                            <label for="basicSelect">작업</label>
	                            <fieldset class="form-group mt-2">
	                                <select class="form-select" id="taskSelect_m" name="taskId" disabled>
	                                </select>
	                            </fieldset>
	                        </div>
	                   	</div>
	                   	<div class="col-md-6 col-12">
	                       <div class="form-group">
	                           <label for="basicSelect">산출물 카테고리</label>
	                           <fieldset class="form-group mt-2">
	                               <select class="form-select" id="category" name="categoryId" disabled>
	                                   <c:forEach var="c" items="${category}">
	                                       <option value="${c.categoryId}">${c.categoryName}</option>
		                        	   </c:forEach>
	                               </select>
	                           </fieldset>
	                        </div>
	                   	</div>
	                   	<div class="col-md-6 col-12">
	                       	<div class="form-group">
	                            <label for="basicSelect">산출물 종류</label>
	                            <fieldset class="form-group mt-2">
	                                <select class="form-select" id="outputType" name="outputType" disabled>
	                                    <c:forEach var="t" items="${type}">
	                                        <option value="${t.typeId}">${t.typeName}</option>
		                        	    </c:forEach>
	                                </select>
	                            </fieldset>
	                        </div>
	                   	</div>
	                       <div class="col-12">
	                       	    <div class="form-group">
	                               <label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
	               			       <textarea class="form-control" id="content" name="content" rows="3" disabled></textarea>
	                           </div>
	                   	   </div>
	                   </div>
	               </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" id="closeBtn" class="btn btn-light-secondary" data-bs-dismiss="modal">
	                    <i class="bx bx-x d-block d-sm-none"></i>
	                    <span class="d-none d-sm-block">닫기</span>
	                </button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 산출물 정보 modal end -->
	
	<!-- 산출물 등록 modal start -->
	<div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" data-bs-backdrop="static" aria-labelledby="myModalLabel160" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header bg-primary">
	                <h5 class="modal-title white" id="myModalLabel160">산출물 등록
	                </h5>
	            </div>
	            <div class="modal-body">
	                <form id="outputForm2" name="output" class="form" action="${path}/output/save.do" method="post" enctype="multipart/form-data">
	                   <div class="row">
	                       <div class="col-12">
	                           <div class="form-group">
	                               <label for="first-name-vertical" class="form-label">파일</label>
	                               <input type="file" name="file" id="first-name-vertical" class="form-control" >
	                           </div>
	                       </div>
	                       <div class="col-md-6 col-12">
		                       <div class="form-group">
		                           <label for="basicSelect">프로젝트</label>
		                           <fieldset class="form-group mt-2">
		                               <select class="form-select" id="projectSelect">
		                                   <c:forEach var="p" items="${project}">
				                               <option value="${p.projectId}">${p.projectName}</option>
			                        	   </c:forEach>
			                           </select>
			                        </fieldset>
			                    </div>
		                   	</div>
		                   	<div class="col-md-6 col-12">
		                       	<div class="form-group">
		                            <label for="basicSelect">작업</label>
		                            <fieldset class="form-group mt-2">
		                                <select class="form-select" id="taskSelect" name="taskId">
		                                </select>
		                         	</fieldset>
		                    	</div>
		                   	</div>
		                   	<div class="col-md-6 col-12">
		                    	<div class="form-group">
		                        	<label for="basicSelect">산출물 카테고리</label>
		                         	<fieldset class="form-group mt-2">
		                            	<select class="form-select" id="basicSelect" name="categoryId">
		                                	<c:forEach var="c" items="${category}">
		                                    	<option value="${c.categoryId}">${c.categoryName}</option>
			                        	 	</c:forEach>
		                             	</select>
		                         	</fieldset>
		                    	</div>
		                   	</div>
		                   	<div class="col-md-6 col-12">
		                       	<div class="form-group">
		                        	<label for="basicSelect">산출물 종류</label>
		                         	<fieldset class="form-group mt-2">
		                            	<select class="form-select" id="basicSelect" name="outputType">
		                                	<c:forEach var="t" items="${type}">
		                                    	<option value="${t.typeId}">${t.typeName}</option>
			                        	 	</c:forEach>
		                             	</select>
		                         	</fieldset>
		                    	</div>
		                   	</div>
		                    <div class="col-12">
		                    	<div class="form-group">
		                        	<label for="exampleFormControlTextarea1" class="form-label">산출물 설명</label>
		               				<textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
		                   		</div>
		                   	</div>
	            		</div>
	            	</form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" id="saveBtn2" class="btn btn-primary ml-1" >
	                    <i class="bx bx-check d-block d-sm-none"></i>
	                    <span class="d-none d-sm-block">등록</span>
	                </button>
	                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
	                    <i class="bx bx-x d-block d-sm-none"></i>
	                    <span class="d-none d-sm-block">취소</span>
	                </button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 산출물 등록 modal end -->
	
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
<script>
	// 작업 datatable
	$("#myTask").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"orderable": false, "targets": 0},
		    {"width": "20%", "targets": 1},
		    {"width": "20%", "targets": 2},
		    {"className": "dt-center", "targets": "_all"}
		],
		"language": {
	        "zeroRecords": "등록된 작업이 없습니다."
	    },
		"order": [5, 'desc']
	});

	// 산출물 datatable
	$("#myOutput").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"width": "55%", "targets": 1}
		],
		"language": {
	        "zeroRecords": "등록한 산출물이 없습니다."
	    }
	});

	// 작업 체크박스 전체 선택 및 해제
	$(document).ready(function() {
		$("#checkAll").click(function() {	
			if($("#checkAll").is(":checked")) 
				$("input[name=chk]").prop("checked", true);
			else 
				$("input[name=chk]").prop("checked", false);
		});
			
		$("input[name=chk]").click(function() {			
			let total = $("input[name=chk]").length;
			let checked = $("input[name=chk]:checked").length;
			
			if(total != checked) 
				$("#checkAll").prop("checked", false);
			else 
				$("#checkAll").prop("checked", true); 
		});
	});
	
	// 작업정보 조회
	function taskDetail(taskId){
		$.ajax({
			url: "${path}/myTask/detail.do",
			type: 'GET',
			data: "taskId="+taskId,
			dataType: "json",
			success: function(data) {
				let myTaskDetail = data.myTaskDetail;
				let myOutputInfo = data.myOutputInfo;
				
				$("input[name=taskId]").val(myTaskDetail.taskId);
				$("input[name=taskName]").val(myTaskDetail.taskName);
				$("input[name=pTitle]").val(myTaskDetail.pTitle);
				$("input[name=startAt]").val(myTaskDetail.startAt);
				$("input[name=endAt]").val(myTaskDetail.endAt);
				$("input[name=progress]").val(myTaskDetail.progress);
				$("input[name=pmName]").val(myTaskDetail.pmName);
				$("textarea[name=taskContent]").val(myTaskDetail.content);
				
				var htmlStr = "";
				
				if (myOutputInfo.length == 0){
					htmlStr += "<p style=\"margin-bottom: 10px;\">등록된 산출물이 없습니다.</p>"	

					$("#detail").html(htmlStr);	
					$(".callModal").click();
					
				} else {
					
					for (var i=0; i<myOutputInfo.length; i++) {	
						htmlStr += "<div class=\"row\">";
						htmlStr += "<div class=\"form-group\">";
						htmlStr += "<details>";
						htmlStr += "<summary>";
						htmlStr += "<span class=\"fw-bold\">" + myOutputInfo[i].originalName + "</span>";
						htmlStr += "</summary>";
						htmlStr += "<div style=\"margin-top: 10px; padding: 10px 10px; background-color: #f2f7ff;\">";
						htmlStr += "<div class=\"row\">";
						htmlStr += "<div class=\"col-md-6 col-12\">";
						htmlStr += "<label for=\"first-name-column\" style=\"padding-bottom: 6px;\">산출물 카테고리</label>";
						htmlStr += "<input type=\"text\" class=\"form-control\" id=\"first-name-column\" readonly value=" + myOutputInfo[i].category + " style=\"background-color: white;\" >";
						htmlStr += "</div>";
						htmlStr += "<div class=\"col-md-6 col-12\">";
						htmlStr += "<label for=\"first-name-column\" style=\"padding-bottom: 6px;\">산출물 종류</label>";
						htmlStr += "<input type=\"text\" class=\"form-control\" id=\"first-name-column\" readonly value=" + myOutputInfo[i].outType + " style=\"background-color: white;\">";
						htmlStr += "</div>";
						htmlStr += "<div class=\"col-12\">";
						htmlStr += "<label for=\"exampleFormControlTextarea1\" class=\"exampleFormControlTextarea1\" style=\"margin-top: 10px\">산출물 설명</label>";
						htmlStr += "<textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" readonly rows=\"3\" style=\"background-color: white;\">" + myOutputInfo[i].content + "</textarea>";
						htmlStr += "</div>";
						htmlStr += "</div>";
						htmlStr += "</div>";
						htmlStr += "</details>"
						htmlStr += "</div>";
						htmlStr += "</div>"
						htmlStr += "</div>"
					}		
					
					$("#detail").html(htmlStr);
					$(".callModal").click();
				
				}
			}
		});
	}
	
	// 작업정보 수정
	function uptDetail() {		
		if($("input[name=progress]").val() >= 0 && $("input[name=progress]").val() <= 100) {
			Swal.fire({
				title: '작업정보를 등록하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskId = $("input[name=taskId").val();
					let progress = $("input[name=progress]").val();
					let content = $("textarea[name=taskContent]").val();
					
					let taskDetail = {
						"taskId": taskId, 
						"progress": progress, 
						"content": content};
					
					$.ajax({
						url: "${path}/myTask/uptDetail.do",
						type: 'POST',
						data: taskDetail,
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '작업정보가 등록되었습니다.' 
								}).then((result) => {
									if(result.isConfirmed) {
										location.href = "${path}/myTask/list.do"
									}
								})
							}
						}
					});
				}
			})
		} else {
			Swal.fire({
				title: '진행률을 다시 입력해주세요',
				text: '0~100 사이의 숫자를 입력해주세요',
				icon: 'error'
			})
		}
	} 
	
	// 승인요청
	function approvalRequest() {	
		if($("input[name=chk]").is(":checked")) {
			Swal.fire({
				title: '승인을 요청하시겠습니까?',
				icon: 'question',
				input: 'textarea',
				inputPlaceholder: '승인요청 내용을 입력해주세요.',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					let taskIdValues = [];
					let pmIdValues = [];
					let reqContent = result.value;
						
					$("input[name=chk]:checked").each(function(i) {
						taskIdValues.push($(this).val());
						pmIdValues.push($(this).next().val());
					});	
					
					let requestData = {
						taskId: taskIdValues,
						pmId: pmIdValues,
						reqContent: reqContent
					};
					
					$.ajax({
						url: "${path}/myTask/approvalRequest.do",
						type: 'POST',
						contentType:'application/json; charset=UTF-8',
						dataType:'json',
						data: JSON.stringify(requestData), 
						success: function(result) {
							if(result == "success") {
								Swal.fire({
							    	icon: 'success',
							    	title: '승인을 요청하였습니다.' 
								}).then((result) => {
									if(result.isConfirmed) {
										location.href = "${path}/myTask/approvalList.do"
									}
								})
							}
						}
					});
				}
			})
		} else {
			Swal.fire({
				title: '작업을 선택해주세요',
				icon: 'error'
			})
		}		
	}
	
	// 산출물
	const authId = ${emp.authId};
	const empId = ${emp.empId};
	
	const outputDetail = (id) => {
		$('#editBtn').remove();
		$('#delBtn').remove();
		$('#updateBtn').remove();
		
		$.ajax({
		  	url: "${path}/output/detail/" + id,
		  	method: "get",
		  	dataType: 'json',	
			contentType: 'application/json; charset=utf-8'
			}).done(function(data) {
				console.log(data);
				$('#fileName').attr('href', '${path}/output/attach/' + data.outputFileId);
				
				$('#fileName').text(data.originalName);
				$('#projectSelect_m').val(data.projectId);
				getMdoalTasks();
				$('#taskSelect_m').val(data.taskId);
				$('#category').val(data.categoryId);
				$('#outputType').val(data.typeId);
				$('#content').val(data.content);
				$('#outputId').val(data.outputId);
				
				console.log(data.categoryId);
				console.log(data.outputId);
				console.log("-----------");
				if (authId !== 1 || empId === data.empId) {
					$('#closeBtn').before(
							`<button type="button" id="editBtn" class="btn btn-primary ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">수정</span>
		                </button>
		                <button type="button" id="updateBtn" style="display: none;" class="btn btn-primary ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">저장</span>
		                </button>
		                <button type="button" id="delBtn" class="btn btn-danger ml-1" >
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">삭제</span>
		                </button>`);
				}
				
			}).fail(function(error) {
				console.log(error);
		});
		
		$('#detail').modal('show');	
	};
	
	const getTasks = () => {
		$.ajax({
			  url: "${path}/project/api/wbs/" + $('#projectSelect').val(),
			  method: "get",
			  dataType: 'json',	
			  contentType: 'application/json; charset=utf-8'
			}).done(function(result) {
				$('#taskSelect').empty();
				if (result.length == 0) $('#taskSelect').append(`<option selected disabled>작업이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	$('#taskSelect').append(`<option value="\${data.id}">\${data.text}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const getMdoalTasks = () => {
		$.ajax({
			  url: "${path}/project/api/wbs/" + $('#projectSelect_m').val(),
			  method: "get",
			  dataType: 'json',
			  async: false,
			  contentType: 'application/json; charset=utf-8'
			}).done(function(result) {
				$('#taskSelect_m').empty();
				if (result.length == 0) $('#taskSelect_m').append(`<option selected disabled>작업이 없습니다.</option>`);
			    result.map((data, idx) => {
			    	$('#taskSelect_m').append(`<option value="\${data.id}">\${data.text}</option>`);
			    });
			}).fail(function(error) {
				console.log(error);
		});
	}
	
	const toggleModelForm = (isDisabled) => {
		$('#projectSelect_m').attr('disabled', isDisabled);
		$('#taskSelect_m').attr('disabled', isDisabled);
		$('#category').attr('disabled', isDisabled);
		$('#outputType').attr('disabled', isDisabled);
		$('#content').attr('disabled', isDisabled);
		
		if (isDisabled) {
			$('#editBtn').show();
			$('#updateBtn').hide();
		} else {
			$('#editBtn').hide();
			$('#updateBtn').show();
		}
	};
	
	$(function() {
		let isEdit = false;
		getTasks();

		$('#projectSelect').change(() => {
			getTasks();
		});
		
		$('#projectSelect_m').change(() => {
			getMdoalTasks();
		});
		
		$(document).on('click', '#closeBtn', function() {
			toggleModelForm(true);
		});
		
		$(document).on('click', '#updateBtn', function() {
			let data = {
				"outputId": parseInt($('#outputId').val()),
				"outputType": parseInt($('#outputType').val()),
				"categoryId":parseInt( $('#category').val()),
				"taskId": parseInt($('#taskSelect_m').val()),
				"content": $('#content').val()
			}
			
			if (isEdit) {
				console.log(data);
				$.ajax({
		            type: "POST",
		            url: "${path}/output/update/" + $('#outputId').val(),
		            data: data,
				  	dataType: 'json',
		            success: function(result) {
		            	console.log(result);
		            	if (result === 'success') {
		            		Swal.fire({
	            			  icon: 'success',
	            			  title: '수정 성공',
	            			  text: '산출물을 수정하였습니다.'
	            			}).then((result) => {
	           				  if (result.isConfirmed) {
	           					location.href = '${path}/myTask/list.do';
	   						  };
	           				})
		            	}
		            },
		            error: function(error) {
		            	console.log(error);
		            	if (error === 'fail') {
		            		Swal.fire({
	            			  icon: 'error',
	            			  title: '수정 실패',
	            			  text: '산출물 수정에 실패하였습니다.'
	            			});
		            	}
		            }
		        });
			}
		});
		
		$(document).on('click', '#editBtn', function() {
			isEdit = true;
			toggleModelForm(false);
		});
		
		$(document).on('click', '#delBtn', function() {
			 $.ajax({
	            type: "POST",
	            url: "${path}/output/delete/" + $('#outputId').val(),
			  	dataType: 'json',
	            success: function(result) {
	            	console.log(result);
	            	if (result === 'success') {
	            		Swal.fire({
	        			  icon: 'success',
	        			  title: '삭제 성공',
	        			  text: '산출물을 삭제하였습니다.'
	        			}).then((result) => {
	       				  if (result.isConfirmed) {
	  	            		location.href = '${path}/myTask/list.do';
							  };
	       				})
	            	}
	            },
	            error: function(error) {
	            	console.log(error);
	            	if (error === 'fail') {
	            		Swal.fire({
	        			  icon: 'error',
	        			  title: '삭제 실패',
	        			  text: '산출물 삭제에 실패하였습니다.'
	        			});
	            	}
	            }
	        });
		});
		
		$(document).on('click', '#saveBtn', function() {
			var form = $("#outputForm");
			
		    // you can't pass Jquery form it has to be javascript form object
		    var formData = new FormData(form[0]);
		    $.ajax({
	            type: "POST",
	            url: $(form).prop("action"),
	            //dataType: 'json', //not sure but works for me without this
	            data: formData,
	            contentType: false, //this is requireded please see answers above
	            processData: false, //this is requireded please see answers above
	            //cache: false, //not sure but works for me without this
	            error: function(error) {
	            	console.log(error);
	            	if (error === 'fail') {
	            		Swal.fire({
	        			  icon: 'error',
	        			  title: '등록 실패',
	        			  text: '산출물 등록에 실패하였습니다.'
	        			});
	            	}
	            },
	            success: function(result) {
	            	console.log(result);
	            	if (result === 'success') {
	            		Swal.fire({
	        			  icon: 'success',
	        			  title: '등록 성공',
	        			  text: '산출물을 등록하였습니다.'
	        			}).then((result) => {
	       				  if (result.isConfirmed) {
	  	            		location.href = '${path}/myTask/list.do';
							  };
	       				})
	            	}
	            }
	        });
		});
		
		$(document).on('click', '#saveBtn2', function() {
			var form = $("#outputForm2");
			
		    // you can't pass Jquery form it has to be javascript form object
		    var formData = new FormData(form[0]);
		    $.ajax({
	            type: "POST",
	            url: $(form).prop("action"),
	            //dataType: 'json', //not sure but works for me without this
	            data: formData,
	            contentType: false, //this is requireded please see answers above
	            processData: false, //this is requireded please see answers above
	            //cache: false, //not sure but works for me without this
	            error: function(error) {
	            	console.log(error);
	            	if (error === 'fail') {
	            		Swal.fire({
	        			  icon: 'error',
	        			  title: '등록 실패',
	        			  text: '산출물 등록에 실패하였습니다.'
	        			});
	            	}
	            },
	            success: function(result) {
	            	console.log(result);
	            	if (result === 'success') {
	            		Swal.fire({
	        			  icon: 'success',
	        			  title: '등록 성공',
	        			  text: '산출물을 등록하였습니다.'
	        			}).then((result) => {
	       				  if (result.isConfirmed) {
	  	            		location.href = '${path}/myTask/list.do';
							  };
	       				})
	            	}
	            }
	        });
		});
	});
	
	function formClick() {
		if($("#outputFormDiv").css("display") == "none"){
		    $("#outputFormDiv").show();
		} else {
		    $("#outputFormDiv").hide();
		}
	} 	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>