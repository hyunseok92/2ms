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
.proptable{
background: green;
color: white;
}
.proptd{
background: whitesmoke;
}
table{
border-collapse: collapse;


}
.proptd:hover {
background-color: rgba(51, 105, 30, 0.5);
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
<c:set var="nowdays_" value="<%= java.util.Date.from(java.time.LocalDate.now().atStartOfDay(java.time.ZoneId.systemDefault()).toInstant()) %>" />
<fmt:formatDate var="nowdays" value="${ nowdays_ }" pattern="yyyy-MM-dd" />
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/student/student_sidemenu/s_test.jsp" />
		


		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">시험</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">시험 목록</li>
				</ul>
			</div>
			<div>
				<div style="margin-top:10px; margin-bottom:10px;">${ list[0].className } 시험목록</div>
				<table style="margin-top:10px;width:1500px;">
					<tr class='proptable'>
						<td>과목</td>
						<td>문제유형</td>
						<td>시작날짜</td>
						<td>마감날짜</td>
						<td>문항수</td>
						<td>시험응시</td>
					</tr>

					<c:forEach var="i" items="${ requestScope.list }">

						<tr class='proptd'>
							<td>${ i.subjectName }</td>
							<td>${ i.testType }</td>
							<td><fmt:formatDate value="${ i.testStartDate }"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${ i.testEndDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>${ i.testCount }</td>
							<c:set var="breakLoop" value="true" />
							<c:set var="breakLoop2" value="true" />
							<td><c:forEach var="j" items="${ requestScope.slist }">
									<c:if test="${ i.testCode eq j.testCode}">
										<c:set var="breakLoop" value="false" />
										<c:if test="${j.testYN ne null }">
										<c:set var="breakLoop2" value="false" />
										</c:if>
									</c:if>
								</c:forEach> 
								
									 	<c:if test="${breakLoop2 eq true and breakLoop eq true}">
									 	
									 		<c:if test="${i.testEndDate > nowdays}">
									 		<form action="testStart.do" method="POST">
												<input type="hidden" id="testCode" value="${i.testCode}"
												name="testCode"> <input type="submit" id="testbtn"
												value="시험 응시">
											</form>
											</c:if>
											<c:if test="${i.testEndDate <= nowdays}">
											미응시
											</c:if>
									 	</c:if>
									 	<c:if test="${breakLoop2 eq true and breakLoop eq false}">
									 		채점중
									 	</c:if>
									 	<c:if test="${breakLoop2 eq false and breakLoop eq false}">
									 		<form action="StestResult.do" method="post">
									 			<input type="hidden" name="testCode" value="${ i.testCode }">
									 			<input type="hidden" name="studentCode" value="${ sessionScope.student.studentCode }">
									 			<input type="hidden" name="className" value="${i.className }">
									 			<input type="hidden" name="subjectName" value="${i.subjectName }">
									 			<input type="hidden" name="testType" value="${i.testType }">
									 			<input type="submit" value="시험결과확인">
									 		</form>
									 	</c:if>
									 </td>
						</tr>

					</c:forEach>
				</table>
			<c:import url="/WEB-INF/views/student/studentHT/studentPagingView.jsp" />


			</div>
		</div>
	</div>
</body>
</html>