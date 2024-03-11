<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
<link  rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style type="text/css">
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

.searchForm {
	display : flex;
}

.mainView {
	display : grid;
	text-align : center;
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

.top {
	display : flex;
}

.bottom {
	height : 800px;
}


.fmaindiv {
	width : 100%;
	height : 33%;
	margin : 10px;

}

.tmaindiv {
	width : 100%;
	height : 33%;
	margin : 10px;
	
}

.emaindiv {
	widht : 100%;
	height : 33%;
	margin : 10px;
	
}

.ftext {
	height: 10%;
	text-align : left;
}



.ttext {
	height : 10%;
	text-align : left;
}

.etext {
	height : 10%;
	text-align : left;
}

.fchartdiv {
	width : 100%;
	height : 80%;
}

.tchartdiv {
	width : 100%;
	height : 80%;
}

.echartdiv {
	width : 100%;
	height : 80%;
}

.fchart-container {
  width: 15%; /* 원하는 너비 설정 */
  height: 100%;
  float: left; /* 좌측으로 정렬 */
  box-sizing: border-box;
  margin : 13px;
}

.tchart-container {
  width: 15%; /* 원하는 너비 설정 */
  height: 100%;
  float: left; /* 좌측으로 정렬 */
  box-sizing: border-box;
  margin : 13px;
}

.echart-container {
  width: 15%; /* 원하는 너비 설정 */
  height: 100%;
  float: left; /* 좌측으로 정렬 */
  box-sizing: border-box;
  margin : 13px;
}

.myPieChart {
	width : 100%;
}

</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
	
<script type="text/javascript">
	function selectChange(selectElement) {
		
		var selectedValue = selectElement.value;
				
		if(selectedValue != '과정 선택') {
			
			$.ajax({
				url : "selectsurvcate.do",
				type : "post",
				data : {keyword : selectedValue},
				dataType : "json",
				success : function(dataObj) {
					
					//object => string
					var objStr = JSON.stringify(dataObj);
					//string => parsing : json object
					var jsonObj = JSON.parse(objStr);
					
					$("#selectCate option").remove();
					
					var output = $("#selectCate").html();
					
					output += "&nbsp;&nbsp; 설문 종류 : "
					for(var i in jsonObj.catelist) {
						output += "<option value='" + jsonObj.catelist[i].surv_no +"'>"
							+ decodeURIComponent(jsonObj.catelist[i].surv_cate).replace(/\+/gi, " ")
							+ "</option>";
					}
					
					$("#selectCate").html(output);
				}
			});
		} else {
			$("#selectCate option").remove();
			alert("과정을 선택해주세요");
		} 
	}
	

</script>
<script>
$(function(){
	
	function addChart(ctx, title, data) {
		
		 var existingChart = Chart.getChart(ctx);

		  if (existingChart) {
			  existingChart.destroy();
		  }
		
		var chartData = {
				  labels: ['전혀아니다', '아니다', '보통이다', '그렇다', '매우그렇다'],
				  datasets: [
				    {
				      data: [data[0], data[1], data[2], data[3], data[4]],
				      backgroundColor: ['red', 'green', 'blue', 'yellow', 'orange'] // 각 섹션의 색상 설정
				    }
				  ]
				};	  
					  
				var chartOptions = {
						  type: 'pie',
						  data: chartData,
						  options: {
						    plugins: {
						      title: {
						        display: true,
						        text: title,
						        fontSize: 16,
						        padding : 0
						      },
						      legend: {
							      display: true,
							      position: 'right',
							      maxWidth: 200
							    }
						    }   
						 }
				};

				var myPieChart = new Chart(ctx, chartOptions);
				
	}
	
	
	$("#resultSurveyBtn").on("click", function() {
		
		var chartData = $(".myPieChart")
		var numberChartData = chartData.length;
				
		//시설		
		$.ajax({
			url : "selectchartdata.do",
			type : "post",
			data : {keyword : $("#selectCate").val(), type : "시설"},
			dataType : "json",
			success : function(dataObj) {
				 
				//object => string
				var objStr = JSON.stringify(dataObj);

				//string => parsing : json object
				var jsonObj = JSON.parse(objStr);				
				var ctx = $("#f1 > .myPieChart");
				
				addChart(ctx, jsonObj.q1, jsonObj.a1);
				
				ctx = $("#f2 > .myPieChart");
				
				addChart(ctx, jsonObj.q2, jsonObj.a2);
				
				ctx = $("#f3 > .myPieChart");
				
				addChart(ctx, jsonObj.q3, jsonObj.a3);
				
				ctx = $("#f4 > .myPieChart");
				
				addChart(ctx, jsonObj.q4, jsonObj.a4);
				
				ctx = $("#f5 > .myPieChart");
				
				addChart(ctx, jsonObj.q5, jsonObj.a5);
			}
		});
		
		//교사
		$.ajax({
			url : "selectchartdata.do",
			type : "post",
			data : {keyword : $("#selectCate").val(), type : "교사"},
			dataType : "json",
			success : function(dataObj) {
				
				//object => string
				var objStr = JSON.stringify(dataObj);

				//string => parsing : json object
				var jsonObj = JSON.parse(objStr);				
				var ctx = $("#t1 > .myPieChart");
				
				addChart(ctx, jsonObj.q1, jsonObj.a1);
				
				ctx = $("#t2 > .myPieChart");
				
				addChart(ctx, jsonObj.q2, jsonObj.a2);
				
				ctx = $("#t3 > .myPieChart");
				
				addChart(ctx, jsonObj.q3, jsonObj.a3);
				
				ctx = $("#t4 > .myPieChart");
				
				addChart(ctx, jsonObj.q4, jsonObj.a4);
				
				ctx = $("#t5 > .myPieChart");
				
				addChart(ctx, jsonObj.q5, jsonObj.a5);
				
			}
		}); 
		
		//기타
		$.ajax({
			url : "selectchartdata.do",
			type : "post",
			data : {keyword : $("#selectCate").val(), type : "기타"},
			dataType : "json",
			success : function(dataObj) {
				
				//object => string
				var objStr = JSON.stringify(dataObj);

				//string => parsing : json object
				var jsonObj = JSON.parse(objStr);				
				var ctx = $("#e1 > .myPieChart");
				
				addChart(ctx, jsonObj.q1, jsonObj.a1);
				
				ctx = $("#e2 > .myPieChart");
				
				addChart(ctx, jsonObj.q2, jsonObj.a2);
				
				ctx = $("#e3 > .myPieChart");
				
				addChart(ctx, jsonObj.q3, jsonObj.a3);
				
				ctx = $("#e4 > .myPieChart");
				
				addChart(ctx, jsonObj.q4, jsonObj.a4);
				
				ctx = $("#e5 > .myPieChart");
				
				addChart(ctx, jsonObj.q5, jsonObj.a5);
				
			}
		});
	});
});
</script>
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
               <li class="selectNavLi">결과보기</li>
            </ul>
    </div>
	<div class="top">
	<c:if test="${!empty requestScope.tlist}">
	과정 : &nbsp;<select id= "selectBox" onchange="selectChange(this)">
		 <option>과정 선택</option>
		 <c:forEach items="${ requestScope.tlist }" var="n">
				<option value="${ n.classCode }">${ n.className }</option>
		</c:forEach> 
 		</select>
 		 &nbsp;&nbsp; 설문 종류 : &nbsp;
 		<select id="selectCate">
 		</select>&nbsp;
 		<input type="button" id=resultSurveyBtn value="조회">
 	</c:if>
 	</div>
 	<div class="bottom">
 		<div class="fmaindiv">
 			<div class="ftext">
 				<h4>시설 결과</h4>
 			</div>
 			<div class="fchartdiv">
	 			<div id="f1" class="fchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="f2" class="fchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="f3" class="fchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="f4" class="fchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="f5" class="fchart-container"><canvas class="myPieChart"></canvas></div>
			</div>
		</div>
		
		<div class="tmaindiv">
			<div class="ttext">
				<h4>교사 결과</h4>
			</div>
			<div class="tchartdiv">
				<div id="t1" class="tchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="t2" class="tchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="t3" class="tchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="t4" class="tchart-container"><canvas class="myPieChart"></canvas></div>
				<div id="t5" class="tchart-container"><canvas class="myPieChart"></canvas></div>
			</div>
		</div>
		
		<div class="emaindiv">
			<div class="etext">
				<h4>기타 결과</h4>
			</div>
			<div class = "echartdiv">
				<div id="e1" class="echart-container"><canvas class="myPieChart"></canvas></div>
				<div id="e2" class="echart-container"><canvas class="myPieChart"></canvas></div>
				<div id="e3" class="echart-container"><canvas class="myPieChart"></canvas></div>
				<div id="e4" class="echart-container"><canvas class="myPieChart"></canvas></div>
				<div id="e5" class="echart-container"><canvas class="myPieChart"></canvas></div>
			</div>
		</div>
 	</div>
</div>
</div>
</body>
</html>