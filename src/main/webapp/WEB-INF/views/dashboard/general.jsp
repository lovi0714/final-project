<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>종합 대시보드</h3>
				</div>
			</div>
		</div>

		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">공지사항</p>
					<a href="${path}/community/noticeList.do">더보기</a>
				</div>
				<div class="card-body">
					<table class="table" id="noticeList">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
	                      	<c:forEach var="notice" items="${NoticeList}">
								<tr>
				                	<td><a href="${path}/community/noticeDetail.do?noticeId=${notice.noticeId}">${notice.title}</a></td>
				                	<td>${notice.writer}</td>
				                    <td><fmt:formatDate value="${notice.createAt}" pattern="yyyy-MM-dd"/></td>
		                        </tr>
	                       	</c:forEach>	
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- Basic Tables end -->
	
		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">프로젝트 현황</p>
					<div style="display: flex; justify-content: flex-end;">
						<select class="form-select" style="width: 150px;">
							<option selected>부서</option>
							<c:forEach items="${Dept}" var="dept">
	                        	<option value="${dept.pmDeptId}">${dept.pmDeptName}</option>
	                        </c:forEach>
						</select> 
						<select class="form-select" style="width: 150px; margin: 0 10px;">
							<option selected>상태</option>
							<c:forEach items="${Status}" var="status">
	                        	<option value="${status.statusId}">${status.status}</option>
	                        </c:forEach>
						</select> 
						<a href="${path}/project/list.do" style="margin-top: 7px">더보기</a>
					</div>
				</div>
				<div class="card-body">
					<table class="table" id="projectList">
						<thead>
							<tr>
								<th>프로젝트코드</th>
								<th>프로젝트명</th>
								<th>부서</th>
								<th>PM</th>
								<th>상태</th>
								<th>시작일</th>
								<th>완료일</th>
							</tr>
						</thead>
						<tbody>
                    		<c:forEach var="project" items="${ProjectList}">
								<tr>
		                            <td><a href="${path}/project/detail.do?projectId=${project.projectId}">${project.projectId}</a></td>
		                            <td>${project.title}</td>
		                            <td>${project.pmDeptName}</td>
		                            <td>${project.pmName}</td>
		                            <c:choose>
		                            	 <c:when test = "${project.status eq '시작전'}">
		                           			<td><span class="badge bg-secondary">${project.status}</span></td>
		                            	 </c:when>
		                            	 <c:when test = "${project.status eq '정상진행'}">
		                            	 	<td><span class="badge bg-success">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '지연진행'}">
		                            	 	<td><span class="badge bg-danger">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '완료'}">
		                            	 	<td><span class="badge bg-primary">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '중단'}">
		                            	 	<td><span class="badge bg-warning">${project.status}</span></td>
		                           		 </c:when>
		                            </c:choose>
		                            <td><fmt:formatDate value="${project.startAt}" pattern="yyyy-MM-dd"/></td>
		                            <td><fmt:formatDate value="${project.endAt}" pattern="yyyy-MM-dd"/></td>
                       			</tr>
                     		</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
		</section>
		<!-- Basic Tables end -->
	
		<section id="basic-horizontal-layouts">
			<div class="row match-height">
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
							<p class="fw-bold">부서별 프로젝트 현황</p>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div style="height: 300px">
											<canvas id="projectChart" width="200px" height="200px"></canvas>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
							<p class="fw-bold">리스크 현황</p>
							<select class="form-select" id="riskChart" style="width: 150px;">
								<option value="1">상태별</option>
								<option value="2">유형별</option>
							</select>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div id="chart1" style="height: 300px">
											<canvas id="riskStatusChart1"></canvas>
										</div>	
										<div id="chart2" style="display: none; height: 300px">
											<canvas id="riskStatusChart2"></canvas>
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

<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>


