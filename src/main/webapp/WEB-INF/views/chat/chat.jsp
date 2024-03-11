<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChatRoomList</title>
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
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
}

.selectNav {
   width: 90%;
   border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
   font-family: 'munhwa';
   margin-bottom : 7px;
}
.selectNavUl {
   display: flex;
}
.selectNavLi {
	list-style : none;
   margin-right: 10px;
}

.main-div {
	border: 3px solid darkgray;
	border-radius : 5px;
	background-color: #ccffc5;
	margin-left: 40px;
	width: 45%;
	height: 400px;
	overflow: auto;
	text-align: center;
}
.chat_info_ul {
	display: flex;
    align-items: center;
	height: 40px;
	border-radius : 5px;
	border-bottom: 1px solid gray; 
}

.chat_info_li {
	list-style : none;
	height: 40px;
	white-space: nowrap; /* 줄 바꿈 방지 */
  	overflow: hidden; /* 내용을 숨김 */
 	text-overflow: ellipsis; /* 텍스트를 생략 부호(...)로 표시 */
}
.chat_info_li[name=chat_info_name] {
	font-family: 'Wooju';
	width: 25%;
	color: black;
	font-size: 18pt;
	padding-top: 15px;
}
.chat_info_li[name=chat_info_content] {
	font-family: 'Wooju';	
	width: 60%;
	color: black;
	padding-top: 25px;
}
.chat_info_li[name=chat_info_readcount] {
	font-family: 'munhwa';
	font-weight: lighter;
	width: 15%;
	color: #ff6600;
	padding-top: 20px;
}
.even-row {
	background: -webkit-linear-gradient(right, #ccffff, #ffffcc);
    /*background-color: #ccffff;	/* 홀수줄 */
}
.odd-row {
	background: -webkit-linear-gradient(right, #ffffcc, #ccffff);
    /*background-color: #ffffcc;	/* 짝수줄 */
}
</style>
</head>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
<body>
		<input type="hidden" id="prof_Code"
			value="${ sessionScope.teacher.prof_Code }">
	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/common/comunity_sidebar.jsp" />
		<div class="mainView">
			<div class="selectNav">
	            <ul class="selectNavUl">
	               <li class="selectNavLi">커뮤니티</li>
	               <li class="selectNavLi">></li>
	               <li class="selectNavLi">채팅방 목록</li>
	            </ul>
			</div>
			<div class="main-div" id="main-div">
				<c:forEach items="${requestScope.list}" var="clist" varStatus="loop">
					<c:set var="rowClass"
						value="${loop.index % 2 == 0 ? 'even-row' : 'odd-row'}" />
					<a href="chatroom.do?prof_code=${ sessionScope.teacher.prof_Code }&student_code=${ clist.student_code }&chat_room=${ clist.chat_room }" style="text-decoration: none;">
						<ul class="chat_info_ul ${rowClass}">
							<li class="chat_info_li" name="chat_info_name">${clist.student_name}</li>
							<li class="chat_info_li" name="chat_info_content">${clist.chat_content}</li>
							<c:if test="${sessionScope.teacher.prof_Code ne clist.chat_talker and clist.chat_readcount eq 1}">
								<li class="chat_info_li" name="chat_info_readcount">NEW!</li>
							</c:if>
							<c:if test="${sessionScope.teacher.prof_Code eq clist.chat_talker or clist.chat_readcount eq 0}">
								<li class="chat_info_li" name="chat_info_readcount"></li>
							</c:if>
						</ul>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
    var prof_Code = $('#prof_Code').val();
    
    function updateList() {
    var prof_Code = $('#prof_Code').val();
        $.ajax({
            url: "callChatroomList.do",
            type: "post",
            data: { prof_code: prof_Code },         
            dataType : "json",
            success: function(dataObj) {
                var objStr = JSON.stringify(dataObj);
                var jsonObj = JSON.parse(objStr);
                var chatroomList = jsonObj.alist; 

                var output = "";  // 빈 문자열로 초기화
                
                for (var i in chatroomList) {
                    var rowClass = i % 2 === 0 ? 'even-row' : 'odd-row';
                    var chat_room = chatroomList[i].chat_room;
                    var student_code = chatroomList[i].student_code;
                    var studentName = decodeURIComponent(chatroomList[i].student_name).replace(/\+/gi, ' ');
                    var chatContent = decodeURIComponent(chatroomList[i].chat_content).replace(/\+/gi, ' ');
                    var chatReadCount = chatroomList[i].chat_readcount;
                    var readCount = "";
                    if (prof_Code != chatroomList[i].chat_talker && chatReadCount === 1) {
                    	readCount = "NEW!";
                    } else if(prof_Code == chatroomList[i].chat_talker || chatReadCount === 0) {
                    	readCount = " ";                    	
                    }
                    var rowHTML = "<a href='chatroom.do?prof_code="+ prof_Code +"&student_code=" 
                    	+ student_code + "&chat_room=" + chat_room 
                    	+ "' style='text-decoration: none;'><ul class='chat_info_ul " + rowClass 
                    	+ "'><li class='chat_info_li' name='chat_info_name'>" + studentName 
                    	+ "</li><li class='chat_info_li' name='chat_info_content'>" + chatContent 
                    	+ "</li><li class='chat_info_li' name='chat_info_readcount'>" + readCount + "</li></ul></a>";

                    output += rowHTML;
                }

                $('#main-div').html(output);
            },
            error: function(request, status, errorData) {
                console.log("errorCode : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
            }
        });
    }
    
    setInterval(updateList, 3000);
});
</script>
</html>