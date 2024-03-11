<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formDetail</title>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<style>
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
th {
	border: 1px solid;
}
td {
	border: 1px solid;
}

/* 모달 스타일 */
.modal {
  display: none; /* 초기에는 숨김 상태 */
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 400px;
  text-align: center;
  position: relative;
}

/* 닫기 버튼 스타일 */
.close {
  position: absolute;
  right: 10px;
  top: 10px;
  font-size: 24px;
  cursor: pointer;
}

/* 버튼 스타일 */
button {
  margin: 5px;
}
</style>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/board_sidebar.jsp" />
		<c:choose>
			<c:when test="${ !empty sessionScope.teacher }">
				<c:import url="/WEB-INF/views/common/admin_nav.jsp" />
				<c:set var="session_prof_Code" value="${ sessionScope.teacher.prof_Code }" />
				<input type="hidden" id="session_prof_Code" value="${session_prof_Code}">
			</c:when>
			<c:when test="${ !empty sessionScope.student }">
				<c:import url="/WEB-INF/views/common/student_nav.jsp" />
				<c:set var="session_studentCode" value="${ sessionScope.student.studentCode }" />
				<input type="hidden" id="session_studentCode" value="${session_studentCode}">
			</c:when>
		</c:choose>
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">게시판</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">서식자료실</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">게시글 상세보기</li>
				</ul>
			</div>
			<div class="main-div">
				<input type="hidden" id="form_no" value="${ FormData.form_no }">
				<table align="center" width="600" cellspacing="0" cellpadding="5">
					<tr>
						<th width="120">제 목</th>
						<td>${ FormData.form_title }</td>
						<th width="120">작성자</th>
						<td>${ FormData.form_author_name }</td>
					</tr>
					<tr>
						<th width="120">등록일</th>
						<td>${ FormData.form_date }</td>
						<th width="120">첨부파일</th>
						<td><c:url var="formdown" value="formdown.do">
								<c:param name="ofile" value="${ FormData.originalfilename }" />
								<c:param name="rfile" value="${ FormData.renamefilename }" />
							</c:url> <a href="${ formdown }">${ FormData.originalfilename }</a></td>
					</tr>
					<tr>
						<th width="120">내 용</th>
						<td colspan="3">${ FormData.form_content }</td>
					</tr>
					<tr>
						<th colspan="4">
							<c:if test="${ !empty sessionScope.teacher }">
								<c:if test="${ teacher.grade eq 'A' }">
								<c:url var="fup" value="formup.do">
									<c:param name="form_no" value="${ FormData.form_no }" />
								</c:url>
								<input type="button" value="수정하기" onclick="javascript:location.href='${fup}';"> &nbsp;&nbsp; &nbsp; 
								<input type="button" id="openButton" value="게시글 삭제" onclick="openModal();"> &nbsp;&nbsp; &nbsp; 
								</c:if> 
							</c:if> 
							<input type="button" value="목록" onclick="javascript:location.href='formlist.do';">
						</th>
					</tr>
				</table>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close" id="closeModal">&times;</span>
						<p>정말 삭제하시겠습니까?</p>
						<button id="confirmButton">삭제</button>
						<button id="cancelButton">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
	  $("#openButton").click(function() {
	    $("#myModal").css("display", "block");
	  });

	  $("#closeModal, #cancelButton").click(function() {
	    $("#myModal").css("display", "none");
	  });
	  $("#confirmButton").click(function() {

	    var form_no = $('#form_no').val();
	    location.href = "formdelete.do?form_no=" + form_no;
	    $("#myModal").css("display", "none");
	  });

	  $("#cancelButton").click(function() {
	    $("#myModal").css("display", "none");
	  });
	});
</script>
</html>