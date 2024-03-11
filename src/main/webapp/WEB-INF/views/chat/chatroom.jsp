<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChatRoom</title>
<style type="text/css">
@font-face {
	font-family: 'munhwa';
	src: url('resources/font/munhwa.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Wilder';
	src: url('resources/font/Wilder.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Wooju';
	src: url('resources/font/Wooju.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

.mainView {
	position: relative;
	display: block;
	left: 150px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
}

.cnamespace {
	padding-top: 3px;
	background: -webkit-linear-gradient(right, white, rgb(51,153,51));
	color: #fffffff0;
	border: none;
	margin-left: 140px;
	padding-left: 10px;
	width: 50%;
	height: 25px;
	outline: none;
	font-size: x-large;
}
.main-div {
	border: 1px solid;
	border-radius: 2px;
	background-color: #d4d4d4;
	margin-left: 140px;
	width: 50%;
	height: 400px;
}

table {
	width: 100%;
	height: 100%;
}
/* td {
border: 1px solid green;
} */
.chat_comment {
	text-align: center;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: #71d886;
	border: 1px solid;
	white-space: normal;
}

.chat_comment_div {
	height: 333px;
	overflow: auto;
	white-space: normal;
}

.chat_contents {
	max-width: 450px;
	padding: 10px;
	border-radius: 10px;
	display: inline-block;
	position: relative;
	margin: 10px;
	float: right;
	clear: both;
	display: flex;
	align-items: center;
	overflow-wrap: anywhere;
	width: 50%;
	height: auto;
}

li {
	list-style: none;
}
li[name=mychat-content] {
	padding: 5px;
	background: #ffa;
	border-radius: 4px;
}

.other-side {
	background: #71d886;
	float: left;
	clear: both;
}

.other-side:after {
	position: absolute;
	right: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 20px solid transparent;
	border-right-color: white;
	border-left: 0;
	border-top: 0;
	margin-top: -3.5px;
	margin-right: -10px;
}

.chat_content_space {
	background: #aafbff;
	border-radius: 4px;
	padding: 5px;
	width: 70%;
}

.chat_none_space {
	width: 10%;
}

.chat_time_space {
	width: 20%;
}
.chat_mycomment {
	width: 85%;
	height: 20%;
	text-align: center;
}

.chat_mycomment_space {
	width: 95%;
	height: 80%;
	resize: none;
	font-family: 'Wooju';
}

.chat_mycomment_space:focus {
	outline: none;	
}
.chat_mycomment_submit {
	text-align: center;
	padding-bottom: 3px;
	padding-right: 5px;
}
.mycomment_submit_button {
	width: 90%;
	height: 75%;
	background-color: #71d886;
	border: none;
	border-radius: 5px;
	font-size: 20pt;
	font-family: 'Wooju';
}

.mycomment_submit_button:hover {
	background-color: #33cc66;
}
</style>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">
</head>
<body>
		<c:import url="/WEB-INF/views/common/comunity_sidebar.jsp" />
		<!-- 사용자 종류에 따라 상단 네비게이션 다르게 import -->
	<c:choose>
		<c:when test="${ !empty sessionScope.teacher }">
			<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
			<c:set var="session_prof_Code" value="${ sessionScope.teacher.prof_Code }" /> 
			<input type="hidden" id="session_prof_Code" value="${session_prof_Code}">
			<c:if test="${ sessionScope.teacher.prof_Code eq ChatRoom.prof_code }">
				<input type="hidden" id="sender" value="${ChatRoom.prof_code}">
				<input type="hidden" id="receiver" value="${ChatRoom.student_code}">
				<input type="hidden" id="sender_name" value="${teacher.name}">
				<input type="hidden" id="receiver_name" value="${ChatRoom.student_name}">
			</c:if>
		</c:when>
		<c:when test="${ !empty sessionScope.student }">
			<c:import url="/WEB-INF/views/common/student_nav.jsp" />
			<c:set var="session_studentCode" value="${ sessionScope.student.studentCode }" /> 
			<input type="hidden" id="session_studentCode" value="${session_studentCode}">
			<c:if test="${ sessionScope.student.studentCode eq ChatRoom.student_code }">
				<input type="hidden" id="sender" value="${ChatRoom.student_code}">
				<input type="hidden" id="receiver" value="${ChatRoom.prof_code}">
				<input type="hidden" id="sender_name" value="${student.name}">
				<input type="hidden" id="receiver_name" value="${ChatRoom.prof_name}">
			</c:if>
		</c:when>
	</c:choose>
	<div class="container">
		<div class="mainView">
			<div class="cnamediv">
			<c:if test="${ !empty sessionScope.teacher }">
				<div class="cnamespace">${ChatRoom.student_name}</div>
			</c:if>
			<c:if test="${ !empty sessionScope.student }">
				<div class="cnamespace">${ChatRoom.prof_name} 강사님</div>
			</c:if>
			</div>			
			<br>
			<div class="main-div">
				<table>
					<tr>
						<td colspan="2" class="chat_comment">
							<c:set var="chat_room_no" value="${ ChatRoom.chat_room }" /> 
							<input type="hidden" id="chat_room_no" value="${ chat_room_no }">
							<c:set var="chat_student_code" value="${ ChatRoom.student_code }" /> 
							<input type="hidden" id="chat_student_code" value="${ chat_student_code }">
							<div class="chat_comment_div">
								<!-- 메시지를 보내고 받는 사용자에 따라 필요한 정보 설정 -->
								<c:if test="${ !empty requestScope.chatList and !empty sessionScope.teacher }">
									<c:forEach items="${requestScope.chatList}" var="chList" varStatus="loop">
										<c:set var="readcount" value="${chList.chat_readcount == 1 ? '1' : '&nbsp;'}" />
										<c:if test="${ sessionScope.teacher.prof_Code eq chList.chat_talker }">
										<ul class='chat_contents'>
											<li class='chat_none_space'>${ readcount }</li>
											<li class='chat_time_space'>${fn:substring(chList.chat_time, 0, 5)}</li>
											<li class='chat_content_space' name="mychat-content">${ chList.chat_content }</li>
										</ul>
										</c:if>
										<c:if test="${ sessionScope.teacher.prof_Code ne chList.chat_talker }">
										<ul class='chat_contents other-side'>
											<li class='chat_content_space'>${ chList.chat_content }</li>
											<li class='chat_time_space'>${fn:substring(chList.chat_time, 0, 5)}</li>
											<li class='chat_none_space'>${ readcount }</li>
										</ul>
										</c:if>
											<br>
									</c:forEach>
								</c:if>
								<c:if test="${ !empty requestScope.chatList and !empty sessionScope.student }">
									<c:forEach items="${requestScope.chatList}" var="chList" varStatus="loop">
										<c:set var="readcount" value="${chList.chat_readcount == 1 ? '1' : '&nbsp;'}" />
										<c:if test="${ sessionScope.student.studentCode eq chList.chat_talker }">
										<ul class='chat_contents'>
											<li class='chat_none_space'>${ readcount }</li>
											<li class='chat_time_space'>${fn:substring(chList.chat_time, 0, 5)}</li>
											<li class='chat_content_space' name="mychat-content">${ chList.chat_content }</li>
										</ul>
										</c:if>
										<c:if test="${ sessionScope.student.studentCode ne chList.chat_talker }">
										<ul class='chat_contents other-side'>
											<li class='chat_content_space'>${ chList.chat_content }</li>
											<li class='chat_time_space'>${fn:substring(chList.chat_time, 0, 5)}</li>
											<li class='chat_none_space'>${ readcount }</li>
										</ul>
										</c:if>
											<br>
									</c:forEach>
								</c:if>
							</div></td>
					</tr>
					<tr>
						<td class="chat_mycomment"><textarea rows="3" cols="50"
								id="chat_mycomment_space" wrap="soft"
								class="chat_mycomment_space" onkeyup="enterKey(event);"></textarea></td>
						<td class="chat_mycomment_submit"><input type="button"
							class="mycomment_submit_button" value="전송" onclick="send();">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    $(function () {
        connection();
        var chatComment = $('.chat_comment_div');
        chatComment.scrollTop(chatComment[0].scrollHeight);
        webSocket.onmessage = function (event) {
            onMessage(event);
        };
    });

    var webSocket = null;
    var chatComment = $('.chat_comment_div');
    var myComment = $('.chat_mycomment_space');
	/*WebSocket 연결설정 함수*/
	function connection(){
		webSocket = new WebSocket(
				"ws://localhost:8888/${ pageContext.servletContext.contextPath }/chat.do");
 		/* console.log(webSocket); */
		webSocket.onopen = function(event) {
		    /* console.log("WebSocket 연결이 열렸습니다.");
		console.log(webSocket); */
			webSocket.send($('#sender').val() + "|" + "message receive" + "|" + "message receive" + "|" + $('#receiver').val());
		}; 
		}
		/*채팅 메시지 전송*/
		function send(){
			// 채팅창 변수
			var chatComment = $('.chat_comment_div');
			// 메세지 변수
			var myComment = $('.chat_mycomment_space');
			// 전송시간 저장용 변수
			var currentDate = new Date();
			var nhour = currentDate.getHours();
	        var nminute = currentDate.getMinutes();
	        var timeString = nhour + ':' + (nminute < 10 ? '0' : '') + nminute;
	        //읽음처리용 변수
			var readCountString = "1";
			//메세지를 입력하지 않고 버튼 누른 경우
			if(myComment.val() == "") {
				alert("전송할 메세지를 입력하세요.");
			}else{  //메세지가 입력된 경우
				chatComment.html(chatComment.html() + 
					"<ul class='chat_contents'><li class='chat_none_space'>" + readCountString + 
					"</li><li class='chat_time_space'>" + timeString + 
					"<li class='chat_content_space' name='mychat-content'>" + myComment.val() + 
					"</li></ul><br>");
				webSocket.send($('#sender').val() + "|"
					    + myComment.val() + "|"
					    + timeString + "|"
					    + $('#receiver').val());
		       var sender_chat = $('.chat_mycomment_space').val().trim();
		       
				        chatComment.scrollTop(chatComment[0].scrollHeight);
				var job = new Object();
				job.chat_room = $('#chat_room_no').val();
				job.chat_talker = $('#sender').val();
				job.chat_content = sender_chat;
				job.chat_talker_name = $('#sender_name').val();
				console.log(job);
				$.ajax({
					url : "sendchat.do",
					type : "post",
					data : JSON.stringify(job),
					contentType : "application/json; charset=utf-8",
					success : function(){
			            /* alert("[전송 성공]"); */
			            myComment.val("");
				        myComment.focus();
			         },	// success
			         error : function(request, status, errorData){
			               console.log("errorCode : " + request.status
			                     + "\nMessage : " + request.responseText
			                     + "\nError : " + errorData);
			           }	// error			
					})	// ajax
				}	// else
			}	// send
			/*엔터키 입력시 전송용 함수*/
			function enterKey(event) {
			    if (event.key === "Enter") {
			        send();
			    }
			}
			/*채팅 메시지 수신 처리*/
			function onMessage(event){
				var receiver = $('#receiver').val();
				var receiverName = $('#receiver_name').val();
				var sender = $('#sender').val();
				var chatComment = $('.chat_comment_div');
				var message = event.data.split("|");
				var senderID = message[0];
				var content = message[1];
				var sendTime = message[2]; 
				var receiveID = message[3];
				console.log("receiver"+receiver);
				console.log("receiverID"+senderID);
				if (sendTime == "message receive") {
					setTimeout(function() { checkRead(); }, 1000);
				} else if(receiver == senderID && sender == receiveID){
					chatComment.html(chatComment.html() +
							"<ul class='chat_contents other-side'><li class='chat_content_space'>" 
							+ content.trim() + 
							"</li><li class='chat_time_space'>" + sendTime + 
							"</li><li class='chat_none_space'>&nbsp;</li></ul><br>");
					chatComment.scrollTop(chatComment[0].scrollHeight);
					var reading = $('.chat_none_space');
					reading.html('&nbsp;');
					//소켓으로 메세지 받은경우 받았다고 답장
					webSocket.send($('#sender').val() + "|" + "message receive" + "|" + "message receive" + "|" + $('#receiver').val());
					
					var job = new Object();
					job.chat_room = $('#chat_room_no').val();
					job.chat_talker = senderID;
					job.chat_talker_name = receiverName;
					$.ajax({
						url : "readcountDown.do",
						type : "post",
						data : JSON.stringify(job),
						contentType : "application/json; charset=utf-8",
						success : function(){
							console.log("ReadCount Update!");
				         },	// success
				         error : function(request, status, errorData){
				               console.log("errorCode : " + request.status
				                     + "\nMessage : " + request.responseText
				                     + "\nError : " + errorData);
				           }	// error			
						})	// ajax
				}
			}
			/*채팅 발신 후 읽었는지 확인하는 함수*/
			function checkRead() {
		        var student_code = $('#chat_student_code').val();

		        $.ajax({
		            url: "readcheck.do",
		            type: "post",
		            data: { student_code: student_code },
		            dataType: "json",
		            success: function (dataObj) {
		                // 서버에서 받아온 데이터를 처리하고 HTML 생성
		                var objStr = JSON.stringify(dataObj);
		                var jsonObj = JSON.parse(objStr);
		                var chattingList = jsonObj.chatlist;
		                var session_prof_Code = $('#session_prof_Code').val();
		                var session_studentCode = $('#session_studentCode').val();
		                var output = "";
						
		                for (var i in chattingList) {
		                    var chat = chattingList[i];
		                    var chatContent = decodeURIComponent(chat.chat_content).replace(/\+/gi, ' ');
		                    var talkerName = decodeURIComponent(chat.chat_talker_name).replace(/\+/gi, ' ');
		                    var chatReadCount = chat.chat_readcount;
		                    var readCount = chatReadCount === 1 ? "1" : "&nbsp;";
		                    var rowHTML = "";

		                    if (chat.chat_talker === session_prof_Code || chat.chat_talker === session_studentCode) {
		                        rowHTML += "<ul class='chat_contents'><li class='chat_none_space'>" 
		                        + readCount + "</li><li class='chat_time_space'>" 
		                        + chat.chat_time.substring(0, 5) + "</li><li class='chat_content_space' name='mychat-content'>" 
		                        + chatContent + "</li></ul><br>";
		                    } else {
		                        rowHTML += "<ul class='chat_contents other-side'><li class='chat_content_space'>" 
		                        + chatContent + "</li><li class='chat_time_space'>" 
		                        + chat.chat_time.substring(0, 5) + "</li><li class='chat_none_space'>" 
		                        + readCount + "</li></ul><br>";
		                    }

		                    output += rowHTML;
		                }

		                $('.chat_comment_div').html(output);
		            },
		            error: function (request, status, errorData) {
		                console.log("errorCode : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
		            }
		        });
		    }
</script>
</body>
</html>