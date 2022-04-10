<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="isAdminSide" value="active" />
   <jsp:param name="isAdminList" value="active" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<style>
.dataTables_filter {
   display: none;
}
</style>

<div id="main-content" style="padding-top: 0">
   <div class="page-heading">
       <div class="page-title">
           <div class="row"> 
               <div class="col-12 col-md-6 order-md-1 order-last">
                   <h3>관리자</h3>
               </div>
           </div>
       </div>
   
       <!-- Basic Tables start -->
       <section class="section">
           <div class="card">
               <div class="card-header">
                   <p class="fw-bold">사원 정보</p>
               </div>
             
               <div class="card-body">
                  <div class="row pt-3" style="background-color: #f2f7ff;">
                      <div class="col-md-3">
                          <fieldset class="form-group" id="dept-group">
                              <select class="form-select" id="deptSelect">
                                  <option value="">부서를 선택하세요.</option>
                              </select>
                          </fieldset>
                      </div>
                         <div class="col-md-3">
                          <fieldset class="form-group" id="pos-group">
                              <select class="form-select" id="posSelect">
                                  <option value="">직급를 선택하세요.</option>
                              </select>
                          </fieldset>
                      </div>                               
                         <div class="col-md-3">
                           <div class="input-group mb-3">
                               <input type="search" class="form-control" id="searchbox" name="searchbox" placeholder="검색어를 입력하세요">
                           </div>
                        </div>                                             
                  </div>
                   <table class="table" id="table1" style="text-align:center">
                       <thead>
                           <tr>
                               <th>사원 번호</th>
                               <th>권한</th>
                               <th>부서</th>
                               <th>직급</th>
                               <th>이름</th> 
                               <th>이메일</th>                            
                           </tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${empInfoList}" var="list">
                             <tr>
                                <td style="cursor:pointer;"><a href="${path}/admin/EmpInfoDetails.do?empId=${list.empId}">${list.empId}</a></td>
                                <td>${list.authName}</td>
                                <td>${list.deptName}</td>
                                <td>${list.posName}</td>
                                <td>${list.name}</td>
                                <td>${list.empEmail}</td>
                             </tr>   
                          </c:forEach>                                 
                       </tbody>
                   </table>
               </div>
           </div>
      </section>      
   </div>
       <!-- Basic Tables end -->
   
<script>
   //Jquery Datatable
   $(document).ready(function() {
      let dataTable = $("#table1").DataTable({
         "info": false,
         "lengthChange": false,
         "language": {
             "zeroRecords" : "등록된 사원이 없습니다."
          },
          "order": [0, 'desc'],
         initComplete: function () {
               this.api().columns([2]).every(function () {
                   var column = this;
                   var select = $('#deptSelect')
                       .appendTo($('#dept-group').empty())
                       .on('change', function () {
                           var val = $.fn.dataTable.util.escapeRegex(
                               $(this).val()
                           );
    
                           column
                           .search(val ? '^'+val+'$' : '', true, false)
                           .draw();
                   });
                   
                   column.data().unique().sort().each( function (d, j) {
                       select.append('<option value="'+d+'">'+d+'</option>')
                   });
               });
               this.api().columns([3]).every(function () {
                   var column = this;
                   var select = $('#posSelect')
                       .appendTo($('#pos-group').empty())
                       .on('change', function () {
                           var val = $.fn.dataTable.util.escapeRegex(
                               $(this).val()
                           );
    
                           column
                           .search(val ? '^'+val+'$' : '', true, false)
                           .draw();
                   });
                   
                   column.data().unique().sort().each( function (d, j) {
                       select.append('<option value="'+d+'">'+d+'</option>')
                   });
               });
           }
       });
      
      $("#searchbox").on("keyup search input paste cut", function() {
          dataTable.search(this.value).draw();
       });  
   });
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>