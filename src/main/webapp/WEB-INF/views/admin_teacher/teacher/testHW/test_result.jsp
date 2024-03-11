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
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#selectClass').change(function(){
		var select = $('#selectClass').val();
		console.log(select);
		$('#classCodeRT').val(select);
		$('#testResultSearch').trigger('click')
			
	});	//click
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
				<li class="selectNavLi">시험결과</li>
				<li class="selectNavLi">></li>
				<li class="selectNavLi">시험 결과 목록</li>
			</ul>
		</div>
		<div>
			<form action="selecttestClassResult.do" method="post">
				<input type="hidden" id="classCodeRT" name="classCode">
				<input type="hidden"  name="teacherCode" value="${ sessionScope.teacher.prof_Code }">
				<input type="submit" id="testResultSearch" style="display:none">
			</form>
			<select name="selectClass" id="selectClass" style="margin-top:10px;">
					<option value="null" disabled selected>과정선택</option>
					<c:forEach items="${ requestScope.rlist }" var="t">
						<option value="${ t.classCode }">${ t.className }</option>
					</c:forEach>
				</select>
			</div>
			<div style="margin-top:10px;">
				<c:if test="${empty requestScope.list }">
					<div style="font-size:20px;margin-top:10px;">*과정을 선택하거나 시험을 등록해주세요.</div>
				</c:if>
				  <c:if test="${!empty requestScope.list }">
				<table style="width:1500px;">
				  <tr class='proptable'>
					<td>과목</td>
					<td>시작 날짜</td>
					<td>마감 날짜</td>
					<td>문항수</td>
					<td>문제 유형</td>
					<td>조회</td>
				  </tr>
				  <c:forEach var="i" items="${ requestScope.list }">
				  <tr class='proptd'>
					<td>${ i.subjectName }</td>
					<td>${ i.testStartDate }</td>
					<td>${ i.testEndDate }</td>
					<td>${ i.testCount } 문항</td>
					<td>${ i.testType }</td>
					<td>
						<form action="testResultStudentList.do" method="post">
							<input type="hidden" name="subjectName" value="${ i.subjectName }">
							<input type="hidden" name="className" value="${ i.className }">
							<input type="hidden" name="testCode" value="${ i.testCode }">
							<input type="hidden" name="classCode" value="${ i.classCode }">
							<input type="hidden" name="testType" value="${ i.testType }">
							<input type="submit" value="시험 결과 확인">
						</form>
					</td>
				  </tr>
				 </c:forEach>
				 </table>
				 </c:if>
			
			</div>
		
		<div>
		
		<c:import url="/WEB-INF/views/admin_teacher/teacher/testHW/teacherPagingView.jsp" />
		
		</div>
	</div>
</div>
</body>
</html>