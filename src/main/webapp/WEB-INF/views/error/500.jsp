<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CPMS:: ERROR PAGE</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/resources/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/app.css">
    <link rel="stylesheet" href="${path}/resources/css/pages/error.css">
</head>

<body>
    <div id="error">
        

<div class="error-page container">
    <div class="col-md-8 col-12 offset-md-2">
        <img class="img-error" src="${path}/resources/images/samples/error-500.png" alt="Not Found">
        <div class="text-center">
            <h1 class="error-title">서버에러 발생</h1>
            <p class="fs-5 text-gray-600">서버에 문제가 발생하였습니다. 관리자에게 문의하세요.</p>
            <a href="${path}/dashboard/general.do" class="btn btn-lg btn-outline-primary mt-3">대쉬보드로 돌아가기</a>
        </div>
    </div>
</div>


    </div>
</body>

</html>