<script>
	// 공지사항
	$("#noticeList").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false, 
		"paging": false,
		"autoWidth" : false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"width": "50%", "targets": 0}
		],
		"language": {
	        "zeroRecords": "등록된 공지사항이 없습니다."
	    },
		"order": [2, 'desc']
	});
	
	// 프로젝트 현황
	$("#projectList").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false, 
		"paging": false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"}
		],
		"language": {
	        "zeroRecords": "등록된 프로젝트가 없습니다."
	    },
		"order": [5, 'desc']
	});
	
	// 부서별 프로젝트 현황		
	var projectCountList1 = [];
	var projectCountList2 = [];
	var projectCountList3 = [];
	var projectCountList4 = [];
	var projectCountList5 = [];
	
	<c:forEach var="project" items="${ProjectChart1}">	
		projectCountList1.push(${project.count});
	</c:forEach>
	
	<c:forEach var="project" items="${ProjectChart2}">	
		projectCountList2.push(${project.count});
	</c:forEach>
	
	<c:forEach var="project" items="${ProjectChart3}">	
		projectCountList3.push(${project.count});
	</c:forEach>
	
	<c:forEach var="project" items="${ProjectChart4}">	
		projectCountList4.push(${project.count});
	</c:forEach>
	
	<c:forEach var="project" items="${ProjectChart5}">	
		projectCountList5.push(${project.count});
	</c:forEach>
	
	const pc = document.getElementById('projectChart');
	const projectChart = new Chart(pc, {
		type: 'bar',
	    data: {
	    	labels: [ '인사', '회계', '경영지원', '생산관리', '기술지원', '연구개발'],
	        datasets: [ {
	        	label: '시작전',
	            data: projectCountList1,
	            backgroundColor: 'rgba(170, 170, 170, 0.5)'
	        },
	        {
	        	label: '정상진행',
	            data: projectCountList2,
	            backgroundColor: 'rgba(75, 192, 192, 0.5)'
	        },
	        {
	            label: '지연진행',
	            data: projectCountList3,
	            backgroundColor: 'rgba(255, 99, 132, 0.5)'
	        },
	        {
	            label: '완료',
	            data: projectCountList4,
	            backgroundColor: 'rgba(54, 162, 235, 0.5)'
	        },
	        {
	            label: '중단',
	            data: projectCountList5,
	            backgroundColor: 'rgba(255, 206, 86, 0.5)'
	        }]
		},	
		options: {
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				x: {
					stacked: true
			    },
			    y: {
			        stacked: true,
					beginAtZero : true,
					max: 30
			    }
			},
			plugins: {
				legend: {
					position: 'bottom'
				}
			}
		}
	});
	
	// 리스크 현황 (select / option)
	$(document).ready(function(){
		$("#chart2").hide()
		
		$("#riskChart").change(function(){
		    if($(this).val() == 1) {
		    	$("#chart1").show()
		    	$("#chart2").hide()
		    	
		    } else if ($(this).val() == 2) {
		    	$("#chart1").hide()
		    	$("#chart2").show()  
		    }   
		 });
	});
	
	// 리스크 현황: 상태별
	var riskStatusList1 = [];
	var riskCountList2 = [];
	
	<c:forEach var="risk" items="${RiskStatusChart1}" >		
		riskStatusList1.push('${risk.status}');
		riskCountList2.push(${risk.count});
	</c:forEach>
	
	const rsc1 = document.getElementById('riskStatusChart1');
	const riskStatusChart1 = new Chart(rsc1, {
		type: 'doughnut',
		data: {
			labels: riskStatusList1,
			datasets: [ {
				data: riskCountList2,
				backgroundColor: [
					'rgba(170, 170, 170, 0.5)', // 오픈(회색)
					'rgba(75, 192, 192, 0.5)', // 진행(초록색)
					'rgba(153, 102, 255, 0.5)', // 취소(보라색)
					'rgba(255, 206, 86, 0.5)', // 홀드(노랑색)
					'rgba(54, 162, 235, 0.5)' // 조치완료(파랑색)
				],
				hoverOffset: 4
			} ],
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			plugins: {
				legend: {
					position : 'bottom'
				}
			}
		}
	});
	
	// 리스크 현황: 유형별
	var riskStatusList2 = [];
	var riskCountList2 = [];
	
	<c:forEach var="risk" items="${RiskStatusChart2}" >		
		riskStatusList2.push('${risk.status}');
		riskCountList2.push(${risk.count});
	</c:forEach>
	
	const rsc2 = document.getElementById('riskStatusChart2');
	const riskStatusChart2 = new Chart(rsc2, {
		type: 'doughnut',
		data: {
			labels: riskStatusList2,
			datasets: [ {
				data: riskCountList2,
				backgroundColor: [
					'rgba(54, 162, 235, 0.5)', // 고객변심(파랑색)
					'rgba(255, 99, 132, 0.5)', // 지연진행(분홍색)
					'rgba(153, 102, 255, 0.5)', // 품질문제(보라색)
					'rgba(255, 206, 86, 0.5)', // 기타사유(노랑색)
				],
				hoverOffset: 4
			} ],
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			plugins: {
				legend: {
					position : 'bottom'
				}
			}
		}
	});
	
</script>
										
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>