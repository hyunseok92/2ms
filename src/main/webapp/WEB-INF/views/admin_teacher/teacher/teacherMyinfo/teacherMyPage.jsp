<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사 내정보</title>
<link  rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style type="text/css">
.mainView{
   position: relative;
    display: block;
    left: 15%;
    top: 100px;
    width: 70%;
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

.tablemain {
	display : flex;
	width : 90%;
	justify-content : center;
}

.outer{
 position: relative;
    display: block;
    left: 40%;
    top: 50px;
    width: 70%;
    height: 70%;
    font-family : 'Wooju';
}

</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/teachermember.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">내정보</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">마이페이지</li>
            </ul>
   	 </div>	



<h1 align="center">내 정보 보기 페이지</h1>
<br>
<table class="outer" id="outer" align="center" width="200" cellspacing="10" cellpadding="1">
	<tr><th colspan="5">등록된 회원정보는 아래와 같습니다.<br> 
	수정할 내용이 있으면 '수정페이지로 이동' 버튼을 누르세요.</th></tr>
	 <td rowspan="8" width="180" align="center" valign="middle">
                <div id="myphoto" style="margin:0; width:150px; height:160px; padding:0; border:1px solid navy;">
   <img id="photo" src="resources/photo/${teacher.photo}" style="width:150px; height:160px; border:1px solid navy; display:block;"></div></td>
	
	<tr><th>이름</th><td>${ teacher.name }</td></tr>
	<tr><th>전화번호</th><td>${ teacher.phone }</td></tr>
	<tr><th>이메일</th><td>${	teacher.email }</td></tr>	
	<tr><th>아이디</th><td>${	teacher.id }</td></tr>	
	<tr><th>이력서</th><td>
      <c:if test= "${!empty teacher.cv}">
         <a href="${pageContext.request.contextPath}/resources/cv/${teacher.cv}" download>
         <img src="${pageContext.request.contextPath}/resources/common/cv.png" width="20" height="20">
         </a>
      </c:if>
      </td></tr>	
	<tr><th>자격증</th><td>
      <c:if test= "${!empty teacher.certificate}">
         <a href="${pageContext.request.contextPath}/resources/certificate/${teacher.certificate}" download>
         <img src="${pageContext.request.contextPath}/resources/common/certificate.png" width="20" height="20">
         </a>
      </c:if>
      </td></tr>	
	<tr><th>서명이미지</th><td>
      <c:if test= "${!empty teacher.signAture_Img}">
         <a href="${pageContext.request.contextPath}/resources/signAtureimg/${teacher.signAture_Img}" download>
         <img src="${pageContext.request.contextPath}/resources/common/sign.png" width="20" height="20">
         </a>
      </c:if>
      </td></tr>	
		
	<tr><th colspan="4" >
		<c:url var="mup" value="moveup.do">
			<c:param name="id" value="${ teacher.id }"/>
		</c:url>
		<button onclick="javascript:location.href='${mup}';">수정페이지로 이동</button> 
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a> 
	
	</th></tr>
</table>
</div>
</div>
</body>
</html>