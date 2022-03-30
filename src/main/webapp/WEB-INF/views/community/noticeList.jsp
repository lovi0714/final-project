<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isCommunitySide" value="active" />
	<jsp:param name="isCommunityList" value="active" />
</jsp:include>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>커뮤니티</h3>
				</div>
			</div>
		</div>

		<section class="section">
			<div class="card">
				<div class="card-header">
					<p class="fw-bold">공지사항</p>
				</div>

				<div class="card-body">
					<div class="row pt-3" style="background-color: #f2f7ff;">
						<div class="col-md-3">
							<div class="input-group mb-6">
								<input type="text" class="form-control" placeholder="검색어를 입력하세요">
								<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
							</div>
						</div>
						<div class="col-md-9">
							<div class="input-group mb-3 justify-content-end">
								<button class="btn btn-primary" type="button" id="regBtn">공지사항 등록</button>
							</div>
						</div>
					</div>

					<table class="table" id="noticeBoard">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${NoticeList}">
								<tr>
									<td>${notice.noticeId}</td>
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
	</div>
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>

<script>
	//Jquery Datatable
	$("#noticeBoard").DataTable({
		"searching": false,
		"info" : false,
		"lengthChange": false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"},
		    {"width": "20%", "targets": 0},
		    {"width": "40%", "targets": 1},
		    {"width": "20%", "targets": 2},
		    {"width": "20%", "targets": 3}
		],
		"language": {
	        "zeroRecords": "등록된 공지사항이 없습니다."
	    },
		"order": [0, 'desc']
	});    
	
	$(function() {
		$('#regBtn').click(function() {
			location.href = '${path}/community/noticeForm.do';
		});
	});
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>