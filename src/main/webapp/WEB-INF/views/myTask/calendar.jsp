<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isTaskSide" value="active" />
	<jsp:param name="isTaskList" value="active" />
</jsp:include>

<link href="${path}/resources/fullcalendar-5.10.2/lib/main.css" rel='stylesheet' />

<script src="${path}/resources/fullcalendar-5.10.2/lib/main.js"></script>
<script src="${path}/resources/fullcalendar-5.10.2/lib/locales-all.js"></script>

<script>	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			locale : "ko",
			themeSystem: 'bootstrap5',
			initialDate: '2022-03-21',
			fixedWeekCount: false,
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectMirror: true,
			select: function(arg) {
		    	$("#modalBtn").click(); 
				
				console.log("시작일:"+arg.start.toLocaleString())
				console.log("마지막일:"+arg.end.toLocaleString())		
				
				console.log("시작일:"+arg.start.toISOString())
				console.log("마지막일:"+arg.end.toISOString())		
				
				calendar.unselect()
			},
			eventClick: function(arg) {
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
			},
			editable: true,
			dayMaxEvents: true, // allow "more" link when too many events
			allDaySlot: true,
			allDayText: '종일',
			events: function(info, successCallback, failureCallback) {
				$.ajax({
					type: "post",
					url: "${path}/task/calendarList.do",
					dataType: "json",
					success: function(data) {
						console.log(data.calendarList)
						successCallback(data.calendarList);
						document.getElementById('script-warning').style.display = 'none';
					},
					error: function(err) {
						console.log(err)
						failureCallback(err);
						document.getElementById('script-warning').style.display = 'block';
					}
				});
			},
			loading: function(bool) {
				document.getElementById('loading').style.display = bool ? 'block' : 'none';
			}
		});
		calendar.render();
	});
	
	$(document).ready(function(){
		$("#start2").hide()
		$("#end2").hide()	
		
	    $("#allDay").change(function(){
	        if($("#allDay").is(":checked")){
	        	
				$("#start1").hide()
				$("#start2").show()
				$("#end1").hide()
				$("#end2").show()
				
				let start = (document.querySelector('#start1').value).substr(0, 10);
				let end = (document.querySelector('#end1').value).substr(0, 10);
				
				document.getElementById("start2").value = start;
				document.getElementById("end2").value = end;
				
	        } else{
				$("#start1").show()
				$("#start2").hide()
				$("#end1").show()
				$("#end2").hide()       
	        }
	    });
	});

	$(document).ready(function(){
		$("#regBtn").click(function(){
				$("#calendarForm").attr("action", "${path}/task/insertCalendar.do");
				$("#calendarForm").attr("method", "post");
				$("#calendarForm").submit();
		});
	});
	
</script>

<!-- 
<style>
#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
-->

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
					<p class="fw-bold">일정관리</p>
				</div>
				<div class="card-body">
					<div id='calendar'></div>
					<div id='loading'>loading...</div>
					<div id='script-warning'>
						<code>서버</code>
						must be running.
					</div>
				</div>
			</div>
		</section>
	</div>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary" id="modalBtn" style="display:none"></button>		

<!-- 산출물 등록 modal -->
<div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" data-bs-backdrop="static"
	aria-labelledby="myModalLabel160" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal" role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title white" id="myModalLabel160">일정 등록</h5>
			</div>
			<div class="modal-body">
				<form class="form" id="calendarForm">
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label for="title" class="form-label">일정</label> 
								<input type="text" id="title" class="form-control" placeholder="일정 제목을 입력하세요">
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="form-group">
								<label for="start" class="form-label">시작일</label> 
								<input type="text" id="start" class="form-control">
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="form-group">
								<label for="end" class="form-label">종료일</label> 
								<input type="text" id="end" class="form-control">
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input type="checkbox" id="allDay" name="allDay" class="form-check-input">
                            	<label for="allDay">종일여부</label>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label for="content" class="form-label">내용</label>
								<textarea class="form-control" id="content" rows="3" placeholder="일정 내용을 입력하세요"></textarea>
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="form-group">
								<label for="backgroundColor" class="form-label">배경색상</label> 
								<input type="color" id="backgroundColor" class="form-control" value="#3245DE">
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="form-group">
								<label for="fontColor" class="form-label">글자색상</label> 
								<input type="color" id="fontColor" class="form-control" value="#ffffff">
							</div>
						</div>	
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary ml-1" id="regBtn">
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
				
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>