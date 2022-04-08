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

<link rel="stylesheet" href="${path}/resources/vendors/sweetalert2/sweetalert2.min.css">

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>CPMS:: 로그인</title>    

<script type="text/javascript">

$(function() {
	var app = new Vue({
	  el: '#auth',
	  data: {
	    empId : '',
	    password: ''
	  },
	  methods: {
		  loginBtn(e) {
			  e.preventDefault();
			  console.log(this.empId, this.password);
			  axios.post('${path}/emp/loginProcess.do', null, { 
				  params : 
					  { 
						empId: this.empId, 
						password: this.password
					  } 
			  		})
		        .then(function(response) {
		          if (response.data === 'success' && response.status == 200) {
		        	  location.href = '${path}/dashboard/general.do';
		          }
		        })
		        .catch(function(error) {
		          console.log(error);
		          Swal.fire({
        			  icon: 'error',
        			  title: '아이디와 패스워드를 확인하세요.',
        			});
		          this.empId = '';
		          this.password = '';
		        });
		  }
	  }
	})
});
</script>




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
	            <form name="login_form" action="${path}/emp/loginProcess.do" method="post">
	                <div class="form-group position-relative has-icon-left mb-4">
	                    <input type="text" class="form-control form-control-xl" name="empId" id="empId" v-model="empId" placeholder="아이디">
	                    <div class="form-control-icon">
	                        <i class="bi bi-person"></i>
	                    </div>
	                </div>
	                <div class="form-group position-relative has-icon-left mb-4">
	                    <input type="password" class="form-control form-control-xl" name="password" id="password" v-model="password" placeholder="비밀번호">
	                    <div class="form-control-icon">
	                        <i class="bi bi-shield-lock"></i>
	                    </div>
	                </div>
	                <div class="form-check form-check-lg d-flex align-items-end" style="padding: 0;">
	                    
	                <input type="checkbox" id="idSaveCheck" name="idSaveCheck" style="margin: 5px;"> 아이디 기억하기
	                </div>
	                <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5" @click="loginBtn" id="loginBtn" onclick="chk()">로그인</button>
	              </form>
        	</div>
    	</div>
	</div>
</div>

<script>

$(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#empId").val(key); 
     
    if($("#empId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#empId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#empId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#empId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>

<script src="${path}/resources/js/extensions/sweetalert2.js"></script>
<script src="${path}/resources/vendors/sweetalert2/sweetalert2.all.min.js"></script>
</body>
</html>
