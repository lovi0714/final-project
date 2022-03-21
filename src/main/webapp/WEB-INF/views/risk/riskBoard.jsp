<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isRiskSide" value="active"/>
</jsp:include>
<style>
	a{
		text-decoration: none;
		color: inherit;
	}
</style>
<div id="main-content" style="padding-top: 0">
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
	            <p class="fw-bold">리스크 목록</p>
	        </div>
	        <div class="card-body">
	                  <div class="row pt-3" style="background-color: #f2f7ff;">
		                <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
		                            <option>프로젝트를 선택하세요.</option>
		                            <option>CPMS</option>
		                            <option>프로젝트 1</option>
		                            <option>프로젝트 2</option>
		                            <option>프로젝트 3</option>
		                        </select>
		                    </fieldset>
		                </div>
                         <div class="col-md-3">
		                    <fieldset class="form-group">
		                        <select class="form-select" id="basicSelect">
   		                            <option>진행상황을 선택하세요.</option>
                                    <option>오픈</option>
                                    <option>진행</option>
                                    <option>취소</option>
                                    <option>홀드</option>
                                    <option>조치완료</option>
                                </select>
		                    </fieldset>
		                </div>
   		                <div class="col-md-3">
	                        <div class="input-group mb-3">
	                            <input type="text" class="form-control" placeholder="검색어를 입력하세요">
   	                            <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
	                        </div>
                        </div>
                        <div class="col-md-3">
   	                        <div class="input-group mb-3 justify-content-end">
                            	<button class="btn btn-primary" type="button" id="regBtn" 
                            	onclick=location.href="write.do">리스크 등록</button>
                            </div>
                        </div>
                        
            		</div>
            </div>
          
            <div class="card-body">
                <table class="table" id="table1" style="text-align:center">
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
                            <td><a href="${path}/risk/detail.do">일정 관련 문제입니다.<%=i %></a></td>
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

 


   
    
               

