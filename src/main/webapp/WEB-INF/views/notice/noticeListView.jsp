<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="currentLimit" value="${ requestScope.limit }" />
<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
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
	display: flex;
	justify-content: center;
}

#noticeTable {
	width: 60%;
	height: 100%;
}

.moveBtn {
	text-align: center;
}

#moveWriteForm {
	width: 150px;
	height: 25px;
	margin-top: 15px;
	margin-bottom: 15px;
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
	padding-top: 3px;
	padding-bottom: 3px;
}
</style>
</head>
<body>

	<div class="container">
	<c:if test="${ !empty sessionScope.student }">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
	</c:if>
	<c:if test="${ !empty sessionScope.teacher }">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
	</c:if>
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">게시판</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">공지사항</li>
				</ul>
			</div>
			<div class="listWrapper">
				<div class="tableWrapper">
					<table id="noticeTable" align="center" border="1" width="700">
						<tr class="proptable">
							<th>번호</th>
							<th>공지사항명</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="notice" items="${ requestScope.list }">
							<tr class="proptd">
								<td align="center">${ notice.notice_no }</td>
								<c:url var="nDetail" value="noticeDetail.do">
									<c:param name="notice_no" value="${ notice.notice_no }" />
									<c:param name="page" value="${ nowpage }" />
								</c:url>
								<td align="center"><a class="atag" href="${ nDetail }">${ notice.notice_title }</a></td>
								<td align="center">${ notice.notice_author }</td>
								<td align="center">${ notice.notice_date }</td>
								<td align="center">${ notice.notice_count }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="moveBtn">
					<button id="moveWriteForm"
						onclick="javascript:location.href='moveNoticeWriteForm.do'">공지사항작성</button>
				</div>
			</div>
			<c:import url="/WEB-INF/views/common/pagingView.jsp" />
		</div>
	</div>
</body>
</html>