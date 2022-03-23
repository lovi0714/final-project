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
<link rel="stylesheet" href="${path}/resources/duallistbox/bootstrap-duallistbox.min.css">
<script type="text/javascript" src="${path}/resources/duallistbox/jquery.bootstrap-duallistbox.js"></script>
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
					<a class="nav-link active" href="${path}/project/resource.do?projectId=${parma.projectId}">리소스</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="#">WBS</a>
				</li>
			</ul>
			<div class="card">
				<div class="card-body">
					<div class="tab-content" id="myTabContent">
						<select multiple="multiple" size="15" id="demo">
						<c:forEach var="member" items="${projectMember}">
							<option value="${member.empId }" selected>${member.empName}-${member.position}</option>
						</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</section>
     </div>
<script type="text/javascript">
$(function() {
	// label 추가
	$("#demo").bootstrapDualListbox({
		bootstrap3Compatible: true,
		nonSelectedListLabel: "전체 사용자",
		selectedListLabel: "프로젝트 참여자",
		moveOnSelect: false,
		infoText: false,
	});
	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>