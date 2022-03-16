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
</div>

    <!-- Basic Tables start -->
    <section class="section">
        <div class="card">
            <div class="card-header">
                <h4>리스크 목록</h4>
                <select class="form-select" style="width:150px">
					  <option selected>진행상태</option>
					  <option value="1">오픈</option>
					  <option value="2">진행</option>
					  <option value="3">취소</option>
					  <option value="4">홀드</option>
					  <option value="5">조치완료</option>
				</select>
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
                        <tr>
                            <td>4</td>
                            <td>일정 관련 문제입니다.</td>
                            <td>PMS프로젝트</td>
                            <td>일정</td>
                            <td>Offenburg</td>
                            <td>New Quay</td>
                            <td>22-10-10</td>
                            <td>22-10-10</td>

                        </tr>
                        <tr>
                            <td>3</td>
                            <td>일정 관련 문제입니다.</td>
                            <td>PMS프로젝트</td>
                            <td>일정</td>
                            <td>New Quay</td>
                            <td>Offenburg</td>
                            <td>22-10-10</td>
                            <td>22-10-10</td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>일정 관련 문제입니다.</td>
                            <td>PMS프로젝트</td>
                            <td>일정</td>
                            <td>Grumo Appula</td>
                            <td>Ways</td>
                            <td>22-10-10</td>
                            <td>22-10-10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>일정 관련 문제입니다.</td>
                            <td>PMS프로젝트</td>
                            <td>일정</td>
                            <td>Ways</td>
                            <td>Grumo Appula</td>
                            <td>22-10-10</td>
                            <td>22-10-10</td>
                        </tr>
                  
                    </tbody>
                </table>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 
   
    
               

