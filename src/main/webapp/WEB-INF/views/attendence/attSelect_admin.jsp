<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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

.top {
	display : flex;
	margin-bottom : 10px;
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
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
	
<script type="text/javascript">
	$(function(){		
		$("#selectBtn").on("click", function(){		
			
			var selectElement = document.getElementById("selectBox");
		    var selectedIndex = selectElement.selectedIndex;
			
			if(selectedIndex === 0) {
				alert("과정을 선택하세요");				
				return;
			}
			
				
			console.log($("#today").val());
			
			if($("#today").val() == "") {
				alert("날짜를 선택하세요");
				return;
			}
			
			var selectedValue = selectElement.options[selectedIndex].value;
			
			
			location.href = "${pageContext.servletContext.contextPath}/att_selectAdmin.do?class_code=" + selectedValue + "&attdate=" + $('#today').val();
			
		});
	});  //document ready
	
</script>

</head>
<body>

<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/academic.jsp"/>

<div class="mainView">
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">학적부</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">출석부</li>
            </ul>
    </div>
	<!--  선생 학적부 -->
	<div class="top">
	<input type="hidden" name="action" value="action">
	과정 : &nbsp;<select id= "selectBox">
		 <option>과정선택</option>
		 <c:forEach items="${ requestScope.tlist }" var="n">
		 	<c:if test="${n.classCode eq requestScope.selectClass }">
		 		 <option value="${ n.classCode }" selected>${ n.className }</option>
		 	</c:if>
		 	<c:if test ="${n.classCode ne requestScope.selectClass }">
		 		 <option value="${ n.classCode }">${ n.className }</option>
		 	</c:if>
		</c:forEach>
		</select>
		&nbsp;&nbsp;
	<c:if test="${requestScope.slist.size() gt 0 }">
		<fmt:parseDate var="parseDate" value="${requestScope.slist[0].attdate}" pattern="yyyy-MM-dd" />
		<fmt:formatDate var="formDate" value="${parseDate }" pattern="yyyy-MM-dd"/>
		<input id="today" type="date" value="${formDate}" >
	</c:if>
	<c:if test ="${empty requestScope.slist or requestScope.slist.size() eq 0 }">
		<fmt:parseDate var="parseDate" value="${requestScope.dateInfo}" pattern="yyyy-MM-dd" />
		<fmt:formatDate var="formDate" value="${parseDate}" pattern="yyyy-MM-dd"/>		
		<input id="today" type="date" value="${formDate}">
	</c:if>
	&nbsp;&nbsp; <input type="button" id="selectBtn" value="조회">
		&nbsp;&nbsp; 담당교사 : ${ requestScope.profname} &nbsp;&nbsp; 검색결과 : ${requestScope.slist.size() }명
	</div>		
	<table id="adminAtt" border="1">
	<tr class="proptable">
		<th>번호</th>
		<th>이름</th>
		<th>주민번호</th>
		<th>전화번호</th>
		<th>출결상태</th>
		<th>비고</th>		
	</tr>
		<c:forEach items="${requestScope.slist}" var ="student" varStatus="status">
		<tr class="proptd">
		<td class="studentCode" hidden="true">${student.student_code}</td>
		<td>${status.count}</td>
		<td>${student.name }</td>
		<td>${student.resident_Number}</td>
		<td>${student.phone }</td>
		<td>${ student.status}</td>
		<td>${student.note}</td>
		</tr>
		</c:forEach>
	</table>	
<!-- 페이징 처리 뷰 포함 -->
</div>
</div>
</body>
</html>