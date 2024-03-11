<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file="../common/menubar.jsp" %> --%>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">훈련생 회원 관리 페이지</h1>
<h2 align="center">현재 회원수 : ${ requestScope.list.size() } 명</h2>
<br>
<center>
	<button onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/mlist.do';">전체 목록 보기</button>
</center>
<br>



<%-- 검색 항목별 값 입력 전송용 폼 만들기 --%>
<%-- 회원 아이디 검색 폼 --%>
<form id="idform" class="sform" action="${ pageContext.servletContext.contextPath }/msearch.do" method="post">
<input type="hidden" name="action" value="id">
<fieldset>
	<legend>검색할 아이디를 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form>



<br>
<%-- 전체 회원 정보 출력 --%>
<table align="center" border="1" cellspacing="0" cellpadding="3">
	<tr><th>아이디</th><th>이름</th><th>주민번호</th>
	<th>전화번호</th><th>이메일</th><th>학교</th><th>마지막 수정날짜</th>
	
	<%-- <% for(Member m : list){ %> --%>
	<c:forEach items="${ requestScope.list }" var="m">
		<tr>
			<td>${ m.userId }</td>
			<td>${ m.userName }</td>
			<td>${ m.phone }</td>
			<td>${ m.email }</td>
			<td>${ m.enrollDate }</td>
			<td>${ m.lastModified }</td>
			<td>${ m.signType }</td>
		</tr>
	<%-- <% } %> --%>
	</c:forEach>
</table>
<br>

<!-- 페이징 처리 뷰 포함 -->
<c:import url="/WEB-INF/views/common/pagingView.jsp" />


</body>
</html>