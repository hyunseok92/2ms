<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육과정 상세페이지</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

<style type="text/css">
.mainView {
	position: relative;
	display: block;
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
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

select {
	text-align: center;
}

ul {
	list-style-type: none;
}

.selectNavUl {
	display: flex;
}

.selectNav {
	width: 90%;
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
	font-family: 'munhwa';
	margin-bottom: 10px;
}

.selectNavLi {
	margin-right: 10px;
}

.wrapper {
	display:flex;
	justify-content:center;
}

.wrapper-one {
	align-self: flex-start;
}

button {
	width: 100px; 
	height: 30px; 
	margin-top:15px;
}

.buttons {
	display:flex;
	justify-content:center;
}
</style>

<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery.min.js">
	
</script>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
		<div class="mainView">

			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과정</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">강의계획서</li>
				</ul>
			</div>
			<div class="wrapper">

				<div class="wrapper-one">
					<h3>과정명</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.course.className }</p>
					<br>
					<h3>학습목표</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p style="width:500px; line-height:1.1;">${ requestScope.course.classGoal }</p>
					<br>
					<h3>시행연도</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${fn:substring(course.executeDate, 0, 10)}</p>
					<br>
					<h3>교강사명</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.course.name }</p>
					<br>

					<h3>교과목</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<table align="center" width="500" border="0" cellspacing="0"
						cellpadding="5">
						<tr>
							<th>주차</th>
							<th>과목명</th>
							<th>시수</th>
						</tr>

						<c:forEach var="subj" items="${ requestScope.dslist }"
							varStatus="loopStatus">
							<tr>
								<td style="text-align: center;">${subj.subjIndex}주차</td>
								<td style="text-align: center;">${subj.subjectName}</td>
								<td style="text-align: center;">${subj.setTime}시간</td>
							</tr>
						</c:forEach>
						<c:set var="totalTime" value="0" />

						<c:forEach var="subj" items="${requestScope.dslist}">
							<c:set var="totalTime" value="${totalTime + subj.setTime}" />
						</c:forEach>

					</table>
					<br>
					<hr width="500" color="#afafaf"
						style="margin-top: 5px; margin-bottom: 5px;">
					<table align="center" width="500" border="0" cellspacing="0"
						cellpadding="5">
						<tr>
							<td></td>
							<td style="text-align: center;"><strong>합산시수</strong> :
								${totalTime} 시간</td>
						</tr>
					</table>
					<script type="text/javascript">
						$(function() {
							$("#toFinalClass").click(function() {

							})
						})
					</script>
					<div class="buttons">
					<button onclick="history.go(-1);">홈으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>