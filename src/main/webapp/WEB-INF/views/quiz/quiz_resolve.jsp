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
	margin-bottom: 7px;
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	list-style: none;
	margin-right: 10px;
}

.main-div {
	border: 1px solid;
	border-radius: 2px;
	background-color: #d4d4d4;
	margin-left: 100px;
	width: 45%;
	height: 400px;
}

table {
	width: 100%;
	height: 100%;
}
/* td {
border: 1px solid green;
} */
.quiz_q_td {
	text-align: center;
	border-radius: 2px;
	height: 215px;
}

.q_console {
	width: 95%;
	height: 190px;
	text-align: center;
	overflow: auto;
	background-color: #006600;
	border-radius: 2px;
	border: 3px solid #a26c25;
	margin: 0 auto;
	display: block;
}

.quiz_q_text {
	padding-top: 10px;
	width: 90%;
	color: white;
	background-color: #006600;
	border: none;
	border-radius: 2px;
	resize: none;
	font-family: 'luckypang';
	font-size: 18pt;
}

.quiz_a_td {
	text-align: center;
	width: 70%;
}

.quiz_a_text {
	width: 95%;
	height: 85%;
	resize: none;
	font-family: 'munhwa';
	padding: 3px;
}

textarea:focus {
	outline: none;
}

.tdr {
	width: 200px;
	text-align: center;
}

.digital-timer {
	color: lime;
	font-size: 32px;
	font-weight: bold;
	background-color: black;
	border: none;
	border-radius: 10px;
}

.quiz_timer {
	width: 1000px;
	height: 50px;
	text-align: center;
	border-radius: 10px;
	padding-left: 5px;
	padding-right: 7px;
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

#quiz_answer {
	font-family: 'munhwa';
	color: #fff;
	background-color: #008668;
	position:relative;
	cursor:pointer;
	transition:500ms ease all;
	border-radius: 7px;
	border: none;
	width: 100%;
	height: 30px;
	font-size: 16pt;
}

#quiz_answer:hover {
	background-color: #2AD5AE;
	color: #00000054;
}
</style>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">
</head>
</script>
<!-- Timer javascript -->
<script type="text/javascript">
	$(function() {
		quizTimerStart();
		var timerInterval;
		var totalTime = 300;
		var currentTime = totalTime;
		var digitalTimer = $('#digitalTimer');
		var progressBar = document.getElementById('q_timer_progress');
		

		function updateTimers() {
			var minutes = Math.floor(currentTime / 60);
			var seconds = currentTime % 60;
			var formattedTime = minutes + " : " + (seconds < 10 ? "0" : "") + seconds;
			digitalTimer.text(formattedTime);

			var progressWidth = (currentTime / totalTime) * 100;
			progressBar.style.width = progressWidth + '%';
		}

		function startTimer() {
			timerInterval = setInterval(function() {
				currentTime--;
				updateTimers();

				if (currentTime < 0) {
					clearInterval(timerInterval);
					alert("퀴즈풀이 종료!");
					$('#quiz_answer').prop('disabled', true);
					$('#quiz_answer').css('background-color', '#336600');
					$('#quiz_answer').val("타임오버");
					 progressBar.style.width = 0 + '%';
					 digitalTimer.text("0 : 00");
				}
			}, 1000);
		}

		function quizTimerStart() {
			if (!timerInterval) {
				startTimer();
			}
		}
	});
</script>
<body>
<!-- 출제된 퀴즈가 없거나 제출 완료된경우 페이지 이동처리 -->
	<c:if test="${ !empty requestScope.message  }">
		<input type="hidden" id="reqMessage" name="reqMessage"value="${ requestScope.message }">
			<script>
				var reqMessage = $('#reqMessage').val();
				alert(reqMessage);
		        location.href = "studentMain.do";
			</script>
	</c:if>
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/common/comunity_sidebar.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">커뮤니티</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">퀴즈 풀이</li>
				</ul>
			</div>
			<div class="main-div">
					<table>
						<input type="hidden" id="quiz_seq" name="quiz_seq"
							value="${ quiz_q.quiz_seq }">
						<input type="hidden" id="student_code" name="student_code"
							value="${ sessionScope.student.studentCode }">
						<tr>
							<td colspan="2" class="quiz_q_td"><div class="q_console">
									<textarea rows="10" cols="55" class="quiz_q_text" readonly>${ quiz_q.quiz_content }</textarea>
								</div></td>
						</tr>
						<tr>
							<td colspan="2" class="quiz_timer">
								<div id="q_timer" class="q_timer">
									<div id="q_timer_progress" class="q_timer_progress"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td rowspan="2" class="quiz_a_td"><textarea rows="5"
									name="quiz_answer" cols="40" class="quiz_a_text" id="quiz_a_text"></textarea></td>
							<td class="tdr" style="height: 60px;">
								<div class="digital-timer" id="digitalTimer">5:00</div>
							</td>
						</tr>
						<tr>
							<td><input type="button" id="quiz_answer" value="답안제출"></td>
						</tr>
					</table>
			</div>
		</div>
	</div>
</body>
<!-- 퀴즈 답안 제출후 메인페이지 이동처리 이벤트 -->
<script type="text/javascript">
	$(function() {		
		$('#quiz_answer').on('click', function() {
			var job = new Object();
			job.quiz_seq = $('#quiz_seq').val();
			job.student_code = $('#student_code').val();
			job.quiz_answer = $('#quiz_a_text').val();
			
					$.ajax({
						url : "quizresolve.do",
						type : 'post',
						data : JSON.stringify(job),
						contentType : "application/json; charset=utf-8",
						success : function() {
							alert("답 등록됨");
							location.href = "studentMain.do";
						}, //success
						error : function(request, status, errorData) {
							console.log("error code : " + request.status
									+ "\nMessage : " + request.responseText
									+ "\nError : " + errorData);
						} // error
					}); // ajax
				}) // onclick
	}); // document.ready
</script>
</html>