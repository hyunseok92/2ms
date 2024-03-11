<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2MS</title>
<link  rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style type="text/css">

p {
	text-align : left;
}
.mainView{
   position: relative;
    display: block;
    left: 250px;
    top: 120px;
    width: 85%;
    height: 100%;
    font-family : 'Wooju';
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


.mainView {
	position: relative;
	display: block;
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
	
}


.mainView {
	display : grid;
	text-align : center;
}

hr {
	margin-top : 5px;
	margin-bottom : 5px;
	width : 810px;
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
   margin-bottom : 7px;
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

td {
	padding-top: 1px;
	padding-bottom: 1px;
}


</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script>
$(function() {
	
	$(".writeSurvey").on("click", function() {
		var row = $(this).closest("tr");
		var surveycate = row.find(".survcate").text();
		
		location.href = "${pageContext.servletContext.contextPath}/writesurvey.do?survey_cate=" + surveycate;
	});
});
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/student_nav.jsp"/>
	<c:import url="/WEB-INF/views/student/student_sidemenu/survey.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">설문</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">설문조회</li>
            </ul>
     </div>
     <!--  설문 조회 -->
    <table id="survList" border="1">
	<tr class="proptable">
		<th>번호</th>
		<th>설문종류</th>
		<th>작성</th>
	</tr>
		<c:forEach items="${requestScope.slist }" var ="survey" varStatus="status">
		<tr class="proptd">
		<td>${(requestScope.paging.currentPage * 10 - 10) + status.count}</td>
		<td class="survcode" hidden>${survey.survey_no}</td>
		<td class="survcate">${survey.survey_cate }</td>
		<td><input type="button" class="writeSurvey" value="작성하기"></td>
		</tr>
		</c:forEach>
	</table>     
<c:import url="/WEB-INF/views/common/pagingView.jsp"></c:import>
</div>
</div>
</body>
</html>