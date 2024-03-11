<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
<script type="text/javascript">
function showUpdateSuccessMessage() {
    // 수정 성공 시 알림 메시지 표시
    alert("회원 정보가 성공적으로 수정되었습니다. 변경된 정보로 다시 로그인해주세요.");
    location.href = 'logout.do';
}
</script>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css">
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/common/student_nav.jsp"/>
	<c:import url="/WEB-INF/views/student/student_sidemenu/member.jsp"/>

<div class="mainView">
	
	<div class="selectNav">
            <ul class="selectNavUl">
               <li class="selectNavLi">내정보</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">마이페이지</li>
               <li class="selectNavLi">></li>
               <li class="selectNavLi">수정페이지</li>
               
            </ul>
    </div>
    <h1>회원 정보 수정 페이지</h1>
    <br>
    <form action="smupdate.do" method="post">
        <input type="hidden" name="id" value="${student.id}">
        <table class="outer" id="outer" align="center" cellspacing="5" cellpadding="0">
            <tr>
                <th colspan="5">등록된 회원정보는 아래와 같습니다. 수정할 내용이 있으면 변경하고 수정하기 버튼을 누르세요.</th>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" value="${student.name}"></td>
            </tr>
            <tr>
                <th>새로운 암호</th>
                <td><input type="password" name="pwd" id="pwd" required></td>
            </tr>
            <tr>
                <th>새로운 암호확인</th>
                <td><input type="password" id="pwd2" required></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="tel" name="phone" value="${student.phone}"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" name="email" value="${student.email}"></td>
            </tr>
            <tr>
                <th colspan="4" class="button-container">
                    <input type="submit" value="수정하기" onclick="showUpdateSuccessMessage();">
                    <a href="javascript:history.go(-1);">이전 페이지로 이동</a>
                </th>
            </tr>
        </table>
    </form>
    </div>
    </div>
</body>
</html>
