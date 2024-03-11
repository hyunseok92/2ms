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
	height : 150px;	
}

.facility {
	margin-top:3px;
	margin-bottom:3px;
	size : 95px;
}

.divTeacher {
	height : 150px;	
}

.teacher {
	margin-top:3px;
	margin-bottom:3px;
	size : 95px;
}

.divEtc {
	height : 150px;	
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
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script>
$(function(){
	
	var facilityCount = ${requestScope.facilityCount};
	var teacherCount = ${requestScope.teacherCount};
	var etcCount = ${requestScope.etcCount};
	
	if(facilityCount === 0 ) {
		facilityCount = 1;
    }
	
	if(teacherCount === 0 ) {
		teacherCount = 1;
    }
	
	if(etcCount === 0 ) {
    	etcCount = 1;
    }
	
	
	$("#facilityBtn").on("click", function() {
		
		if(facilityCount <= 5) {
			
			var newRow = $("<div>" + facilityCount + "번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' required> <input type='button' value='삭제' id='delbtn'><br><div>");
			
			$(".divFacility").append(newRow);
			facilityCount++;
			
		} else {
			alert("등록 가능한 시설 설문 갯수를 초과했습니다");
		}
		
		return false;
	});
	
	
	$("#teacherBtn").on("click", function() {
		
		if(teacherCount <= 5) {
			var newRow = $("<div>" + teacherCount + "번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' required> <input type='button' value='삭제' id='delbtn'><br><div>");
			
			$(".divTeacher").append(newRow);
			teacherCount++;

		} else {
			alert("등록 가능한 교사 설문 갯수를 초과했습니다");
		}		
		
		return false;

	});
	
	$("#etcBtn").on("click", function() {
		
		if(etcCount <= 5) {
			var newRow = $("<div>" + etcCount + "번 기타 설문 등록 <input type='text' class='etc' size='95' name='survetc' required> <input type='button' value='삭제' id='delbtn'><br><div>");
			
			
			$(".divEtc").append(newRow);
			etcCount++;

		} else {
			alert("등록 가능한 기타 설문 갯수를 초과했습니다");
		}		
		
		return false;

	});
	
	$(".divFacility").on("click", "#delbtn", function() {
        $(this).closest("div").remove();
        facilityCount--;
        
        if(facilityCount === 0 ) {
        	facilityCount = 1;
        }
    });	
	
	$(".divTeacher").on("click", "#delbtn", function() {
        $(this).closest("div").remove();
        teacherCount--;
        
        if(teacherCount === 0 ) {
        	teacherCount = 1;
        }
    });
	
	
	$(".divEtc").on("click", "#delbtn", function() {
        $(this).closest("div").remove();
        etcCount--;
        
        if(etcCount === 0 ) {
        	etcCount = 1;
        }
    });
	
	$("#surveyForm").on("keypress", function(e) {
		if(e.key == "Enter") {
			e.preventDefault();
		}
	});
});

</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/survey.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">설문관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">설문수정</li>
            </ul>
     </div>


	<!--  설문 수정 -->
<form id="surveyForm" action="updateSurvey.do" method="post" >
	<p>설문 종류 :  <select name="surveycate"> 
					<c:if test="${ requestScope.slist[0].survey_cate eq '사전 설문'}">
					<option selected>사전 설문</option>
					<option>중간 설문</option>
					<option>사후 설문</option>
					</c:if>
					<c:if test="${ requestScope.slist[0].survey_cate eq '중간 설문'}">
					<option>사전 설문</option>
					<option selected>중간 설문</option>
					<option>사후 설문</option>
					</c:if>
					<c:if test="${ requestScope.slist[0].survey_cate eq '사후 설문'}">
					<option>사전 설문</option>
					<option>중간 설문</option>
					<option selected>사후 설문</option>
					</c:if>
				</select>
	</p><br>
	<div class="divFacility">
	<p>시설설문 등록 <input type="button" id="facilityBtn" value="추가"> </p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '시설' }">
		<c:if test="${!empty survey.survey1}">
			<div>1번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' value="${survey.survey1}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div>2번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' value="${survey.survey2}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div>3번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' value="${survey.survey3}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div>4번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' value="${survey.survey4}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div>5번 시설 설문 등록 <input type='text' class='facility' size='95' name='survfacility' value="${survey.survey5}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<div class="divTeacher">
	<p>교사설문 등록 <input type="button" id="teacherBtn" value="추가"> </p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '교사' }">
		<c:if test="${!empty survey.survey1}">
			<div>1번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' value="${survey.survey1}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div>2번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' value="${survey.survey2}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div>3번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' value="${survey.survey3}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div>4번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' value="${survey.survey4}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div>5번 교사 설문 등록 <input type='text' class='teacher' size='95' name='survteacher' value="${survey.survey5}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<div class="divEtc">
	<p>기타설문 등록 <input type="button" id="etcBtn" value="추가"> </p>
	<c:forEach items="${requestScope.slist }" var ="survey">
	<c:if test="${survey.survey_type eq '기타' }">
		<c:if test="${!empty survey.survey1}">
			<div>1번 기타 설문 등록 <input type='text' class='etc' size='95' name='survetc' value="${survey.survey1}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey2}">
			<div>2번 기타 설문 등록 <input type='text' class='etc' size='95' name='survetc' value="${survey.survey2}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey3}">
			<div>3번 기타 설문 등록 <input type='text' class='etc' size='95' name='survetc' value="${survey.survey3}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey4}">
			<div>4번 기타 설문 등록 <input type='text' class='etc' size='95' name='survetc' value="${survey.survey4}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
		<c:if test="${!empty survey.survey5}">
			<div>5번 기타 설문 등록 <input type='text' class='etc'  size='95' name='survetc' value="${survey.survey5}" required> <input type='button' value='삭제' id='delbtn'><br></div>
		</c:if>
	</c:if>
	</c:forEach>
	</div>
	<hr>
	<input type="submit" value="수정" id="submit">
</form> 
</div>
</div>
</body>
</html>