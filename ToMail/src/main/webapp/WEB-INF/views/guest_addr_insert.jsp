<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>주소록</h1>
	<table border="1">
		<col width="100" />
		<col width="100" />
		<tr>
			<th>이름</th>
			<th colspan="2">이메일</th>
		</tr>

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="2">---정보를 등록해주세요---</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td><a href="detail.do?name=${dto.customer_name }">${dto.customer_name }</a></td>
						<td>${dto.customer_email }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div>
		<form action="myaddr_insert.do" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
			<div>
				<br /> 
				<div class="form-group">
        			<input class="form-control" type="file" name="files" multiple="multiple">
      			</div>
				<label for="name">이름</label> 
					<input id="name" name="customer_name" type="text" placeholder="이름" required="required" />
						<label for="email">이메일</label> 
							<input id="email" name="customer_email" type="email" placeholder="이메일" required="required" />
				<button onclick="location.href='check.do'">중복체크</button>
				<input name="members_seq" value="${members_seq }" type="hidden">
			</div>
			<p>
				<button onclick="submit">수신자 등록</button>
				<input type="button" value="취소" onclick="location.href='index.jsp'">
			</p>
		</form>
	</div>

</body>
</html>