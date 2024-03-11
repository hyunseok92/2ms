<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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

.timeChanged {
	width:30px;
	text-align:center;
}

select {
	text-align:center;
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
</style>

<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery.min.js">
</script>

<script type="text/javascript">
// ================== 과목 추가 및 드롭다운메뉴 필터 관련 ==================
var totalTime = 0;
var addCount = 0;
var resultTime = 0;
var timeChanged = 0;

// 시간 계산 후 프린트하는 메소드
function calculateAndPrint() {
 	
	totalTime = 0;
	for (var i = 0; i < addCount + 1; i++) {
	    var originTimeStr = $("#originTime" + i).text();
	    var originTime = parseInt(originTimeStr, 10);

	    if (!isNaN(originTime)) {
	        totalTime += originTime;
	        console.log("addCount값 : " + addCount);
	    }
	}
	
	resultTime = 0;
	for (var i = 0; i < addCount + 1; i++) {
	    var originTimeStr = $("#timeChanged" + i).val();
	    var originTime = parseInt(originTimeStr, 10);

	    if (!isNaN(originTime)) {
	        resultTime += originTime;
	    }
	}

 	$("#totalTime tr").remove();
	
	$("#totalTime").html("<tr><th colspan='3'>시수합산 : " 
			+ totalTime + "시간 / 현재시수 : " 
			+ resultTime + "시간</button></th></tr>");
}

// 표에 추가된 항목을 다시 제거하는 함수
function removeFromAdded(button){
	var row = $(button).closest('tr');
    row.remove();
	addCount--;
	calculateAndPrint();
}

function timeOnTable(addCount, element){
	calculateAndPrint();
}

$(function(){
	

	// Controller에 name 으로 각각 값 보내기
	$("#sendToController").click(function(){
		
	var courseAndSubjs = new Array();
	var subjs = new Array();
		// 값이 담겨있다면 비우기
		course = [];
		subjs = [];
		
		var course = new Object();
		
		course.className = $("#className").val();
		course.classGoal = $("#classGoal").val();
		course.executeDate = $("#executeDate").val();
		course.profCode = $("#profCode").val();
		course.profConfirm = $("#profConfirm").val();
		course.uploadDate = $("#uploadDate").val();
		
		// 과목 Object를 반복문으로 course에 담는다.
		for (var i = 1; i < addCount + 1; i++) {
		    var originTimeStr = $("#timeChanged" + i).val();
		    var originTime = parseInt(originTimeStr, 10);
		    var subjCode = $("#subjName" + i + " th:eq(0)").text();
		    var subjName = $("#subjName" + i + " th:eq(1)").text();
			
		    console.log("과목명 : " + subjName);
		    
		    var subj = new Object();
		    subj.subjectCode = subjCode;
		    subj.subjectName = subjName;
		    subj.setTime = originTime;
		
		    subjs.push(subj);
		}
		
		courseAndSubjs.push(course);
		courseAndSubjs.push(subjs);
		console.log(JSON.stringify(courseAndSubjs));
//		console.log("course 값\n" + JSON.stringify(course));
		
		$.ajax({
			url: "insertCourse.do",
			type: "post",
			data: JSON.stringify(courseAndSubjs),
			contentType: "application/json; charset=UTF-8",
			success: function(result){
				alert("과정이 정상적으로 작성되었습니다.");
				location.href = "courseList.do";
			}
		})
	})
	
	// NCS과목을 선택한 과목 테이블로 옮기는 함수
	$("#adding").click(function(){
		$.ajax({
			url: "select5thCate.do",
			type: "post",
			data: { keyword : $("#category4").val() },
			dataType: "JSON",
			success: function(dataObj){
				var objStr = JSON.stringify(dataObj);
				var jsonObj = JSON.parse(objStr);
				var index = document.getElementById("leftBox").selectedIndex;
				var output = $("#totalTime").html();
				var rows = $("#selectedTable tr");
				
				addCount++;
				
				$("#selectedTable").append("<tr class='selected' id='subjName" + addCount + "'><th>" 
				+ jsonObj.sublist[index].subjectCode + "</th><th>" 
				+ decodeURIComponent(jsonObj.sublist[index].subjectName).replace(/\+/gi, " ")
				+ "</th><th id='originTime" + addCount + "'>" 
				+ jsonObj.sublist[index].basicTime + "시간 / " 
				+ "<input type='text' name='basicTime' class='timeChanged' id='timeChanged" + addCount + "' onchange='timeOnTable(" + addCount + ", this);' value='" 
				+ jsonObj.sublist[index].basicTime + "'>" + "시간</th><th>" 
				+ "<button onclick='removeFromAdded(this)'>제거하기</button>" 
				+ "</th></tr>");
				
				console.log("\naddCount : " + addCount);
				calculateAndPrint();
			}
		})
	})
	
	// 비NCS과목을 선택한 과목 테이블로 옮기는 함수
	$("#adding1").click(function(){
		console.log("비NCS과목 추가버튼");
		var output = $("#totalTime").html();
		var rows = $("#selectedTable tr");
		var notNCSTitle = $("#notNCSTitle").val();
		var notNCSTime = $("#notNCSTime").val();
		
		addCount++;
		
		$("#selectedTable").append("<tr class='selected' id='subjName" + addCount + "'><th>"
				+ "</th><th>" + notNCSTitle
				+ "</th><th id='originTime" + addCount + "'>" 
				+ notNCSTime + "시간 / " 
				+ "<input type='text' name='basicTime' class='timeChanged' id='timeChanged" + addCount + "' onchange='timeOnTable(" + addCount + ", this);' value='" 
				+ notNCSTime + "'>" + "시간</th><th><button onclick='removeFromAdded(this)'>제거하기</button></th></tr>");
		
		console.log("\naddCount : " + addCount);
		calculateAndPrint();

	})
	
	$("#category1").change(function(){
		$.ajax({
			url: "select2ndCate.do",
			type: "post",
			data: { keyword : $("#category1").val() },
			dataType: "JSON",
			success: function(dataObj){
				console.log("firstCate : " + dataObj);
				
				var objStr = JSON.stringify(dataObj);
				var jsonObj = JSON.parse(objStr);
				
				var output = $("#category2").html();
				
				for (var i in jsonObj.clist2){
					output += "<option value='" 
					+ decodeURIComponent(jsonObj.clist2[i].secondCateName) + "' >" 
					+ decodeURIComponent(jsonObj.clist2[i].secondCateName) + "</option>";
				}
				
				$("#category2").html(output);
			}
		});
	});
	
	$("#category2").change(function(){
		$.ajax({
			url: "select3rdCate.do",
			type: "post",
			data: { keyword : $("#category2").val() },
			dataType: "JSON",
			success: function(dataObj){
				console.log("secondCate : " + dataObj);
				
				$("#category3 option:not(:first)").remove();
				
				var objStr = JSON.stringify(dataObj);
				var jsonObj = JSON.parse(objStr);
				
				var output = $("#category3").html();
				
				for (var i in jsonObj.clist3){
					output += "<option value='" 
					+ decodeURIComponent(jsonObj.clist3[i].thirdCateName) + "' >" 
					+ decodeURIComponent(jsonObj.clist3[i].thirdCateName) + "</option>";
				}
				
				$("#category3").html(output);
			}
		});
	});
	
	$("#category3").change(function(){
		$.ajax({
			url: "select4thCate.do",
			type: "post",
			data: { keyword : $("#category3").val() },
			dataType: "JSON",
			success: function(dataObj){
				console.log("thirdCate : " + dataObj);
				
				$("#category4 option:not(:first)").remove();
				
				var objStr = JSON.stringify(dataObj);
				var jsonObj = JSON.parse(objStr);
				
				var output = $("#category4").html();
				
				for (var i in jsonObj.clist4){
					output += "<option value='" 
					+ decodeURIComponent(jsonObj.clist4[i].fourthCateName) + "' >" 
					+ decodeURIComponent(jsonObj.clist4[i].fourthCateName) + "</option>";
				}
				
				$("#category4").html(output);
			}
		});
	});
	
	$("#category4").change(function(){
		$.ajax({
			url: "select5thCate.do",
			type: "post",
			data: { keyword : $("#category4").val() },
			dataType: "JSON",
			success: function(dataObj){
				console.log("fourthCate : " + dataObj);
				
				$("#leftBox option").remove();
				
				var objStr = JSON.stringify(dataObj);
				var jsonObj = JSON.parse(objStr);
				
				var output = $("#leftBox").html();
				
				for (var i in jsonObj.sublist){
					output += "<option value='" 
					+ decodeURIComponent(jsonObj.sublist[i].subjectName).replace(/\+/gi, " ") + "' >" 
					+ decodeURIComponent(jsonObj.sublist[i].subjectName).replace(/\+/gi, " ") + "</option>";
				}
				
				$("#leftBox").html(output);
			}
		});
	});
});
</script>

</head>

<body>

	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/academic.jsp" />

		<div class="mainView">

			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과정</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과정설계</li>
				</ul>
			</div>

			<input type="hidden" id="profConfirm" name="profConfirm" value="N">
			<input type="hidden" id="uploadDate" name="uploadDate"
				value="SYSDATE">

			<h5>과정명</h5>
			<input type="text" id="className" name="className" placeholder="과정명">
			<h5>학습목표</h5>
			<input type="text" id="classGoal" name="classGoal" placeholder="학습목표">

			<h5>시행연도</h5>
			<input type="date" id="executeDate" name="executeDate">

			<h5>담당교사명</h5>
			<select id="profCode" name="profCode">
				<option selected disabled>교강사를 선택하세요</option>
				<c:forEach var="teacher" items="${ requestScope.tlist }">
					<option value="${ teacher.prof_Code }">${ teacher.name }</option>
				</c:forEach>
			</select>

			<div>
				<div class="subject_box1">
					<h5>대분류</h5>
					<select id="category1">
						<option selected disabled>대분류를 선택하세요</option>
						<c:forEach var="cate1" items="${ requestScope.clist1 }">
							<option value="${ cate1.firstCategoryName }">${ cate1.firstCategoryName }</option>
						</c:forEach>
					</select>

					<h5>중분류</h5>
					<select id="category2">
						<option selected disabled>중분류를 선택하세요</option>
					</select>

					<h5>소분류</h5>
					<select id="category3">
						<option selected disabled>소분류를 선택하세요</option>
					</select>

					<h5>세분류</h5>
					<select id="category4">
						<option selected disabled>세분류를 선택하세요</option>
					</select>

					<h5>NCS 과목</h5>
					<div>
						<select id="leftBox" size="1">
							<option selected disabled>구성할 과목을 선택하세요</option>
						</select>
					</div>
					<button id="adding">추가 ➡️</button>
					
					<h5>비NCS 과목</h5>
					<input type="text" id="notNCSTitle" placeholder="교육할 비NCS 과목명">
					<input type="number" id="notNCSTime" placeholder="교육할 비NCS 과목의 시수">					
					<button id="adding1">추가 ➡️</button>
				</div>

				<div class="subject_box2">
					<h5>과정</h5>

					<table id="selectedTable" align="center" border="1" cellspacing="0"
						width="700">
						<tr>
							<th>과목코드</th>
							<th>과목명</th>
							<th>시수</th>
							<th>제거</th>
						</tr>
					</table>
					<table id="totalTime" align="center" border="1" cellspacing="0"
						width="700">
					</table>
				</div>
			</div>

			<div id="insertBtnWrapper"
				style="display: flex; justify-content: center;">
				<button id="sendToController" style="width: 100px; height: 30px;">확인</button>
			</div>
		</div>
	</div>

</body>
</html>