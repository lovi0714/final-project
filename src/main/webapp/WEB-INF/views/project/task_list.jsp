<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>업무 목록 - borampms</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
	<meta content="Coderthemes" name="author" />
	<!-- App favicon -->
	<link rel="shortcut icon" href="${path}/tools/project_assets/images/favicon.ico">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

	<!-- App css -->
	<link href="${path}/tools/project_assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	<link href="${path}/tools/project_assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />
</head>


<!-- 양념한 부분 msg관련 js와 detail.
	양념하고 싶은 거 : taskUser 활용 (조회리스트)
 -->

<script>
	let msg = '${msg}';
	
	if(msg!=''){
		alert(msg);
	}
	msg='';

</script>

<body class="loading" data-layout-color="light" data-leftbar-theme="dark" data-layout-mode="fluid"
	data-rightbar-onstart="true">
	
	
	<!-- Begin page -->
	<div class="wrapper">
		<!-- ========== Left Sidebar Start ========== -->
		<div class="leftside-menu">
			<!-- LOGO -->
			<a href="index.html" class="logo text-center logo-light">
				<span class="logo-lg">
					<img src="${path}/tools/project_assets/images/boram_dark.png" alt="" height="45">
				</span>
				<span class="logo-sm">
					<img src="${path}/tools/project_assets/images/boram_sm_dark.png" alt="" height="35">
				</span>
			</a>
			<!-- LOGO -->
			<a href="index.html" class="logo text-center logo-dark">
				<span class="logo-lg">
					<img src="${path}/tools/project_assets/images/boram_light.png" alt="" height="45">
				</span>
				<span class="logo-sm">
					<img src="${path}/tools/project_assets/images/boram_sm_light.png" alt="" height="35">
				</span>
			</a>
			<div class="h-100" id="leftside-menu-container" data-simplebar>
				<!--- Start Sidemenu -->
				<ul class="side-nav">
					<li class="side-nav-item">
						<a href="../dashboard/prjDash.html" class="side-nav-link">
             				<i class="fa fa-bar-chart" aria-hidden="true"></i>
              				<span> 대시보드 </span>
           				</a>
         			</li>
					<li class="side-nav-item">
            			<a href="../schedule/schCalendar.html" class="side-nav-link">
              				<i class="uil-calender"></i>
              				<span> 캘린더 </span>
            			</a>
          			</li>
          			<li class="side-nav-item">
          				<a data-bs-toggle="collapse" href="#sidebarTasks"
            				aria-expanded="false" aria-controls="sidebarTasks" class="side-nav-link">
              				<i class="uil-clipboard-alt"></i>
              				<span> 일정관리 </span>
              				<span class="menu-arrow"></span>
            			</a>
            			<div class="collapse" id="sidebarTasks">
              				<ul class="side-nav-second-level">
                				<li><a href="${path}/schGantt.do">WBS/간트차트</a></li>
                				<li><a href="../schedule/schKanban.html">칸반보드</a></li>
              				</ul>
            			</div>
          			</li>
        			<li class="side-nav-item">
           				<a data-bs-toggle="collapse" href="#sidebarDashboards" aria-expanded="false"
							aria-controls="sidebarDashboards" class="side-nav-link">
							<i class="uil-home-alt"></i>
							<span> 업무 관리 </span>
							<span class="menu-arrow"></span>
						</a>
						<div class="collapse" id="sidebarDashboards">
							<ul class="side-nav-second-level">
								<li><a href="${path}/task.do?method=list">업무 목록</a></li>
								<li><a href="${path}/issue.do?method=list">업무 이슈</a></li>
							</ul>
						</div>
					</li>
					<li class="side-nav-item">
                        <a href="${path}/issue.do?method=list" class="side-nav-link">
                            <i class="uil-folder-plus"></i>
                            <span> 이슈 관리 </span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="${path}/dept.do?method=list" class="side-nav-link">
                            <i class="uil-folder-plus"></i>
                            <span> 문서관리 </span>
                        </a>
                    </li>
                </ul>
				<!-- End Sidemenu -->

				<div class="clearfix"></div>

			</div>
			<!-- Sidebar -left -->

		</div>
		<!-- ========== Left Sidebar end ========== -->
		
		
		
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">
			
				<!-- Start Topbar -->
				<div class="navbar-custom">
					<ul class="list-unstyled topbar-menu float-end mb-0">
						<li class="dropdown notification-list d-lg-none">
							<a class="nav-link dropdown-toggle arrow-none"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false">
								<i class="dripicons-search noti-icon"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
								<form class="p-3">
									<input type="text" class="form-control"
										placeholder="Search ..." aria-label="Recipient's username">
								</form>
							</div>
						</li>
						
						<!--상단(top bar) 언어 설정 / 알림 목록 / 공유 / 설정 nav -->
						<li class="dropdown notification-list topbar-dropdown">
							<a class="nav-link dropdown-toggle arrow-none"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false">
									<img src="${path}/tools/project_assets/images/flags/us.jpg" alt="user-image"
										class="me-0 me-sm-1" height="12">
									<span class="align-middle d-none d-sm-inline-block">English</span>
									<i class="mdi mdi-chevron-down d-none d-sm-inline-block align-middle"></i>
							</a>
							
							<!-- 언어 설정 -->
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu">

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/korean.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">Korean</span>
								</a>
								
								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/japan.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">Japan</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/germany.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">German</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/italy.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">Italian</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/spain.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">Spanish</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<img src="${path}/tools/project_assets/images/flags/russia.jpg" alt="user-image"
									class="me-1" height="12"> <span class="align-middle">Russian</span>
								</a>

							</div>
						</li>

						<!-- 알림 목록 -->
						<li class="dropdown notification-list">
							<a
								class="nav-link dropdown-toggle arrow-none"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false">
								<i class="dripicons-bell noti-icon"></i>
								<span class="noti-icon-badge"></span>
							</a>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg">

								<!-- item-->
								<div class="dropdown-item noti-title px-3">
									<h5 class="m-0">
										<span class="float-end">
											<a href="javascript: void(0);" class="text-dark">
											<small>Clear All</small>
											</a>
										</span>
										Notification
									</h5>
								</div>

								<div class="px-3" style="max-height: 300px;" data-simplebar>

									<h5 class="text-muted font-13 fw-normal mt-0">Today</h5>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item p-0 notify-item card unread-noti shadow-none mb-2">
										<div class="card-body">
											<span class="float-end noti-close-btn text-muted">
												<i class="mdi mdi-close"></i>
											</span>
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													<div class="notify-icon bg-primary">
														<i class="mdi mdi-comment-account-outline"></i>
													</div>
												</div>
												<div class="flex-grow-1 text-truncate ms-2">
													<h5 class="noti-item-title fw-semibold font-14">
														Datacorp
														<small class="fw-normal text-muted ms-1">1 min ago</small>
													</h5>
													<small class="noti-item-subtitle text-muted">
														Caleb Flakelar commented on Admin</small>
												</div>
											</div>
										</div>
									</a>

									<!-- item-->
									<a href="javascript:void(0);"
										class="dropdown-item p-0 notify-item card read-noti shadow-none mb-2">
										<div class="card-body">
											<span class="float-end noti-close-btn text-muted">
												<i class="mdi mdi-close"></i>
											</span>
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													<div class="notify-icon bg-info">
														<i class="mdi mdi-account-plus"></i>
													</div>
												</div>
												<div class="flex-grow-1 text-truncate ms-2">
													<h5 class="noti-item-title fw-semibold font-14">
														Admin
														<small class="fw-normal text-muted ms-1">1 hours ago</small>
													</h5>
													<small class="noti-item-subtitle text-muted">
														New user registered</small>
												</div>
											</div>
										</div>
									</a>

									<h5 class="text-muted font-13 fw-normal mt-0">Yesterday</h5>
									<!-- item-->
									<a href="javascript:void(0);"
										class="dropdown-item p-0 notify-item card read-noti shadow-none mb-2">
										<div class="card-body">
											<span class="float-end noti-close-btn text-muted">
												<i class="mdi mdi-close"></i>
											</span>
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													<div class="notify-icon">
														<img src="${path}/tools/project_assets/images/users/avatar-2.jpg"
															class="img-fluid rounded-circle" alt="" />
													</div>
												</div>
												<div class="flex-grow-1 text-truncate ms-2">
													<h5 class="noti-item-title fw-semibold font-14">
														Cristina Pride
														<small class="fw-normal text-muted ms-1">1 day ago</small>
													</h5>
													<small class="noti-item-subtitle text-muted">
														Hi, How are you? What about our next meeting</small>
												</div>
											</div>
										</div>
									</a>

									<h5 class="text-muted font-13 fw-normal mt-0">30 Dec 2021</h5>
									<!-- item-->
									<a href="javascript:void(0);"
										class="dropdown-item p-0 notify-item card read-noti shadow-none mb-2">
										<div class="card-body">
											<span class="float-end noti-close-btn text-muted">
												<i class="mdi mdi-close"></i>
											</span>
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													<div class="notify-icon bg-primary">
														<i class="mdi mdi-comment-account-outline"></i>
													</div>
												</div>
												<div class="flex-grow-1 text-truncate ms-2">
													<h5 class="noti-item-title fw-semibold font-14">Datacorp</h5>
													<small class="noti-item-subtitle text-muted">
														Caleb Flakelar commented on Admin</small>
												</div>
											</div>
										</div>
									</a>

									<!-- item-->
									<a href="javascript:void(0);"
										class="dropdown-item p-0 notify-item card read-noti shadow-none mb-2">
										<div class="card-body">
											<span class="float-end noti-close-btn text-muted">
												<i class="mdi mdi-close"></i>
											</span>
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													<div class="notify-icon">
														<img src="${path}/tools/project_assets/images/users/avatar-4.jpg"
															class="img-fluid rounded-circle" alt="" />
													</div>
												</div>
												<div class="flex-grow-1 text-truncate ms-2">
													<h5 class="noti-item-title fw-semibold font-14">Karen Robinson</h5>
													<small class="noti-item-subtitle text-muted">
														Wow ! this admin looks good and awesome design</small>
												</div>
											</div>
										</div>
									</a>

									<div class="text-center">
										<i class="mdi mdi-dots-circle mdi-spin text-muted h3 mt-0"></i>
									</div>
								</div>

								<!-- All-->
								<a href="javascript:void(0);"
									class="dropdown-item text-center text-primary notify-item border-top border-light py-2">
									View All </a>

							</div>
						</li>

						<!-- 타 플랫폼 공유 -->
						<li class="dropdown notification-list d-none d-sm-inline-block">
							<a class="nav-link dropdown-toggle arrow-none"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false">
								<i class="dripicons-view-apps noti-icon"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg p-0">

								<div class="p-2">
									<div class="row g-0">
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/slack.png" alt="slack"> <span>Slack</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/github.png" alt="Github">
												<span>GitHub</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/dribbble.png" alt="dribbble">
												<span>Dribbble</span>
											</a>
										</div>
									</div>

									<div class="row g-0">
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/bitbucket.png" alt="bitbucket">
												<span>Bitbucket</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/dropbox.png" alt="dropbox">
												<span>Dropbox</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#">
												<img src="${path}/tools/project_assets/images/brands/g-suite.png" alt="G Suite">
												<span>G Suite</span>
											</a>
										</div>
									</div>
									<!-- end row-->
								</div>

							</div>
						</li>

						<!-- setting 아이콘 -->
						<li class="notification-list">
							<a class="nav-link end-bar-toggle" href="javascript: void(0);">
								<i class="dripicons-gear noti-icon"></i>
							</a>
						</li>

						<!-- 내 프로필 아이콘 -->
						<li class="dropdown notification-list">
							<a class="nav-link dropdown-toggle nav-user arrow-none me-0"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false">
								<span class="account-user-avatar">
									<img src="${path}/tools/project_assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">
								</span>
								<span>
									<span class="account-user-name">Dominic Keller</span>
									<span class="account-position">Founder</span>
								</span>
							</a>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
								<!-- item-->
								<div class=" dropdown-header noti-title">
									<h6 class="text-overflow m-0">Welcome !</h6>
								</div>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-account-circle me-1"></i>
									<span>My Account</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-account-edit me-1"></i>
									<span>Settings</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-lifebuoy me-1"></i>
									<span>Support</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-lock-outline me-1"></i>
									<span>Lock Screen</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<i class="mdi mdi-logout me-1"></i>
									<span>Logout</span>
								</a>
							</div>
						</li>
					</ul>
					
					<button class="button-menu-mobile open-left">
						<i class="mdi mdi-menu"></i>
					</button>
					
					<!-- 상단(top bar) Search 클릭 시 -->
					<div class="app-search dropdown d-none d-lg-block">
						<form>
							<div class="input-group">
								<input type="text" class="form-control dropdown-toggle"
									placeholder="Search..." id="top-search">
								<span class="mdi mdi-magnify search-icon"></span>
								<button class="input-group-text btn-primary" type="submit">Search</button>
							</div>
						</form>

						<div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">
							<!-- item-->
							<div class="dropdown-header noti-title">
								<h5 class="text-overflow mb-2">
									Found <span class="text-danger">17</span> results
								</h5>
							</div>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="uil-notes font-16 me-1"></i>
								<span>Analytics Report</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="uil-life-ring font-16 me-1"></i>
								<span>How can I help you?</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="uil-cog font-16 me-1"></i>
								<span>User profile settings</span>
							</a>

							<!-- item-->
							<div class="dropdown-header noti-title">
								<h6 class="text-overflow mb-2 text-uppercase">Users</h6>
							</div>

							<div class="notification-list">
								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item notify-item">
									<div class="d-flex">
										<img class="d-flex me-2 rounded-circle"
											src="${path}/tools/project_assets/images/users/avatar-2.jpg"
											alt="Generic placeholder image" height="32"/>
										<div class="w-100">
											<h5 class="m-0 font-14">Erwin Brown</h5>
											<span class="font-12 mb-0">UI Designer</span>
										</div>
									</div>
								</a>
							</div>
							<!-- end notification list -->
							
						</div>
					</div>
				</div>
				<!-- end Topbar -->

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">borampms</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">업무 관리</a></li>
										<li class="breadcrumb-item active">업무 목록</li>
									</ol>
								</div>
								<h4 class="page-title">업무 목록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<!-- start page content -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="row gy-2 gx-2 align-items-center justify-content-between">
										<div class="col-auto">
											<form class="row g-2" id="listsch" method="post">
												<input type="hidden" name="curPage" value="1"/>
												<div class="col">
													<select class="form-select" id="search-select">
														<option selected value="${taskSch.ptTitle}">제목</option>
														<option value="${taskSch.ptCharge}">담당자</option>
													</select>
												</div>
												<div class="col">
													<input type="search" class="form-control" id="search-word" placeholder="Search...">
												</div>
											</form>
										</div>
										<div class="col-auto">
											<form class="row g-4" id="datesch" action="">
												<div class="col">
													<label for="startdate-form" class="col-form-label">시작일</label>
												</div>
												<div class="col">
													<input class="form-control" type="date" name="startdate" value="${taskSch.ptStartdate }"/>
												</div>
												<div class="col">
													<label for="enddate-form" class="col-form-label">마감일</label>
												</div>
												<div class="col">
													<input class="form-control" type="date" name="enddate" value="${taskSch.ptDuedate }"/>
												</div>
											</form>
										</div>
									</div>
									<!-- end row -->
							
									<div class="row my-3">
										<div class="table-responsive">
											<table class="table table-centered table-nowrap mb-0 text-center">
												<thead class="table-light">
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>부서</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>마감일</th>
														<th>진행상태</th>
														<th>결재상태</th>
													</tr>
											 	</thead>
											 	<tbody id="task-tbody">
													<c:forEach var="task" items="${tasklist}" varStatus="status">
													<tr>
														<td>${task.cnt }</td>
														<td ondblclick="detail('${task.ptId}')">${task.ptTitle }</td>
														<td>${task.ptCharge }</td>
														<td>${task.ptCharge }</td>
														<td>${task.ptStartdate }</td>
														<td>${task.ptDuedate }</td>
														<td>
															<div class="progress">
																<div
																	<c:choose>
																		<c:when test="${task.ptStatus eq '진행 전' }">
																			class="progress-bar bg-secondary"
																			style="width:100%" aria-valuenow="100"
																		</c:when>
																		<c:when test="${task.ptStatus eq '진행 중' }">
																			class="progress-bar bg-info"
																			style="width:70%" aria-valuenow="70"
																		</c:when>
																		<c:when test="${task.ptStatus eq '완료' }">
																			class="progress-bar bg-success"
																			style="width:100%" aria-valuenow="100"
																		</c:when>
																		<c:when test="${task.ptStatus eq '지연' }">
																			class="progress-bar-striped bg-warning progress-bar-animated"
																			style="width:0%" aria-valuenow="0"
																		</c:when>
																		<c:when test="${task.ptStatus eq '보류' }">
																			class="progress-bar-striped"
																			style="width:0%" aria-valuenow="0"
																		</c:when>
																	</c:choose>
																		role="progressbar" aria-valuemin="0" aria-valuemax="100">${task.ptStatus }
																</div>
															</div>
														</td>
														<td>
															<span class="badge bg-secondary text-light">결재완료</span>
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									
										<!-- 페이징 블록 -->
										<div class="row gy-2">
											<div class="col justify-content-end">
												<ul class="pagination pagination-rounded">
													<li class="page-item">
												  		<a class="page-link" href="javascript:goPage(${taskSch.firstBlock != 1 ? taskSch.lastBlock-1 : 1})">Previous</a>
												  	</li>
												  	<c:forEach var="cnt" begin="${taskSch.firstBlock}" end="${taskSch.lastBlock}">
												  	<li class="page-item ${cnt == taskSch.curPage ? 'active' : ''}"> <!-- 클릭한 현재 페이지 번호 -->
												  		<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
												  	</li>
												  	</c:forEach>
												  	<li class="page-item">
												  		<a class="page-link"
												  			href="javascript:goPage(${taskSch.firstBlock != taskSch.pageCount ? taskSch.lastBlock+1 : taskSch.lastBlock})">Next</a>
												  	</li>
												</ul>
											</div>
											<div class="d-grid gap-2 col-sm-2 col-lg-1 float-end">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signup-modal">등록</button>
											</div>
										</div>
									
									</div>
									<!-- end row -->
									
								</div>
								<!-- end card body -->
							</div>
							<!-- end card -->
					</div>
					<!-- end row -->
					
				</div>
				<!-- end content -->
				
			</div>
			
			
			<!-- end row -->
			
		</div>
		
		<!-- ============================================================== -->
		<!-- End Page content -->
		
		
	</div>
	</div>
	<!-- wrapper -->

	<!-- Footer Start -->
	<footer class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<script>
						document.write(new Date().getFullYear())
					</script>
					© Hyper - Coderthemes.com
				</div>
				<div class="col-md-6">
					<div class="text-md-end footer-links d-none d-md-block">
						<a href="javascript: void(0);">About</a>
						<a href="javascript: void(0);">Support</a>
						<a href="javascript: void(0);">Contact Us</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer end -->


	<!-- Right Sidebar -->
	<div class="end-bar">
		<div class="rightbar-title">
			<a href="javascript:void(0);" class="end-bar-toggle float-end">
				<i class="dripicons-cross noti-icon"></i>
			</a>
			<h5 class="m-0">Settings</h5>
		</div>

		<div class="rightbar-content h-100" data-simplebar>
			<div class="p-3">
				<!-- Settings -->
				<h5 class="mt-3">Color Scheme</h5>
				<hr class="mt-1"/>
				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox"
						name="color-scheme-mode" value="light" id="light-mode-check" checked>
					<label class="form-check-label" for="light-mode-check">Light Mode</label>
				</div>
				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox"
						name="color-scheme-mode" value="dark" id="dark-mode-check"/>
					<label class="form-check-label" for="dark-mode-check">Dark Mode</label>
				</div>

				<!-- Left Sidebar-->
				<h5 class="mt-4">Left Sidebar</h5>
				<hr class="mt-1" />
				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox" name="theme"
						value="default" id="default-check"/>
					<label class="form-check-label" for="default-check">Default</label>
				</div>

				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox" name="theme"
						value="light" id="light-check" checked/>
					<label class="form-check-label" for="light-check">Light</label>
				</div>

				<div class="form-check form-switch mb-3">
					<input class="form-check-input" type="checkbox" name="theme"
						value="dark" id="dark-check"/>
					<label class="form-check-label" for="dark-check">Dark</label>
				</div>

				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox" name="compact"
						value="fixed" id="fixed-check" checked/>
					<label class="form-check-label" for="fixed-check">Fixed</label>
				</div>

				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox" name="compact"
						value="condensed" id="condensed-check"/>
					<label class="form-check-label" for="condensed-check">Condensed</label>
				</div>

				<div class="form-check form-switch mb-1">
					<input class="form-check-input" type="checkbox" name="compact"
						value="scrollable" id="scrollable-check"/>
					<label class="form-check-label" for="scrollable-check">Scrollable</label>
				</div>

				<div class="d-grid mt-4">
					<button class="btn btn-primary" id="resetBtn">Reset to Default</button>
				</div>
			</div>
			<!-- end padding-->

		</div>
	</div>
	<!-- /End-bar -->
	
	<div class="rightbar-overlay"></div>
	


	<!-- 업무 등록 modal -->
	<div class="tab-content">
	    <div class="tab-pane show active" id="modal-pages-preview" >
	        <!-- Signup modal content --> 
	        <div id="signup-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	            <div class="modal-dialog">
	                <div class="modal-content" >
	
	                    <div class="modal-header">
	                        <h4>업무등록</h4>                                                                
	                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                    </div>
	
	                    <div class="modal-body">
	                        <form id="regForm" class="ps-3 pe-3" action="${path}/task.do?method=insert" method="post">                               
	                            <div class="mb-3">
	                                <label for="username" class="form-label">제목</label>
	                                <input name="ptTitle" class="form-control"  required="" placeholder="제목을 입력해주세요">
	                            </div>
	                            <!-- Autoclose -->
	                            <div style="display:flex; justify-content: space-between;">
	                                <div class="mb-3">
	                                 <label class="form-label">시작일</label>
	                                 <input class="form-control" required=""  type="date" name="ptStartdate">
	                             </div>
	                             <div class="mb-3">
	                                 <label class="form-label">마감일</label>
	                                 <input class="form-control" required=""  type="date" name="ptDuedate">
	                             </div>
	                            </div>
	                            
	                            <!-- Multiple Select -->
	                            <div class="mb-3 position-relative">
	                                <label class="form-label">업무담당자</label>
	                                <select name="ptCharge" class="select2 form-control select2-multiple" required=""
	                                	data-toggle="select2" multiple="multiple" data-placeholder="업무담당자 지정">
	                                    <optgroup label="IT팀">
	                                        <option value="IT팀 조민혁">IT팀 조민혁</option>
	                                        <option value="IT팀 전지원">IT팀 전지원</option>
	                                    </optgroup>
	                                    <optgroup label="인사팀">
	                                        <option value="인사팀 김파월">인사팀 김파월</option>
	                                        <option value="인사팀 김소월">인사팀 김소월</option>
	                                        <option value="인사팀 한가람">인사팀 한가람</option>
	                                        <option value="인사팀 김효은">인사팀 김효은</option>
	                                    </optgroup>
	                                    <optgroup label="마케팅팀">
	                                        <option value="마케팅팀 양초명">마케팅팀 양초명</option>
	                                        <option value="마케팅팀 양현수">마케팅팀 양현수</option>
	                                        <option value="마케팅팀 양광">마케팅팀 양광</option>
	
	                                    </optgroup>
	                                </select>
	                            </div>
	                            
	
	                            <div style="display:flex; justify-content: space-between; ">
	                            	<div class="mb-3" style="width: 30%;">
	                                    <label for="example-select" class="form-label">우선순위</label>
	                                    <select class="form-select" id="example-select" name="ptPriority">
	                                        <option>중요</option>
	                                        <option>보통</option>
	                                        <option>낮음</option>
	                                    </select>
	                                </div>
	                                <div class="mb-3" style="width: 30%;">
	                                    <label for="example-select" class="form-label">분류</label>
	                                    <select class="form-select" id="example-select" name="ptType">
	                                        <option>요구사항 도출</option>
	                                        <option>요구사항 분석</option>
	                                        <option>요구사항 명확</option>
	                                        <option>요구사항 확인</option>
	                                        <option>개발</option>
	                                    </select>
	                                </div>	
	                                <div class="mb-3" style="width: 30%;">
	                                    <label for="example-select" class="form-label">진행상태</label>
	                                    <select class="form-select" id="example-select" name="ptStatus">
	                                        <option>진행 전</option>
	                                        <option>진행 중</option>
	                                        <option>지연</option>
	                                        <option>보류</option>
	                                        <option>완료</option>
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="example-textarea" class="form-label">내용</label>
	                                <textarea class="form-control" id="example-textarea" rows="15" name="ptContent"></textarea>
	                            </div>
	                            <hr>		
	                            <div class="mb-3 text-center" style="display: flex; justify-content: space-between;">
	                                <button class="btn btn-secondary" class="btn-close" data-bs-dismiss="modal" aria-label="Close">취소</button>
	                                <button class="btn btn-primary" type="button" id="regBtn">등록</button>
	                            </div>
	                        </form>
	                    </div>
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	        </div><!-- /.modal -->
	    </div> <!-- /.tab-panel -->
	</div> <!-- /.tab-content -->
			
			
			
