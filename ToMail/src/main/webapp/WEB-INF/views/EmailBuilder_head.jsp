<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/form_builder.css?ver=2" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<!-- emoji -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<!-- sweetalert -->
<script src="js/sweetalert2.all.min.js"></script>
<script src="js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="js/sweetalert2.min.css">
<title>Insert title here</title>
</head>
<style type="text/css">
html {
	overflow-x: hidden;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

.navbar {
	min-height: 60px;
	border-bottom: 2.5px solid #F4F4F5;
}

.navbar-brand {
	padding-top: 0;
}

.navbar-light .navbar-nav .active>.nav-link {
	padding-left: 80px;
	padding-top: 10px;
	color: #B4B4B4;
}

.dropdown-menu.show {
	margin-top: 17px;
}

.dropdown-menu {
	width: 250px !important;
}

#user {
	padding-right: 100px;
}

i {
	cursor: pointer;
}

i, i:link {
	color: #808080
}

#mobile {
	display: none;
}

@media screen and (max-width:768px) {
	#user {
		padding-right: 0px;
	}
	.dropdown {
		display: none;
	}
	#mobile {
		display: block;
	}
}

#submit {
	width: 100px;
	background-color: #3879EA;
	color: white;
}
#font{
	font-size: 25px;
}
</style>

<script type="text/javascript">

function submitFunc(){
	alert("test");
}

function canDelete(mailTitle){
	return confirm("Are you sure you want to delete" + mailTitle + "?");
	
}


</script>

<body style="padding-top: 0px;">

	<nav class="navbar navbar-expand-md navbar-light"
		style="padding-bottom: 0px;padding-top: 0px;padding-left: 0px;height: 77.5px;">
		<div align="left">
			<a class="btn col-sm"> <img alt="back" src="resources/img/entrar.png"
				style="width: 70px; height: 70px;">
			</a>
		</div>
		<c:set var="title" value="${title}"/>
		<c:choose>
		<c:when test="${fn:length(title) == 0}">
		<a class="navbar-brand" style="color: #B0C4DE;" id="font"><b
			style="padding-left: 20px;">제목 없음</b></a>
		</c:when>
		<c:when test="${fn:length(title) > 0}">
		<a class="navbar-brand" style="color: #B0C4DE;" id="font"><b
			style="padding-left: 20px;">${title}</b></a>
		</c:when>
		</c:choose>
		<div align="right">
		<c:choose>
			<c:when test="${mail.bno > 0 }">
			<form action="deleteMail" method="get">
			<input type="hidden" name="bno" value="${mail.bno }"/>
			<input type="hidden" name="email" value="${mail.email }"/>
			<input onclick="return canDelete('${mail.title}');" type="submit" 
			class="btn col-sm" id="submit" style="right:0px; left: 1140px; background-color:red;" value="삭제"/>
			</form>
			<form action="updateMail" method="post" id="updateMailAction">
			<input type="hidden" name="titie" value="<c:out value="${mail.title }"/>">
			<input type="hidden" name="content" value="<c:out value="${mail.content }"/>"/>
			<input type="hidden" name="bno" value="<c:out value="${mail.bno}"/>"/>
			<input type="hidden" name="email" value="<c:out value="${mail.email }"/>"/>
			<input type="hidden" name="template" value="<c:out value="${mail.template }"/>"/>
			<input type="submit" class="btn col-sm" id="submit" style="right: 0px; left: 1140px;" value="수정하기"/>
			</form>
			</c:when>
			<c:otherwise>
			<div class="btn col-sm" id="submit" style="right: 0px; left: 1140px;" onclick="all_content()">저장하기</div>
			</c:otherwise>
		</c:choose>	
		</div>
		<c:if test="${mail.bno == null}">
		<div align="right">
		<form action="sendMail.do" method="post" onsubmit="submitFunc()">
			<c:forEach var="num" items="${email_fuc}">
				<input name="recipient" type="hidden" class="listval" value="${num}" />
			</c:forEach>
			<input type="hidden" name="title" value="${title }">
			<input id="All_code" type="hidden" name="content">
			<input type="hidden" name="template" value="${num}"/>
			<input type="hidden" name="email" value="highkick89@naver.com"/>
			<input type="hidden" name="pageNum" value="1"/>
			<input type="hidden" name="amount" value="10"/>
			<input type="submit" class="btn col-sm" id="submit" style="right: 0px; left: 1180px;" value="보내기" />
		</form>
		</div>
		</c:if>
	</nav>
</body>
</html>