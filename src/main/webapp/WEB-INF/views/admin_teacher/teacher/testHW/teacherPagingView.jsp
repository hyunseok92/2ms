<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<c:set var="currentPage"
					value="${ requestScope.paging.currentPage }" />
				<c:set var="urlMapping" value="${ requestScope.paging.urlMapping }" />
				<c:set var="startPage" value="${ requestScope.paging.startPage}" />
				<c:set var="endPage" value="${ requestScope.paging.endPage}" />
				<c:set var="maxPage" value="${ requestScope.paging.maxPage}" />
				<c:set var="action" value="${ requestScope.action }" />
				<c:set var="keyword" value="${ requestScope.keyword }" />
				<c:set var="begin" value="${ requestScope.begin }" />
				<c:set var="end" value="${ requestScope.end }" />
				<c:if test="${ !empty classCode}">
					<div style="text-align: center; width:1500px; margin-top:10px;">

						<c:if test="${ currentPage eq 1 }">
     						 [맨처음] &nbsp;
   						</c:if>

						<c:if test="${ currentPage gt 1 }">
							<a
								href="${ urlMapping }?page=1&classCode=${ requestScope.classCode }&teacherCode=${sessionScope.teacher.prof_Code}">[맨처음]</a> &nbsp;
   						</c:if>

						<c:if
							test="${ (currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
							<a
								href="${ urlMapping }?page=${ startPage - 10 }&classCode=${ requestScope.classCode }&teacherCode=${sessionScope.teacher.prof_Code}">[이전그룹]</a> &nbsp;
   						</c:if>

						<c:if
							test="${ !((currentPage - 10) lt startPage and (currentPage - 10) gt 1) }">
      					[이전그룹] &nbsp;
   						</c:if>

						<c:forEach var="p" begin="${ startPage }" end="${ endPage }"
							step="1">
							<c:if test="${ p eq currentPage }">
								<font color="green" size="4"><b>${ p }</b></font>
							</c:if>

							<c:if test="${ p ne currentPage }">
								<a
									href="${ urlMapping }?page=${ p }&classCode=${ requestScope.classCode }&teacherCode=${sessionScope.teacher.prof_Code}">${ p }</a>
							</c:if>
						</c:forEach>

						<c:if
							test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
							<a
								href="${ urlMapping }?page=${ startPage + 10 }&classCode=${ requestScope.classCode }&teacherCode=${sessionScope.teacher.prof_Code}">[다음그룹]</a> &nbsp;
   						</c:if>

						<c:if
							test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
      					[다음그룹] &nbsp;
  						 </c:if>

						<c:if test="${ currentPage >= maxPage }">
					      [맨끝] &nbsp;
					   </c:if>

						<c:if test="${ currentPage < maxPage }">
							<a
								href="${ urlMapping }?page=${ maxPage }&classCode=${ requestScope.classCode }&teacherCode=${sessionScope.teacher.prof_Code}">[맨끝]</a> &nbsp;
   						</c:if>
					</div>
				</c:if>



			
</body>
</html>