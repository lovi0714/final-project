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
					<div class="tab-content" id="myTabContent">
						<div id="gantt_here" style='width:100%; height:100vh;'></div>
					</div>
				</div>
			</div>
		</section>
     </div>
<script type="text/javascript">
$(function() {
	gantt.config.date_format = "%Y-%m-%d %H:%i";
	var opts = [
	    { key: 1, label: 'High' },
	    { key: 2, label: 'Normal' },
	    { key: 3, label: 'Low' }
	];
	 
	gantt.config.lightbox.sections = [
	    {name:"description", height:38, map_to:"text", type:"textarea", focus:true},
	    {name:"priority",    height:22, map_to:"priority", type:"select", options:opts},
	    {name:"time",        height:72, map_to:"auto", type:"duration"}
	];
	gantt.init("gantt_here");
	gantt.parse({
	  data: [
	    {id: 1, text: "Project #1", start_date: null, duration: null, parent:0, progress: 0, open: true},
	    {id: 2, text: "Task #1", start_date: "2019-08-01 00:00", duration:5, parent:1, progress: 1},
	    {id: 3, text: "Task #2", start_date: "2019-08-06 00:00", duration:2, parent:1, progress: 0.5},
	    {id: 4, text: "Task #3", start_date: null, duration: null, parent:1, progress: 0.8, open: true},
	    {id: 5, text: "Task #3.1", start_date: "2019-08-09 00:00", duration:2, parent:4, progress: 0.2},
	    {id: 6, text: "Task #3.2", start_date: "2019-08-11 00:00", duration:1, parent:4, progress: 0}
	  ],
	  links:[
	    {id:1, source:2, target:3, type:"0"},
	    {id:2, source:3, target:4, type:"0"},
	    {id:3, source:5, target:6, type:"0"}
	  ]
	});
	

	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>