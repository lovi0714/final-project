<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="${path}/resources/js/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/vendors/iconly/bold.css">
<link rel="stylesheet" href="${path}/resources/css/pages/auth.css">
<link rel="stylesheet" href="${path}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${path}/resources/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${path}/resources/css/app.css">
<link rel="shortcut icon" href="${path}/resources/images/favicon.svg" type="image/x-icon">

<title>Login</title>    

</head>

<body>
    <div id="auth">   
<div class="row h-100">
    <div class="col-lg-5 col-12" style="width: 70%; padding-left: 30%;">
        <div id="auth-left">
            <div class="auth-logo">
                <h1>CPMS</h1>
            </div>
            <h1 class="auth-title">로그인</h1>
            

            <form name=loginForm action="${path}/emp/loginProcess.do" method="post">
                <div class="form-group position-relative has-icon-left mb-4">
                    <input type="text" class="form-control form-control-xl" name="empId" id="empId" placeholder="UserId">
                    <div class="form-control-icon">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <div class="form-group position-relative has-icon-left mb-4">
                    <input type="password" class="form-control form-control-xl" name="password" id="password" placeholder="Password">
                    <div class="form-control-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                </div>
                <div class="form-check form-check-lg d-flex align-items-end">
                    <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label text-gray-600" for="flexCheckDefault">
                        로그인 유지하기
                    </label>
                </div>
                <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5" onclick="btnLogin()">로그인</button>
            	
            	
            </form>

        </div>
    </div>
    
</div>

    </div>

</body>

</html>
