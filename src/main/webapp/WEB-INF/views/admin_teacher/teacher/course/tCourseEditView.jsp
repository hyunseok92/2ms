<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육과정 상세페이지</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">

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

select {
	text-align: center;
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

.wrapper {
	display:flex;
	justify-content:center;
}

.wrapper-one {
	align-self: flex-start;
}

button {
	width: 100px; 
	height: 30px; 
	margin-top:15px;
}

.buttons {
	display:flex;
	justify-content:center;
}

.wrapper-one-one {
	display:flex;
	justify-content:center;
	flex-direction: column;
	align-items: center;
}

.wrapper-one-one-one {
	align-self: flex-start;
}

#leftBox {
	margin-top:15px;
	width:500px;
	height:100px;
}
</style>

<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery.min.js">
</script>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import
			url="/WEB-INF/views/admin_teacher/admin_sidemenu/academic.jsp" />
		<div class="mainView">

			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과정</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과목구성</li>
				</ul>
			</div>
			<div class="wrapper">

				<div class="wrapper-one">
					<h3>과정명</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.course.className }</p>
					<br>
					<h3>학습목표</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p style="width:500px; line-height:1.1;">${ requestScope.course.classGoal }</p>
					<br>
					<h3>시행연도</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${fn:substring(course.executeDate, 0, 10)}</p>
					<br>
					<h3>교강사명</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<p>${ requestScope.course.name }강사</p>
					<br>

					<h3>교과목</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<div class="wrapper-one-one">
					
					<select id="leftBox" multiple>
						<option selected disabled>교육할 과목을 순서대로 구성해주세요.</option>
						<c:forEach var="subj" items="${ requestScope.dslist }">
							<option id="subject" value="${ subj.subjectCode }">${ subj.subjectName }</option>
						</c:forEach>
					</select>
					
					<button id="adding" onclick="">추가 🔽</button>
					</div>

					<h3>교과목 구성표</h3>
					<hr width="500" color="#afafaf" style="margin-top: 5px">
					<br>
					<table id="setTable" align="center" width="500" border="0"
						cellspacing="0" cellpadding="5">
						<tr>
							<th>과목코드</th>
							<th>과목명</th>
							<th>시수</th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>

<script type="text/javascript">
$(function(){
	var classcode = new Array();
	var classCode = "${requestScope.course.classCode}";
	var addCount = 0;
	var profcode = new Array();
	var profCode = "${requestScope.course.profCode}";
	
	console.log("classCode : " + classCode);
	console.log("profCode : " + profCode);
	
	$("#adding").click(function(){
		classcode.push(${ requestScope.course.classCode });
		profcode.push(${ requestScope.course.profCode });
		var subjectName = $("#leftBox option:selected");

            $.ajax({
                url: "selectOneDS.do",
                type: "post",
                data:  
                { 
                	subjectName: subjectName.text(),
                	classCode: classCode
                },
                dataType: "json",
                success: function(data){

                    addCount++;
                    console.log(addCount + "개 추가됨");
                    
                    if (data.subjectCode != null) {
	                    $("#setTable").append("<tr><th name='subjectCode'>" + data.subjectCode 
	                    + "</th><th name='subjectName'>" 
	                    + decodeURIComponent(data.subjectName).replace(/\+/gi, " ")
	                    + "</th><th name='setTime'>" 
	                    + data.setTime + "</th></tr>");
                    } else {
                    	$("#setTable").append("<tr><th name='subjectCode'>"
   	                    + "</th><th name='subjectName'>" 
   	                    + decodeURIComponent(data.subjectName).replace(/\+/gi, " ")
   	                    + "</th><th name='setTime'>" 
   	                    + data.setTime + "</th></tr>");
                    }

                    subjectName.remove();
				}
			})
		})

	
	$("#confirmBtn").click(function(){
		var sendArray = new Array();
		
		
		var subjectName = new Array();
		var setTime = new Array();

		subjectName = Array.from(document.querySelectorAll(
			"th[name='subjectName']")).map(element => element.textContent);
		
		sendArray.push(classcode);
		sendArray.push(subjectName);
		sendArray.push(profcode);

		console.log(JSON.stringify(sendArray));
		
		$.ajax({
			url: "setOrder.do",
			type: "post",
			data: JSON.stringify(sendArray),
			contentType: "application/json; charset=UTF-8",
			success: function(result){
				alert("교과목 구성이 완료되었습니다.");
				location.href="atmain.do";
			}
		})
	})
})

</script>

					<div class="buttons">
						<button id="confirmBtn">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>