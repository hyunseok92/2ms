<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련생 회원가입</title>
<style type="text/css">
.mainView {
    position: relative;
    display: block;
    left: 250px;
    top: 120px;
    width: 85%;
    height: 100%;
    font-family: 'Wooju';
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
    display: grid;
    text-align: center;
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
    margin-bottom: 10px;
}

.selectNavLi {
    margin-right: 10px;
}

.outer {
    position: relative;
    display: block;
    left: 40%;
    top: 40px;
    width: 85%;
    height: 100%;
    font-family: 'Wooju';
}

/* Adjust the form layout */
form {
    width: 100%;
    text-align: center;
}

/* Style the submit button and reset button */
input[type="submit"], input[type="reset"] {
    background-color: #33691E;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
    font-size: 16px;
}

/* Style the file input */
input[type="file"] {
    display: block;
    margin: 2px auto;
}


</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">

function validate(){
	
	//암호와 암호확인이 일치하지 않는지 확인
	//var pwdValue = document.getElementById("userpwd").value;
	//var pwdValue2 = document.getElementById("userpwd2").value;
	//jQuery 선택자 사용으로 바꾼다면
	var pwdValue = $('#pwd').val();
	var pwdValue2 = $('#pwd2').val();
	
	if(pwdValue !== pwdValue2){
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("pwd2").value = "";
		document.getElementById("pwd").select();
		return false;  //전송 취소함
	}
	
	//아이디의 값 형식이 요구한 대로 작성되었는지 검사
	//암호의 값 형식이 요구한 대로 작성되었는지 검사
	//정규표현식(Regular Expression) 사용함
	
	return true;  //전송보냄
}



</script>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/enrollMemberSide.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">회원관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">회원등록</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">훈련생 회원등록</li>
            </ul>
   	 </div>	


<h1 align="center">훈련생 회원 가입 페이지</h1>
<br>
<br>
<br>
<!-- 사진파일 첨부시 enctype="multipart/form-date" 속성 추가함 -->

<form action="sEnroll.do" id="enrollForm" method="post" onsubmit="return validate();">
<table class="outer" id="outer" align="center" width="500" cellspacing="8" cellpadding="1">
	<tr><th colspan="3">회원 정보를 입력해 주세요. (* 표시는 필수입력 항목입니다.)</th></tr>
  
	<tr><th>*암호</th>
	<td><input type="password" name="pwd" id="pwd" required></td></tr>
	
	<tr><th>*암호확인</th>
	<td><input type="password" id="pwd2" required></td></tr>
	
	<tr><th>*이름</th>
	<td><input type="text" name="name" required></td></tr>
	
	<tr><th>*주민번호</th>
	<td>
		<input type="text" name="resident_Number" required placeholder="예)940251-1025124">  
	</td></tr>
	
	<tr><th>*전화번호</th>
	<td><input type="tel" name="phone" required></td></tr>	
	
	<tr><th>*이메일</th>
	<td><input type="email" name="email" required></td>
	</tr>
	
	<tr><th>*학력</th>
	<td><input type="text" name="eduation" required></td>
	</tr>
	
	<tr><th>*학교</th>

	<td><input type="text" name="school" required></td>
	
	</tr>
	
	<select id= "selectBox" name="class_code" required><option>전체</option>

       <c:forEach items="${ requestScope.tlist }" var="n">
                  <option value="${ n.classCode }">${ n.className }</option>
      </c:forEach>
      </select>
      </td>
	</tr>
	<tr><th colspan="3">
		<input type="submit" value="가입하기"> &nbsp;
		<input type="reset" value="작성취소"> &nbsp;
	</th></tr>
</table>
	
</form>

</body>
</html>