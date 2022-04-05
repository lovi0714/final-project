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
<link rel="stylesheet" href="${path}/resources/gantt/dhtmlxgantt.css">
<script type="text/javascript" src="${path}/resources/gantt/dhtmlxgantt.js"></script>
<style>
.nav-tabs .nav-link.active {
	color: white;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	background-color: #435ebe;
}

.nav {
	padding-left: 10px;
}
.fa-pen-square, .fa-plus-square, .fa-trash-alt {
	cursor: pointer;
	text-align: center;
	opacity: 0.4;
}
.fa-pen-square:hover, .fa-plus-square:hover, .fa-trash-alt:hover {
	opacity: 1;
}
.fa-pen-square {
	color: #ffa011;
	font-size: 18px;
	margin-right: 3px;
}
.fa-plus-square {
	color: #328EA0;
	font-size: 18px;
	margin-right: 3px;
}
.fa-trash-alt {
	color: red;
	font-size: 16px;
	padding-bottom: 1px;
}
</style>
<div id="main-content">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>프로젝트</h3>
				</div>
			</div>
		</div>

		<section class="section">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="${path}/project/detail.do?projectId=${param.projectId}">기본정보</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="${path}/project/resource.do?projectId=${param.projectId}">리소스</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link active" href="${path}/project/wbs.do?projectId=${param.projectId}">WBS</a>
				</li>
			</ul>
			<div class="card">
				<div class="card-body">
				<div class="row" style="background-color: #f2f7ff; margin: 10px auto;">
		                <div class="col-md-6">
							<c:choose>
								<c:when test="${emp.authId eq 1}">
									<h4 style="padding-top: 0.5em;">* 관리자 및 PM권한자만 편집이 가능합니다. *</h4>
								</c:when>
								<c:otherwise>
				                	<button id="btnEdit" class="btn btn-primary" style="margin: 10px 4px;">편집 모드</button>
								</c:otherwise>
							</c:choose>
		                </div>
            		</div>
					<div class="tab-content" id="myTabContent">
						<div id="gantt_here" style='width:100%; height:100vh;'></div>
					</div>
				</div>
			</div>
		</section>
     </div>
