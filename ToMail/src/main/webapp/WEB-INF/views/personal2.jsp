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
<title>내 정보 수정</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- 글꼴 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
   <!-- emoji -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
   <!-- sweetalert -->
   <script src="js/sweetalert2.all.min.js"></script>
   <script src="js/sweetalert2.min.js"></script>
   <link rel="stylesheet" href="js/sweetalert2.min.css">

<script type="text/javascript">


	 function checkPwd(){
		  var f1 = document.forms[0];
		  var pw1 = f1.members_pw.value;
		  var pw2 = f1.members_pw2.value;

		  if(pw1!=pw2){
		   document.getElementById('pwsame').style.color = "red";
		   document.getElementById('pwsame').innerHTML = "비밀번호가 일치하지 않습니다."; 
		  }else{
		   document.getElementById('pwsame').style.color = "#007BFF";
		   document.getElementById('pwsame').innerHTML = "비밀번호가 확인 되었습니다.";
		   $("#c").prop('disabled', false);
		   
		   if (pw1 == "" && pw2 == "") {
				document.getElementById('pwsame').innerHTML = "";

			}
		  }
	 }
		 	 
</script>
<style type="text/css">
body, html {
  height: 100%;
}

.card{ padding: 50px;
	width: 800px;
	height: 600px;
}
#b{padding-bottom: 10px; padding-left: 100px;}
#a{margin-left: 20px;}
#c{margin-left: 40px; width: 300px;}
.bg {
  /* The image used */
  background-image: url("img/register_up.png");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
</head>
<%@ include file="header.jsp"%>
<div class="container-fluid bg">

	<div class="row justify-content-center">
		<div style="padding: 100px 250px 0 200px;">
			<div class="card">
				<h3>내 정보</h3>
				<hr>
				<br>
				<br>
				<br>
				<br>
				<c:forEach var="dto" items="${personalList}">
					<div>
						<div id="b">
							<strong>이름</strong> <a id="a" style="margin-left: 70px">${dto.members_name}</a>
						</div>
						<hr>
						<div id="b">
							<strong> 이메일 주소</strong> <a id="a">${dto.members_email}</a>
						</div>
						<hr>
						<div id="b">
							<strong> 비밀번호</strong>
							<div id="a" class="btn btn-sm btn-primary" style="margin-left: 40px;" data-toggle="modal"
								data-target="#personalModal">비밀번호 변경</div>
						</div>
						<input type="hidden" value="${dto.members_pw}">
					</div>
					<br>
					<br>
					<br>
				</c:forEach>
				<div align="center">
					<img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br>
				</div>
			</div>
		</div>
	</div>
</div>

<!--group_insert Modal -->
		<div class="modal fade" id="personalModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container">
							<div class="row justify-content-center">
								<div>
									<div align="center">
										<div>
											<img alt="tomail" src="img/logo_tomail.png" width="200px"
												onclick="location.href='main.do'"><br>
										</div>
										<div>
											<h3>
												<strong>비밀번호를 변경하세요.</strong>
											</h3>
											<br>
											<p>띄어쓰기 없는 영문 소문자, 숫자포함 6~20자 사용가능</p>
										</div>
									</div>
									<br>
									<div>
										<form action="personal2.do" method="post">
											<div class="form-group">
												<label class="control-label" >새 비밀번호 입력</label><br>
												<input class="form-control"  name="members_pw" type="password" required="required" onkeyup="checkPwd()" />
											</div>
											<div class="form-group">
												<label class="control-label">새 비밀번호 확인</label><br>
												<input class="form-control" name="members_pw2" type="password" required="required" onkeyup="checkPwd()" />
												<small id="pwsame" style="color:red;"></small>
											</div>
											
											<div style="padding-bottom: 0px;">
												<input name="member_email" type="hidden" value="${member_email }">
											</div>
											<hr>
											<div>
												<button class="btn btn-primary btn-block login-button" type="submit" title="확인" disabled="disabled" id="c">확인</button>
											</div>

										</form>
										<br>
										<div align="center">
											<br>
											<div>
												<img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br><br><br><br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</div>
</div>		
</body>
</html>