<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formList</title>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<style>
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

.selectNav {
	width: 90%;
	border-bottom: 1px solid rgba(51, 105, 30, 0.5);
	font-family: 'munhwa';
	margin-bottom: 7px;
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	list-style: none;
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

td {
	padding-top: 3px;
	padding-bottom: 3px;
}
</style>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
		<c:choose>
			<c:when test="${ !empty sessionScope.teacher }">
				<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
				<c:set var="session_prof_Code" value="${ sessionScope.teacher.prof_Code }" />
				<input type="hidden" id="session_prof_Code" value="${session_prof_Code}">
			</c:when>
			<c:when test="${ !empty sessionScope.student }">
				<c:import url="/WEB-INF/views/common/student_nav.jsp" />
				<c:set var="session_studentCode" value="${ sessionScope.student.studentCode }" />
				<input type="hidden" id="session_studentCode" value="${session_studentCode}">
			</c:when>
		</c:choose>
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">게시판</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">서식자료실</li>
				</ul>
			</div>
			<div class="main-div">
				<table align="center" width="600" cellspacing="0" cellpadding="5">
					<tr class="proptable">
							<td>조회수</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성자</td>
					</tr>
					<c:forEach items="${requestScope.list}" var="flist">
						<tr class="proptd">
							<td class="tdread">
								<div class="tdreaddiv">${ flist.readcount }</div>
							</td>
							<td class="tdtitle">
								<div class="tdtitlediv">
									<a href="formdetail.do?form_no=${ flist.form_no }&readcount=${ flist.readcount }">${ flist.form_title }</a>
								</div>
							</td>
							<td class= "tddate">
								<div class= "tddatediv">${ flist.form_date }</div>
							</td>
							<td class= "tdauthor">
								<div class= "tdauthordiv">${ flist.form_author_name }</div>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${ !empty sessionScope.teacher }">
						<c:if test="${ teacher.grade eq 'A' }">
							<tr>
								<td colspan="4"><input type="button" value="새 게시글 작성" onclick="moveFWrite();"></td>
							</tr>
						</c:if>
					</c:if>
				</table>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function moveFWrite() {
		location.href = "formwrite.do";
	}
</script>
</html>