<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LMS</title>
    <script type="text/javascript" src="/lms/resources/js/lib/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('input[type=submit]').on('click', function() {
                var username = $('#id').val();
                var password = $('#pwd').val();
                
                if (!username || !password) {
                    alert('아이디 또는 비밀번호를 확인해주세요');
                    return false; 
                }
            });
        });
    </script>

    
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
        .loginpage_title {
            font-family: 'Wilder';
            width: 100%;
            font-size: 60px;
            text-align: center;
            margin-top: 150px;
            margin-bottom: 30px;
        }

        .login_title {
            font-family: 'munhwa';
            text-align: center;
            width: 100%;
            font-size: 30px;
        }

        .login_box {
            width: 460px;
            height: 250px;
            justify-content: center;
            align-items: center;
            display: inherit;
            border-radius: 20px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            background-color: whitesmoke;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
        }

        .loginpage {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 입력 필드 스타일 */
        input[type=text], input[type=password] {
            border-radius: 5px;
            font-size: 15px;
            outline: none;
            margin-bottom: 5px;
            border: 1px solid black;
            font-family: 'Wooju';
            width: 192px;
        }

        /* 로그인 버튼 스타일 */
        input[type=submit] {
            border-radius: 5px;
            width: 200px;
            background-color: darkgreen;
            color: white;
            font-size: 15px;
            font-family: 'Wooju';
        }
        
        .login_input:focus {
            outline: 2px solid darkgreen;
        }

        /* 링크 스타일 */
        .login_links a {
            font-family: 'Wooju';
            font-size: 15px;
            text-decoration: none;
            color: darkgreen;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="loginpage_title">Responce2ms</div>
    <div class="loginpage">
        <div class="login_box">
            <div class="login_title">로그인</div>

            <form action="login.do" method="post" style="text-align: center;">
                <input type="text" name="id" id="id" placeholder="ID" class="login_input"> 
                <input type="password" name="pwd" id="pwd" placeholder="PASSWORD" class="login_input"> 
                <input type="submit" value="로그인">
                
                <div class="login_links">
                    <a href="tsearchPage.do">아이디 찾기</a>
                    <a href="tsearchPage1.do">비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>