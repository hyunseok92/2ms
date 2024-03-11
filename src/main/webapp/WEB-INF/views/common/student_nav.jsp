<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script>
$(document).ready(function(){
	  $("#menu_lst_1").click(function() {
		  $("#menu_lst_2_main").css("top", "0px");
		  $("#menu_lst_3_main").css("top", "0px");
		  $("#menu_lst_4_main").css("top", "0px");
		  $("#menu_lst_5_main").css("top", "0px");
		  $("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_1_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_1 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_1 a").css("color", "white");
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_2").click(function() {
		  $("#menu_lst_1_main").css("top", "0px");
		  $("#menu_lst_3_main").css("top", "0px");
		  $("#menu_lst_4_main").css("top", "0px");
		  $("#menu_lst_5_main").css("top", "0px");
		  $("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_2_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_2 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_2 a").css("color", "white");
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_3").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_2_main").css("top", "0px");
		$("#menu_lst_4_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_3_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_3 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_3 a").css("color", "white");
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_4").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_2_main").css("top", "0px");
		$("#menu_lst_3_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_4_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_4 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_4 a").css("color", "white");
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_8").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_2_main").css("top", "0px");
		$("#menu_lst_3_main").css("top", "0px");
		$("#menu_lst_4_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
	    var submenu = $("#menu_lst_8_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_8 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_8 a").css("color", "white");
	      
	    }
	  });
	});

$(document).ready(function(){
	  $("#menu_lst_5").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_2_main").css("top", "0px");
		$("#menu_lst_3_main").css("top", "0px");
		$("#menu_lst_4_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_5_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_5 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_5 a").css("color", "white");
	      
	    }
	  });
	});


</script>
</head>
<body>
<c:set var="student" value="1" />
<!-- main navbar start -->
		<div class="main_admin">
			<div class="main_menu_block">
				<div class="main_title"><a class="main_title"href="${ pageContext.servletContext.contextPath }/studentMain.do">Responce.2ms</a></div>
				<div class="main_menu">
					<ul>
						<li class="main_menu_lst" id="menu_lst_1"><a href="#">학적부</a></li>
						<li class="main_menu_lst" id="menu_lst_2"><a href="#">과정</a></li>
						<li class="main_menu_lst" id="menu_lst_3"><a href="#">평가및과제</a></li>
						<li class="main_menu_lst" id="menu_lst_4"><a href="#">설문</a></li>
						<li class="main_menu_lst" id="menu_lst_5"><a href="#">커뮤니티</a></li>
						<li class="main_menu_lst" id="menu_lst_8"><a href="#">게시판</a></li>
					</ul>
					
					
				</div>
				<div class="main_log">
					<ul style="align-items: center; display: flex;">
						<li class="main_login">${ sessionScope.student.name } 님</li>
						<li class="main_profile"><a href="sMyinfo.do"><img class="main_profile"
							src="/lms/resources/images/profile.png"></a></li>
						<li class="main_logout"><a class="main_logout" href="logout.do">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div class="main_submenu">
				<div class="main_submenu_hidden" id="menu_lst_1_main"
					style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="att_student.do">출결조회</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_2_main"
					style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="sCourseDetail.do">강의계획서</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_3_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="sTestView.do?studentCode=${sessionScope.student.studentCode}">시험</a></li>
						<li class="nav_sub"><a href="sHWView.do?studentCode=${ sessionScope.student.studentCode }">과제</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_4_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="studentsurvey.do">설문조회</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_5_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="chatroom.do?student_code=${ sessionScope.student.studentCode }">채팅</a></li>
						<li class="nav_sub"><a href="quizreceive.do?student_code=${ sessionScope.student.studentCode }">퀴즈</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_8_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="moveNoticeList.do?page=1">공지사항</a></li>
						<li class="nav_sub"><a href="itNews.do">IT최신동향</a></li>
						<li class="nav_sub"><a href="formlist.do">서식게시판</a></li>
					</ul>
				</div>
<%-- 
				<div class="main_submenu_hidden" id="t_training" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="#">강의계획서</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="t_test" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="/2ms/views/admin_teacher/teacher/hw_insert.jsp">과제등록</a></li>
						<li class="nav_sub"><a href="/2ms/views/admin_teacher/teacher/hw_result.jsp">과제확인</a></li>
						<li class="nav_sub"><a href="/2ms/views/admin_teacher/teacher/test_insert.jsp">시험출제</a></li>
						<li class="nav_sub"><a href="/2ms/views/admin_teacher/teacher/test_result.jsp">시험결과</a></li>
						<li class="nav_sub"><a href="/2ms/views/admin_teacher/teacher/test_graph.jsp">평가그래프</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="t_chat" style="top: 0px;">
					<ul style="position: fixed;">
						<c:set var="testStdCode" value="9" />
						<li class="nav_sub"><a href="chatroom.do">채팅</a></li>
						<li class="nav_sub"><a href="quizreceive.do?student_code=${ testStdCode }&page=1">퀴즈</a></li>
					</ul>
				</div>
 --%>
			</div>
		</div>
		<!-- main navbar end -->
</body>
</html>