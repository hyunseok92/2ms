<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
<style type="text/css">
.mainView {
	position: relative;
	display: block;
	left: 250px;
	top: 120px;
	width: 85%;
	height: 100%;
	font-family: 'Wooju';
}

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

div.trand-section {
	width: 100%;
	height:100%;
}

#accodianMenu h3 {
	background: #4F6969; /* linear-gradient( to bottom, #339933, #efefef ); */
	height:25px;
	text-align:center;
	border-radius:15px;
	/* box-shadow: 3px 3px 4px gray; */
	transition: background 1s;
}

#accodianMenu h3:hover {
    background: linear-gradient( to bottom, #6F9999, #4F6969);
    transition: background 1s;
}

#accodianMenu div a {
	font-size:110%;
}



.sectionTitle {
	color:black;
}

#atag {
	color:black;
	display:block;
}

#atag:hover {
  	color:#4F8099;
  	border-radius:10px;
  	background-color: rgba(170, 221, 200, 0.3);
}

#atag {
	color:black;
	display:block;
}

#atag:hover {
  	color:#4F8099;
  	border-radius:10px;
  	background-color: rgba(170, 221, 200, 0.3);
}


td {
	white-space: nowrap; 
  	overflow: hidden;
  	text-overflow: ellipsis;
  	padding-bottom: 10px;
}

.wrapperOfThree {
	display:flex;
}

.bannerSection {
	height:670px;
/* 	margin-bottom:-25px; */
	justify-content:center;
	display:flex;
}

.notice-section, .form-section, .trand-section {
    flex: 1;
    height: 300px;
    padding: 20px;
}

.titleDiv {
	background-color:#dfdfdf; 
	display:flex; 
	margin-bottom:15px;
	/* border-radius:7px; */
}
</style>
<script type="text/javascript" 
src="${ pageContext.servletContext.contextPath }/resources/js/lib/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">

<script type="text/javascript">
$(function(){
   $.ajax({
	      url: "new5notice.do",
	      type: "post",
	      dataType: "json",
	      success: function(data){

	         var str = JSON.stringify(data);
	         var json = JSON.parse(str);
	         
	         values = "";         
	         for(var i in json.nlist){
	            values += "<tr><td style='text-align: center;'><a id='atag' href='noticeDetail.do?notice_no=" 
	                  + json.nlist[i].notice_no + "'>"
	                  + decodeURIComponent(json.nlist[i].notice_title).replace(/\+/gi, " ") 
	                  + "</a></td><td style='text-align: center;'>"
	                  + json.nlist[i].notice_date + "</td></tr>";
	         }
	         
	         $('#newnotice').html($('#newnotice').html() + values);
	      },
	   });
   
    $.ajax({
	   url: "new5form.do",
	      type: "post",
	      dataType: "json",
	      success: function(data){
			 console.log("data:" + data);
	         var str = JSON.stringify(data);
	         var json = JSON.parse(str);
	         
	         values = "";     
	         for(var i in json.flist){
	            values += "<tr><td style='text-align: center;'><a id='atag' href='formdetail.do?form_no="
	                  + json.flist[i].form_no + "'>"
	                  + decodeURIComponent(json.flist[i].form_title).replace(/\+/gi, " ") 
	                  + "</a></td><td style='text-align: center;'>"
	                  + json.flist[i].form_date + "</td></tr>";
	         }
	     	 $('#formBoard').html($('#formBoard').html() + values);
	      }
   })
})
</script>

