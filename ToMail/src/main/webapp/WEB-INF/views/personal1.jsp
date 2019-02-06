<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>개인정보수정</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
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

<body>

	<%@ include file="header.jsp"%>	
	<div class="container-fluid bg">

		<div class="row justify-content-center">
			<div style="padding: 100px 250px 0 200px;">
				
				<form class="card" action="personal1.do" method="post">
				<h3 >비밀번호 재확인</h3><hr><br><br><br><br>
				<div>
					<div  id="b">
						<b>이메일주소</b> 
						<input type="hidden" name="members_email" value="${email}"><a id="a">${email}</a>
					</div>
					<div  id="b" class="form-inline">
						<b>비밀번호</b> 
						<input class="form-control" id="c" type="password" name="members_pw">
					</div>
					<div align="center"><small>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</small></div><br><hr><br>					
					<div align="center"><button class="btn btn-primary rounded-0" type="submit" style="width: 100px">확인</button></div><br><br><br>
				</div>
				<div align="center">
									<img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br>
								</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>