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
td{
border:rgba(51, 105, 30, 0.5) solid 1px;

}
table{
border-collapse: collapse;


}
.tabletitle{
background: green;
color: white;
}
.tablesub{
background: whitesmoke;

}
button{
width:100%;
height:100%;
}
.titleLi{
margin-right:10px;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">


//과목 불러오기
$(function(){
	$('#selectClass').change(function(){
		var select = $('#selectClass').val();
		console.log(select);
		$('#selectSub').css('display', 'block');
		$('#noneSelect').css('display', 'none');
	    $.ajax({
			url : "SubClass.do",
			type: "post",
			data: {classcode : $('#selectClass').val()} ,
			dataType: "Json",
			success: function(data){
				var str = JSON.stringify(data);  
		        var json = JSON.parse(str);
				var space = " "
				var values = "<tr class='tabletitle'><td>과목</td><td>수정/삭제</td></tr><tr class='tablesub'>"; 
				if(select !== 'null'){
					  for(var i in json.nlist){
						  var subjectname = decodeURIComponent(json.nlist[i].subjectname).replace(/\+/gi, space);
						  var classname = decodeURIComponent(json.nlist[i].classname).replace(/\+/gi, space);
						  var classcode = decodeURIComponent(json.nlist[i].classcode).replace(/\+/gi, space);
						  var subjectcode = decodeURIComponent(json.nlist[i].subjectcode).replace(/\+/gi, space);
						 values += "<input type='hidden' value='"+ classcode  +"' id='classCode"+ subjectcode +"' name='classCode'>"
								+ "<input type='hidden' value='"+ classname  +"' id='className"+ subjectcode +"' name='className'>"
						 		+ "<input type='hidden' value='"+ subjectname  +"' id='subjectName"+ subjectcode +"' name='subjectName'>"
							  	+ "<td><input type='hidden' value='"+ subjectcode  +"' id='subjectCode"+ subjectcode +"' name='subjectCode'>" + decodeURIComponent(json.nlist[i].subjectname).replace(/\+/gi, space) + "</td>"
			                  	+ "</td><td><button id='"+ subjectcode +"' value='"+ subjectcode +"' onclick='subBox(this.value);'>시험목록생성</button></td></tr>"
								 
					$('#selectSub').html(values);             
			         }
				}else{
					$('#selectSub').html("<tr><td>과정을 선택해 주세요</td><tr>"); 
				}
			}
		}); //ajax 
	});	//click
}); //document.ready


//시험 목록 불러오기
function subBox(value){
	$('#selectSubmenu').css('display', 'grid');
	var classCode = '#classCode' + value;
	var className = '#className' + value;
	var subjectName = '#subjectName' + value;
	var subjectcode = '#subjectCode' + value;
	console.log(subjectcode);
	$("#classNameI").text($(className).val());
	$("#subjectNameI").text($(subjectName).val());
	$("#subjectCodeI").val($(subjectcode).val());
	var classCodeI = $(classCode).val();
	$("#classCodeI").val(classCodeI);
	$.ajax({
		url : "selectOpenTest.do",
		type: "post",
		data: {subjectCode : $(subjectcode).val()} ,
		dataType: "Json",
		success: function(data){
			var str = JSON.stringify(data);  
	        var json = JSON.parse(str);
			var space = " "
			var pvalues = "<tr class='tabletitle'><td>출제여부</td><td>과정명</td><td>과목명</td><td>문항수</td><td>시작날짜</td><td>마감날짜</td><td>수정</td><td>삭제</td></tr>"; 
			var mvalues = "<tr class='tabletitle'><td>출제여부</td><td>과정명</td><td>과목명</td><td>문항수</td><td>시작날짜</td><td>마감날짜</td><td>수정</td><td>삭제</td></tr>"; 
			if(json.slist !== null){
			for(var i in json.slist){
					  var testType = decodeURIComponent(json.slist[i].subjectname).replace(/\+/gi, space);
					  var testYN
					  var testC
					  if(json.slist[i].testCountYN === 0){
						  testYN = '수정요망'
					  }else{
						  testYN = '시험출제완료'
					  }
					  if(json.slist[i].testCount != null){
						  testC = json.slist[i].testCount;
					  }else{
						  testC = 0;
					  }
					if(decodeURIComponent(json.slist[i].testType).replace(/\+/gi, space) === "주관식"){
					 pvalues += "<tr class='tablesub'>"
					 		+ "<td>" + testYN + "</td>"
						  	+ "<td>" + $(className).val() + "</td>"
						  	+ "<td>" + $(subjectName).val() + "</td>"
						  	+ "<td>" + testC + "</td>"
						  	+ "<td>" + json.slist[i].startDate + "</td>"
						  	+ "<td>" + json.slist[i].endDate + "</td>"
		                  	+ "<td><button id='testUp' value='"+ json.slist[i].testCode +"' onclick='mupBox(this.value);'>시험수정</button></td>"
		                  	+ "<td><button id='testDe' value='"+ json.slist[i].testCode + "," + json.slist[i].subjectcode +"' onclick='deBox(this.value);'>시험삭제</button></tr>"
					}else{
						mvalues += "<tr class='tablesub'>"
				 		+ "<td>" + testYN + "</td>"
					  	+ "<td>" + $(className).val() + "</td>"
					  	+ "<td>" + $(subjectName).val() + "</td>"
					  	+ "<td>" + testC + "</td>"
					  	+ "<td>" + json.slist[i].startDate + "</td>"
					  	+ "<td>" + json.slist[i].endDate + "</td>"
	                  	+ "<td><button id='testUp' value='"+ json.slist[i].testCode +"' onclick='pupBox(this.value);'>시험수정</button></td>"
	                  	+ "<td><button id='testDe' value='"+ json.slist[i].testCode + "," + json.slist[i].subjectcode +"' onclick='deBox(this.value);'>시험삭제</button></tr>"
					
						}
					}
				$('#pTest').html(pvalues); 
				$('#mTest').html(mvalues); 
		         }
		}
			
	});
	
};

function mupBox(value){
	console.log(value);
	location.href ="${ pageContext.servletContext.contextPath}/mProbView.do?testCode=" + value;
	
}
function pupBox(value){
	console.log(value);
	location.href ="${ pageContext.servletContext.contextPath}/probView.do?testCode=" + value;
	
}
function deBox(value){
	var values = event.target.value.split(',');
	var button = "#" + values[1];
	var className = '#className' + value;
	var subjectName = '#subjectName' + value;
	console.log(values[1]);
	 $.ajax({
			url : "deleteTest.do",
			type: "post",
			data: {testCode : values[0]} ,
			success: function(data){
				if(data == "ok"){
					$(button).trigger('click');
					alert("삭제완료");
				}
			}
		}); //ajax 
		
}
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
				</ul>
			</div>
			<div style="margin-top:10px;">
				<select name="selectClass" id="selectClass" style="justify-content: left; display: block;">
					<option value="null" disabled selected>과정선택</option>
					<c:forEach items="${ requestScope.list }" var="t">
						<option value="${ t.classCode }">${ t.className }</option>
					</c:forEach>
				</select>
				<table id="selectSub" style="display:none; justify-content: center;margin-top:10px; width:500px;"><tr><td class="tabletitle" style="text-align: center;">과목</td>
				<td class="tabletitle" style="text-align: center;">수정/삭제</td></tr><tr><td colspan="2">과정을 선택해주세요.<td></tr></table>
				<div id="noneSelect" style="font-size:20px;margin-top:10px;">*과목을 선택해 주세요.</div>
			</div>
			<div class="selectSubmenu" id="selectSubmenu" style="display:none">
			<div class="openTest" style="margin-top:10px; border-bottom:solid 1px rgba(51, 105, 30, 0.5); width:80%; height:25px;">
				<form action="insertTest.do" method="post">
				<input type="hidden" id="classCodeI" name="classCode" value="dd">
				<input type="hidden" id="subjectCodeI" name="subjectCode">
				<input type="hidden" value="${sessionScope.teacher.prof_Code }" name="teacherCode">
				<ul style="display:flex;">
					<li class="titleLi" id="classNameI" style="font-weight:bold;"></li>				
					<li class="titleLi" id="subjectNameI"></li>
					<li class="titleLi" style="font-weight:bold;">문제 유형 : </li>
					<li class="titleLi" >
						<select name="testType" style="height:17px">
							<option disabled selected>문제유형</option>
							<option value="객관식">객관식</option>
							<option value="주관식">주관식</option>
						</select>
					</li>
					<li class="titleLi" style="font-weight:bold;">시험 시작 날짜 : </li>
					<li class="titleLi"><input type="date" name="testStartDate" style="height:13px"></li>
					<li class="titleLi" style="font-weight:bold;">시험 마감 날짜 : </li>
					<li class="titleLi"><input type="date" name="testEndDate" style="height:13px"></li>
					<li class="titleLi"><input type="submit" value="시험생성"></li>
				</ul>
				</form>
			</div>
				<div class="pTest" style="margin-top:10px">
				<div style="font-weight:bold;">주관식 시험</div>
					<table id="pTest" style="width:90%">
					
					</table>
			
				</div>
				<div class="mTest" style="margin-top:10px">
				<div style="font-weight:bold;">객관식 시험</div>
					<table id="mTest" style="width:90%">
					
					</table>
			
				</div>
			</div>

		</div>
	</div>
</body>
</html>