</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/common/student_nav.jsp"/>
			<div class="bannerSection">
			<div class="picture" style="overflow:hidden;">
				<img src="${ pageContext.servletContext.contextPath }/resources/images/banner.png"
				style="width:100%; height: 650px; box-shadow: 0px 3px 12px gray;">
			</div>
		</div>
		
		<div class="wrapperOfThree">
			<!-- trand-section -->
			<div class="trand-section">
				<div class="titleDiv">
					<h3 style="font-weight: normal;"><a class="sectionTitle" href="#">유익한 기사들</a></h3>
				</div>
				<div id="accodianMenu">
				    <h3 style="margin-bottom:5px; cursor:pointer;">
				    <a style="color:#D0E3DD;">${ cateList[0].category }</a></h3>
					<div>
	 			    <c:forEach var="IoT" items="${ requestScope.cateOfFirst }">
				    	<a href="${ IoT.urlAddress }">${ IoT.title }</a><br>
				    	<p style="margin-top:0px;">${ IoT.content }</p><br>
				    	<hr color="#afafaf" style="margin-bottom:0px;"><br>
				    </c:forEach>
					</div>
	
				    <h3 style="margin-bottom:5px; cursor:pointer;"><a style="color:#D0E3DD;">${ cateList[1].category }</a></h3>
					<div>
	 			    <c:forEach var="globalTrand" items="${ requestScope.cateOfSecond }">
				    	<a href="${ globalTrand.urlAddress }">${ globalTrand.title }</a><br>
				    	<p>${ globalTrand.content }</p><br>
				    	<hr color="#afafaf" style="margin-bottom:0px;"><br>
				    </c:forEach>
					</div>
	
				    <h3 style="margin-bottom:5px; cursor:pointer;"><a style="color:#D0E3DD;">${ cateList[2].category }</a></h3>
					<div>
	 			    <c:forEach var="developer" items="${ requestScope.cateOfThird }">
				    	<a href="${ developer.urlAddress }">${ developer.title }</a><br>
				    	<p>${ developer.content }</p><br>
				    	<hr color="#afafaf" style="margin-bottom:0px;"><br>
				    </c:forEach>
					</div>
	
				    <h3 style="margin-bottom:5px; cursor:pointer;"><a style="color:#D0E3DD;">${ cateList[3].category }</a></h3>
					<div>
	 			    <c:forEach var="futureTech" items="${ requestScope.cateOfFourth }">
				    	<a href="${ futureTech.urlAddress }">${ futureTech.title }</a><br>
				    	<p>${ futureTech.content }</p><br>
				    	<hr color="#afafaf" style="margin-bottom:0px;"><br>
				    </c:forEach>
					</div>
	
				    <h3 style="margin-bottom:5px; cursor:pointer;"><a style="color:#D0E3DD;">${ cateList[4].category }</a></h3>
					<div>
	 			    <c:forEach var="coCulture" items="${ requestScope.cateOfFifth }">
				    	<a href="${ coCulture.urlAddress }">${ coCulture.title }</a><br>
				    	<p>${ coCulture.content }</p><br>
				    	<hr color="#afafaf" style="margin-bottom:0px;"><br>
				    </c:forEach>
					</div>
				</div>
			</div>
			<!-- trand-section -->
		
			<div class="notice-section">
				<div class="titleDiv">
					<h3 style="font-weight: normal;"><a class="sectionTitle" href="moveNoticeList.do?page=1">2MS 공지사항</a></h3>
				</div>
				<table id="newnotice" align="center" cellspacing="0" 
				style="width:100%;">

				</table>
			</div>
			<div class="form-section">
				<div class="titleDiv">
					<h3 style="font-weight: normal;"><a class="sectionTitle" href="formlist.do">필요한 서식</a></h3>
				</div>
				<table id="formBoard" align="center" cellspacing="0" 
				style="width:100%;">

				</table>
			</div>
			
		</div>

</div>
<script type="text/javascript">

(function($, undefined){
    $.fn.multiOpenMenu = function(options) {

        if (this.length === 0) {
            return this;
        }

        var settings = $.extend({
            active: -1
        }, options);

        var headers = this.find(">h3");

        headers.on('click', function() {
            var menuArea = $(this).next();
            var isOpen = menuArea.is(":visible");

            headers.next().slideUp();

            if (!isOpen) {
                menuArea.slideDown().trigger('show');
            }

            $('html, body').animate({
                scrollTop: 0
            }, 'fast');
            return false;
        });

        headers.next().hide();

        return this;
    };
}(jQuery));

$(function(){
	$("#accodianMenu").multiOpenMenu();
});


function truncateText(element, maxLength) {
    var text = element.textContent;
    if (text.length > maxLength) {
        text = text.substring(0, maxLength) + '···';
        element.textContent = text;
    }
}

window.onload = function() {
    var pElements = document.querySelectorAll("p");
    var maxLength = 70; // 표시할 최대 문자 길이

    for (var i = 0; i < pElements.length; i++) {
        truncateText(pElements[i], maxLength);
    }
};

</script>
</body>
</html>