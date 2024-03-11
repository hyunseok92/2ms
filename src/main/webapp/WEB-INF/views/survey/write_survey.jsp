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

.divFacility {
	height : 220px;	
}

.facility {
	margin-top:3px;
	margin-bottom:3px;
	size : 95px;
}

.divTeacher {
	height : 220px;	
}

.teacher {
	margin-top:3px;
	margin-bottom:3px;
	size : 95px;
}

.divEtc {
	height : 220px;	
}

.etc {
	margin-top:3px;
	margin-bottom:3px;
	size : 95px;
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
   margin-bottom : 10px;
}

.selectNavLi {
   margin-right: 10px;
}

#submit {
	left : 783px;
	position : absolute;
}

#etcArea{
	width : 810px;
	height : 70px;
}

.divScore {
	margin-bottom : 5px;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script>
$(function(){
		
	$("#surveyForm").on("keypress", function(e) {
		if(e.key == "Enter") {
			e.preventDefault();
		}
	});
});

function validateForm() {
    var divfScoreElements = document.querySelectorAll('.divFacility .divScore'); 
    var divfScoreCount = divfScoreElements.length;
    
    var divtScoreElements = document.querySelectorAll('.divTeacher .divScore'); 
    var divtScoreCount = divtScoreElements.length;
    
    var diveScoreElements = document.querySelectorAll('.divEtc .divScore'); 
    var diveScoreCount = diveScoreElements.length;

    $("#divfScoreCount").val(divfScoreCount);
    $("#divtScoreCount").val(divtScoreCount);
    $("#diveScoreCount").val(diveScoreCount);

    return true;
}

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
               <li class="selectNavLi">설문관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">설문작성</li>
            </ul>
     </div>

	<!--  설문 수정 -->
<form id="surveyForm" action="enrollsurveyresult.do" method="post">
	<p>설문 종류 : ${requestScope.slist[0].survey_cate }</p><br>
	<input type="hidden" name="survey_cate" value = "${requestScope.slist[0].survey_cate }">
	<input type="hidden" name="survey_no" value = "${requestScope.slist[0].survey_no }">
	<input type="hidden" name="divfScoreCount" id="divfScoreCount">
	<input type="hidden" name="divtScoreCount" id="divtScoreCount">
	<input type="hidden" name="diveScoreCount" id="diveScoreCount">
	<div class="divFacility">
	<p>시설 설문</p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '시설' }">
		<c:if test="${!empty survey.survey1}">
			<div class="divScore"><b>1번 : ${survey.survey1}</b><br></div>
			<input type="radio" name="fscore1" value="1" required> 매우 그렇지 않다 <input type="radio" name="fscore1" value="2" required> 그렇지 않다 <input type="radio" name="fscore1" value="3" required> 보통이다 <input type="radio" name="fscore1" value="4" required> 그렇다 <input type="radio" name="fscore1" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div class="divScore"><b>2번 : ${survey.survey2}</b><br></div>
			<input type="radio" name="fscore2" value="1" required> 매우 그렇지 않다 <input type="radio" name="fscore2" value="2" required> 그렇지 않다 <input type="radio" name="fscore2" value="3" required> 보통이다 <input type="radio" name="fscore2" value="4" required> 그렇다 <input type="radio" name="fscore2" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div class="divScore"><b>3번 : ${survey.survey3}</b><br></div>
			<input type="radio" name="fscore3" value="1" required> 매우 그렇지 않다 <input type="radio" name="fscore3" value="2" required> 그렇지 않다 <input type="radio" name="fscore3" value="3" required> 보통이다 <input type="radio" name="fscore3" value="4" required> 그렇다 <input type="radio" name="fscore3" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div class="divScore"><b>4번 : ${survey.survey4}</b><br></div>
			<input type="radio" name="fscore4" value="1" required> 매우 그렇지 않다 <input type="radio" name="fscore4" value="2" required> 그렇지 않다 <input type="radio" name="fscore4" value="3" required> 보통이다 <input type="radio" name="fscore4" value="4" required> 그렇다 <input type="radio" name="fscore4" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div class="divScore"><b>5번 : ${survey.survey5}</b><br></div>
			<input type="radio" name="fscore5" value="1" required> 매우 그렇지 않다 <input type="radio" name="fscore5" value="2" required> 그렇지 않다 <input type="radio" name="fscore5" value="3" required> 보통이다 <input type="radio" name="fscore5" value="4" required> 그렇다 <input type="radio" name="fscore5" value="5" required> 매우 그렇다
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<div class="divTeacher">
	<p>교사 설문</p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '교사' }">
		<c:if test="${!empty survey.survey1}">
			<div class="divScore"><b>1번 : ${survey.survey1}</b><br></div>
			<input type="radio" name="tscore1" value="1" required> 매우 그렇지 않다 <input type="radio" name="tscore1" value="2" required> 그렇지 않다 <input type="radio" name="tscore1" value="3" required> 보통이다 <input type="radio" name="tscore1" value="4" required> 그렇다 <input type="radio" name="tscore1" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div class="divScore"><b>2번 : ${survey.survey2}</b><br></div>
			<input type="radio" name="tscore2" value="1" required> 매우 그렇지 않다 <input type="radio" name="tscore2" value="2" required> 그렇지 않다 <input type="radio" name="tscore2" value="3" required> 보통이다 <input type="radio" name="tscore2" value="4" required> 그렇다 <input type="radio" name="tscore2" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div class="divScore"><b>3번 : ${survey.survey3}</b><br></div>
			<input type="radio" name="tscore3" value="1" required> 매우 그렇지 않다 <input type="radio" name="tscore3" value="2" required> 그렇지 않다 <input type="radio" name="tscore3" value="3" required> 보통이다 <input type="radio" name="tscore3" value="4" required> 그렇다 <input type="radio" name="tscore3" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div class="divScore"><b>4번 : ${survey.survey4}</b><br></div>
			<input type="radio" name="tscore4" value="1" required> 매우 그렇지 않다 <input type="radio" name="tscore4" value="2" required> 그렇지 않다 <input type="radio" name="tscore4" value="3" required> 보통이다 <input type="radio" name="tscore4" value="4" required> 그렇다 <input type="radio" name="tscore4" value="5" required> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div class="divScore"><b>5번 : ${survey.survey5}</b><br></div>
			<input type="radio" name="tscore5" value="1" required> 매우 그렇지 않다 <input type="radio" name="tscore5" value="2" required> 그렇지 않다 <input type="radio" name="tscore5" value="3" required> 보통이다 <input type="radio" name="tscore5" value="4" required> 그렇다 <input type="radio" name="tscore5" value="5" required> 매우 그렇다
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<div class="divEtc">
	<p>기타 설문</p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '기타' }">
		<c:if test="${!empty survey.survey1}">
			<div class="divScore"><b>1번 : ${survey.survey1}</b><br></div>
			<input type="radio" name="escore1" value="1"> 매우 그렇지 않다 <input type="radio" name="escore1" value="2"> 그렇지 않다 <input type="radio" name="escore1" value="3"> 보통이다 <input type="radio" name="escore1" value="4"> 그렇다 <input type="radio" name="escore1" value="5"> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div class="divScore"><b>2번 : ${survey.survey2}</b><br></div>
			<input type="radio" name="escore2" value="1"> 매우 그렇지 않다 <input type="radio" name="escore2" value="2"> 그렇지 않다 <input type="radio" name="escore2" value="3"> 보통이다 <input type="radio" name="escore2" value="4"> 그렇다 <input type="radio" name="escore2" value="5"> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div class="divScore"><b>3번 : ${survey.survey3}</b><br></div>
			<input type="radio" name="escore3" value="1"> 매우 그렇지 않다 <input type="radio" name="escore3" value="2"> 그렇지 않다 <input type="radio" name="escore3" value="3"> 보통이다 <input type="radio" name="escore3" value="4"> 그렇다 <input type="radio" name="escore3" value="5"> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div class="divScore"><b>4번 : ${survey.survey4}</b><br></div>
			<input type="radio" name="escore4" value="1"> 매우 그렇지 않다 <input type="radio" name="escore4" value="2"> 그렇지 않다 <input type="radio" name="escore4" value="3"> 보통이다 <input type="radio" name="escore4" value="4"> 그렇다 <input type="radio" name="escore4" value="5"> 매우 그렇다
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div class="divScore"><b>5번 : ${survey.survey5}</b><br></div>
			<input type="radio" name="escore5" value="1"> 매우 그렇지 않다 <input type="radio" name="escore5" value="2"> 그렇지 않다 <input type="radio" name="escore5" value="3"> 보통이다 <input type="radio" name="escore5" value="4"> 그렇다 <input type="radio" name="escore5" value="5"> 매우 그렇다
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<input type="submit" value="제출" id="submit" onclick="return validateForm()">
</form> 
</div>
</div>
</body>
</html>