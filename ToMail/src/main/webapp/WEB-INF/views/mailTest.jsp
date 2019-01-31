<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#enter").on("click", function(e){
		$("#test").append("<strong>이렇게 하면?</strong>");
	});
	
});

</script>
</head>
<body>

<div class="container" style="margin-top: 30px">
	<h1>* 이메일 보내기 *</h1>
		<br>
		<hr>
			<h3>보내는 메일</h3>
			<form action="tests.do" method="post">
				<c:forEach items="${email }" var="list" varStatus="status">
				<input type="hidden" name="email" value="${email[status.index]}"/>
				<input type="text" class="form-control" value="${email[status.index]}" readonly="readonly"/><br/>
				</c:forEach>
				<hr>
				<br>
				
				글제목 : <input type="text" name="title" class="form-control"><br>
				글 내용 : <textarea id="html" rows="5" cols="30" name="content" class="form-control">
		
						</textarea>

<input type="submit" value="메일 보내기">
</form>

		<button id="enter">Enter</button>
		<div id="test"></div>
</div>
</body>
</html>