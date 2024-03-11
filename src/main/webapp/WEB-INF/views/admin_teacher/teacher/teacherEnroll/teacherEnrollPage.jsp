<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사 회원가입</title>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
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
<link rel="stylesheet" type="text/css" href="resources/css/main.css">

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

window.onload = function(){
	//선택한 사진파일 이미지 미리보기 처리
	var photofile = document.getElementById("photoFileName");
	photofile.addEventListener('change', function(event){		
		const files = event.currentTarget.files;
	    const file = files[0];
	    const myphoto = document.getElementById("photo");	    
	    console.log(file.name);
	    
	    const reader = new FileReader();
        reader.onload = (e) => {          
          myphoto.setAttribute('src', e.target.result);
          myphoto.setAttribute('data-file', file.name);
        };
        reader.readAsDataURL(file);    
	});
}



</script>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/admin_nav.jsp"/>
	<c:import url="/WEB-INF/views/admin_teacher/admin_sidemenu/enrollMemberSide.jsp"/>
</div>
<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">회원관리</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">회원등록</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">교사 회원등록</li>
            </ul>
   	 </div>	
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<h1 align="center">교사 회원 가입 페이지</h1>
<br>

<form action="tEnroll.do" id="enrollForm" method="post" onsubmit="return validate();" enctype="multipart/form-data">
    <table class="outer" id="outer" align="center" width="100" cellspacing="5" cellpadding="0">
        
            <th colspan="3">회원 정보를 입력해 주세요. (* 표시는 필수 입력 항목입니다.)</th>
        
        <tr>
            <td rowspan="10" width="200" align="left" valign="middle">
            
            
            
            
                <div id="myphoto" style="margin:0;width:150px;height:160px;padding:0;border:1px solid navy;">
                    <img id="photo" style="width:150px;height:160px;border:1px solid navy;display:block;"
                        alt="사진을 드래그 드롭하세요." style="padding:0;margin:0;">
                     
                    <input type="file" name="photo1" id="photoFileName" accept="image/*">
                </div>
            </td>
	<tr><th>*암호</th>
	<td><input type="password" name="pwd" id="pwd" required></td></tr>
	
	<tr><th>*암호확인</th>
	<td><input type="password" id="pwd2" required></td></tr>
	
	<tr><th>*이름</th>
	<td><input type="text" name="name" required></td></tr>
	
	<tr><th>*주민번호</th>
	<td>
		<input type="text" name="resident_Number" required placeholder="예)940225-1021234">  
	</td></tr>
	
	<tr><th>*전화번호</th>
	<td><input type="tel" name="phone" required placeholder="예)010-5555-1234"></td>	
	
	<tr><th>*이메일</th>
	<td><input type="email" name="email" required></td>
	</tr>
	
	<tr><th>*이력서</th>
	<td><input type="file" name="cv1" ></td>
	</tr>
	
	<tr><th>*자격증</th>
	<td><input type="file" name="certificate1" ></td>
	</tr>
	
	<tr><th>*서명이미지</th>
	<td><input type="file" name="signAture_Img1" ></td>
	</tr>

	<th colspan="3">
		<input type="submit" value="가입하기" onsubmit="return validateForm();"> &nbsp;
		<input type="reset" value="작성취소"> &nbsp;
	</th>	
</table>
</form>

</body>
</html>