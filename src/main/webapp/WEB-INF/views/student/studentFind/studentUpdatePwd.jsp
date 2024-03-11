<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호</title>
<style type="text/css">
<style type="text/css">
        /* 폰트 스타일 */
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

        /* 페이지 스타일 */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login_box {
            width: 460px;
            height: 250px;
            display: inherit;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            background-color: whitesmoke;
        }

        /* 입력 필드 스타일 */
input[type=text] {
    border-radius: 5px;
    font-size: 15px;
    outline: none;
    border: 1px solid black;
    font-family: 'Wooju';
    width: 200px;
    display: block; /* 블록 레벨 요소로 설정합니다. */
    margin: 0 auto;
    font-weight: bold;
    
}

input[type=passward] {
    border-radius: 5px;
    font-size: 15px;
    outline: none;
    border: 1px solid black;
    font-family: 'Wooju';
    width: 200px;
    display: block; /* 블록 레벨 요소로 설정합니다. */
    margin: 0 auto;
    font-weight: bold;
    
}

input[type=submit] {
    display: block;
    margin: 0 auto;
    border-radius: 5px;
    background-color: darkgreen;
    color: white;
    font-size: 20px;
    font-family: 'Wooju';
    margin-top: -10px; /* 위로 올리고자 하는 만큼의 음수 여백을 지정합니다. */
}
        /* 포커스 스타일 */
        input[type=text]:focus {
            outline: 2px solid darkgreen;
        }
        
        label {
    text-align: left; /* 텍스트를 오른쪽 정렬합니다. */
    display: inline-block; /* 인라인 블록 요소로 설정합니다. */
    width: 200px; /* 라벨의 너비를 200px로 설정합니다. */
}

.form-group {
    display: flex;
    justify-content: center; /* 가로 가운데 정렬을 추가합니다. */
    align-items: center; /* 세로 가운데 정렬을 추가합니다. */
    margin-bottom: 10px;
}

.form-group label {
    width: 40%;
    text-align: right;
    margin-right: 10px;
    font-weight: bold;
}

.form-group input[type="text"] {
    flex: 1;
    border-radius: 5px;
    font-size: 20px;
    outline: none;
    border: 2px solid black;
    font-family: 'Wooju';
    font-weight: bold;
}

.form-group input[type="email"] {
    flex: 1;
    border-radius: 5px;
    font-size: 20px;
    outline: none;
    border: 2px solid black;
    font-family: 'Wooju';
    font-weight: bold;
}

.form-group input[type="submit"] {
    flex: 1;
    border-radius: 10px;
    font-size: 20px;
    height:10%;
    outline: none;
    border: 2px solid black;
    font-family: 'Wooju';
    font-weight: bold;
    margin-top: -10px;
}
    </style>
</head>
<body>

	<script type="text/javascript"
		src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js">
		</script>
		
		
	<script type="text/javascript">
		function validateForm() {
			var password1 = document.getElementById("pwd").value;
			var password2 = document.getElementById("pwd2").value;
			if (password1 == password2) {
				return true;
			} else {
				alert("새로운 암호와 암호확인이 일치하지 않습니다.");
				return false; 
			}
		}
	</script>
		
	<div class="container">
    <div class="login_box">
        <h1>새로운 비밀번호 </h1>
        <form action="smupdate2.do" method="post" onsubmit="return validateForm();">
        <input type="hidden" id="id" name="id" value="${requestScope.id}">

    <div class="form-group">
         <label for="password">새로운 암호:</label>
         <input type="password" id="pwd" name="pwd" required>
    </div>
    <div class="form-group">
        <label for="password">새로운 암호확인:</label>
        <input type="password" id="pwd2" name="pwd2" required>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group"> 
       <input type="submit" id="findPwd" value="비밀번호 저장">
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</form>
    </div>
</div>

</body>
</html>