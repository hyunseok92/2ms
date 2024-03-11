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
border:1px solid green;
}
table{
border-collapse: collapse;


}
.finaltestopen:hover {
background-color: rgba(51, 105, 30, 0.5);
}
.finaltestopen{
top:-30px; left:-108px; position:relative; height:23px; width:78px; font-size: 12px; font-weight:bold; background-color:green;color:white; border:none;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>

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
				<li class="selectNavLi">시험결과</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">시험 결과 목록</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">과정 훈련생 시험 결과</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">과정 훈령생 시험 채점</li>
			</ul>
		</div>
		<div style="display:flex; margin-top:10px;">
			<div style="margin-right:20px; font-weight:bold;">${ requestScope.className }</div>
			<div style="margin-right:20px; ">${ requestScope.subjectName }</div>
			<div style="margin-right:20px; font-weight:bold;">${ requestScope.studentName} 훈련생</div>
			<div>시험 응시 날짜 : ${requestScope.stlist[0].testDate }</div>
		</div>
			<form action="markTestResult.do" method="post">
		<div style="margin-top:10px; display:flex;">
			<div>
			<table style="width:1500px; margin-right:30px;">
				<tr class='proptable'>
					<td>문항</td>
					<td>문제</td>
					<td style="width:500px;">정답</td>
					<td style="width:70px;">배점</td>
					<td>훈련생답</td>
					<td style="width:70px;">결과</td>
				</tr>
			<c:forEach var="i" items="${ requestScope.stlist }">
				<tr class='proptd'>
					<td>${ i.testNo }</td>
					<td>${ i.testQ }</td>
					<td>${ i.testRA }</td>
					<td>${ i.testScore }</td>
					<td>${ i.testA }</td>
					<td>
						<input type="hidden" name="testScore" value="${ i.testScore }">
						<input type="hidden" name="testNo" value="${ i.testNo }">
						<select name="testYN">
							<option value="null" disabled selected>정답확인</option>
							<option value="Y" >Y</option>
							<option value="N" >N</option>
						</select>
						
					</td>
				</tr>
			</c:forEach>
			</table>
			</div>
				<div>
						<input type="hidden" name="studentCode" value="${ requestScope.studentCode }">
						<input type="hidden" name="testCode" value="${ requestScope.stlist[0].testCode }">
						<input type="hidden" name="className" value="${ requestScope.className}">
						<input type="hidden" name="subjectName" value="${ requestScope.subjectName }">
						<input type="hidden" name="studentName" value="${ requestScope.studentName }">
						<input class="finaltestopen" type="submit" value="확인완료">
				</div>
				
		</div>
			</form>
				
		
	</div>
</div>
</body>
</html>