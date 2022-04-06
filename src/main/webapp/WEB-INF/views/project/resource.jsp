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
					<a class="nav-link active" href="${path}/project/resource.do?projectId=${param.projectId}">리소스</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" href="${path}/project/wbs.do?projectId=${param.projectId}">WBS</a>
				</li>
			</ul>
			<div class="card">
				<div class="card-body">
					<div class="tab-content" id="myTabContent">
						<select multiple="multiple" size="15" id="demo">
						<c:forEach var="member" items="${allMember}">
							<option value="${member.empId}">${member.empName}-${member.position}</option>
						</c:forEach>
						<c:forEach var="member" items="${projectMember}">
							<option value="${member.empId}" selected ${member.empId == member.pmoId ? 'disabled' : '' }>${member.empName}-${member.position}</option>
						</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</section>
     </div>
<script type="text/javascript">
$(function() {
	let selectedMember = '';
	const authId = ${emp.authId};

	// label 추가
	$("#demo").bootstrapDualListbox({
		bootstrap3Compatible: true,
		nonSelectedListLabel: "전체 사용자",
		selectedListLabel: "프로젝트 참여자",
		moveOnSelect: false,
		infoText: false,
		authId: authId
	});
	
	$('#bootstrap-duallistbox-nonselected-list_').change(function() {
	    selectMember = $(this).val().join('');
	})
	
	$('#bootstrap-duallistbox-selected-list_').change(function() {
	    selectedMember = $(this).val().join('');
	})
	
	$('#addMember').click(function(e) {
		if (authId === 1) {
			e.preventDefault();
			Swal.fire({
				  title: '추가 권한이 없습니다.',
				  html: '실무진은 리소스를 추가할 수 없습니다.<br> PM및 관라자에게 문의하세요.',
				  icon: 'error',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: '확인',
			});
			return;
		}
		
		let data = {
			"projectId": '${param.projectId}',
			"empId": selectMember
		};
		
		$.ajax({
		  url: "${path}/resource/api/addMember.do",
		  method: "post",
		  contentType: "application/json; charset=utf-8",
		  data: JSON.stringify(data)
		}).done(function(msg) {
			console.log('추가성공');
		}).fail(function(error) {
			console.log(error);
		});
	});
	
	$('#removeMember').click(function() {
		if (authId === 1) {
			Swal.fire({
				  title: '삭제 권한이 없습니다.',
				  html: '실무진은 리소스를 삭제할 수 없습니다.<br> PM및 관리자에게 문의하세요.',
				  icon: 'error',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: '확인',
			});
			
			return;
		}
		
		let data = {
			"projectId": '${param.projectId}',
			"empId": selectedMember
		};
		
		$.ajax({
		  url: "${path}/resource/api/removeMember.do",
		  method: "post",
		  contentType: "application/json; charset=utf-8",
		  data: JSON.stringify(data)
		}).done(function(msg) {
			console.log('삭제성공');
		}).fail(function(error) {
			console.log(error);
		});
	});
	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>