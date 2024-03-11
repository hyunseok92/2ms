<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
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
}

.selectNavLi {
	margin-right: 10px;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/student/student_sidemenu/s_test.jsp" />
		


		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">시험</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">시험 목록</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">시험 결과</li>
				</ul>
			</div>
				<div style="margin-top:10px; font-weight:bold;">${ttest.className}</div>
			<div style="margin-top:10px;display: flex;">
				<div>과 목 : ${ttest.subjectName }</div>
				<div style="margin-left:20px;">시험 유형 : ${ttest.testType } 시험</div>
				<div style="margin-left:20px;">총점 : ${ slist[0].scoreSum } 점</div>
			</div>
			<c:if test="${ ttest.testType eq '객관식' }">
			<c:set var="j" value="${ 0 }" />
			<c:forEach var="i" items="${ requestScope.tlist }">
			<div style="margin-top:20px;">
				<div>능력단위요소</div>
				<div>${ i.ability }</div>
				<c:if test="${requestScope.slist[j].testYN eq 'Y'}">
				<div><h4 style="color:green">${ i.testNo }. ${ i.testQ }</h4></div>
				</c:if>
				<c:if test="${requestScope.slist[j].testYN eq 'N'}">
				<div><h4 style="color:red">${ i.testNo }. ${ i.testQ }</h4></div>
				</c:if>
				<div> 배점 : ${ i.testScore }점 정답 : ${ i.testRA } 나의 답 :  ${ requestScope.slist[j].testA } </div>
				<div>1. ${ i.testQ1 }</div>
				<div>2. ${ i.testQ2 }</div>
				<div>3. ${ i.testQ3 }</div>
				<div>4. ${ i.testQ4 }</div>
			</div>
			<c:set var="j" value="${ j + 1}"/>
			</c:forEach> 
			</c:if>
			<c:set var="a" value="${ 0 }" />
			<c:if test="${ttest.testType eq '주관식' }">
				<c:forEach var="i" items="${requestScope.tlist }">
					<div style="margin-top:20px;">
						<div>능력단위요소</div>
						<div>${ i.ability }</div>
						<c:if test="${requestScope.slist[a].testYN eq 'Y'}">
						<div><h4 style="color:green">${ i.testNo }. ${ i.testQ } 배점 : ${ i.testScore }</h4></div>
						</c:if>
						<c:if test="${requestScope.slist[a].testYN eq 'N'}">
						<div><h4 style="color:red">${ i.testNo }. ${ i.testQ } 배점 : ${ i.testScore }</h4></div>
						</c:if>
						<div>${ i.testRA }</div>		
					</div>
					<c:set var="a" value="${ a + 1 }" />
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>