<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="container">
<!-- main submenu start -->
		<div class="submenu_side">
			<div class="side_menu">
				<ul style="width:100%;">
					<li class="sub_side_title">학적부</li>
					<c:if test="${  !empty sessionScope.teacher and teacher.grade eq 'A' }">
					<li class="sub_side_menu"><a href="att_select.do">출석부</a></li>
					</c:if>
					<c:if test="${  !empty sessionScope.teacher and teacher.grade eq 'T' }">
					<li class="sub_side_menu"><a href="att_teacher.do">출석부</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>