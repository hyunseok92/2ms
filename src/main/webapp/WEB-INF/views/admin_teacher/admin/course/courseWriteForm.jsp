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

input[type="text"] {
	width:296px;
	height:25px;
}

input[type="date"] {
	width:296px;
	height:25px;
}

input[type="number"] {
	width:296px;
	height:25px;
}

select {
	width:300px;
	height:25px;
}

#leftBox {
	width:300px;
	height:100px;
}

#adding {
	width:150px;
	height:25px;
	margin-right:91px;
	margin-top:15px;
	margin-bottom:15px;
}

#adding1 {
	width:150px;
	height:25px;
	margin-left:91px;
	margin-top:15px;
	margin-bottom:15px;
}

.wrapper-first {
	display:flex;
	justify-content:center;
}

.wrapper-second {
	align-self: flex-start;
}

h3 {
	margin-top:5px;
}

.wrapper-third {
	
}

.third-one{
	display:flex;
	justify-content:center;
}

.third-one-one {
	align-self: flex-start;
	margin-right:15px;
}

.third-one-two {
	align-self: flex-start;
	margin-left:15px;
}

.third-two{
	display:flex;
	justify-content:center;
}
.third-three{
	justify-content:center;
}

.third-three-one {
	
	display:flex;
	justify-content:center;
}

.third-three-two {
	display:flex;
	justify-content:center;
}

input[name="setTime"]{
	width:28px;
	height:15px;
}

#notNCSTitle {
	margin-top:10px;
}

#notNCSTime {
	margin-top:20px;
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

//비NCS 과목의 비율을 알 수 있는 함수
var ratio = 0;

