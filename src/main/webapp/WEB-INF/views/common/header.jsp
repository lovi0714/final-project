<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CPMS</title>
<script src="${path}/resources/js/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">

<link rel="stylesheet" href="${path}/resources/vendors/iconly/bold.css">

<link rel="stylesheet" href="${path}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${path}/resources/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${path}/resources/css/app.css">
<link rel="shortcut icon" href="${path}/resources/images/favicon.svg" type="image/x-icon">

<link rel="stylesheet" href="${path}/resources/vendors/sweetalert2/sweetalert2.min.css">

<link rel="stylesheet" href="${path}/resources/vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/all.min.css">

<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
</head>
<body>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="${path}/dashboard/general.do">CPMS</a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <!-- <li class="sidebar-title">Menu</li> -->

                        <li class="sidebar-item ${param.isDashboardSide} has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span><spring:message code="dashboard"/></span>
                            </a>
                            <ul class="submenu ${param.isDashboardList}">
                                <li class="submenu-item ">
                                    <a href="${path}/dashboard/general.do"><spring:message code="dashboard.general"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/dashboard/personal.do"><spring:message code="dashboard.personal"/></a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item ${param.isProjectSide}  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span><spring:message code="project"/></span>
                            </a>
                            <ul class="submenu ${param.isList}">
                                <li class="submenu-item">
                                    <a href="${path}/project/list.do"><spring:message code="project.list"/></a>
                                </li>
                                <li class="submenu-item">
                                    <a href="${path}/output/list.do"><spring:message code="project.file"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/approval/list.do"><spring:message code="project.approval"/></a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item ${param.isTaskSide}  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span><spring:message code="task.my"/></span>
                            </a>
                            <ul class="submenu ${param.isTaskList} ">
                                <li class="submenu-item ">
                                    <a href="${path}/myTask/list.do"><spring:message code="task.my"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/myTask/approvalList.do"><spring:message code="approval.my"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/myTask/calendar.do"><spring:message code="calendar"/></a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item ${param.isRiskSide} ">
                            <a href="${path}/risk/riskBoard.do" class='sidebar-link'>
                                <i class="bi bi-grid-1x2-fill"></i>
                                <span><spring:message code="risk.management"/></span>
                            </a>

                        </li>

                        <!-- <li class="sidebar-title">Forms &amp; Tables</li> -->

                        <li class="sidebar-item ${param.isCommunitySide}   has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-hexagon-fill"></i>
                                <span><spring:message code="community"/></span>
                            </a>
                            <ul class="submenu ${param.isCommunityList} ">
                                 <li class="submenu-item ">
                                    <a href="${path}/community/noticeList.do"><spring:message code="notice"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/community/chat.do"><spring:message code="teamchat"/></a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  ${param.isEmpStatusSide}">
                            <a href="${path}/emp/empStatus.do" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span><spring:message code="resources"/></span>
                            </a>
                        </li>
					<c:if test="${sessionScope.emp.authName=='관리자'}">	
                        <li class="sidebar-item ${param.isAdminSide} has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-pen-fill"></i>
                                <span><spring:message code="admin"/></span>
                                
                            </a>
                            
                            <ul class="submenu ${param.isAdminList}">
                                <li class="submenu-item ">
                                    <a href="${path}/emp/getEmpInfoList.do"><spring:message code="employee"/></a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${path}/emp/addEmp.do"><spring:message code="employee.add"/></a>
                                </li>
                            </ul>
                        </li>
                    </c:if>    
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main" class='layout-navbar'>
            <header class='mb-3'>
                <nav class="navbar navbar-expand navbar-light ">
                    <div class="container-fluid">
                        <a href="#" class="burger-btn d-block">
                            <i class="bi bi-justify fs-3"></i>
                        </a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown me-1">
                                    <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class='bi bi-envelope bi-sub fs-4 text-gray-600'></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                        <li>
                                            <h6 class="dropdown-header">이메일</h6>
                                        </li>
                                        <li><a class="dropdown-item" href="#">${sessionScope.emp.empEmail}</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="dropdown">
                            	
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex">
                                        <div class="user-name text-end me-3">
                                            <c:if test="${sessionScope.emp != null}">                       
                                            <h6 class="mb-0 text-gray-600">${sessionScope.emp.empId}</h6>                               
                                            <h6 class="mb-0 text-gray-600">${sessionScope.emp.name}</h6>                               
                                            
                                           	</c:if> 
                                           	
                                           	
                                        </div>
                                        <!-- 프로필 이미지 사용 X
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="assets/images/faces/1.jpg">
                                            </div>
                                        </div>
                                        -->
                                    </div>
                                </a>
                                
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <c:if test="${sessionScope.empId != null}">
                                        <h6 class="dropdown-header">${sessionScope.empId}</h6>
                                        <h6 class="dropdown-header">${sessionScope.emp.name}</h6>
                                        </c:if>
                                           
                                    </li>
                                    <li><a class="dropdown-item" href="${path}/emp/profile.do"><i class="icon-mid bi bi-person me-2"></i><spring:message code="profile"/></a></li>
                                    <li><a class="dropdown-item" href="${path}/emp/modifyPassword.do"><i class="icon-mid bi bi-person me-2"></i><spring:message code="pwd.mod"/></a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    
                                    <li>
                                    
                                    <a class="dropdown-item" href="${path}/emp/logout.do"><i
                                                class="icon-mid bi bi-box-arrow-left me-2"></i><spring:message code="logout"/></a>
                                                </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>