<!-- bundle -->
<script src="${path}/tools/project_assets/js/vendor.min.js"></script>
<script src="${path}/tools/project_assets/js/app.min.js"></script>
<script src="${path}/a00_com/jquery-3.6.0.js"></script>
<script>
	
	// 검색 범위(제목 / 담당자)
	let schtype = "제목";
	// 검색 키워드
	let schword = "";
	let schdate = {"startdate":"", "enddate":""};
	let schdata = {"ptTitle":"", "ptCharge":"", "ptStartdate":"", "ptDuedate":""};
	
	
	// 검색 : 제목 / 담당자
	$("#search-select").change(function() {
		schtype = $("#search-select option:selected").text();
	});
	// 검색 : 시작일 / 마감일
	$("[name=startdate]").change(function() {
		schdate.startdate = $(this).val();
	});
	$("[name=enddate]").change(function() {
		schdate.enddate = $(this).val();
	});
	
	// 제목 / 담당자 검색 키워드 입력 시
	$("#search-word").keyup(function(key) {
		schword = $(this).val();
		
		// 검색 범위와 검색 키워드를 json 형태로 설정
		if(schtype == "제목") {
			schdata.ptTitle = schword;
			schdata.ptCharge = "";
		};
		if(schtype == "담당자") { 
			schdata.ptCharge = schword;
		};
		
		console.log(schdata);
		
		search(schdata);
	});
	
	// 시작일 / 마감일 키워드 입력 시
	$("[name=startdate], [name=enddate]").change(function() {
		schword = $(this).val();
		console.log(schword);
		
		schdata.ptStartdate = schdate.startdate;
		schdata.ptDuedate = schdate.enddate;
		
		search(schdata);		
	});
	
	
	
	function detail(ptId){
		// 더블 클릭시, no를 매개변수를 넘기고 controller에 요청값을 전달 처리.
		location.href="${path}/taskDetail.do?ptId="+ptId;
	}
	function goPage(no){
		$("[name=curPage]").val(no);
		$("#listsch").submit();
	}
	function search(schdata) {
		console.log(schdata);
		
		$.ajax({
			url:"${path}/task.do?method=search",
			type:"get",
			data:schdata,
			dataType:"json",
			success:function(data) {
				console.log(data.schlist);
				let html = "";
				
		    	$.each(data.schlist, function(idx, sch) {
		    		let ptStatus = sch.ptStatus;
		    		let settings = {"cl":"", "style":"", "valuenow":0};
		    		
		    		if(ptStatus == "진행 전") {
		    			settings.cl = "progress-bar bg-secondary";
		    			settings.style = "width:100%";
		    			settings.valuenow = 100;
		    		}
		    		if(ptStatus == "진행 중") {
		    			settings.cl = "progress-bar bg-info";
		    			settings.style = "width:70%";
		    			settings.valuenow = 70;
		    		}
		    		if(ptStatus == "완료") {
		    			settings.cl = "progress-bar bg-success";
		    			settings.style = "width:100%";
		    			settings.valuenow = 100;
		    		}
		    		if(ptStatus == "지연") {
		    			settings.cl = "progress-bar-striped bg-warning progress-bar-animated";
		    			settings.style = "width:70%";
		    			settings.valuenow = 100;
		    		}
		    		if(ptStatus == "보류") {
		    			settings.cl = "progress-bar-striped bg-secondary";
		    			settings.style = "width:100%";
		    			settings.valuenow = 100;
		    		}
		    		
		 			html += "<tr>"
		 				+"<td>"+sch.cnt+"</td>"
		 				+"<td>"+sch.ptTitle+"</td>"
		 				+"<td>"+sch.ptCharge+"</td>"
		 				+"<td>"+sch.ptCharge+"</td>"
		 				+"<td>"+sch.ptStartdate+"</td>"
		 				+"<td>"+sch.ptDuedate+"</td>"
		 				+"<td><div class='progress'>"
		 				+"<div class='"+settings.cl+"' role='progressbar' style='"+settings.style+"' aria-valuenow='"+settings.valuenow+"' "
		 				+"aria-valuemin='0' aria-valuemax='100'>"+sch.ptStatus+"</div></div></td>"		 				
		 				+"<td><span class='badge bg-secondary text-light'>결재완료</span></td>"
		 				+"</tr>";	
			 	});	
		 		$("#task-tbody").html(html);
			},
			error:function(err) {
				console.log(err);
			}
		});
	}
	

	
	// 업무 등록
	$("#regBtn").click(function() {
		if(confirm("등록하시겠습니까?")) {
			if($("[name=ptTitle]").val() == "") {
				alert("제목을 작성해주세요.");
			} else if($("[name=ptCharge]").val() == "" || $("[name=ptCharge]").val() == null) {
				alert("업무담당자를 지정해주세요.");			
			} else if($("[name=ptStartdate]").val() == "" || $("[name=ptStartdate]").val() == null) {
				alert("업무 시작일을 지정해주세요.");
			} else if($("[name=ptDuedate]").val() == "" || $("[name=ptDuedate]").val() == null) {
				alert("업무 마감일을 지정해주세요.");
			} else if($("[name=ptContent]").val() == "" || $("[name=ptContent]").val() == null) {
				alert("업무 마감일을 지정해주세요.");
			} else {
				$("#regForm").submit();
			}
		}
	});
	
	
	
	
	// 유효성 검증
	// 1. 업무 등록
	$("[name=ptTitle]").change(function(){
	    if($(this).val().length>30){
	        alert("제목은 최대 30자까지 작성가능합니다.");
	        $(this).val($(this).val().substring(0,29));
	    }
	});
			
	let newDateOptions = {
	        year: "numeric",
	        month: "2-digit",
	        day: "2-digit"
	}
	
	$("[name=ptStartdate]").change(function(){
	    // 음.... 깜박하고 그런 경우에는...?
	    // if($("[name=ptStartdate]").val()<new Date().toLocaleDateString("en-US", newDateOptions)){
	    //     alert("시작일은 오늘 전일로 설정할 수 없습니다.");
	    //     $(this).val('');
	    // }
	
	    if($("[name=ptStartdate]").val()>$("[name=ptDuedate]").val() && $("[name=ptDuedate]").val()!=""){
	        alert("시작일은 마감일보다 이후로 설정할 수 없습니다.");
	        $(this).val('');
	    }
	});
	
	$("[name=ptDuedate]").change(function(){
	    // if($("[name=ptDuedate]").val()<new Date().toLocaleDateString("en-US", newDateOptions)){
	    //     alert("마감일은 오늘 전일로 설정할 수 없습니다.");
	    //     $(this).val('');
	    // }
	    if($("[name=ptStartdate]").val()>$("[name=ptDuedate]").val()){
	        alert("마감일은 시작일보다 이전으로 설정할 수 없습니다.");
	        $(this).val('');
	    }
	});
	
	
	
    
</script>


</body>
</html>