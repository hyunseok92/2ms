<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="nowpage" value="1" /> 
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정설계 페이지</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

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

.timeChanged {
	width: 30px;
	text-align: center;
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
   margin-bottom: 10px;
}

.selectNavLi {
   margin-right: 10px;
}

.tableWrapper {
	display:flex;
	justify-content:center;
}

#courseTable {
	width:60%;
	height:100%;
}

.moveBtn {
	text-align:center;
}
#moveWriteForm{
	width:150px;
	height:25px;
	margin-top:15px;
	margin-bottom:15px;
}

.atag {
	color:black;
	display:block;
}

.atag:hover {
  	color:#4F8099;
  	border-radius:10px;
  	/* background-color: rgba(170, 221, 200, 0.3); */
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

td {
	padding-top: 1px;
	padding-bottom: 1px;
}
</style>

</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/academic.jsp" />
		<div class="mainView">
		
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과정</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">강의계획서</li>
				</ul>
			</div>
			<div class="listWrapper">
				<div class="tableWrapper">
				<table id="courseTable" align="center" border="1">
					<tr class="proptable">
						<th>과정번호</th>
						<th>과정명</th>
						<th>교강사명</th>
						<th>과목구성</th>
						<th>시행연도</th>
						<th>작성일</th>
					</tr>

					<c:forEach var="course" items="${ requestScope.list }">
						<tr class="proptd">
							<!-- 과정번호 -->
							<td align="center">${ course.classCode }</td>

							<!-- 과정명 -->
							<td align="center">
							<c:url var="cView" value="courseDetail.do">
								<c:param name="classCode" value="${ course.classCode }" />
								<c:param name="page" value="${ nowpage }" />
								<c:param name="profCode" value="${ course.profCode }" />
							</c:url> <a class="atag" href="${ cView }">${ course.className }</a></td>
							
							<!-- 교강사명 -->
							<td align="center">${ course.name }</td>
							
							<!-- 과목구성여부 -->			
							<c:if test="${ course.profConfirm eq 'Y' }">
								<td align="center">✅</td>
							</c:if>	
							<c:if test="${ course.profConfirm ne 'Y' }">
								<td align="center">❌</td>
							</c:if>

							<!-- 시행연도 -->
							<td align="center">${fn:substring(course.executeDate, 0, 10)}</td>
							<!-- 작성일 -->
							<td align="center">${fn:substring(course.uploadDate, 0, 10)}</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			<div class="moveBtn">
				<button id="moveWriteForm" onclick="moveToWriteForm()">과정설계</button>
			</div>
			</div>
		<c:import url="/WEB-INF/views/common/pagingView.jsp" />
		</div>
	</div>
	
<script type="text/javascript">
function moveToWriteForm() {
	location.href = "${ pageContext.servletContext.contextPath }/selectSList.do"
}
</script>
</body>
</html>