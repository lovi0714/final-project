<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">

<div id="main-content">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>커뮤니티</h3>
				</div>
			</div>
		</div>
	</div>
	<section class="section">
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">공지사항</h4>
			</div>
			<div class="card-body">
				<table class="table" id="table2">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="20" step="1">
							<tr>
								<td>번호${i}</td>
								<td>제목${i}</td>
								<td>작성자${i}</td>
								<td>등록일${i}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	</section>

	<script src="${path}/resources/vendors/jquery/jquery.min.js"></script>
	<script
		src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
	<script
		src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
	<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>
	<script>
		// Jquery Datatable
		// let jquery_datatable = $("#table2").DataTable()
		$("#table2").DataTable({
			lengthChange : false,
			searching : false,
			info : false
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>