<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz</title>
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

@font-face {
	font-family: 'luckypang';
	src: url('resources/font/Typo_luckypangB.ttf') format('truetype');
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

.selectNav {
   width: 90%;
   border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
   font-family: 'munhwa';
   margin-bottom : 7px;
}
.selectNavUl {
   display: flex;
}
.selectNavLi {
	list-style:none;
	margin-right: 10px;
}

.main-div {
	border: 1px solid;
	border-radius: 2px;
	background-color: #e7e7e7;
	margin-left: 40px;
	width: 55%;
	height: 400px;
}

table {
	width: 100%;
	height: 100%;
}
/* td {
	border: 1px solid green;
} */
/* 퀴즈 디스플레이 */
.quiz_text_q {
    text-align: center;
    width: 95%;
    height: 340px;
}

.quiz_content {
	font-family: 'luckypang';
    width: 90%;
    height: 295px;
    background-color: #006600;
    color: white;
    resize: none;
    border: 3px solid #a26c25;
    padding: 10px;
}

.quiz_content:focus {
	outline: none;
}
/* 출제버튼 */
.tdr_q {
    padding-top: 9px;
    padding-right: 7px;	
	width: 200px;
	text-align: center;
}

input[type=button] {
	text-align:center;
	background-color: #2AD5AE;
	color:#00000054;
	border: none;
	position:relative;
	cursor:pointer;
	transition:500ms ease all;
	width: 190px;
	height: 70px;
	margin-left: 5px;
	border-radius: 5px;
	font-size: 24pt;
}
input[type=button]:hover {
	background:#008668;
	color:#fff;
}
/* 제출자명단 */
.tdr_a {
	padding-right: 7px;
}
.answerList {
	width: 100%;
	height: 20px;
	background-color: gray;
	color: white;
	text-align: center;
	overflow: auto;
	white-space: normal;
	padding-top: 5px;
	/* border-radius: 5px; */
}
.answer_list {
	width: 100%;
	height: 155px;
	text-align: center;
	font: bold;
	border: none;
	resize: none;
	overflow: auto;
	white-space: normal;
	/* border-radius: 5px; */
}
.bordered-namelist {
border-bottom: 1px solid gray;
} 

.answer_list:focus {
	outline: none;
}
.even-row {
    background-color: lightgoldenrodyellow;	/* 홀수줄 */
}
.odd-row {
    background-color: azure;	/* 짝수줄 */
}
/* 타이머 */
.tdr_t {
	padding-right: 7px;
}
.quiz_timer {
	width: 1000px;
	height: 50px;
	text-align: center;
	border-radius: 5px;
	padding-right: 5px;
    padding-left: 5px;
    padding-bottom: 5px;
}

.q_timer {
	width: 100%;
	height: 50px;
	background-color: #818181;
	border-radius: 4px;
	border: 1px solid #7ca7b7;
}

.q_timer_progress {
	width: 100%;
	height: 50px;
	background: -webkit-linear-gradient(right, #99ccff, #006600);
	transition: width 1s linear;
	border-radius: 4px;
}

.digital-timer {
	text-align:center;
	color: lime;
	font-size: 32px;
	font-weight: bold;
	background-color: black;
	border: none;
	border-radius: 5px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
		<c:import url="/WEB-INF/views/common/comunity_sidebar.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">커뮤니티</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">퀴즈 출제</li>
				</ul>
			</div>
			<div class="main-div">
				<table>
					<tr>
						<input type="hidden" id="prof_code" name="prof_code"
							value="${ teacher.prof_Code }">
						<!-- ${ sessionScope.loginMember.userCode } -->
						<td rowspan="3" class="quiz_text_q"><textarea
								id="quiz_content" name="quiz_content" class="quiz_content"
								cols="100" rows="17"></textarea></td>
						<td class="tdr_q" style="height: 70px;"><input type="button"
							id="quiz_to_student" value="퀴즈 출제"></td>
					</tr>
					<tr>
						<td class="tdr_a" style="height: 180px;">
							<div>
								<dl>
									<dd class="answerList">제출자 명단</dd>
								</dl>
								<div class="answer_list" id="answer_list"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="tdr_t" style="height: 60px;">
							<div class="digital-timer" id="digitalTimer">5:00</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="quiz_timer">
							<div id="q_timer" class="q_timer">
								<div id="q_timer_progress" class="q_timer_progress"></div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
	<!-- Ajax script -->
	<script type="text/javascript">
		$('#quiz_to_student').on(
				'click',
				function() {

					var job = new Object();
					job.prof_code = $('#prof_code').val();
					job.quiz_content = $('#quiz_content').val();

					console.log("실행됨");
					console.log(job);

					if (job.quiz_content === ""
							|| job.quiz_content.length === 0) {
						alert("문제 작성 후 퀴즈 출제가 가능합니다.");
					} else {
						$.ajax({
							url : "makeQuiz.do",
							type : "post",
							data : JSON.stringify(job),
							contentType : "application/json; charset=utf-8",
							success : function() {
								/*타이머함수 실행*/
								quizTimerStart();
								$('#quiz_to_student').prop('disabled', true);
								$('#quiz_to_student').css('background-color', '#00755B');
								$('#quiz_to_student').css('color', '#fff');
								$('#quiz_to_student').val('풀이중...');
								quizAnswerList();
							},
							error : function(request, status, errorData) {
								console.log("error code : " + request.status
										+ "\nMessage : " + request.responseText
										+ "\nError : " + errorData);
							}
						}); // ajax

					} // else
				}); // Btn click
	</script>
	<!-- Timer javascript -->
	<script type="text/javascript">
		var timerInterval;
		var totalTime = 300; // 5 minutes in seconds
		var currentTime = totalTime;
		var digitalTimer = $('#digitalTimer');
		var progressBar = document.getElementById('q_timer_progress');

		function updateTimers() {
			var minutes = Math.floor(currentTime / 60);
			var seconds = currentTime % 60;
			var formattedTime = minutes + " : " + (seconds < 10 ? "0" : "")
					+ seconds;
			digitalTimer.text(formattedTime);

			var progressWidth = (currentTime / totalTime) * 100;
			progressBar.style.width = progressWidth + '%';
		}

		function startTimer() {
			timerInterval = setInterval(function() {
				currentTime--;
				updateTimers();

				if (currentTime <= 0) {
					clearInterval(timerInterval);
					alert("퀴즈풀이 종료!");
					location.href = "quiz.do";
					progressBar.style.width = 0 + '%';
					digitalTimer.text("0 : 00");
				}
			}, 1000); // 1 second interval
		}

		function quizTimerStart() {
			if (!timerInterval) {
				startTimer();
			}
		}
	</script>
	<!-- AnswerList javascript -->
	<script type="text/javascript">
		var answerListVar;

		function callAnswerList() {

			answerListVar = setInterval(function() {

				var job = new Object();
				job.prof_code = $('#prof_code').val();
				job.quiz_content = $('#quiz_content').val();

				$.ajax({
					url : "quizAnswerList.do",
					type : "post",
					data : JSON.stringify(job),
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(dataJsonObject) {
						var output = "";
						// object >> String
						var objStr = JSON.stringify(dataJsonObject);
						// String >> parsing : json Object
						var jsonObj = JSON.parse(objStr);

						for ( var i in jsonObj.list) {
							var rowClass = i % 2 === 0 ? 'even-row' : 'odd-row';
							output += "<p class='bordered-namelist "+rowClass+"'>" + jsonObj.list[i].name + "</p>";
						}

						// 테이블에 기록 처리
						$('#answer_list').html(output);
					},
					error : function(request, status, errorData) {
						console.log("error code : " + request.status
								+ "\nMessage : " + request.responseText
								+ "\nError : " + errorData);
					}
				}); // ajax
			}, 5000); // setInterval
		} // func callAnswerList()

		function quizAnswerList() {
			if (!answerListVar) {
				callAnswerList();
			}
		}
	</script>
</html>