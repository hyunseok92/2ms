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
		$('#updateAttAll').on('click', function(){   
			if( ${requestScope.slist.size()} > 0 ) {
			 	location.href = "${pageContext.servletContext.contextPath}/att_update.do?class_code=" + ${sessionScope.teacher.class_code}  + "&prof_code=" + ${sessionScope.teacher.prof_Code} + "&attDate=" + $("#today").val();
				alert("수정 완료");
			} else {
				alert("수정할 값이 없습니다.");
			}
		 });
		
		$('.ubtn').on('click', function(){   
			
			var $row = $(this).closest("tr");
	        var $statusSelect = $row.find(".statusSelect");
	        var $noteInput = $row.find("input[type='text']");
	        var studentStatus = $statusSelect.val();
	        var studentNote = $noteInput.val();
	        var studentCode = $row.find(".studentCode").text();
	        var attdate = $("#today").val();
				        
	        location.href="${pageContext.servletContext.contextPath}/att_updateRow.do?student_code="+studentCode+ "&class_code="+ ${sessionScope.teacher.class_code} +"&prof_code="+${sessionScope.teacher.prof_Code}+"&attdate="+attdate+"&status="+studentStatus+"&note="+studentNote;
     
	    });
		
	});  //document ready
	
	function selectStudent(){		
		location.href = "${pageContext.servletContext.contextPath}/att_selectDate.do?class_code=" + ${sessionScope.teacher.class_code}  + "&prof_code=" + ${sessionScope.teacher.prof_Code} + "&attDate=" + $("#today").val();
	}
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
	과정 : &nbsp; ${requestScope.tlist[0].className }
		&nbsp;&nbsp; 검색결과 : ${requestScope.slist.size() }명
	&nbsp;&nbsp;&nbsp;
	
	<c:if test="${requestScope.slist.size() gt 0 }">
		<fmt:parseDate var="parseDate" value="${requestScope.slist[0].attdate}" pattern="yyyy-MM-dd" />
		<fmt:formatDate var="formDate" value="${parseDate }" pattern="yyyy-MM-dd"/>
		<input id="today" type="date" value="${formDate}" >
	</c:if>
	<c:if test ="${requestScope.slist.size() eq 0 }">
		<fmt:parseDate var="parseDate" value="${requestScope.dateInfo}" pattern="yyyy-MM-dd" />
		<fmt:formatDate var="formDate" value="${parseDate}" pattern="yyyy-MM-dd"/>		
		<input id="today" type="date" value="${formDate}">
	</c:if>
	&nbsp;&nbsp;&nbsp;
	<input type="button" value="조회" onclick="selectStudent()">
	&nbsp;&nbsp;&nbsp;
	<input type="button" id="updateAttAll" value="전체출석">	
	&nbsp;&nbsp;&nbsp;
	</div>		
	<table id="adminAtt" border="1">
	<tr class="proptable">
		<th>번호</th>
		<th>이름</th>
		<th>주민번호</th>
		<th>전화번호</th>
		<th>학력</th>
		<th>학교</th>
		<th>출결상태</th>
		<th>비고</th>
		<th>수정</th>
		
	</tr>
		<c:forEach items="${requestScope.slist}" var ="student" varStatus="status">
		<tr class="proptd">
		<td class="studentCode" hidden="true">${student.student_code}</td>
		<td>${status.count}</td>
		<td>${student.name }</td>
		<td>${student.resident_Number}</td>
		<td>${student.phone }</td>
		<td>${student.eduation }</td>
		<td>${student.school}</td>
		<td><select class="statusSelect">
			<c:if test="${ student.status eq '대기'}">
			 <option value="대기" selected>대기</option>
			 <option value="출석">출석</option>
			 <option value="조퇴">조퇴</option>
			 <option value="지각">지각</option>			
			 <option value="결석">결석</option>	
			</c:if>		
			<c:if test="${ student.status eq '출석'}">
			 <option value="대기">대기</option>
			 <option value="출석" selected>출석</option>
			 <option value="조퇴">조퇴</option>
			 <option value="지각">지각</option>			
			 <option value="결석">결석</option>	
			</c:if>		
			<c:if test="${ student.status eq '조퇴'}">
			 <option value="대기">대기</option>
			 <option value="출석">출석</option>
			 <option value="조퇴" selected>조퇴</option>
			 <option value="지각">지각</option>			
			 <option value="결석">결석</option>	
			</c:if>		
			<c:if test="${ student.status eq '지각'}">
			 <option value="대기" selected>대기</option>
			 <option value="출석">출석</option>
			 <option value="조퇴">조퇴</option>
			 <option value="지각" selected>지각</option>			
			 <option value="결석">결석</option>	
			</c:if>
			<c:if test="${ student.status eq '결석'}">
			 <option value="대기" selected>대기</option>
			 <option value="출석">출석</option>
			 <option value="조퇴">조퇴</option>
			 <option value="지각">지각</option>			
			 <option value="결석" selected>결석</option>	
			</c:if>				
			</select></td>
		<td><input type="text" value="${student.note}"></td>
		<td><input type="button" class="ubtn" value="수정"></td>
		</tr>
		</c:forEach>
	</table>
	
<!-- 페이징 처리 뷰 포함 -->
</div>
</div>
</body>
</html>