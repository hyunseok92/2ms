<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="submenu_side">
		<div class="side_menu">
			<ul style="width: 100%;">
				<li class="sub_side_title">커뮤니티</li>
				<c:choose>
					<c:when test="${ !empty sessionScope.teacher }">
						<li class="sub_side_menu"><a href="chatroomList.do?prof_code=${ sessionScope.teacher.prof_Code }">채팅방 목록</a></li>
						<li class="sub_side_menu"><a href="quiz.do">퀴즈 출제</a></li>
					</c:when>
					<c:when test="${ !empty sessionScope.student }">
						<li class="sub_side_menu"><a href="chatroom.do?student_code=${ sessionScope.student.studentCode }">채팅</a></li>
						<li class="sub_side_menu"><a href="quizreceive.do?student_code=${ sessionScope.student.studentCode }">퀴즈</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>