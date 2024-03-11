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
}

.selectNavLi {
	margin-right: 10px;
}
.sidemove{
position: stacky;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	// 타이머에 표시될 초기 값 설정 (초 단위)
    //var time = 1800; // 1시간 (60초 * 60분)
    var time = 600;
    // 1초마다 실행되는 함수
    var timer = setInterval(function() {
      // 시간을 시, 분, 초로 변환
     
      var minutes = Math.floor((time % 3600) / 60);
      var seconds = time % 60;

      // 시간을 HTML 요소에 표시
      document.getElementById("timer").textContent =
       
        ("0" + minutes).slice(-2) +
        ":" +
        ("0" + seconds).slice(-2);

       // 시간을 감소
       time--;

       // 시간이 0 이하로 내려가면 타이머 중지
       if (time < -1) {
         clearInterval(timer);
         selectAll();
       }
    },1000);



});
function selectAll(){
var radios = document.querySelectorAll('input[type="radio"]');


var checkedValues = [];


for (var i = 0; i < radios.length; i++) {

 if (radios[i].checked) {
    
     checkedValues.push(radios[i].value);
 }
}
console.log(checkedValues);
$("#testA").val(checkedValues);

$('#submitbtn').trigger('click');
}

</script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/student/student_sidemenu/s_test.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl" style="display:flex;align-content: center;">
					<li class="selectNavLi">시험응시</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">시험 목록</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">객관식 시험</li>
			<div style="display:flex; align-content: center; justify-content: flex-end; width:1300px;">
			<div style="font-size:20px;font-weight:bold;">시험 시간 : </div>
			<div id="timer" style="font-size:20px;font-weight:bold;">00:00</div>
			</div>
				</ul>
			</div>
			
			<c:forEach var="i" items="${requestScope.plist }">
			<div>
				<div style="margin-top:20px; font-weight:bold;">능력단위요소</div>
				<div>${ i.ability }</div>
				<div>${ i.testNo }. ${ i.testQ } 배점 : ${ i.testScore }점</div>
				<input type="radio"  name="testA${ i }" value="null" style="display:none" checked >
				<div><input type="radio"  name="testA${ i }" value="1" >1. ${ i.testQ1 }</div>
				<div><input type="radio"  name="testA${ i }" value="2" >2. ${ i.testQ2 }</div>
				<div><input type="radio"  name="testA${ i }" value="3" >3. ${ i.testQ3 }</div>
				<div><input type="radio"  name="testA${ i }" value="4" >4. ${ i.testQ4 }</div>
			</div>
			<hr style="margin-top:10px; width:1550px;">
			</c:forEach>
			<%-- <table>
				<tr>
					<td>문항</td>
					<td>답</td>
				</tr>
			<c:forEach var="j" items="${requestScope.plist }">
				<tr>
					<td>${ i.testNo }</td>
					<td><input type="text" id="chooseA${ i }" readonly></td>
				</tr>
			</c:forEach>
			</table> --%>
			
			<button onclick="selectAll();">제출</button>
			<form action="testComplate.do" method="post">
			<input type="hidden" name="studentCode"value="${ sessionScope.student.studentCode }">
			<input type="hidden" name="testCode" value="${ requestScope.testCode }">
			<input type="hidden" name="testA" id="testA">
			<input type="submit" id="submitbtn" style="display:none;">
			</form>
			
			
			
	</div>
	</div>
</body>
</html>