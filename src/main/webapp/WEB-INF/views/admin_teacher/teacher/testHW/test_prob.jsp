<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

ul {
	list-style-type: none;
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

.selectNav {
	width: 90%;
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
	font-family: 'munhwa';
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	margin-right: 10px;
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
.btnprop{
width:100%;
}
.finaltestopen:hover {
background-color: rgba(51, 105, 30, 0.5);
}
.finaltestopen{
left:12%; position:relative; height:23px; width:78px; font-size: 10px; font-weight:bold; background-color:green;color:white; border:none;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
function testOpen(){
	var sum = $('#sumScore').val();
	if(sum != 100){
		alert("총 점수 합계가 100점이 아닙니다. 문제 점수를 수정해 주세요.");
	}else{
		location.href = "${ pageContext.servletContext.contextPath}/MtestOpen.do?testCode="
				+ $('#testCode').val() +"&teacherCode=${ sessionScope.teacher.prof_Code }"
	}
}
function checkInput() {
    var testScore = document.getElementById('testScore').value;
    var testQ = document.getElementById('testQ').value;
    var testQ1 = document.getElementById('testQ1').value;
    var testQ2 = document.getElementById('testQ2').value;
    var testQ3 = document.getElementById('testQ3').value;
    var testQ4 = document.getElementById('testQ4').value;
    var testRA = document.getElementById('testRA').value;
    var ability = document.getElementById('ability').value;

    if (testScore && testQ1 && testQ2 && testQ3 && testQ4 && testRA && testQ && ability !== '능력별단위요소' ) {
        document.getElementById('probSubmitBtn').disabled = false;
    } else {
        document.getElementById('probSubmitBtn').disabled = true;
    }
}
function ucheckInput() {
    var testScore = document.getElementById('utestScore').value;
    var testQ = document.getElementById('utestQ').value;
    var testQ1 = document.getElementById('utestQ1').value;
    var testQ2 = document.getElementById('utestQ2').value;
    var testQ3 = document.getElementById('utestQ3').value;
    var testQ4 = document.getElementById('utestQ4').value;
    var testRA = document.getElementById('utestRA').value;
    var ability = document.getElementById('uability').value;

    if (testScore && testQ1 && testQ2 && testQ3 && testQ4 && testRA && testQ && ability !== '능력별단위요소') {
        document.getElementById('uprobSubmitBtn').disabled = false;
    } else {
        document.getElementById('uprobSubmitBtn').disabled = true;
    }
}
$(document).ready(function() {
    var message = "${requestScope.message}";
    
    if (message) {
        alert(message);
    }
});
function deleteMProb(value){
	console.log(value);
	var values = event.target.value.split(',');
	location.href = "${ pageContext.servletContext.contextPath}/delMprop.do?testNo=" + values[0] + "&testCode=" + $('#testCode').val() + "&testQ1=" + values[1];
	alert("문제 삭제 완료");
}
function updateMProb(value){
	var values = event.target.value.split(',');
	
	$('#fixnone').css('display', 'block');
	
	$('#utestNo').val(values[0]);
	$('#uability').val(values[1]);
	$('#utestQ').val(values[2]);
	$('#utestQ1').val(values[3]);
	$('#utestQ2').val(values[4]);
	$('#utestQ3').val(values[5]);
	$('#utestQ4').val(values[6]);
	$('#utestRA').val(values[7]);
	$('#utestScore').val(values[8]);
}
function displayok(){
	$('#fixnone').css('display', 'none');
}
$(function(){
	   
	   $.ajax({
	      url: "selectMprob.do",
	      type: "post",
	      data: { testcode : $('#testCode').val()} ,
	      dataType: "json",
	      success: function(data){
	         console.log("success : " + data);
	         
	         //object --> string
	         var str = JSON.stringify(data);
	         
	         //string --> json
	         var json = JSON.parse(str);
	         
	         values = "<tr class='proptable'><td>번호</td><td>능력별단위요소</td><td>문제</td><td>정답</td><td>배점</td><td>수정</td><td>삭제</td></tr>";         
	         for(var i in json.list){
	            values += "<tr class='proptd'><td>" + json.list[i].testnol 
	                  + "</td><td>" 
	                  + decodeURIComponent(json.list[i].testabilityl).replace(/\+/gi, " ") 
	                  + "</td><td>"
	                  + decodeURIComponent(json.list[i].testql).replace(/\+/gi, " ")  + "</td>"
	                  +"<td>" + decodeURIComponent(json.list[i].testral).replace(/\+/gi, " ") 
	                  + "번</td><td>" 
	                  + json.list[i].testscorel  
	                  + "점</td><td>"
	                  + "<button value='"+ json.list[i].testnol  +","
	                  + decodeURIComponent(json.list[i].testabilityl).replace(/\+/gi, " ") 
	                  +","
	                  + decodeURIComponent(json.list[i].testql).replace(/\+/gi, " ") + ","
	                  + decodeURIComponent(json.list[i].testq1l).replace(/\+/gi, " ") + ","
	                  + decodeURIComponent(json.list[i].testq2l).replace(/\+/gi, " ") + ","
	                  + decodeURIComponent(json.list[i].testq3l).replace(/\+/gi, " ") + ","
	                  + decodeURIComponent(json.list[i].testq4l).replace(/\+/gi, " ") + ","
	                  + decodeURIComponent(json.list[i].testral).replace(/\+/gi, " ") + ","
	                  + json.list[i].testscorel
	                  +"' onclick='updateMProb(this.value);'class='btnprop'>수정하기</button>"
	                  + "</td><td>"
	                  + "<button class='btnprop' value='"+ json.list[i].testnol  +","+decodeURIComponent(json.list[i].testq1l).replace(/\+/gi, " ")+"' onclick='deleteMProb(this.value);'>삭제하기</button>"
	                  + "</td></tr>";
	         }
	         $('#scoreSum').html('<input style="width:25px;border:none;" name="sumScore" id="sumScore" type="hidden" value="' + json.sumScore + '" readonly>');
	         
	         $('#MprobList').html($('#MprobList').html() + values);
	         $('#sumScore2').val($('#sumScore').val());
	       
	      },
	      error: function(jqXHR, textStatus, errorThrown){
	         console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	      }
	   });  //ajax
}); 
</script>

<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/admin_teacher/t_sidemenu/t_test.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">시험출제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과목별 시험생성</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">객관식 문제생성</li>
				</ul>

			</div>
			<div>
				<div>
					
					<div class="ttestup" style="margin-top:10px; border-bottom:solid 1px rgba(51, 105, 30, 0.5); width:80%; height:25px; display:flex; align-items: center;">
						<form action="updateTtest.do" method="post">
							<input type="hidden" id="testcode" name="testCode" value="${ requestScope.testcode }">
							<input type="hidden" id="testtype" name="testType" value="${ requestScope.testType }">
							<input type="hidden" value="${teacher.prof_Code}" name="teacherCode">
							<ul style="display:flex">
								<li id="classNameI" style="font-weight:bold; margin-right:20px;">${ requestScope.classname }</li>
								<li id="subjectNameI" style="margin-right:20px;">${ requestScope.subjectname }</li>
								<li style="font-weight:bold;">시작 날짜 : <input type="date" name="testStartDate" value="${ requestScope.startdate }"style="margin-right:20px;height:13px;"></li>
								<li style="font-weight:bold;">마감 날짜 : <input type="date" name="testEndDate" value="${ requestScope.enddate }"style="margin-right:20px;height:13px;"></li>
								<li><input type="submit" value="시험 날짜 수정"style="font-size:10px; height:17px; margin-right:20px;"></li>
							</ul>
						</form>
						<div style="display:flex;"><div style="margin-right:20px; font-weight:bold;">문제 총점 :</div><div id=scoreSum2></div><input style="width:25px;border:none;" id="sumScore2" type="text" value="0" readonly><div> 점</div> </div>
											<button class="finaltestopen" onclick="testOpen();" >시험 출제</button>
					</div>
					</div>
					<div style="display:flex;">
					<div style="margin-top:10px;">
					<form action="insertProb.do" method="post">
						<div id=scoreSum></div>
						<input type="hidden" value="${ requestScope.testcode }"
							id="testCode" name="testCode">
						<ul style="display:flex">
							<li><select name="ability" id="ability"
								onchange="checkInput();" style="margin-right:20px;">
									<option disabled selected>능력별단위요소</option>
									<c:forEach items="${ requestScope.alist }" var="t">
										<option value="${ t.ability }">${ t.ability }</option>
									</c:forEach>
							</select></li>
							<li>배점<input type="number" id="testScore" name="testScore"
								oninput="checkInput();" min="1" max="100" style="width:37px;"></li>
						</ul>
						<ul>
							<li><div>문제</div><div style="display:flex;"><input type="text" id="testQ" name="testQ" style="width:226px;"
								oninput="checkInput();"><div>정답<input type="number" id="testRA" name="testRA"
								oninput="checkInput();" min="1" max="4"></div></div></li>
								
							<li><div>1.</div><input type="text" id="testQ1" name="testQ1" oninput="checkInput();" style="width:305px;"></li>
							<li><div>2.</div><input type="text" id="testQ2" name="testQ2" oninput="checkInput();" style="width:305px;"></li>
							<li><div>3.</div><input type="text" id="testQ3" name="testQ3" oninput="checkInput();" style="width:305px;"></li>
							<li><div>4.</div><input type="text" id="testQ4" name="testQ4" oninput="checkInput();" style="width:305px;"></li>
							
							<li><input type="submit" value="문제추가" id="probSubmitBtn"
								disabled style="width:307px;"></li>
						</ul>
					</form>
					</div>
				
				<div id="probList" style="margin-left:190px; margin-top:10px;">
					<table id="MprobList" style="width: 850px;">

					</table>
				</div>
				</div>
				<div id="fixnone" style="width:350px; background-color: white; position:absolute;z-index:2;top:66px;display:none;">
					<form action="updateMprop.do" method="post">
						<input type="hidden" id="utestNo" name="testNo"> <input
							type="hidden" value="${ requestScope.testcode }" id="utestCode"
							name="testCode">
						<ul>
							<li><div style="display:flex;"><div style="margin-right:20px;"><select name="ability" id="uability"
								onchange="ucheckInput();">
									<option disabled selected>능력별단위요소</option>
									<c:forEach items="${ requestScope.alist }" var="t">
										<option value="${ t.ability }">${ t.ability }</option>
									</c:forEach>
							</select></div>
							<div>배점<input type="number" id="utestScore" name="testScore"
								oninput="ucheckInput();" min="1" max="100" style="width:37px;"></div></div></li>
							
							<li><div>문제</div><div style="display:flex;"><input type="text" id="utestQ" name="testQ"
								oninput="ucheckInput();"style="width: 226px;"><div>정답<input type="number" id="utestRA" name="testRA"
								oninput="checkInput();" min="1" max="4"></div></div></li>
							<li><div>1.</div><input type="text" id="utestQ1" name="testQ1" oninput="ucheckInput();" style="width: 305px;"></li>
							<li><div>2.</div><input type="text" id="utestQ2" name="testQ2" oninput="ucheckInput();"style="width: 305px;"></li>
							<li><div>3.</div><input type="text" id="utestQ3" name="testQ3" oninput="ucheckInput();"style="width: 305px;"></li>
							<li><div>4.</div><input type="text" id="utestQ4" name="testQ4" oninput="ucheckInput();"style="width: 305px;"></li>
							<li><input type="submit" value="수정완료" id="uprobSubmitBtn"
								disabled style="width: 305px;"></li>
						</ul>
					</form>
					<button onclick="displayok();"style="width: 305px;">수정 취소</button>
				</div>
			</div>


		</div>


	</div>
</body>
</html>