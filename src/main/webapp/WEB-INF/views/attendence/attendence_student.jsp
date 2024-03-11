<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
<link  rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style type="text/css">
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

.top {
	display : flex;
}

.mainView {
	display : grid;
	text-align : center;
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
   margin-bottom : 10px;
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
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
	
<script type="text/javascript">
	$(function(){		
		$("#selectBtn").on("click", function(){		
			
			console.log("클릭");
			
			if($("#today").val() == "") {
				alert("날짜를 선택하세요");
				return;
			}			
			
			location.href = "${pageContext.servletContext.contextPath}/att_checkstudent.do?attdate=" + $('#today').val();
			
		});
	});  //document ready
	
</script>

</head>
<body>

<div class="container">
	<c:import url="/WEB-INF/views/common/student_nav.jsp"/>
	<c:import url="/WEB-INF/views/student/student_sidemenu/academic.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">학적부</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">출석부</li>
            </ul>
    </div>

	<!-- 학생  학적부 -->
	<div class="top">
	<input type="hidden" name="action" value="action">
	과정 : ${requestScope.classname } &nbsp;&nbsp; 담당교사 : ${ requestScope.profname} &nbsp;&nbsp;
	
	<fmt:parseDate var="parseDate" value="${requestScope.dateInfo}" pattern="yyyy-MM" />
	<fmt:formatDate var="formDate" value="${parseDate}" pattern="yyyy-MM"/>
	<input id="today" type="month" value="${formDate}"> &nbsp;&nbsp;
	
	<input type="button" id="selectBtn" value="조회">
		
	</div>		
	<table id="adminAtt" border="1">
	<tr class="proptable">
		<th width="20%">날짜</th>
		<th width="20%">출결상태</th>
		<th>비고</th>		
	</tr>
		<c:forEach items="${requestScope.slist}" var ="student">
		<tr class="proptd">
		<td>
		<fmt:parseDate var="parseDate" value="${student.attdate}" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="formDate" value="${parseDate}" pattern="yyyy-MM-dd"/>
			${formDate}
		</td>
		<td>${student.status}</td>
		<td>${student.note}</td>
		</tr>
		</c:forEach>
	</table>
<!-- 페이징 처리 뷰 포함 -->
</div>
</div>
</body>
</html>