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
    width: 700px;
    overflow: auto;
    background-color: green;
    border-top-right-radius: 10px;
    
    
}
.hwtitle{
    
    
    height: 30px;
   
}
.hwdate{
display: flex;
    background-color: whitesmoke;
    height: 30px;
    align-items: center;
    
}
.contentbox{
width: 700px;
    background-color: green;
    border-top-right-radius: 10px;
    margin-top: 20px;
}
.hwcontent{
    font-weight: bold;
    color: white;
    display: flex;
    border-top-right-radius: 10px;
    align-items: center;
    height: 30px;
    margin-left: 15px;
}
.hwcontentin{
    background-color: whitesmoke;
    height: 200px;
    overflow-y: scroll;
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
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>

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
					<li class="selectNavLi">과제 상세 페이지</li>
				</ul>
			</div>
				<div>
					<div style="margin-top:10px;">
						<div style="font-weight:bold;">${ requestScope.className }</div>
					</div>
				</div>
				<div style="display:flex;">
				<div>
				<div class="hwtitlebox" style="margin-top:10px;">
					<div class="hwtiltle" style="display:flex;align-items: center;">
						<div style="font-weight:bold;color:white;margin-left:15px;height: 30px;display:flex;align-items: center; ">제목 : </div>
						<div style="font-weight:bold;color:white;">${ requestScope.TH.THWTitle }</div>
					</div>
					<div class="hwdate"style="display:flex;">
						<div style="font-weight:bold;margin-left: 15px;">과제 생성 날짜 : </div>
						<div style="margin-right:20px;">${ requestScope.TH.HWStartDate }</div>
						<div style="font-weight:bold;">과제 마감 날짜 : </div>
						<div style="margin-right:20px;">${ requestScope.TH.HWEndDate }</div>
						<div style="font-weight:bold;">첨부 파일 : </div>
						<c:if test="${!empty requestScope.TH.THWFile }">
						<div>${ requestScope.TH.THWFile }</div>
						</c:if>
						<c:if test="${empty requestScope.TH.THWFile }">
						<div>파일 없음</div>
						</c:if>
					</div>
				</div>
				<div class="contentbox">
					<div class="hwcontent"style="font-weight:bold;">내 용</div>
					<div class="hwcontentin">${ requestScope.TH.THWContent }</div>
				</div>
				<div style="display:flex;width:700px;justify-content: right;">
						<div>
							<input style="width: 100px;"type="button" value="과제목록" onclick="javascript:history.go(-1); return false;">
						</div>
						<div>
							<form action="updateTHW.do" method="post">
								<input type="hidden" name=className value="${ requestScope.className }">
								<input type="hidden" name="HWCode" value="${ requestScope.TH.HWCode }">
								<input style="width: 100px;"type="submit" value="수정">
							</form>
						</div>
						<div>
							<form action="deleteTHW.do" method="post">
								<input type="hidden" name="rfile" value="${ requestScope.TH.THWRFile }">
								<input type="hidden" name="HWCode" value="${ requestScope.TH.HWCode }">
								<input style="width: 100px;"type="submit" value="삭제">
							</form>
						</div>
				</div>
			</div>
			<div style="margin-top:10px;margin-left:200px;">
				<div>
					<table style="width: 600px;">
					<tr class="proptable">
						<td>이름</td>
						<td>제출날짜</td>
						<td>첨부파일</td>
						<td colspan="2">제출확인</td>
					</tr>
					<c:forEach var="i" items="${ requestScope.slist }">
					<tr class="proptd">
					<c:if test="${ requestScope.hlist ne null }">
						<td>${ i.name }</td>
					
					<c:set var="breakpoint2" value="true"/>
					<c:forEach var="j" items="${ requestScope.hlist }">
						<c:if test="${ i.studentCode eq j.studentCode }">
						<c:set var="breakpoint2" value="false"/>
						<c:set var="h" value="${ j }"/>
						</c:if>
					</c:forEach>
						<c:if test="${ breakpoint2 eq false }">
						<td>${ h.SHWDate }</td>
						<td>${ h.SHWFile }</td>
						<td>${ h.HWRST }</td>
						</c:if>
						<c:if test="${ breakpoint2 eq true }">
						<td colspan="2"></td>
						<td colspan="2">미제출</td>
						</c:if>
					</c:if>
						<c:if test="${ breakpoint2 eq false }">
						<td>
							<form action="thwresultCheck.do" method="post">
								<input type="hidden" name="studentName" value="${i.name }">
								<input type="hidden" name=className value="${ requestScope.className }">
								<input type="hidden" name="studentCode" value="${i.studentCode }">
								<input type="hidden" name="HWCode" value="${ h.HWCode }">
								<input type="submit" value="과제 확인">
							</form>
						</td>
						</c:if>
					</tr>
					</c:forEach>
					</table>
				</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>