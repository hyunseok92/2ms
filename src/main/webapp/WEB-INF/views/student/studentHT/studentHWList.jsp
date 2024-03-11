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
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/student/student_sidemenu/s_test.jsp" />
		


		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과제 목록</li>
				</ul>
			</div>
			
			<div style="margin-top:10px;"><h4>${requestScope.className } 과제</h4></div>
			<div style="margin-top:10px;">
			<table style="margin-top:10px;width:1500px;">
					<tr class='proptable'>
						<td>제목</td>
						<td>작성날짜</td>
						<td>마감날짜</td>
						<td>교사 파일</td>
						<td>제출 파일</td>
						<td>제출현황</td>
					</tr>
					<c:forEach var="i" items="${ requestScope.list }">
					<tr  class='proptd'>
					<c:url var="shdv" value="sHwDetailView.do">
						<c:param name="studentCode" value="${ requestScope.studentCode }"></c:param>
      					<c:param name="HWCode" value="${ i.HWCode }"></c:param>
      					<c:param name="className" value="${ requestScope.className }"></c:param>
   					</c:url>
						<td><a style="color:black;"href="${ shdv }">${ i.THWTitle }</a></td>
						<td>${ i.HWStartDate }</td>
						<td>${ i.HWEndDate }</td>
						<td><c:if test="${!empty i.THWFile }">
								O
							</c:if>
							<c:if test="${empty i.THWFile }">
								X
							</c:if>
						</td>
						<c:set var="breakpoint" value="true"/>
						<c:forEach var="j" items="${ requestScope.hlist }">
						<c:if test="${ i.HWCode eq j.HWCode }">
							<c:set var="breakpoint" value="false"/>
							<c:set var="hw" value="${ j.HWRST }" />
							<c:set var="fi" value="${ j.SHWFile }" />
						</c:if>
						</c:forEach>
						<c:if test="${breakpoint eq false }">
						<c:if test="${!empty fi}">
						<td>${ fi }</td>
						</c:if>
						<c:if test="${empty fi}">
						<td>제출파일없음</td>
						</c:if>
						</c:if>
						<c:if test="${breakpoint ne false }">
						<td>미제출</td>
						</c:if>
						
						<c:if test="${breakpoint eq false }">
						<td>${ hw }</td>
						</c:if>
						<c:if test="${breakpoint eq true }">
						<td>미제출</td>
						</c:if>
					</tr>
				</c:forEach>
				</table>
		</div>
		<c:import url="/WEB-INF/views/student/studentHT/studentPagingView.jsp" />
	</div>
</div>
</body>
</html>