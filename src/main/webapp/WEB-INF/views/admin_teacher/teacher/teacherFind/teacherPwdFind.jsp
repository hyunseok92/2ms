<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Your CSS and other head content -->
</head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/lib/jquery.min.js"></script>
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

input[type=email] {
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

input[type=button] {
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

.form-group input[type="button"] {
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
<div class="container">
    <div class="login_box">
        <h1>비밀번호 찾기</h1>
        <form action="tsearchPage2.do" method="post" onsubmit="return validateForm();">
    <div class="form-group">
         <label for="id">아이디:</label>
         <input type="text" id="id" name="id" required>
    </div>
    <div class="form-group">
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group"> 
       <input type="button" id="findPwd" value="비밀번호 찾기">
        <input type="text" class="Token" id="inputToken" style="display: none;">
        <input type="submit" class="Token" id="checkToken" style="display: none;" value="토큰 인증">
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</form>
    </div>
</div>

    <!-- <div class="loginpage">
        <h1 class="loginpage_title">비밀번호 찾기</h1>
        <div class="login_box">
            <form id="formhtml" action="ssearchPage2.do" method="post" onsubmit="return validateForm();">
                <div class="login_title">
                    <label for="id">아이디:</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="login_title">
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="login_title">
                    <input type="button" id="findPwd" value="비밀번호 찾기">
                    <input type="text" class="Token" id="inputToken" style="display: none;">
                    <input type="submit" class="Token" id="checkToken" style="display: none;" value="토큰 인증">
                </div>
            </form>
        </div>
    </div> -->
    </body>
<script type="text/javascript">
   $(function() {
	   function validateForm() {
		var authToken = $('#Token').val();
		var inputToken = $('#inputToken').val();
		if(authToken == inputToken){
			/* location.href = "ssearchPage2.do?id=" + $('#id').val() + "&email=" + $('#email').val();  */
			return true;
		} else {
			alert("인증 토큰을 올바르게 입력해주세요!");
			return false;
		}			
	}
	   
	$('#findPwd').on('click',function() {
		var id = $('#id').val();
		var email = $('#email').val()
		$.ajax({
			  url: "mail.do",
			  type:"post",
			  data: { email:email },
			  dataType : "json",
			  success: function(tokenObj){
				  var objStr = JSON.stringify(tokenObj);
	              var jsonObj = JSON.parse(objStr);
	              var token = jsonObj.Token;
				  var formHTML = "<label for='name'>아이디:</label><input type='text' id='id' name='id' value=" + id 
				  + "><br><label for='name'>이메일:</label> <input type='email' id='email' name='email' value=" + email 
				  + "> <br> <input type='hidden' id='Token' name='Token' value=" + token 
				  + "> <input type='text' class='Token' id='inputToken' style='display: none;'> <input type='submit' class='Token' id='checkToken' style='display: none;' value='토큰 인증'>"
	              $('#formhtml').html(formHTML);
				  console.log(token);
				  $('#inputToken').show();				/*document.getElementById('Token').style.display = 'block';*/
				  $('#checkToken').show();		/*document.getElementById('checkToken').style.display = 'block';*/
			  },
			  error: function(request, status, errorData) {
	              console.log("errorCode : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
	          }  
		   });
		});
   })
   </script>
</html>
