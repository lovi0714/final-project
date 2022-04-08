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
<script type="text/javascript">
	var ws;
	
	$(document).ready(function(){
			
		const Toast = Swal.mixin({
			toast: true, position: 'top',
			showConfirmButton: false,
			timer: 1500,
			timerProgressBar: true,
			didOpen: (toast) => {
				toast.addEventListener('mouseenter', Swal.stopTimer)
				toast.addEventListener('mouseleave', Swal.resumeTimer) 
				} 
			})
		
		$("#chatBox").hide();
		
		$("#exitBtn").hide();
		
		
		// 접속 종료를 처리했을 시
		$("#exitBtn").click(function(){	
			Toast.fire({
                icon: 'success',
                title: $("#userName").val()+'님 접속을 종료합니다.'
            });
			$("#yourName").show();
			$("#exitBtn").hide();
			$('#chating').text("");
			$("#roomName").text("");
			ws.close();
		});
	});

	function wsOpen(){
		ws = new WebSocket("ws:/49.238.195.70:7080/${path}/chat-ws.do");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
			$("#chatBox").fadeIn();
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			var deptInfo = $("#deptInfo").val();
			var today = new Date();

			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			var seconds = ('0' + today.getSeconds()).slice(-2); 


			var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
			
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					
					if(d.deptInfo == $("#deptInfo").val()){
					
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append(
							"<div class='chat'>"+
                        	"<div class='chat-body'>"+
                        	"<div class='chat-message'>"+dateString+"<br>"+d.msg+"</div>"+
                    		"</div>"+
               				"</div>");	
					}else{
						$("#chating").append(
						"<div class='chat chat-left'>"+
                        "<div class='chat-body'>"+ 
                        "<div class='chat-message'>"+dateString+"<br>"+"<strong>"+d.userName+"</strong>"+"<br>"+d.msg +"</div>" +                      
                    	"</div>"+
                		"</div>"
                		);
					}
				}
						
				}else{
					console.warn("unknown type!")
				}
			}
			
		}
		
		ws.onclose=function(){
			$("#chatBox").fadeOut();
		}
		
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	function chatName(dept){
		var userName = $("#userName").val();
		var deptInfo = dept;
		document.getElementById("deptInfo").value = deptInfo;

		const Toast = Swal.mixin({
			toast: true, position: 'top',
			showConfirmButton: false,
			timer: 1500,
			timerProgressBar: true,
			didOpen: (toast) => {
				toast.addEventListener('mouseenter', Swal.stopTimer)
				toast.addEventListener('mouseleave', Swal.resumeTimer) 
				} 
			})

		
		if(userName == null || userName.trim() == "") {
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			Toast.fire({
                icon: 'success',
                title: $("#userName").val()+'님 반갑습니다.'
            });
			$("#roomName").append("<h3 style='margin-top:15px;'>"+deptInfo+"</h3>")
			$("#yourName").hide();
			$("#yourMsg").show();
			$("#exitBtn").show();
		}
		
	}
	

	function send() {
		if($('#chatting').val()!=""){
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val(),
			deptInfo : $("#deptInfo").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");	
		}
	}
	
	$(function(){
		$('#dept').on('click',function(){
			var deptInfo = $(this).value();
		})
	})
	

</script>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12">
                <h3 style="margin-bottom:20px">팀챗</h3>                
            </div>
        </div>
    </div>
  
   
    <section class="section">
        <div class="row">
            <div class="col-4">
                <div class="card col-9" style="height:480px; margin-left:20px;">
                    <div class="card-header">
                    	<div class="d-grid gap-2">
                    	<h4>채팅방 목록</h4>
  							<div id="yourName">
  							<input type="hidden" name="userName" id="userName" value="${sessionScope.emp.name }">
  							<input type="hidden" name="deptInfo" id="deptInfo" value="">
							
								<div class="card-content">
                        <div class="card-body">	
								<div class="list-group" style="margin-right:-30px; margin-left:-30px;">
											<button id="dept" name="dept" class="list-group-item list-group-item-action active" disabled>부서별</button>
											
											<button id="dept" name="dept" class="list-group-item list-group-item-action " onclick="chatName('인사')" value="인사">인사</button>
                                
											<button id="dept" name="dept" class="list-group-item list-group-item-action " onclick="chatName('회계')" value="회계">회계</button>
                                
											<button id="dept" name="dept" class="list-group-item list-group-item-action " onclick="chatName('경영관리')" value="경영관리">경영관리</button>
                                
											<button id="dept" name="dept"class="list-group-item list-group-item-action " onclick="chatName('생산관리')" value="생산관리">생산관리</button>
                                	
											<button id="dept" name="dept" class="list-group-item list-group-item-action " onclick="chatName('기술지원')" value="기술지원">기술지원</button>
                                
											<button id="dept" name="dept" class="list-group-item list-group-item-action " onclick="chatName('연구개발')" value="연구개발">연구개발</button>
                          							
								</div>
								</div>
								</div>
							</div>
							<input type="button" class="btn btn-danger btn-block" value="나가기" id="exitBtn" style="float:right"/>
						</div>
                    </div>    
                </div>
            </div>
     		<input type="hidden" id="sessionId" value="">

            <div class="col-8" id="chatBox">
                <div class="card col-12" style="float:right; height:625px; margin-right:70px;">
                    <div class="card-header" style="border-bottom:1px solid #dedfe0">
                        <div class="media d-flex align-items-center">                    
                            <div class="name flex-grow-1" id="roomName">
                               
                            </div>
        
                        </div>
                    </div>
        
        
                    <div class="card-body pt-4 bg-grey" id="chatingArea" style=" display:flex; overflow:auto; height:625px; flex-direction: column-reverse;" >
                           <div id="chating" class="chating">
						   </div>					
                      
                        </div>
				
					
					
                    <div class="card-footer">
                        <div class="message-form d-flex flex-direction-column align-items-center">
                            <div class="d-flex flex-grow-1 ml-6">
                               <div id="yourMsg">
							   		<table class="inputTable">
										<tr>
											<th width="800px"><input id="chatting" class="form-control" placeholder="보내실 메시지를 입력하세요."></th>
											<th width="20%"><button onclick="send()" id="sendBtn" class="btn btn-primary">전송</button></th>											
										</tr>
									</table>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
         	</div>
     
  	</div>
    </section>

	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>