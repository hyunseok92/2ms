<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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
.mainView {
	position: relative;
	display: block;
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
}
input{
	font-family: 'Wooju';
}
button{
	font-family: 'Wooju';
}

option{
font-family: 'Wooju';
}
select{
font-family: 'Wooju';
}

.selectNav {
	width: 90%;
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
	font-family: 'munhwa';
}

ul {
	list-style-type : none;
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	margin-right: 10px;
}
.selectSubmenu{
	display: flex;
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
.proptd:hover {
background-color: rgba(51, 105, 30, 0.5);
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#selectClass').change(function(){
		var classC = $('#selectClass').val();
		location.href ="${ pageContext.servletContext.contextPath}/ThomeworkList.do?classCode=" + classC + "&teacherCode=" + ${ requestScope.teacherCode };		
	});	//change
}); //document.ready

</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/t_sidemenu/t_test.jsp"/>
	<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과제출제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과정별 과제목록</li>
				</ul>
			</div>
			<div>
				<select name="selectClass" id="selectClass" style="margin-top:10px;">
					<option value="null" disabled selected>과정선택</option>
					<c:forEach items="${ requestScope.clist }" var="c">
						<option value="${ c.classCode }">${ c.className }</option>
					</c:forEach>
				</select>
				<div style="margin-top:10px; margin-bottom:10px;"><h4>${requestScope.className } 과제</h4></div>
				<form action="homeworkOpen.do" method="post">
				<input type="text" name="className" id="className" value="${requestScope.className}"readonly style="width:350px;">
				<input type="hidden" name="teacherCode" value="${ requestScope.teacherCode }">
				<input type="hidden" name="classCode" value="${ requestScope.classCode }">
				<input type="submit" value="과제 생성">
				</form>
				<c:if test="${empty requestScope.list }">
				<h4 style="margin-top:10px;">*과제를 생성해 주세요</h4>
				</c:if>
				<c:if test="${!empty requestScope.list }">
				<table style="margin-top:10px;width:1500px;">
					<tr class='proptable'>
						<td>제목</td>
						<td>작성날짜</td>
						<td>마감날짜</td>
						<td style="width:70px;">파일유무</td>
					</tr>
					<c:forEach var="i" items="${ requestScope.list }">
					<tr class='proptd'>
					<c:url var="hdv" value="hwDetailView.do">
      					<c:param name="THWTitle" value="${ i.THWTitle }"></c:param>
      					<c:param name="HWStartDate" value="${ i.HWStartDate }"></c:param>
      					<c:param name="HWEndDate" value="${ i.HWEndDate }"></c:param>
      					<c:param name="HWCode" value="${ i.HWCode }"></c:param>
      					<c:param name="THWFile" value="${ i.THWFile }"></c:param>
      					<c:param name="classCode" value="${ requestScope.classCode }"></c:param>
      					<c:param name="THWContent" value="${ i.THWContent }"></c:param>
      					<c:param name="className" value="${ requestScope.className }"></c:param>
   					</c:url>
						<td><a href="${ hdv }" style="color:black;">${ i.THWTitle }</a></td>
						<td>${ i.HWStartDate }</td>
						<td>${ i.HWEndDate }</td>
						<td><c:if test="${!empty i.THWFile }">
								O
							</c:if>
							<c:if test="${empty i.THWFile }">
								X
							</c:if>
						</td>
						
					</tr>
						
				</c:forEach>
				</table>
				<c:import url="/WEB-INF/views/admin_teacher/teacher/testHW/teacherPagingView.jsp" />
				</c:if>
			</div>
	</div>
</div>
</body>
</html>