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
.main_menu_block{
top:0px;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
$(function(){
var hiddenInputs = document.querySelectorAll('input[name=scoreSum2]');
var scoreSums = [];
for (var i = 0; i < hiddenInputs.length; i++) {
	console.log("ddd"+hiddenInputs[i].value);
	
  scoreSums.push(hiddenInputs[i].value);
}
var hiddenInputs2 = document.querySelectorAll('input[name=sname]');
var sname = [];
for (var i = 0; i < hiddenInputs2.length; i++) {
  sname.push(hiddenInputs2[i].value);
}
console.log(sname);
console.log(scoreSums);

	var chartData = {
		labels :  sname ,
		datasets : [ {
			label : '시험점수',
			data :  scoreSums ,
			backgroundColor : [ 'green' ]
		// 각 섹션의 색상 설정
		} ]
	};

	var chartOptions = {
		type : 'bar',
		data : chartData,
		options : {
			plugins : {
				title : {
					display : true,
					text : '시험결과',
					fontSize : 16,
					padding : 0
				},
				legend : {
					display : true,
					
					position : 'right',
					maxWidth : 200
				}
			}
		}
	};
	var myPieChart = new Chart($('.myPieChart'), chartOptions);
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
		<div class="selectNav"style="margin-top:10px">
			<ul class="selectNavUl" >
				<li class="selectNavLi">시험결과</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">시험 결과 목록</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">과정 훈련생 시험 결과</li>
			</ul>
		</div>
		<div style="margin-top:10px; display:flex;">
			<div style="margin-right:20px; font-weight:bold;">${ requestScope.className }</div>
			<div style="margin-right:20px;">${ requestScope.subjectName }</div>
			
			<c:if test="${ !empty requestScope.stlist }">
				<div style="font-weight:bold;">평균 점수 : ${ requestScope.testAvg } 점</div>			
			</c:if>
			<c:if test="${ empty requestScope.stlist }">
				<div>시험 응시 완료한 훈련생이 없습니다.</div>
			</c:if>
		</div>
		<div style="display:flex; margin-top:20px;">
			<table style="width:300px; margin-right:250px;">
			  <tr class='proptable'>
				<td>이름</td>
				<td>제출날짜</td>
				<td style="width:90px;">점수</td>
			  </tr>
			  <c:forEach var="i" items="${ requestScope.slist }">
			  <c:set var="break1" value="false"></c:set>
				<input type="hidden" id="sname${ i }" name="sname" value="${ i.name}">
			  <tr class='proptd'>
				<td>${ i.name}</td>
				<c:if test="${ !empty requestScope.stlist }">
				<c:forEach var="j" items="${ requestScope.stlist }">
					<c:if test="${ i.studentCode eq j.studentCode }">
						<c:set var="break1" value="true"/>
						<c:set var="scoreSum" value="${ j.scoreSum }" />
						<c:set var="testDate" value="${ j.testDate }" />
						<c:set var="testOK" value="${ j.testOK }" />
					</c:if>
				</c:forEach>
				<c:if test="${ break1 eq true and !empty testOK}">
				<td>${ testDate }</td>
				<td style="display:flex;">${ scoreSum } 점
				
				<c:if test="${ requestScope.testType eq '주관식' }">
					<form action="markTest.do" method="post">
					<input type="hidden" name="studentName" value="${ i.name }">
					<input type="hidden" name="className" value="${ requestScope.className }">
					<input type="hidden" name="subjectName" value="${ requestScope.subjectName }">
					<input type="hidden" name="studentCode" value="${ i.studentCode }">
					<input type="hidden" name="testCode" value="${ requestScope.stlist[0].testCode }">
					<input type="submit" value="채점 수정">
					</form>
				</c:if></td><input type="hidden"class="scoreSum2" id="scoreSum2${ i }" name="scoreSum2"value="${ scoreSum }">
				</c:if>
				<c:if test="${ break1 eq true and empty testOK}">
				<td>${ testDate }</td>
				<td>
					<form action="markTest.do" method="post">
					<input type="hidden" name="studentName" value="${ i.name }">
					<input type="hidden" name="className" value="${ requestScope.className }">
					<input type="hidden" name="subjectName" value="${ requestScope.subjectName }">
					<input type="hidden" name="studentCode" value="${ i.studentCode }">
					<input type="hidden" name="testCode" value="${ requestScope.stlist[0].testCode }">
					<input type="submit" value="채점">
					</form>
				</td>
				</c:if>
				<c:if test="${ break1 eq false }">
				<input type="hidden" class="scoreSum2" name="scoreSum2"value="${ 0 }">
				<td colspan="2">미제출</td>
				</c:if>
				</c:if>
				<c:if test="${ empty requestScope.stlist }">
				<td colspan="2">미제출</td>
				</c:if>
			  </tr>
			  </c:forEach>
			</table>
			<div class="tchart-container" style="width:800px"><canvas class="myPieChart"></canvas></div>
		</div>
		
	</div>
</div>
</body>
</html>