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
</head>
<body>
* 이메일 보내기 *
<br>
<hr>
<b>보내는 메일</b>
<form action="tests.do" method="post">
<c:forEach items="${email }" var="list" varStatus="status">
<input type="hidden" name="email" value="${email[status.index]}"/>
<td>${email[status.index]}</td><br/>
</c:forEach>
<hr>
<br>
글제목 : <input type="text" name="title"><br>
글 내용 : <textarea rows="5" cols="30" name="content"></textarea>
<p>
<input type="submit" value="메일 보내기">
</form>
</body>
</html>