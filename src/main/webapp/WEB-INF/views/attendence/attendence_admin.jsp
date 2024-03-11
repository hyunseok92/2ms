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

.radioDiv {
    display: flex;
    align-items: center;
    margin-bottom : 10px;
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

.top {
	margin-bottom : 10px;
}

</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	 const radioGroup = $('input[name="selectGrade"]');

     // 라디오 버튼 상태가 변경될 때 처리할 함수를 정의합니다.
     radioGroup.on("change", function() {
         const selectedValue = radioGroup.filter(":checked").val();
	
         if(selectedValue !== "학생") { 
			location.href = "${pageContext.servletContext.contextPath}/selectteacher.do"
         }  
     });
     
     $(".statusBtn").on("click", function() {
     	
    	 var $row = $(this).closest("tr");
	     var $statusSelect = $row.find(".studentcode");
	     var studentcode = $statusSelect.text();
	     
	     var $status = $row.find(".status");
	     var statusText = $status.text().trim();
	     
	     console.log(statusText);
	     
	     if(statusText === "재원") {
	    	 statusText = 'N';
	     } else {
	    	 statusText = 'Y';
	     }
	     
		 location.href = "${pageContext.servletContext.contextPath}/updatestudentstatus.do?studentcode=" + studentcode + "&status=" + statusText;
	     
     });
});
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/member.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">회원관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">회원조회</li>
                <li class="selectNavLi">></li>
               <li class="selectNavLi">훈련생조회</li>
            </ul>
    </div>
	<br>
	<div class="radioDiv">
	<c:if test="${requestScope.grade eq 'student'}">
		<input type="radio" name="selectGrade" id="studentRadio" value="학생" checked>
    	<label for="studentRadio">학생</label>
		&nbsp;&nbsp;
		<input type="radio" name="selectGrade" id="teacherRadio" value="교사">
    	<label for="teacherRadio">교사</label>
	</c:if>
	</div>
	<div class="top">
	<!--  관리자 학적부 -->
	<form action="${pageContext.servletContext.contextPath}/att_admin.do" method="get" class="searchForm">
	<input type="hidden" name="action" value="action">
	이름 : &nbsp;<input type="text" name="name"> &nbsp;
	과정 : &nbsp;<select id= "selectBox" name="selectData"><option>전체</option>
		 <c:forEach items="${ requestScope.tlist }" var="n">
		 			<c:if test="${requestScope.keyword2 eq n.classCode }">
		 				<option value="${ n.classCode }" selected>${ n.className }</option>
		 			</c:if>
		 			<c:if test="${requestScope.keyword2 ne n.classCode }">
		 				<option value="${ n.classCode }">${ n.className }</option>
		 			</c:if>
		 			
		</c:forEach>
		</select>
		&nbsp;<input type="submit" value="검색">
		&nbsp;&nbsp; 검색결과 : ${requestScope.paging.listCount }명		
	</form>
	</div>
	<table id="adminAtt" border="1">
	<tr class="proptable">
		<th>번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주민번호</th>
		<th>이메일</th>
		<th>과정</th>
		<th>상태</th>
		<th>상태변경</th>
	</tr>
		<c:forEach items="${requestScope.slist }" var ="student" varStatus="status">
		<tr class="proptd">
		<td>${(requestScope.paging.currentPage * 10 - 10) + status.count}</td>
		<td class="studentcode" hidden>${student.studentCode }</td>
		<td>${student.name }</td>
		<td>${student.phone }</td>
		<td>${student.resident_Number }</td>
		<td>${student.email }</td>
		<td>${student.class_Code }</td>
		<td class="status">
			<c:if test= "${student.inactive_OR_Not eq 'Y'}">재원</c:if>
			<c:if test= "${student.inactive_OR_Not eq 'N'}">퇴원</c:if>
		</td>
		<td>
			<input type="button" class="statusBtn" value="상태 변경">
		</td>
		</tr>
		</c:forEach>
	</table>
<!-- 페이징 처리 뷰 포함 -->
<c:import url="/WEB-INF/views/common/pagingView.jsp"></c:import>
</div>
</div>
</body>
</html>