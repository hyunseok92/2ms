<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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
.hwtitlebox{
margin-top: 10px;
    width: 900px;
    overflow: auto;
    background-color: green;
    border-top-right-radius: 10px;
    
    
}
.hwdata{
display: flex;
    background-color: whitesmoke;
    height: 30px;
    align-items: center;
    width:900px;
}
.filedwbtn:hover{
	color: green;
}
.filedwbtn{
	color:black;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#selectClass').change(function(){
		var classC = $('#selectClass').val();
		location.href ="${ pageContext.servletContext.contextPath}/ThomeworkResultList.do?classCode=" + classC + "&teacherCode=" + ${ requestScope.teacherCode };		
	});	//change
}); //document.ready

</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/t_sidemenu/t_test.jsp"/>
	<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과제출제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과정별 과제목록</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">훈련생 제출 과제</li>
				</ul>
			</div>
			<div>
				
			</div>
			<div style="margin-top:10px;">
					<div style="font-weight:bold;">${ requestScope.className }</div>
				<div class="hwtitlebox"style="display:flex; margin-top:10px;height:30px; align-items: center">
					<div style="color:white;margin-left:15px; font-weight:bold;">제 목 : ${ requestScope.title }</div>
				</div>
				<div class="hwdata">
					<div style="margin-left:10px;">${ requestScope.studentName } 훈련생 제출 과제</div>
					
					<div style="margin-left:20px;">제출날짜 : ${ requestScope.hw.SHWDate }</div>
					<div style="margin-left:20px;">첨부 파일 : <a class="filedwbtn" href="thwfdown.do?ofile=${ requestScope.hw.SHWFile }&rfile=${requestScope.hw.SHWRFile}">${ requestScope.hw.SHWFile }</a></div>
					<div style="margin-left:20px;">과제 결과 : ${ requestScope.hw.HWRST }</div>
				</div>
				<div style="width:900px; border-top:solid 1px green;height:200px;background-color:whitesmoke;overflow-y: scroll;">${ requestScope.hw.HWcontent }</div>		
			</div>
			
			<div >
			<div style="width:900px; display: flex; justify-content: flex-end;">
				<input style="width:100px;" type="button" value="과제상세페이지" onclick="javascript:history.go(-1); return false;">
			</div>
			<form action="updatehwresult.do" method="post">
			<input type="hidden" name="HWCode" value="${ requestScope.hw.HWCode }">
			<input type="hidden" name="className" value="${ requestScope.className}">
			<input type="hidden" name="studentCode" value="${ requestScope.hw.studentCode }">
				<div style="display:flex;">
					<div >
					과제 결과 : <select name="HWRST">
						<option disabled selected>결과</option>
						<option value="과제완료">과제완료</option>
						<option value="반려">반려</option>
					</select>
					</div>
					<div><input type="submit" value="과제 결과 등록"></div>
				</div>
				
				<div>
					<c:if test="${ requestScope.hw.HWComent ne null }">
					<textarea rows="10" cols="125" style="resize: none;border:solid 1px green"name="HWComent" placeholder="과제에 대한 코멘트를 남겨주세요.">${requestScope.hw.HWComent}</textarea>
					</c:if>
					<c:if test="${ requestScope.hw.HWComent eq null }">
					<textarea rows="10" cols="125" name="HWComent" style="resize: none;border:solid 1px green"placeholder="과제에 대한 코멘트를 남겨주세요."></textarea>
					</c:if>
				</div>
			</form>
			
			</div>
	<c:import url="/WEB-INF/views/admin_teacher/teacher/testHW/teacherPagingView.jsp" />
	</div>
</div>
</body>
</html>