// 시간 계산 후 프린트하는 메소드
function calculateAndPrint() {
 	
	setTime = Array.from(document.querySelectorAll(
    "input[name='setTime']")).map(element => parseFloat(element.value) || 0);
	
	var resultTime = setTime.reduce(function (total, time) {
        return total + time;
    }, 0);
	
	basicTime = Array.from(document.querySelectorAll("th[name='basicTime']")).map(element => {
	    var text = element.textContent;
	    var match = text.match(/\d+/);
	    return match ? parseInt(match[0], 10) : 0;
	});
	
	var totalTime = basicTime.reduce(function (total, time) {
        return total + time;
    }, 0);

	var check = new Array();
	check = Array.from(document.querySelectorAll(
	"th[name='subjectCode']")).map(element => element.textContent);
	
	var notNCSCount = 0;
	var NCSCount = 0;
	
	for (var i = 0; i < check.length; i++){
		if (check[i] == "") {
			notNCSCount++;
		} else {
			NCSCount++;
		}
	}
	console.log("NCScount : " + NCSCount);
	console.log("notNCSCount : " + notNCSCount);
	
	ratio = notNCSCount / (NCSCount + notNCSCount) * 100;
	
	console.log("비NCS과목 비율 : " + ratio + "%");
	
 	$("#totalTime tr").remove();
	
	$("#totalTime").html("<tr><th colspan='3'>시수합산 : " 
			+ totalTime + "시간 / 현재시수 : " 
			+ resultTime + "시간</th></tr><tr><th colspan='3'>비NCS과목 비율 : " + ratio.toFixed(1) + "%</th></tr>");
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

	$("#confirmSubjs").click(function(){

	})
	
	// Controller에 name 으로 각각 값 보내기
	$("#sendToController").click(function(){
		var sendArray = new Array();
		
		var course = new Object();
		
		var subjectCode = new Array()
		var subjectName = new Array();
		var setTime = new Array();
		
		course.className = $("#className").val();
		course.classGoal = $("#classGoal").val();
		course.executeDate = $("#executeDate").val();
		course.profCode = $("#profCode").val();
		course.profConfirm = $("#profConfirm").val();
		course.uploadDate = $("#uploadDate").val();
		
		subjectCode = Array.from(document.querySelectorAll(
				"th[name='subjectCode']")).map(element => element.textContent);
		subjectName = Array.from(document.querySelectorAll(
				"th[name='subjectName']")).map(element => element.textContent);
		setTime = Array.from(document.querySelectorAll(
				"input[name='setTime']")).map(element => element.value);

		sendArray.push(course);
		sendArray.push(subjectCode);
		sendArray.push(subjectName);
		sendArray.push(setTime);
		
		console.log("sendArray : " + JSON.stringify(sendArray));
		
  		$.ajax({
			url: "insertCourse.do",
			type: "post",
			data: JSON.stringify(sendArray),
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
				
				$("#selectedTable").append("<tr class='selected'><th name='subjectCode'>" 
				+ jsonObj.sublist[index].subjectCode + "</th><th name='subjectName'>" 
				+ decodeURIComponent(jsonObj.sublist[index].subjectName).replace(/\+/gi, " ")
				+ "</th><th name='basicTime'>" + jsonObj.sublist[index].basicTime + "시간 / " 
				+ "<input type='text' name='setTime' class='timeChanged' onchange='timeOnTable(" + addCount + ", this);' value='" 
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
		
		$("#selectedTable").append("<tr class='selected'><th name='subjectCode'>" 
		+ "</th><th name='subjectName'>" 
		+ notNCSTitle
		+ "</th><th name='basicTime'>" + notNCSTime + "시간 / " 
		+ "<input type='text' name='setTime' class='timeChanged' onchange='timeOnTable(" + addCount + ", this);' value='" 
		+ notNCSTime + "'>" + "시간</th><th>" 
		+ "<button onclick='removeFromAdded(this)'>제거하기</button>" 
		+ "</th></tr>");
		
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
				
				
				
<div class="wrapper-first">
	<div class="wrapper-second">
			<h3 style="margin-top:30px;">과정명</h3>
			<input type="text" id="className" name="className" placeholder="과정명">
			<h3>학습목표</h3>
			<textarea id="classGoal" name="classGoal" placeholder="학습목표"
			style="width:298px; height:50px;"></textarea>

			<h3>시행연도</h3>
			<input type="date" id="executeDate" name="executeDate">

			<h3>담당교사명</h3>
			<select id="profCode" name="profCode">
				<option selected disabled>교강사를 선택하세요</option>
				<c:forEach var="teacher" items="${ requestScope.tlist }">
					<option value="${ teacher.prof_Code }">${ teacher.name }</option>
				</c:forEach>
			</select>

			
				<div class="subject_box1">
					<h3>대분류</h3>
					<select id="category1">
						<option selected disabled>대분류를 선택하세요</option>
						<c:forEach var="cate1" items="${ requestScope.clist1 }">
							<option value="${ cate1.firstCategoryName }">${ cate1.firstCategoryName }</option>
						</c:forEach>
					</select>

					<h3>중분류</h3>
					<select id="category2">
						<option selected disabled>중분류를 선택하세요</option>
					</select>

					<h3>소분류</h3>
					<select id="category3">
						<option selected disabled>소분류를 선택하세요</option>
					</select>

					<h3>세분류</h3>
					<select id="category4">
						<option selected disabled>세분류를 선택하세요</option>
					</select>
				</div>
	</div>
</div>				





				<div class="third-one">
					<div class="third-one-one">
					<h3>NCS 과목</h3>
						<select id="leftBox" multiple>
							<option selected disabled>구성할 과목을 선택하세요</option>
						</select>
					</div>
				<div class="third-one-two">
					<h3>비NCS 과목</h3>
					<input type="text" id="notNCSTitle" placeholder="교육할 비NCS 과목명"><br>
					<input type="number" id="notNCSTime" placeholder="교육할 비NCS 과목의 시수"><br>					
				</div>
				</div>	
				
				<div class="third-two">
					<button id="adding">NCS과목 추가 🔽</button>
					<button id="adding1">비NCS과목 추가 🔽</button>
				</div>

				<div class="third-three">
					
				<div class="third-three-one">
					<table id="selectedTable" align="center" border="1" cellspacing="0"
						width="700">
						<tr>
							<th>과목코드</th>
							<th>과목명</th>
							<th>시수</th>
							<th>제거</th>
						</tr>
					</table>
					</div>
					<div class="third-three-two">
					<table id="totalTime" align="center" border="1" cellspacing="0"
						width="700">
					</table>	
				</div>
				</div>			
	

			<div id="insertBtnWrapper"
				style="display: flex; justify-content: center;">
				<button id="sendToController" 
				style="width: 100px; height: 30px; margin-top:15px;">확인</button>
			</div>
		</div>
	</div>

</body>
</html>