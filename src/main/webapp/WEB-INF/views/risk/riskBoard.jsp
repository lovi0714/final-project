<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div id="main-content">
	<div class="page-heading">
	    <div class="page-title">
	        <div class="row">
	            <div class="col-12 col-md-6 order-md-1 order-last">
	                <h3>리스크 관리</h3>
	            </div>
	        </div>
	    </div>
	
	
    <!-- Basic Tables start -->
    <section class="section">
        <div class="card">
            <div class="card-header">
	            <h4>리스크 목록</h4>
	            <div class="form-inline" style="display:inline;">
	                <select class="form-select" style="width:150px; margin-top:7px; margin-right:10px; display:inline-block; float:left;">
						  <option selected>진행상태</option>
						  <option value="1">오픈</option>
						  <option value="2">진행</option>
						  <option value="3">취소</option>
						  <option value="4">홀드</option>
						  <option value="5">조치완료</option>
					</select>
					<select class="form-select" style="width:150px; margin-top:7px; margin-right:10px; display:inline-block; float:left;">
						  <option selected>프로젝트</option>
						  <option value="1">프로젝트1</option>
						  <option value="2">프로젝트2</option>
						  <option value="3">프로젝트3</option>
						  <option value="4">프로젝트4</option>
						  <option value="5">프로젝트5</option>
					</select>
					<div class="input-group mb-3" style="width:300px; float:left; margin-top:7px; margin-right:10px;">
						<input type="text" class="form-control" placeholder="검색할 내용을 입력하세요">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					</div>
					<button type="button" class="btn btn-primary" style="float:right">리스크 등록</button>
            	</div>  
            </div>
          
            <div class="card-body">
                <table class="table" id="table1">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>프로젝트명</th>
                            <th>유형</th>
                            <th>제기자</th>
                            <th>조치자</th>
                            <th>조치희망일</th>
                            <th>조치완료일</th>
                        </tr>
                    </thead>
                    <tbody>
                      <%for(int i=0; i<100; i++){ %> 
                        <tr>
                            <td><%=i+1%></td>
                            <td>일정 관련 문제입니다.<%=i %></td>
                            <td>PMS프로젝트<%=i %></td>
                            <td>일정<%=i %></td>
                            <td>Offenburg<%=i %></td>
                            <td>New Quay<%=i %></td>
                            <td>22-10-10</td>
                            <td>22-10-10</td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!-- Basic Tables end -->
    </div>
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>    
<script>
// Jquery Datatable
let jquery_datatable = $("#table1").DataTable({
	"searching" : false,
	"lengthChange" : false,
	"info" : false,
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

 


   
    
               

