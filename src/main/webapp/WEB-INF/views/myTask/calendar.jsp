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
	$(document).ready(function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			locale : "ko",
			themeSystem : 'bootstrap5',
			aspectRatio: 1.35, 
			contentHeight: 700,
			fixedWeekCount : false,
			navLinks : true, 
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				// 모달 설정
				$("#myModalLabel160").text("일정등록");
				
				$("#regBtn").show();
				$("#uptBtn").hide();
				$("#delBtn").hide();
							
				// 폼 초기화  
				$("#calendarForm")[0].reset();
				
				// 모달창 표시
				$("#modalBtn").click();
				
				// 폼 데이터 입력
				$("#start").val(arg.start.toLocaleString());
				$("[name=start]").val(arg.start.toISOString());
				
				$("#end").val(arg.end.toLocaleString());
				$("[name=end]").val(arg.end.toISOString());
				
				$("#allDay").val("" + arg.allDay);
				$("[name=allDay]").val((arg.allDay?1:0));
				
				calendar.unselect();
			},
			eventClick: function(arg) {
				// 폼 데이터 입력
				formData(arg.event);
				
				// 모달 설정
				$("#myModalLabel160").text("상세일정");
				
				$("#regBtn").hide();
				$("#uptBtn").show();
				$("#delBtn").show();
				
				// 모달창 표시
				$("#modalBtn").click();
			},
			eventDrop : function(info) {
				// 폼 데이터 입력
				formData(info.event);
				
				// updateCalendar.do 컨트롤러 호출
				$("#calendarForm").attr("action", "${path}/myTask/updateCalendar.do");
				$("#calendarForm").attr("method", "post");
				$("#calendarForm").submit();
			},
			eventResize : function(info) {
				// 폼 데이터 입력
				formData(info.event);
				
				// updateCalendar.do 컨트롤러 호출
				$("#calendarForm").attr("action", "${path}/myTask/updateCalendar.do");
				$("#calendarForm").attr("method", "post");
				$("#calendarForm").submit();
			},
			editable : true,
			dayMaxEvents : true,
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					type : "post",
					url : "${path}/myTask/calendarList.do",
					dataType : "json",
					success : function(data) {
						successCallback(data.calendarList);
						document.getElementById('script-warning').style.display = 'none';
					},
					error : function(err) {
						failureCallback(err);
						document.getElementById('script-warning').style.display = 'block';
					}
				});
			},
			loading : function(bool) {
				document.getElementById('loading').style.display = bool ? 'block' : 'none';
			}
		});
		calendar.render();
	});

	function formData(event) {
		// 폼 데이터 입력
		$("[name=id]").val(event.id);
		$("[name=title]").val(event.title);
		$("#start").val(event.start.toLocaleString());
		$("[name=start]").val(event.start.toISOString());				
		$("#end").val(event.end.toLocaleString());
		$("[name=end]").val(event.end.toISOString());
		$("[name=allDay]").val((event.allDay?1:0)); 				
		$("[name=backgroundColor]").val(event.backgroundColor);
		$("[name=textColor]").val(event.textColor);
		$("[name=content]").val(event.extendedProps.content);
			
	}
	
	$(document).ready(function() {
		// 등록 버튼 클릭 시 inserCalender.do 컨트롤러 호출
		$("#regBtn").click(function() {
			if($("[name=title]").val()=="") {
				Swal.fire({
					  icon: 'error',
					  title: '등록 실패',
					  text: '일정 제목을 입력해주세요.'
				})
				return;
			}

			$("#calendarForm").attr("action", "${path}/myTask/insertCalendar.do");
			$("#calendarForm").attr("method", "post");
			$("#calendarForm").submit();
			
		});
		
		// 수정 버튼 클릭 시 updateCalender.do 컨트롤러 호출
		$("#uptBtn").click(function(){
			if($("[name=title]").val()=="") {
				Swal.fire({
					  icon: 'error',
					  title: '수정 실패',
					  text: '일정 제목을 입력해주세요.'
				})
				return;
			}
			$("#calendarForm").attr("action","${path}/myTask/updateCalendar.do");
			$("#calendarForm").attr("method", "post");
			$("#calendarForm").submit();
		});	
		
		// 삭제 버튼 클릭 시 deleteCalender.do 컨트롤러 호출
		$("#delBtn").click(function(){
			$("#calendarForm").attr("action","${path}/myTask/deleteCalendar.do");
			$("#calendarForm").submit();
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
						<code>서버</code> must be running.
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 산출물 등록 modal 버튼 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary" id="modalBtn" style="display: none"></button>

	<!-- 산출물 등록 modal start -->
	<div class="modal fade text-left" id="primary" tabindex="-1" role="dialog" 
		data-bs-backdrop="static" aria-labelledby="myModalLabel160" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title white" id="myModalLabel160"></h5>
				</div>
				<div class="modal-body">
					<form class="form" id="calendarForm">
						<input type="hidden" name="id" value="0"/>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label for="title" class="form-label">일정</label> 
									<input type="text" name="title" class="form-control" placeholder="일정 제목을 입력하세요" onKeyup="javascript:textByte(this, 90)"/>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="start" class="form-label">시작일</label>
									<input type="text" id="start" class="form-control" readonly style="background-color: white;"/>
									<input type="hidden" name="start"/>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="end" class="form-label">종료일</label> 
									<input type="text" id="end" class="form-control" readonly style="background-color: white;"/>
									<input type="hidden" name="end"/>
									<input type="hidden" name="allDay"/>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="backgroundColor" class="form-label">배경색</label> 
									<input type="color" name="backgroundColor" class="form-control" value="#3245DE" style="height: 38px"/>
								</div>
							</div>
							<div class="col-md-6 col-12">
								<div class="form-group">
									<label for="fontColor" class="form-label">글자색</label> 
									<input type="color" name="textColor" class="form-control" value="#ffffff" style="height: 38px;"/>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<label for="content" class="form-label">내용</label>
									<textarea class="form-control" name="content" rows="3" placeholder="일정 내용을 입력하세요" onKeyup="javascript:textByte(this, 180)"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary ml-1" id="regBtn">등록</button>
					<button type="button" class="btn btn-primary ml-1" id="uptBtn">수정</button>
					<button type="button" class="btn btn-danger ml-1" id="delBtn">삭제</button>
					<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 산출물 등록 modal end -->
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>