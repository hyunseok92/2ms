<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ms</title>
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

.mainView {
	position: relative;
	display: block;
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
}

input {
	font-family: 'Wooju';
}

button {
	font-family: 'Wooju';
}

option {
	font-family: 'Wooju';
}

select {
	font-family: 'Wooju';
}

.selectNav {
	width: 90%;
	border-bottom: rgba(51, 105, 30, 0.5) solid 1px;
	font-family: 'munhwa';
}

ul {
	list-style-type: none;
}

.selectNavUl {
	display: flex;
}

.selectNavLi {
	margin-right: 10px;
}

.selectSubmenu {
	display: flex;
}
.hwtitlebox{
margin-top: 10px;
    width: 700px;
    overflow: auto;
    background-color: green;
    border-top-right-radius: 10px;
    
    
}
.hwtitle{
    
    
    height: 30px;
   
}
.hwdate{
display: flex;
    background-color: whitesmoke;
    height: 30px;
    align-items: center;
    
}
.contentbox{
width: 700px;
    background-color: green;
    border-top-right-radius: 10px;
    margin-top: 20px;
}
.hwcontent{
    font-weight: bold;
    color: white;
    display: flex;
    border-top-right-radius: 10px;
    align-items: center;
    height: 30px;
    margin-left: 15px;
}
.hwcontentin{
    background-color: whitesmoke;
    height: 200px;
    overflow-y: scroll;
}
</style>
<script type="text/javascript" src="resources/js/lib/jquery.min.js"></script>
<script type="text/javascript">
function updisoff(){
	$('#uphw').css('display', 'none');
}
function updison(){
	$('#uphw').css('display', 'block');
}
</script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/student_nav.jsp" />
		<c:import url="/WEB-INF/views/student/student_sidemenu/s_test.jsp" />
		<div class="mainView">
			<div class="selectNav">
				<ul class="selectNavUl">
					<li class="selectNavLi">과제</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과제 목록</li>
					<li class="selectNavLi">></li>
					<li class="selectNavLi">과제 상세 페이지</li>
				</ul>
			</div>
			<div style="display:flex; margin-top:10px;">
			<div>
				<div>
					<div style="font-weight:bold;">[교사]${ requestScope.className }</div>
				</div>
				<div style="margin-top:10px;">
					<div class="hwtitlebox" style="display:flex;align-items: center;">
						<div style="font-weight:bold;color:white;margin-left:15px;height: 30px;display:flex;align-items: center; ">제 목 : ${ requestScope.TH.THWTitle }</div>
					</div>
					<div class="hwdate" style="display:flex; width:700px;">
						<div >과제 마감 날짜 : ${ requestScope.TH.HWEndDate }</div>
						<c:url var="shwfd" value="shwfdown.do">
							<c:param name="ofile" value="${ requestScope.TH.THWFile }"></c:param>
							<c:param name="rfile" value="${ requestScope.TH.THWRFile }"></c:param>
						</c:url>
						<div style="margin-left:20px;">
						첨부 파일 : 
							<a href="${ shwfd }">${ requestScope.TH.THWFile }</a>
						</div>
					</div>
				</div>
				<div class="contentbox">
					<div class="hwcontent"style="font-weight:bold;">내 용</div>
					<div class="hwcontentin" >${ requestScope.TH.THWContent }</div>
				</div>
			</div>

			<c:if test="${ requestScope.hw eq null }">

				<div style="margin-left:100px;">
					<div style="font-weight:bold;">[훈련생 제출]${ requestScope.className }</div>
					<form action="shwinsert.do" method="post"
						enctype="multipart/form-data">
						<div>
							<div class="hwtitlebox" style="width:719px;">
								<div style="font-weight:bold;color:white;margin-left:15px;height: 30px;display:flex;align-items: center; ">제 목 :${ requestScope.TH.THWTitle }</div>
								<input type="hidden" name="className" value="${ requestScope.className }"> 
								<input type="hidden" name="classCode" value="${ requestScope.TH.classCode }"> 
								<input type="hidden" name="HWCode" value="${ requestScope.TH.HWCode }">
								<input type="hidden" name="teacherCode" value="${ requestScope.TH.teacherCode }"> 
								<input type="hidden" name="studentCode" value="${ requestScope.studentCode }"> 
								<input type="hidden" value="${ requestScope.TH.THWTitle }" readonly>
							</div>
							<div class="hwdate">
								<input type="file" name="ofile">
							</div>
						</div>
						<div>
							<textarea name="HWcontent" rows="15" cols="100" style="resize: none;border:solid 1px green"name="HWComent" placeholder="과제를 작성해 주세요."></textarea>
						</div>
						<div>
							<input type="submit" value="과제 제출"> <input type="button"
								value="목록" onclick="javascript:history.go(-1); return false;">
						</div>
					</form>
				</div>
			</c:if>
			
			<c:if test="${ requestScope.hw ne null }">
				<div style="margin-left:100px;">
							<div style="font-weight:bold;">${ requestScope.className }</div>
						<div style="margin-left:100px;">
						</div>
						<div class="hwtitlebox" style="width:719px;">
							<div style="font-weight:bold;color:white;margin-left:15px;height: 30px;display:flex;align-items: center; ">[훈련생 제출완료]${ requestScope.TH.THWTitle }</div>
							</div>
					<div class="hwdate"style="display:flex;">
							<div style="display:flex;">
								<div>제출일 : ${ requestScope.hw.SHWDate }</div>
								<div style="margin-left:20px;">결과 확인 : ${ requestScope.hw.HWRST }</div>
								<c:url var="thwfd" value="thwfdown.do">
									<c:param name="ofile" value="${ requestScope.hw.SHWFile }"></c:param>
									<c:param name="rfile" value="${ requestScope.hw.SHWRFile }"></c:param>
								</c:url>
							</div>
								<div style="margin-left:20px;">첨부 파일 : 
									<a href="${ thwfd }">${ requestScope.hw.SHWFile }</a>
								</div>
						</div>
					
						<div>
							<div class="hwcontentin"style="border-top:solid 1px green;">${ requestScope.hw.HWcontent }</div>
						</div>
						<div style="display:flex; justify-content: flex-end;">
							<div>
								<button onclick="updison();"style="width:100px;">수정</button>
							</div>
							<div >
								<form action="deleteSHW.do" method="post">
									<input type="hidden" name="className" value="${ requestScope.className }"> 
									<input type="hidden" name="rfile" value="${ requestScope.hw.SHWFile }"> 
									<input type="hidden" name="HWCode" value="${ requestScope.TH.HWCode }"> 
									<input type="hidden" name="studentCode" value="${ requestScope.studentCode }"> 
									<input style="width:100px;"type="submit" value="삭제">
								</form>
							</div>
							<div>
								<input style="width:100px;" type="button" value="목록" onclick="javascript:history.go(-1); return false;">
							</div>
							</div>
						</div>
			</c:if>
				</div>
			
			<div id="uphw" style="position:absolute;top:46px;left:800px;display:none;">
					
					<form action="Shwupdate.do" method="post"
						enctype="multipart/form-data">
						<div>
							<div class="hwtitlebox" style="margin-top:10px; display:flex; align-content: center;width:720px;"><div style="font-weight:bold;color:white;margin-left:15px;height: 30px;display:flex;align-items: center; ">제 목 : </div>
							<div style="font-weight:bold;color:white;display:flex;align-items: center;">[훈련생 과제 수정]${ requestScope.TH.THWTitle }</div>
							</div>
							<div class="hwdate"style="display:flex; width:720px">
								<input type="hidden" name="className" value="${ requestScope.className }"> 
								<input type="hidden" name="classCode" value="${ requestScope.TH.classCode }"> 
								<input type="hidden" name="HWCode" value="${ requestScope.TH.HWCode }">
								<input type="hidden" name="teacherCode" value="${ requestScope.TH.teacherCode }"> 
								<input type="hidden" name="studentCode" value="${ requestScope.studentCode }"> 
								<input type="hidden" value="${ requestScope.TH.THWTitle }" readonly>
								<c:if test="${ !empty requestScope.hw.SHWFile }">
								<div style="margin-right:20px;">${requestScope.hw.SHWFile }</div>
								<input type="checkbox" name="deleteFlag" value="yes"> 
									<div style="display:flex;align-content: center;">
										<div style="display: flex;align-content: center;margin-top:5px;">파일삭제 </div>
										<div style="margin-left:20px;">변경 : <input type="file" name="upfile"></div>
									</div>
								</c:if>
						
								<c:if test="${ empty requestScope.hw.SHWFile }">
									<div style="display:flex;">
									<div>첨부된 파일 없음</div>
									<div style="margin-left:20px;">추가 : <input type="file" name="upfile"></div>
									</div>	
								</c:if>	
							</div>
						</div>
						<div>
							<textarea name="HWcontent"rows="15" cols="100" style="resize: none;border:solid 1px green"name="HWComent" placeholder="과제를 제출해주세요.">"${ requestScope.hw.HWcontent }"</textarea>
						</div>
						<div>
							<input type="submit" value="수정 완료">
							<button onclick="updisoff();">수정 취소</button>
						</div>
					</form>
				</div>
		</div>
	</div>

</body>
</html>