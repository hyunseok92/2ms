<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
<link  rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style type="text/css">
.mainView{
   position: relative;
    display: block;
    left: 250px;
    top: 100px;
    width: 85%;
    height: 100%;
    font-family : 'Wooju';
}
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
	display : grid;
	text-align : center;
}

ul {
   list-style-type: none;
}

.selectNavUl {
   display: flex;
}

.selectNav {
   width: 500%;
   border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
   font-family: 'munhwa';
   margin-bottom : 10px;
}

.selectNavLi {
   margin-right: 10px;
}

.tablemain {
	display : flex;
	width : 100%;
	justify-content : center;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/student_nav.jsp"/>
	<c:import url="/WEB-INF/views/student/student_sidemenu/member.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">내정보</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">마이페이지</li>
               
            </ul>
    </div>
<h1> 내 정보 보기 페이지 </h1>
	<br>
	<div class="tablemain" rowspan="10">
	<table>
		<tr >
			<th>이름</th>
			<td>${sessionScope.student.name}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${sessionScope.student.id}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${sessionScope.student.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${sessionScope.student.email}</td>
		</tr>
		<tr>
			<th>학교</th>
			<td>${sessionScope.student.school}</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>${sessionScope.student.eduation}</td>
		</tr>
		<tr>
			<td colspan="3" class="button-container"><c:url var="mup"
					value="moveup.do">
					<c:param name="id" value="${student.id}" />
				</c:url>
				<button onclick="javascript:location.href='${mup}';">수정페이지로
					이동</button> <a href="javascript:history.go(-1);">이전 페이지로 이동</a></td>
		</tr>
	</table>
	</div>
</div>
</div>
</body>
</html>