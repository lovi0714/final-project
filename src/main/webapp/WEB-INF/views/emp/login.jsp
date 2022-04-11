<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<spring:message code="id" var="placeholder_id" />
<spring:message code="pwd" var="placeholder_password" />
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
	    console.log(cookieValue);
	    return unescape(cookieValue);
    }
	
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
	
	var app = new Vue({
	  el: '#auth',
	  data: {
	    empId : '',
	    password: '',
	    lang : '${param.lang}'
	  },
	  mounted: function() {
		  
		 $("#selectLan").val("${param.lang}");

		 this.empId = getCookie("key"); 
	    
	     if(this.empId != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	         $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	     }
	  },
	  methods: {
		  loginBtn(e) {
			  e.preventDefault();
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
		  },
		  changeLang(e) {
			if(this.lang != ""){
				location.href="${path}/emp/login.do?lang="+this.lang;
			}	
		  },
		  changeRemember() {
			  if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
				  setCookie("key", $("#empId").val(), 7); // 7일 동안 쿠키 보관
		      } else { // ID 저장하기 체크 해제 시,
		    	  deleteCookie("key");
		      }
		  },
		  keyupEmpid() {
			  if($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				  setCookie("key", $("#empId").val(), 7); // 7일 동안 쿠키 보관
			  }
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
	            <h1 class="auth-title"><spring:message code="login"/></h1>
	            <form name="login_form" action="${path}/emp/loginProcess.do" method="post">
	                <div class="form-group position-relative has-icon-left mb-4">
	                    <input type="text" class="form-control form-control-xl" name="empId" id="empId" @keyup="keyupEmpid" v-model="empId" placeholder="${placeholder_id}">
	                    <div class="form-control-icon">
	                        <i class="bi bi-person"></i>
	                    </div>
	                </div>
	                <div class="form-group position-relative has-icon-left mb-4">
	                    <input type="password" class="form-control form-control-xl" name="password" id="password" v-model="password" placeholder="${placeholder_password}">
	                    <div class="form-control-icon">
	                        <i class="bi bi-shield-lock"></i>
	                    </div>
	                </div>
	                <div class="form-check form-check-lg d-flex align-items-end">
                        <input class="form-check-input me-2" type="checkbox" name="idSaveCheck" value="" id="idSaveCheck" @change="changeRemember">
                        <label class="form-check-label text-gray-600" for="flexCheckDefault">
                        <spring:message code="remember.id"/>
                        </label>
	                </div>
	                
	                <button class="btn btn-primary btn-block btn-lg shadow-lg mt-2" @click="loginBtn" id="loginBtn" onclick="chk()"><spring:message code="login"/></button>
	              </form>
	              <div class="mt-3">
	              	<div class="row">
					  <div class="col"><hr/></div>
					  <div class="col-auto"><spring:message code="chlange"/></div>
					  <div class="col"><hr/></div>
					</div>
	                <select class="form-control" id="selectLan" @change="changeLang" v-model="lang">
						<option value=""><spring:message code="chlange"/></option>
					  	<option value="ko"><spring:message code="ko"/></option>
					  	<option value="en"><spring:message code="en"/></option>
					</select>
                  </div>
        	</div>
    	</div>
	</div>
</div>

<script src="${path}/resources/js/extensions/sweetalert2.js"></script>
<script src="${path}/resources/vendors/sweetalert2/sweetalert2.all.min.js"></script>
</body>
</html>
