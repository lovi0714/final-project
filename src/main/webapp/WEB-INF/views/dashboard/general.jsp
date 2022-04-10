<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active"/>
	<jsp:param name="isDashboardList" value="active"/>
</jsp:include>

<style>
.dataTables_filter {
   display: none;
}
</style>
<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>종합 대시보드</h3>
				</div>
			</div>
		</div>

		<!-- 공지사항 start -->
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
	                      	<c:forEach var="list" items="${notice}">
								<tr>
				                	<td><a href="${path}/community/noticeDetail.do?no=${list.noticeId}">${list.title}</a></td>
				                	<td>${list.writer}</td>
				                    <td><fmt:formatDate value="${list.createAt}" pattern="yyyy-MM-dd"/></td>
		                        </tr>
	                       	</c:forEach>	
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- 공지사항 end -->
		
		<!-- 프로젝트 현황 start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">프로젝트 현황</p>
					<div style="display: flex; justify-content: flex-end;">
						<fieldset class="form-group" id="dept-group">
							<select class="form-select" id="deptSelect" style="width: 150px;">
								<option value="">부서</option>
							</select> 
						</fieldset>
						<a href="${path}/project/list.do" style="margin: 7px 0 0 15px;">더보기</a>
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
                    		<c:forEach var="list" items="${project}">
								<tr>
		                            <td><a href="${path}/project/detail.do?projectId=${list.projectId}">${list.projectId}</a></td>
		                            <td>${list.title}</td>
		                            <td>${list.pmDeptName}</td>
		                            <td>${list.pmName}</td>
		                            <c:choose>
		                            	 <c:when test = "${list.status eq '시작전'}">
		                           			<td><span class="badge bg-secondary">${list.status}</span></td>
		                            	 </c:when>
		                            	 <c:when test = "${list.status eq '정상진행'}">
		                            	 	<td><span class="badge bg-success">${list.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${list.status eq '지연진행'}">
		                            	 	<td><span class="badge bg-danger">${list.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${list.status eq '완료'}">
		                            	 	<td><span class="badge bg-primary">${list.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${list.status eq '중단'}">
		                            	 	<td><span class="badge bg-warning">${list.status}</span></td>
		                           		 </c:when>
		                            </c:choose>
		                            <td><fmt:formatDate value="${list.startAt}" pattern="yyyy-MM-dd"/></td>
		                            <td><fmt:formatDate value="${list.endAt}" pattern="yyyy-MM-dd"/></td>
                       			</tr>
                     		</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- 프로젝트 현황 end -->
	
		<section id="basic-horizontal-layouts">
			<div class="row match-height">		
				<!-- 부서별 프로젝트 현황 start -->
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
				<!-- 부서별 프로젝트 현황 end -->				
				<!-- 리스크 현황 start -->
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
				<!-- 리스크 현황 end -->
			</div>
		</section>
	</div>	

<script>
	// 공지사항 datatable
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
	
	// 프로젝트 현황 datatable
	$(document).ready(function() {
		let projectList = $("#projectList").DataTable({
			"info": false,
			"lengthChange": false, 
			"paging": false,
			"columnDefs": [
			    {"className": "dt-center", "targets": "_all"}
			],
			"language": {
		        "zeroRecords": "등록된 프로젝트가 없습니다."
		    },
			"order": [0, 'desc'],
			initComplete: function () {
	            this.api().columns([2]).every(function () {
	                var column = this;
	                var select = $('#deptSelect')
	                    .appendTo( $('#dept-group').empty() )
	                    .on('change', function () {
	                        var val = $.fn.dataTable.util.escapeRegex(
	                            $(this).val()
	                        );
	  
	                        column
	                            .search( val ? '^'+val+'$' : '', true, false )
	                            .draw();
	                    } );
	  
	                column.data().unique().sort().each( function (d, j) {
	                    select.append( '<option value="'+d+'">'+d+'</option>' )
	                } );
	            } );
	        }
		});
	});
	
	// 부서별 프로젝트 현황 chart		
	let projectCountList1 = [];
	let projectCountList2 = [];
	let projectCountList3 = [];
	let projectCountList4 = [];
	let projectCountList5 = [];
	
	<c:forEach var="pc1" items="${projectChart1}">	
		projectCountList1.push(${pc1.count});
	</c:forEach>
	
	<c:forEach var="pc2" items="${projectChart2}">	
		projectCountList2.push(${pc2.count});
	</c:forEach>
	
	<c:forEach var="pc3" items="${projectChart3}">	
		projectCountList3.push(${pc3.count});
	</c:forEach>
	
	<c:forEach var="pc4" items="${projectChart4}">	
		projectCountList4.push(${pc4.count});
	</c:forEach>
	
	<c:forEach var="pc5" items="${projectChart5}">	
		projectCountList5.push(${pc5.count});
	</c:forEach>
	
	const pc = document.getElementById('projectChart');
	const projectChart = new Chart(pc, {
		type: 'bar',
	    data: {
	    	labels: [ '인사', '회계', '경영지원', '생산관리', '기술지원', '연구개발'],
	        datasets: [ {
	        	label: '시작전',
	            data: projectCountList1,
	            backgroundColor: 'rgba(170, 170, 170, 0.5)' // 시작전(회색)
	        },
	        {
	        	label: '정상진행',
	            data: projectCountList2,
	            backgroundColor: 'rgba(75, 192, 192, 0.5)' // 정상진행(초록색)
	        },
	        {
	            label: '지연진행',
	            data: projectCountList3,
	            backgroundColor: 'rgba(255, 99, 132, 0.5)' // 지연진행(빨강색)
	        },
	        {
	            label: '완료',
	            data: projectCountList4,
	            backgroundColor: 'rgba(54, 162, 235, 0.5)' // 완료(파랑색)
	        },
	        {
	            label: '중단',
	            data: projectCountList5,
	            backgroundColor: 'rgba(255, 206, 86, 0.5)' // 중단(노랑색)
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
					max: 10
			    }
			},
			plugins: {
				legend: {
					position: 'bottom'
				}
			}
		}
	});
	
	// 리스크 현황 select option
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
	
	// 리스크 현황 chart (상태별)
	let riskStatusList1 = [];
	let riskCountList1 = [];
	
	<c:forEach var="rsc1" items="${riskStatusChart1}" >		
		riskStatusList1.push('${rsc1.status}');
		riskCountList1.push(${rsc1.count});
	</c:forEach>
	
	const rsc1 = document.getElementById('riskStatusChart1');
	const riskStatusChart1 = new Chart(rsc1, {
		type: 'doughnut',
		data: {
			labels: riskStatusList1,
			datasets: [ {
				data: riskCountList1,
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
	
	// 리스크 현황 chart (유형별)
	var riskStatusList2 = [];
	var riskCountList2 = [];
	
	<c:forEach var="rsc2" items="${riskStatusChart2}" >		
		riskStatusList2.push('${rsc2.status}');
		riskCountList2.push(${rsc2.count});
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