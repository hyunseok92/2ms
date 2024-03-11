<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.login_select {
	display: flex;
	width: 100%;
	justify-content: center;
	align-items: center;
}

.select_box {
	display: flex;
	width: 250px;
	height: 400px;
	border-radius: 40px;
	margin: 35px;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

.select_box:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.admin_select {
	display: flex;
	justify-content: center;
	align-items: center;
}

.T_select {
	display: flex;
}

.S_select {
	display: flex;
}

.admin_select a {
	display: flex;
	justify-content: center;
	align-items: center;
}

.T_select a {
	display: flex;
	justify-content: center;
	align-items: center;
}

.S_select a {
	display: flex;
	justify-content: center;
	align-items: center;
}

.select_title {
	font-family: Wilder;
	text-align: center;
	font-size: 200px;
}

.select_text {
	position: absolute;
	text-align: center;
	width: 250px;
	font-family: munhwa;
	color: white;
	background-color: rgba(0, 80, 0, 0.4);
}
</style>
</head>
<body>
	<div class="select_title">Responce2ms</div>
	<div class="login_select">
		<div class="select_box">
			<div class="admin_select">
				<a href="adminlogin.do"><img
					src="resources/images/a_img.jpg" style="height: 410px;">
					<h1 class="select_text">운영자</h1></a>

			</div>
		</div>
		<div class="select_box">
			<div class="T_select">
				<a href="adminlogin.do"><img src="resources/images/t_img.jpg"
					style="height: 410px;">
				<h1 class="select_text">교사</h1></a>

			</div>
		</div>
		<div class="select_box">
			<div class="S_select">
				<a href="studentLogin.do"><img src="resources/images/s_img.jpg"
					style="height: 410px;">
				<h1 class="select_text">훈련생</h1></a>

			</div>
		</div>
	</div>

</body>
</html>