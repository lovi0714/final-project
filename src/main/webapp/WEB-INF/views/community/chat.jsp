<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today" />
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
		
		$("#chatBox").hide();
		
		$("#exitBtn").hide();
		// 접속 종료를 처리했을 시
		$("#exitBtn").click(function(){	
			alert($("#userName").val()+'님 접속 종료합니다.');
			$("#yourName").show();
			$("#exitBtn").hide();
			$('#chating').text("");
			$("#roomName").text("");
			ws.close();
		});
	});

	function wsOpen(){
		ws = new WebSocket("ws:/localhost:7080/${path}/chat-ws.do");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
			$("#chatBox").fadeIn();
			$("#roomName").append("<h4>"+"채팅방"+"</h4>")
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append(
							"<div class='chat'>"+
                        	"<div class='chat-body'>"+
                        	"<div class='chat-message'>"+"<c:out value='${today}'/>"+"<br>"+d.msg+"</div>"+
                    		"</div>"+
               				"</div>");	
					}else{
						$("#chating").append(
						"<div class='chat chat-left'>"+
                        "<div class='chat-body'>"+ 
                        "<div class='chat-message'>"+"<c:out value='${today}'/>"+"<br>"+"<strong>"+d.userName+"</strong>"+"<br>"+d.msg +"</div>" +                      
                    	"</div>"+
                		"</div>"
                		);
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

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			alert($("#userName").val()+'님 반갑습니다.');
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
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");	
		}
	}
	
	

</script>

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
                <div class="card col-9" style="height:625px;">
                    <div class="card-header">
                    	<div class="d-grid gap-2">
                    	<h4>채팅방 목록</h4>
  							<div id="yourName">
  							<input type="hidden" name="userName" id="userName" value="${sessionScope.emp.name }">
								<table class="inputTable" style="width:100%">
									<tr>
										<td><button onclick="chatName()" id="startBtn" class="btn btn-primary btn-block">대화 참여하기</button></td>
									</tr>
		
								</table>							
							</div>
							<input type="button" class="btn btn-danger btn-block" value="나가기" id="exitBtn" style="float:right"/>
						</div>
                    </div>    
                </div>
            </div>
     		<input type="hidden" id="sessionId" value="">

            <div class="col-8" id="chatBox">
                <div class="card col-12" style="float:right; height:625px; margin-right:50px;">
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