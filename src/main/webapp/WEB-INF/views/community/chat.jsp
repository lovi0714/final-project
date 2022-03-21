<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<link rel="stylesheet" href="${path}/resources/css/widgets/chat.css">

    <link rel="stylesheet" href="${path}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${path}/resources/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/app.css">
    <link rel="shortcut icon" href="a${path}/resources/images/favicon.svg" type="image/x-icon"> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="isCommunitySide" value="active"/>
		<jsp:param name="isCommunityList" value="active"/>
</jsp:include>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12">
                <h3>팀챗</h3>                
            </div>
        </div>
    </div>
    <section class="section">
        <div class="row">
            <div class="col-4">
                <div class="card col-9" style="height:625px">
                    <div class="card-header">
                    	<div class="d-grid gap-2">
  							<button class="btn btn-primary" type="button">대화상대 추가</button>
						</div>
                    </div>    
                </div>
            </div>
     
        

            <div class="col-8">
                <div class="card col-12" style="float:right; height:625px; margin-right:50px">
                    <div class="card-header">
                        <div class="media d-flex align-items-center">                    
                            <div class="name flex-grow-1">
                                <h6 class="mb-0">홍길동</h6>
                                <span class="text-xs">Online</span>
                            </div>
                            <button class="btn btn-sm">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body pt-4 bg-grey">
                        <div class="chat-content">
                            <div class="chat">
                                <div class="chat-body">
                                    <div class="chat-message">Hi Alfy, how can i help you?</div>
                                </div>
                            </div>
                            <div class="chat chat-left">
                                <div class="chat-body">
                                    <div class="chat-message">I'm looking for the best admin dashboard template</div>
                                    <div class="chat-message">With bootstrap certainly</div>
                                </div>
                            </div>
                            <div class="chat">
                                <div class="chat-body">
                                    <div class="chat-message">I recommend you to use Mazer Dashboard</div>
                                </div>
                            </div>
                            <div class="chat chat-left">
                                <div class="chat-body">
                                    <div class="chat-message">That"s great! I like it so much :)</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="message-form d-flex flex-direction-column align-items-center">
                            <a href="http://" class="black"><i data-feather="smile"></i></a>
                            <div class="d-flex flex-grow-1 ml-6">
                                <input type="text" class="form-control" placeholder="메세지를 입력하세요.">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     </div>
    </section>
</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>