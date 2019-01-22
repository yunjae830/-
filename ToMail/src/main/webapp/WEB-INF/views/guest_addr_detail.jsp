<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>수신자 정보</h1>


	<table border="1">
		<tr>
			<th>이름</th>
			<td>${dto.customer_email }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.customer_name }</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="수정" onclick="location.href='updateform.do?id='"/>
				<input type="button" value="삭제" onclick="location.href='delete.do?id='"/>
				<input type="button" value="목록" onclick="location.href='list.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>