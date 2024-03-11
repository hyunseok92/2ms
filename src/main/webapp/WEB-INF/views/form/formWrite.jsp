<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formWrite</title>
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
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
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
table {
	text-align: center;
	width: 500px;
}
td {
	/* border: 1px solid green; */
	text-align: left;
}
input[name=form_author_name] {
	border: none;
}
textarea {
	resize: none;
	overflow: auto;
}
:focus {
	outline: none;
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
					<li class="selectNavLi">></li>
					<li class="selectNavLi">게시글 작성</li>
				</ul>
			</div>
			<div class="main-div">
				<form action="forminsert.do" method="post"enctype="multipart/form-data">
					<input type="hidden" name="form_author" value="${ sessionScope.teacher.prof_Code }">
					<table>
						<tr>
							<th>제 목</th>
							<td><input type="text" name="form_title" size="50" required></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="form_author_name" readonly
								value="${ sessionScope.teacher.name }"></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="formFile" required></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea rows="5" cols="52" name="form_content" required></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
							<input type="submit" value="등록하기">&nbsp;  &nbsp;   &nbsp; 
							<input type="button" value="목록"  onclick="javascript:location.href='formlist.do';">
							<%-- <c:url var="bl" value="formlist.do">
								<c:param name="page" value="1" />
							</c:url> --%>
							<%-- <input type="button" value="목록" onclick="javascript:location.href='formlist.do'; return false;"> --%>
							</th>
						</tr>
					</table>
				</form>
				<a href="formlist.do">FormList</a>
			</div>
		</div>
	</div>
</body>
</html>