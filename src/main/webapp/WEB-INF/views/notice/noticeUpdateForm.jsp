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

textarea[name="notice_content"] {
	width: 502px;
	height: 200px;
}

input[name="notice_title"] {
	width: 500px;
	height: 30px;
}

#before {
	width: 100px;
	height: 30px;
	margin-top: 15px;
	margin-left: 5px;
}

#edit {
	width: 100px;
	height: 30px;
	margin-top: 15px;
	margin-right: 5px;
}

.wrapper {
	display: flex;
	justify-content: center;
}

.wrapper-one {
	align-self: flex-start;
}

.wrapper-one-two {
	display: flex;
	justify-content: center;
}

h4 {
	margin-top: 15px;
	margin-bottom: 3px;
	background-color: #dfdfdf;
}
</style>
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
		<div class="mainView">

			<form action="updateNotice.do" method="post">
				<input type="hidden" name="notice_author"
					value="${ sessionScope.teacher.name }"> <input
					type="hidden" name="notice_no"
					value="${ requestScope.notice.notice_no }">
				<div class="wrapper">
					<div class="wrapper-one">
						<div class="wrapper-one-one">
							<p style="font-size: 140%; background-color: #dfdfdf;">공지사항
								수정페이지</p>
							<h4>제목</h4>
							<input type="text" name="notice_title"
								value="${ requestScope.notice.notice_title }">

							<h4>내용</h4>
							<textarea name="notice_content">${ requestScope.notice.notice_content }</textarea>
						</div>
						<div class="wrapper-one-two">
							<input id="edit" type="submit" value="수정하기"> &nbsp; <input
								id="before" type="button" value="이전으로"
								onclick="javascript:history.go(-1); return false;">
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>

</body>
</html>