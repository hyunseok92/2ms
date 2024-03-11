<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	display: flex;
	justify-content: center;
}

.wrapper-two {
	display: flex;
	justify-content: center;
}

.wrapper-one {
	align-self: flex-start;
}

.wrapper-two-one {
	align-self: flex-start;
}

#toEdit {
	width: 100px;
	height: 30px;
	margin-top: 15px;
}

#toList {
	width: 100px;
	height: 30px;
	margin-top: 15px;
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
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">게시판</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">공지사항</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">공지 상세보기</li>
				</ul>
			</div>
			<div class="wrapper">
				<div class="wrapper-one">
					<h3>공지사항명</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.notice.notice_title }</p>
					<br>

					<h3>작성자</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.notice.notice_author }</p>
					<br>

					<h3>등록날짜</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.notice.notice_date }</p>
					<br>

					<h3>공지내용</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p style="width:500px; line-height:1.1;">${ requestScope.notice.notice_content }</p>
					<br>
					<div class="wrapper-two">
						<div class="wrapper-two-one">
							<button id='toList' onclick="goBack()">목록으로</button>
							<c:if test="${ sessionScope.teacher.grade eq 'A' }">
								<button id="toEdit" onclick="editNotice()">수정하기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function editNotice() {
			location.href = "noticeUpdateForm.do?notice_no=${ requestScope.notice.notice_no }";
		}
		function goBack() {
			location.href = "moveNoticeList.do?page=1";
		}
	</script>
</body>
</html>