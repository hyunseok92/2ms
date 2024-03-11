<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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
input{
	font-family: 'Wooju';
}
button{
	font-family: 'Wooju';
}

option{
font-family: 'Wooju';
}
select{
font-family: 'Wooju';
}

.selectNav {
	width: 90%;
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
	font-family: 'munhwa';
}

ul {
	list-style-type : none;
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	margin-right: 10px;
}
.selectSubmenu{
	display: flex;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/t_sidemenu/t_test.jsp"/>
	<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과제출제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과정별 과제목록</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과제 생성</li>
				</ul>
			</div>
			<div>
				<div style="margin-top:10px;">
					<div style="font-weight:bold;">${ requestScope.className }</div>
				<form action="Thwinsert.do" method="post"  enctype="multipart/form-data">
				<div style="margin-top:10px;">
				<input type="hidden" name="classCode" value="${ requestScope.classCode }">
				<input type="hidden" name="teacherCode" value="${ requestScope.teacherCode }">
				<div style="display:flex;">
				<div>제 목 : </div>
				<input style="margin-left:20px;width:657px;type="text" name="THWTitle">
				</div>
				<div style="display:flex; margin-top:10px; align-content: center;">
				<div>마감 날짜 : </div>
				<input  style="margin-left:20px; height:12px;"type="date" name="HWEndDate">
				<div style="margin-left:20px;">첨부 파일 : </div>
				<input style="font-size:10px;"type="file" name="ofile">
				</div>
				<div>
				<textarea name="THWContent"rows="10" cols="100" style="resize: none;border:solid 1px green"name="HWComent" placeholder="과제에 대한 코멘트를 남겨주세요."></textarea>
				</div>
				<div>
				</div>
				<input type="submit" value="과제 출제">
				<input type="button" value="목록" onclick="javascript:history.go(-1); return false;">
				</div>
				</form>
				
				</div>
			</div>

	</div>
</div>
</body>
</html>