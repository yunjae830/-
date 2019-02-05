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
<meta charset="EUC-KR">
<title>Insert title here</title>
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

<style type="text/css">
h2 {
	margin-top: 60px;
}

#button {
	margin-top: 60px;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

html {
	overflow: scroll;
}

div {
	padding-bottom: 5px;
}

hr {
	border: solid 0.5px #DEE2E6;
}

.tomail {
	background-color: transparent;
	border: 2px solid black;
	border-color: black;
}

.bg {
	background-image: url("img/bg.png");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bb {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	font-size: 16px;
	padding: 12px 24px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

b {
	font-size: 15px;
	cursor: default;
}

@media ( max-width :769px) {
	.hidden-xs {
		display: none;
	}
	html {
		overflow: scroll;
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
<script type="text/javascript">
	function clause() {
		var group = document.forms["group_form"]["group_title"].value;
		var f = document.forms[0];
		if (group != "") {
			f.group_insert.disabled = false;
		} else {
			f.group_insert.disabled = true;
		}
	}
	function button_event(num) {
		if (confirm("그룹안의 데이터까지 모두 삭제하시겠습니까?") == true) { //확인
			location.href='delete_dd.do?group_seq='+num;
		} else { //취소
			return;
		}
	}
	function group_seq(num){
		document.getElementById("group").value = num;
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div>
			<div>
				<h2>이메일</h2>
			</div>
			<div id="button">
				<div align="left">
					<p>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">+ 그룹 새로 만들기</button>
					</p>
				</div>
			</div>
			<c:forEach var="dto" items="${list }">
				<div id="wrapper">
					<hr>
					<div id="title_div">
						<h3>
							<a href="myaddr_Form.do?group_seq=${dto.group_seq }">${dto.group_title }</a>
						</h3>
						<b>생성일 </b>
						<fmt:formatDate pattern="yyyy-MM-dd.a HH:mm"
							value="${dto.group_date }" />
					</div>
					<div id="list_size_div">
						<div>
							<div>구독자</div>
							<b>${dto.cnt}</b>
						</div>
					</div>
					<div id="update_bb">
						<button id="update_group" data-toggle="modal"
							data-target="#myModal_up" onclick="group_seq(${dto.group_seq })">수정</button>
					</div>
					<div id="delete_bb">
						<button id="delete_group"
							onclick="button_event(${dto.group_seq })">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<!--group_insert Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
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
											<img alt="tomail" src="/board/resources/img/logo_tomail.png" width="200px"
												onclick="location.href='main.do'"><br>
										</div>
										<div>
											<h3>
												<strong>그룹을 만들어보세요.</strong>
											</h3>
											<br>
											<p>
												뉴스레터, 프로모션 메일 등 구독자의 참여를 <br> 유도하기 위해 대량 발송하는 이메일을
												만듭니다.
											</p>
										</div>
									</div>
									<br>
									<div>
										<form action="group.do" name="group_form" method="post">
											<div class="form-group">
												<label class="control-label" for="group_title">그룹 이름</label><br>
												<input class="form-control" id="title" name="group_title"
													type="text" required="required" onkeyup="clause()" />
											</div>
											<div style="padding-bottom: 0px;">
												<input name="member_seq" type="hidden"
													value="${member_seq }">
											</div>
											<hr>
											<div>
												<button class="btn btn-primary btn-block login-button"
													id="group_update" type="submit" title="그룹등록"
													disabled="disabled" name="group_insert">그룹 등록</button>
												<!-- disabled : 칸은 보이지만 사용 못함 -->
											</div>

										</form>
										<br>
										<div align="center">
											<br>
											<div>
												<img alt="tomail" src="/board/resources/img/logo_tomail_font.png"
													width="150px"><br>
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
		
		<!-- update modal-->
		<div class="modal fade" id="myModal_up" tabindex="-1" role="dialog"
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
											<img alt="tomail" src="/board/resources/img/logo_tomail.png" width="200px"
												onclick="location.href='main.do'"><br>
										</div>
										<div>
											<h3>
												<strong>그룹 이름을 바꿔보세요.</strong>
											</h3>
											<br>
											<p>최고의 멋진 이름으로 소중한 정보들을 간직하세요.</p>
										</div>
									</div>
									<br>
									<div>
										<form action="group_update.do" name="group_form_up" method="post">
											<div class="form-group">
												<label class="control-label" for="group_title_up">그룹 이름</label><br>
												<input class="form-control" id="title" name="group_title"
													type="text" required="required" />
											</div>
											<div style="padding-bottom: 0px;">
												<input name="member_seq" type="hidden"
													value="${member_seq }">
													<input id="group" name="group_seq" type="hidden"/>
											</div>
											<hr>
											<div>
												<button class="btn btn-primary btn-block login-button"
													id="group_update" type="submit" title="그룹수정"
													 name="group_insert">그룹 수정</button>
												<!-- disabled : 칸은 보이지만 사용 못함 -->
											</div>

										</form>
										<br>
										<div align="center">
											<br>
											<div>
												<img alt="tomail" src="/board/resources/img/logo_tomail_font.png"
													width="150px"><br>
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
	<%@ include file="kakaoopenchat.jsp"  %> 
</body>
</html>