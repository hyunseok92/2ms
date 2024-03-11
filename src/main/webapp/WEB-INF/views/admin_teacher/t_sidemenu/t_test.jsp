<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

		<div class="submenu_side">
			<div class="side_menu">
				<ul style="width:100%;">
					<li class="sub_side_title">평가및과제</li>
					<li class="sub_side_menu"><a href="selectClass.do?teacherCode=${ sessionScope.teacher.prof_Code }">시험출제</a></li>
					<li class="sub_side_menu"><a href="selecttestClassResult.do?teacherCode=${ sessionScope.teacher.prof_Code }">시험결과</a></li>
					<li class="sub_side_menu"><a href="selectHWClassView.do?teacherCode=${sessionScope.teacher.prof_Code }">과제</a></li>
				</ul>
			</div>
		</div>
	
</body>
</html>