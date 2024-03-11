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

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    width: 400px;
}

.modal-btn {
	float : right;
}

#modelXbtn{
	border : none;
}

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


.mainView {
	display : grid;
	text-align : center;
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
   margin-bottom : 7px;
}

.selectNavLi {
   margin-right: 10px;
}

#selectBox {
	margin-bottom : 7px;
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

td {
	padding-top: 1px;
	padding-bottom: 1px;
}

</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script>
$(function() {
	
	$("#surveyForm").submit(function(evnet) {
		var selectedValue = $("#selectBox").val();
		
		if (selectedValue === "전체") {
            event.preventDefault(); // 폼 제출을 중지
            alert("과정을 선택하세요");
        }
	});
	
	$(".delBtn").on("click", function() {
		var row = $(this).closest("tr");
		var survCate = row.find(".survcate").text();
		console.log(survCate);
		var confirmDelete = confirm("삭제하시겠습니까?");
		
		
		if(confirmDelete) {
			row.remove();
			
			location.href="${pageContext.servletContext.contextPath}/delsurvey.do?survey_cate=" + survCate;
		}
	});
	
	$(".upBtn").on("click", function() {
		var row = $(this).closest("tr");
		var survCate = row.find(".survcate").text();		
			
		location.href="${pageContext.servletContext.contextPath}/selectsurvCateSurvey.do?survey_cate=" + survCate;
		
	});
	 
	var modal = document.getElementById("myModal");

    $(".openFormBtn").on("click", function() {
    	
    	var row = $(this).closest("tr");
    	var surveyCode = row.find(".survCode").text();	
    	
    	var appendData = "<input type ='hidden' name='survNo' value='" + surveyCode + "'>";
    	    	
    	$("#surveyForm").append(appendData);
		
    	 modal.style.display = "block";
    });
    
    $("#modelXbtn").on("click", function() {
    	modal.style.display="none";
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
	
	<!-- 모달 다이얼로그 폼 -->
	<div class="modal" id="myModal">
	    <div class="modal-content">
	    	<div class="modal-btn"><input type="button" id="modelXbtn" value="X"></div>
	        <br><h4>설문배포</h4><br>
	        <form action="startSurvey.do" id="surveyForm" method="post">
	            <!-- 폼 내용을 여기에 추가 -->
	            과정 : &nbsp;<select id= "selectBox" name="class_code"><option>전체</option>
		 					<c:forEach items="${ requestScope.tlist }" var="n">
								<option value="${ n.classCode }">${ n.className }</option>
							</c:forEach>
							</select>
	            <br><button type="submit" id="submitBtn">배포</button>
	        </form>
	    </div>
	</div>
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">설문관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">설문조회</li>
            </ul>
     </div>
     <!--  설문 조회 -->
    <table id="survList" border="1">
	<tr class="proptable">
		<th>번호</th>
		<th>종류</th>
		<th>수정날짜</th>
		<th>배포/수정/삭제</th>
	</tr>
		<c:forEach items="${requestScope.slist }" var ="survey" varStatus="status">
		<tr class="proptd">
		<td>${(requestScope.paging.currentPage * 10 - 10) + status.count}</td>
		<td class="survCode" hidden>${survey.survey_no }</td>
		<td class="survcate">${survey.survey_cate }</td>
		<td>${survey.survey_date }</td>
		<td><input type="button" class="openFormBtn" value="배포">&nbsp;&nbsp;<input type="button" class="upBtn" value="수정">&nbsp;&nbsp;<input type="button" class="delBtn" value="삭제"></td>
		</tr>
		</c:forEach>
	</table>     
<c:import url="/WEB-INF/views/common/pagingView.jsp"></c:import>
</div>
</div>
</body>
</html>