<script type="text/javascript">
	gantt.config.date_format = "%Y-%m-%d %H:%i";
	gantt.config.drag_move = true;
	gantt.config.grid_width = 700;
	gantt.config.readonly = true;
	gantt.config.show_errors = false;
	gantt.config.open_tree_initially = true;
	gantt.config.touch = "force";

	var formatter = gantt.ext.formatters.durationFormatter({
		enter: "day", 
		store: "day", 
		format: "auto"
	});
	
	var linksFormatter = gantt.ext.formatters.linkFormatter({durationFormatter: formatter});

	var editors = {
		text: {type: "text", map_to: "text"},
		start_date: {type: "date", map_to: "start_date", min: new Date(2000, 0, 1), max: new Date(2050, 0, 1)},
		end_date: {type: "date", map_to: "end_date", min: new Date(2000, 0, 1), max: new Date(2050, 0, 1)},
		duration: {type: "duration", map_to: "duration", min:0, max: 100, formatter: formatter},
		progress: {type: "number", map_to:"progress", min:0, max: 100}
	};
	
	var colHeader = '<div class="gantt_grid_head_cell gantt_grid_head_add" onclick="createTaskBefore()"></div>',
	colContent = function (task) {
		return ('<i class="ml-1 mr-1 gantt_button_grid gantt_grid_edit fa fa-pen-square" onclick="clickGridButton(\'' + task.id + '\', \'edit\')"></i>' +
			'<i class="ml-1 mr-1 gantt_button_grid gantt_grid_add fa-solid fa fa-plus-square" onclick="clickGridButton(\'' + task.id + '\', \'add\')"></i>' +
			'<i class="ml-1 mr-1 gantt_button_grid gantt_grid_delete fa-solid fa fa-trash-alt" onclick="clickGridButton(\'' + task.id + '\', \'delete\')"></i>');
	};
	
	$.ajax({
	  url: "${path}/resource/api/wbs/projectMember.do?projectId=${param.projectId}",
	  method: "get",
	  dataType: "json",
	}).done(function(resourceList) {
		console.log(resourceList);
		gantt.config.columns = [
			{name: "wbs", label: "WBS", width: 30, align: "center", template: gantt.getWBSCode},
			{name: "text", label: "작업명", tree: true, width: 150, editor: editors.text, resize: true, align: "left"},
			{name: "duration", label: "기간",width:35, align: "center", editor: editors.duration, resize: true,  template: function(task){
				return formatter.format(task.duration);
			}},
			{name: "start_date", label: "시작일", width:75, align: "center", editor: editors.start_date, resize: true},
			{name: "end_date", label: "완료일", width:75, align: "center", editor: editors.end_date, resize: true},
			{name: "progress", label: "진행도", align: "center", width: 40, resize: true, editor: editors.progress, template: function (task){
		  		if (task.progress){
		  			return Math.round(task.progress * 100) + "%";
		  		}
		  	}},
			{name: "approver", label: "승인자", align: "center", width: 50 , template: function (task){
				for(var i in resourceList){
					if(resourceList[i].key == task.approver){
						return resourceList[i].label;				
					}
					
				}
		  		
		  	}},
			{
				name: "manager", label: "작업자", align: "center", width: 50, template: function (task){
					for(var i in resourceList){
						if(resourceList[i].key == task.manager){
							return resourceList[i].label;				
						}
						
					}
			  		
		  	}},
			{
				name: "buttons",
				label: colHeader,
				width: 70,
				template: colContent,
				align:"center"
			}
		];
		
		gantt.config.lightbox.sections = [
			{name: "task", height: 38, map_to: "text", type: "textarea", focus: true},
			{
				name: "approverId",
				height: 22,
				map_to: "approver",
				type: "select",
				options: resourceList
			},
			{
				name: "managerId",
				height: 22,
				map_to: "manager",
				type: "select",
				options: resourceList
			},
			{name: "time", type: "time", map_to: "auto", time_format: ["%Y", "%m", "%d"]},
			{name: "description", height: 100, map_to: "description", type: "textarea"}
		];
		
	}).fail(function(error) {
		console.log(error);
	});

	// Task 생성 레이아웃 라벨
	gantt.locale.labels.section_task = "작업명"
	gantt.locale.labels.section_approverId = "승인자";
	gantt.locale.labels.section_managerId = "담당자";
	gantt.locale.labels.section_description = "작업 설명";
	gantt.locale.labels.section_time = "날짜";
	
	function createTaskBefore(){
		if(!gantt.config.readonly){
			gantt.createTask();
		}
	}
	
	// Task 생성후 이벤트 처리 
	gantt.attachEvent("onAfterTaskAdd", function(id,item){
		console.log("태스크생성후 출력", id, item.id);
		$.ajax({
		    type: 'GET',
		    url: '/pms/project/api/wbs/task/maxId',
		    dataType: 'text',
		    contentType: 'application/json; charset=utf-8',
		}).done(function (maxId) {
			let new_id = parseInt(maxId) + 1; 
			gantt.changeTaskId(item.id, new_id);
		}).fail(function (error) {
		    alert(JSON.stringify(error));
		});
		
	});
	
	// Link 생성후 이벤트 처리
	gantt.attachEvent("onAfterLinkAdd", function(id,item){
		console.log("링크생성후 출력", id, item);
		$.ajax({
		    type: 'GET',
		    url: '/pms/project/api/wbs/link/maxId',
		    //async: false,
		    dataType: 'text',
		    contentType: 'application/json; charset=utf-8',
		}).done(function (maxId) {
			new_id = parseInt(maxId) + 1;
			gantt.changeLinkId(id, new_id);
		}).fail(function (error) {
		    alert(JSON.stringify(error));
		});
	});
	
	gantt.ext.inlineEditors.attachEvent("onSave", function(state){
		console.log('onSave');
		var col = state.columnName;
		if(gantt.autoSchedule && (col == "start_date" || col == "end_date" || col == "duration")){
			gantt.autoSchedule();
		}
	});
	
	gantt.ext.inlineEditors.attachEvent("onEditStart", function(state){
		if (state.columnName == "progress"){	
		    var task = gantt.getTask(state.id);
		    var element = document.getElementsByTagName("input").progress;
		    element.value = parseInt(element.value * 100);
	    }
	});

	gantt.ext.inlineEditors.attachEvent("onBeforeSave", function(state){
	  	if (state.columnName == "progress")
	      	state.newValue /= 100;
	   return true;
	});
	
	function clickGridButton(id, action) {
		if(!gantt.config.readonly){
			switch (action) {
			case "edit":
				gantt.showLightbox(id);
				break;
			case "add":
				gantt.createTask(null, id);
				
				break;
			case "delete":
				gantt.confirm({
					title: gantt.locale.labels.confirm_deleting_title,
					text: gantt.locale.labels.confirm_deleting,
					callback: function (res) {
						if (res)
							gantt.deleteTask(id);
					}
				});
				break;
			}
		}
	}
	
	$('#btnEdit').click(function() {
		gantt.config.readonly = !gantt.config.readonly;
		if (!gantt.config.readonly) {
			$(this).html('편집 종료');
			$(this).removeClass('btn-primary');			
			$(this).addClass('btn-danger');			
		}
		else {
			$(this).html('편집 모드')
			$(this).removeClass('btn-danger');
			$(this).addClass('btn-primary');
		}
	});
	
	// 간트 생성
	gantt.init("gantt_here");
	
	// 간트 생성시 데이터 서버에서 불러오기 
	var apiUrl = "${path}/project/api/wbs/${param.projectId}";
	
	$.ajax({
	    type: 'GET',
	    url: apiUrl,
	    dataType: 'json',	
	    contentType: 'application/json; charset=utf-8',
	}).done(function (data) {
		$.ajax({
		    type: 'GET',
		    url: apiUrl+'/link',
		    dataType: 'json',	
		    contentType: 'application/json; charset=utf-8',
		}).done(function (link) {
			gantt.parse({data:data, links:link});
		
		}).fail(function (error) {
			
		    console.log("link Error", JSON.stringify(error));
		});
	}).fail(function (error) {
		console.log(data);
	    console.log("data Error", JSON.stringify(error));
	});
	
	var dp = gantt.createDataProcessor({
	      url: apiUrl,
	      mode: "REST-JSON"
	});
	

</script>
<script type="text/javascript">

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>