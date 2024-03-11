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

div.trand-section {
	width: 100%;
	height: 100%;
}

#accodianMenu h3 {
	background: #4F6969;
	/* linear-gradient( to bottom, #339933, #efefef ); */
	height: 35px;
	text-align: center;
	border-radius: 5px;
	/* box-shadow: 3px 3px 4px gray; */
	transition: background 1s;
}

#accodianMenu {
	width: 700px;
}

#accodianMenu h3:hover {
	background: linear-gradient(to bottom, #6F9999, #4F6969);
	transition: background 1s;
}

#accodianMenu div a {
	font-size: 110%;
}

.sectionTitle {
	color: black;
}

#atag {
	color: black;
	display: block;
}

#atag:hover {
	color: #4F8099;
	border-radius: 10px;
	background-color: rgba(170, 221, 200, 0.3);
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-bottom: 10px;
}

.wrapperOfThree {
	display: flex;
}

.bannerSection {
	height: 670px;
	/* 	margin-bottom:-25px; */
	justify-content: center;
	display: flex;
}

.trand-section {
	flex: 1;
	height: 300px;
	padding: 20px;
}

.titleDiv {
	background-color: #dfdfdf;
	display: flex;
	margin-bottom: 15px;
	/* border-radius:7px; */
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
.one {
	display:flex;
	justify-content:center;
}
.two {
	align-self: flex-start;
}

.atag {
	color:black;
	display:block;
}

.atag:hover {
  	color:#4F8099;
  	background-color: rgba(170, 221, 200, 0.3);
}

a{
	vertical-align:middle;
}

h3 {
	box-shadow:2px 3px 1px dimgray;
}
</style>

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">

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
					<li class="selectNavLi">IT 최신동향</li>
				</ul>
			</div>
			<div class="one">
				<div class="two">
					<!-- trand-section -->
					<div class="trand-section">
						<div id="accodianMenu">
							<h3 style="margin-bottom: 5px; cursor: pointer;">
								<a style="color: #D0E3DD; font-size:170%">${ cateList[0].category }</a>
							</h3>
							<div style="box-shadow:5px 9px 7px gray;">
								<c:forEach var="IoT" items="${ requestScope.cateOfFirst }">
									<a style="background-color:#cfcfcf;" class="atag" href="${ IoT.urlAddress }">${ IoT.title }</a>
									<br>
									<a class="atag" href="${ IoT.urlAddress }">${ IoT.content }</a>
									<br>
									<hr color="#afafaf" style="margin-bottom: 0px;">
									<br>
								</c:forEach>
							</div>

							<h3 style="margin-bottom: 5px; cursor: pointer;">
								<a style="color: #D0E3DD; font-size:170%">${ cateList[1].category }</a>
							</h3>
							<div style="box-shadow:5px 9px 7px gray;">
								<c:forEach var="globalTrand"
									items="${ requestScope.cateOfSecond }">
									<a style="background-color:#cfcfcf;" class="atag" href="${ globalTrand.urlAddress }">${ globalTrand.title }</a>
									<br>
									<a class="atag" href="${ globalTrand.urlAddress }">${ globalTrand.content }</a>
									<br>
									<hr color="#afafaf" style="margin-bottom: 0px;">
									<br>
								</c:forEach>
							</div>

							<h3 style="margin-bottom: 5px; cursor: pointer;">
								<a style="color: #D0E3DD; font-size:170%">${ cateList[2].category }</a>
							</h3>
							<div style="box-shadow:5px 9px 7px gray;">
								<c:forEach var="developer" items="${ requestScope.cateOfThird }">
									<a style="background-color:#cfcfcf;" class="atag" href="${ developer.urlAddress }">${ developer.title }</a>
									<br>
									<a class="atag" href="${ developer.urlAddress }">${ developer.content }</a>
									<br>
									<hr color="#afafaf" style="margin-bottom: 0px;">
									<br>
								</c:forEach>
							</div>

							<h3 style="margin-bottom: 5px; cursor: pointer;">
								<a style="color: #D0E3DD; font-size:170%">${ cateList[3].category }</a>
							</h3>
							<div style="box-shadow:5px 9px 7px gray;">
								<c:forEach var="futureTech"
									items="${ requestScope.cateOfFourth }">
									<a style="background-color:#cfcfcf;" class="atag" href="${ futureTech.urlAddress }">${ futureTech.title }</a>
									<br>
									<a class="atag" href="${ futureTech.urlAddress }">${ futureTech.content }</a>
									<br>
									<hr color="#afafaf" style="margin-bottom: 0px;">
									<br>
								</c:forEach>
							</div>

							<h3 style="margin-bottom: 5px; cursor: pointer;">
								<a style="color: #D0E3DD; font-size:170%">${ cateList[4].category }</a>
							</h3>
							<div style="box-shadow:5px 9px 7px gray;">
								<c:forEach var="coCulture" items="${ requestScope.cateOfFifth }">
									<a style="background-color:#cfcfcf;" class="atag" href="${ coCulture.urlAddress }">${ coCulture.title }</a>
									<br>
									<a class="atag" href="${ coCulture.urlAddress }">${ coCulture.content }</a>
									<br>
									<hr color="#afafaf" style="margin-bottom: 0px;">
									<br>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		(function($, undefined) {
			$.fn.multiOpenMenu = function(options) {

				if (this.length === 0) {
					return this;
				}

				var settings = $.extend({
					active : -1
				}, options);

				var headers = this.find(">h3");

				headers.on('click', function() {
					var menuArea = $(this).next();
					var isOpen = menuArea.is(":visible");

					headers.next().slideUp();

					if (!isOpen) {
						menuArea.slideDown().trigger('show');
					}

					$('html, body').animate({
						scrollTop : 0
					}, 'fast');
					return false;
				});

				headers.next().hide();

				return this;
			};
		}(jQuery));

		$(function() {
			$("#accodianMenu").multiOpenMenu();
		});

		function truncateText(element, maxLength) {
			var text = element.textContent;
			if (text.length > maxLength) {
				text = text.substring(0, maxLength) + '···';
				element.textContent = text;
			}
		}

		window.onload = function() {
			var pElements = document.querySelectorAll("p");
			var maxLength = 70; // 표시할 최대 문자 길이

			for (var i = 0; i < pElements.length; i++) {
				truncateText(pElements[i], maxLength);
			}
		};
	</script>
</body>
</html>