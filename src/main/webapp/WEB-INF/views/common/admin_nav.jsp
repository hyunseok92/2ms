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
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
<script>
$(document).ready(function(){
	  $("#menu_lst_1").click(function() {
		  $("#menu_lst_2_main").css("top", "0px");
		  $("#menu_lst_3_main").css("top", "0px");
		  $("#menu_lst_4_main").css("top", "0px");
		  $("#menu_lst_6_main").css("top", "0px");
		  $("#menu_lst_7_main").css("top", "0px");
		  $("#menu_lst_8_main").css("top", "0px");
		  $("#menu_lst_5_main").css("top", "0px");
	    var submenu = $("#menu_lst_1_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_1 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_6 a").css("color", "white");
	      $("#menu_lst_7 a").css("color", "white");
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
	    var submenu = $("#menu_lst_2_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_2 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
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
	    var submenu = $("#menu_lst_3_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_3 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
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
	    var submenu = $("#menu_lst_4_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_4 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
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
		$("#menu_lst_6_main").css("top", "0px");
		$("#menu_lst_7_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_5_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_8 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_4 a").css("color", "white");
	      $("#menu_lst_3 a").css("color", "white");
	      $("#menu_lst_2 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_6 a").css("color", "white");
	      $("#menu_lst_7 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_8 a").css("color", "white");
	      
	    }
	  });
	});

$(document).ready(function(){
	  $("#menu_lst_5").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
		$("#menu_lst_7_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_6_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_5 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_6 a").css("color", "white");
	      $("#menu_lst_7 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_5 a").css("color", "white");
	      
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_6").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
		$("#menu_lst_6_main").css("top", "0px");
		$("#menu_lst_8_main").css("top", "0px");
	    var submenu = $("#menu_lst_7_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_6 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_7 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_6 a").css("color", "white");
	      
	    }
	  });
	});
$(document).ready(function(){
	  $("#menu_lst_7").click(function() {
		$("#menu_lst_1_main").css("top", "0px");
		$("#menu_lst_5_main").css("top", "0px");
		$("#menu_lst_6_main").css("top", "0px");
		$("#menu_lst_7_main").css("top", "0px");
	    var submenu = $("#menu_lst_8_main");
	    if (submenu.css("top") === "0px") {
	      submenu.css("top", "70px");
	      $("#menu_lst_7 a").css("color", "rgb(0,80,0)");
	      $("#menu_lst_5 a").css("color", "white");
	      $("#menu_lst_6 a").css("color", "white");
	      $("#menu_lst_8 a").css("color", "white");
	      $("#menu_lst_1 a").css("color", "white");
	    } else {
	      submenu.css("top", "0px");
	      $("#menu_lst_7 a").css("color", "white");
	      
	    }
	  });
	});
</script>
</head>
<body>

<c:set var="teacher.grade"  />
<!-- main navbar start -->
		<div class="main_admin">
			<div class="main_menu_block">
				<div class="main_title"><a class="main_title"href="${ pageContext.servletContext.contextPath }/atmain.do">Response.2ms</a></div>
				<div class="main_menu">
					<ul>
					<li class="main_menu_lst" id="menu_lst_1"><a href="#">학적부</a></li>
						<c:if test="${ !empty sessionScope.teacher and teacher.grade eq 'A' }">
						<li class="main_menu_lst" id="menu_lst_2"><a href="#">과정</a></li>
						<li class="main_menu_lst" id="menu_lst_3"><a href="#">설문관리</a></li>
						<li class="main_menu_lst" id="menu_lst_4"><a href="#">회원관리</a></li>
						</c:if>
						<c:if test="${ !empty sessionScope.teacher and teacher.grade eq 'T' }">
						<li class="main_menu_lst" id="menu_lst_5"><a href="#">교육과정</a></li>
						<li class="main_menu_lst" id="menu_lst_6"><a href="#">평가및과제</a></li>
						<li class="main_menu_lst" id="menu_lst_7"><a href="#">커뮤니티</a></li>
						</c:if>
						<li class="main_menu_lst" id="menu_lst_8"><a href="#">게시판</a></li>
						
					</ul>
					
					
				</div>
				<div class="main_log">
					<ul style="align-items: center; display: flex;">
						<li class="main_login">${ sessionScope.teacher.name } 님</li>
						<li class="main_profile"><a href="tMyinfo.do"><img class="main_profile"
							src="resources/images/profile.png"></a></li>
						<li class="main_logout"><a class="main_logout" href="logout.do">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div class="main_submenu">
				<div class="main_submenu_hidden" id="menu_lst_1_main"
					style="top: 0px;">
					<ul style="position: fixed;">
						<c:if test="${teacher.grade eq 'A' }">
						<li class="nav_sub"><a href="att_select.do">출석부</a></li>						
						</c:if>
						<c:if test="${teacher.grade eq 'T' }">
						<li class="nav_sub"><a href="att_teacher.do">출석부</a></li>
						</c:if>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_2_main"
					style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="courseList.do">강의계획서</a></li>
						<li class="nav_sub"><a href="selectSList.do">과정설계</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_3_main" style="top: 0px;">
					<ul style="position: fixed;">
						<c:if test="${teacher.grade eq 'A' }">
						<li class="nav_sub"><a href="selectsurvey.do">설문조회</a></li>
						<li class="nav_sub"><a href="enrollsurvey.do">설문등록</a></li>
						<li class="nav_sub"><a href="resultsurvey.do">결과보기</a></li>
						</c:if>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_4_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="att_admin.do">회원조회</a></li>
						<li class="nav_sub" ><a href="${ pageContext.servletContext.contextPath }/tenrollPage.do" >회원등록</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_5_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="moveNoticeList.do?page=1">공지사항</a></li>
						<li class="nav_sub"><a href="itNews.do">IT최신동향</a></li>
						<li class="nav_sub"><a href="formlist.do">서식게시판</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_6_main" style="top: 0px;">
					<ul style="position: fixed;">
						<c:url var="tCList" value="tCourseDetail.do">
							<c:param name="profCode" value="${ sessionScope.teacher.prof_Code }"/>
							<c:param name="classCode" value="${ sessionScope.teacher.class_code }"/>
						</c:url>
						<li class="nav_sub"><a href="${ tCList }">과목구성</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_7_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="selectClass.do?teacherCode=${ sessionScope.teacher.prof_Code }">시험출제</a></li>
						<li class="nav_sub"><a href="selecttestClassResult.do?teacherCode=${ sessionScope.teacher.prof_Code }">시험결과</a></li>
						<li class="nav_sub"><a href="selectHWClassView.do?teacherCode=${sessionScope.teacher.prof_Code }">과제</a></li>
					</ul>
				</div>
				<div class="main_submenu_hidden" id="menu_lst_8_main" style="top: 0px;">
					<ul style="position: fixed;">
						<li class="nav_sub"><a href="chatroomList.do?prof_code=${ sessionScope.teacher.prof_Code }">채팅</a></li>
						<li class="nav_sub"><a href="quiz.do">퀴즈</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- main navbar end -->
</body>
</html>