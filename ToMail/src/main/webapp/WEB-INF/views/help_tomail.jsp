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
<style type="text/css">
.container-4 input#search{
  width: 300px;
  height: 50px;
  background: white;
  border: none;
  font-size: 10pt;
  float: left;
  color: black;
  padding-left: 15px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.container-4 input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.container-4 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
 
.container-4 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
 
.container-4 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-4 button.icon{
  -webkit-border-top-right-radius: 5px;
  -webkit-border-bottom-right-radius: 5px;
  -moz-border-radius-topright: 5px;
  -moz-border-radius-bottomright: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
 
  border: none;
  background: aqua;
  height: 50px;
  width: 50px;
  color: #4f5b66;
  opacity: 0;
  font-size: 10pt;
 
  -webkit-transition: all .55s ease;
  -moz-transition: all .55s ease;
  -ms-transition: all .55s ease;
  -o-transition: all .55s ease;
  transition: all .55s ease;
}
.container-4:hover button.icon, .container-4:active button.icon, .container-4:focus button.icon{
    outline: none;
    opacity: 1;
    margin-left: -50px;
  }
 
  .container-4:hover button.icon:hover{
    background: blue;
  }
</style>
<script type="text/javascript">
function button_event(num) {
	if (confirm("삭제하시겠습니까?") == true) { //확인
		location.href='delete_help.do?help_seq='+num;
	} else { //취소
		return;
	}
}
function group_seq(num){
	//alert(num);
	document.getElementById("group").value = num;
}
$(document).ready(function(){
	  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myDIV *").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
</script>
</head>
<body>
	<div id="hed_content"
		style="background-image: url('https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/a2q/image/bKVyZ5g7dAZAxDvBzfZZhHpHzyI.JPG');">
		<header id="header">
			<div id="content" class="container">
				<div>
					<div id="logo_body" style="float: left; border: 1px;">
						<img alt="도움말"
							src="https://kin-phinf.pstatic.net/20170217_195/1487265323583TOP2A_PNG/%B7%CE%B0%ED%BE%F3%B1%BCPNG.png"
							style="width: 40px; height: 40px; margin-top: 50px;">
					</div>
					<div id="logo_side"
						style="float: right; border: 1px; margin-top: 60px;">
						<a href="#" onclick="location.href='main2.do'">투메일로 이동</a>
					</div>
				</div>
				<div style="margin-top: 110px;">
					<h2>투메일에서 조언 및 답변</h2>
					<div class="box">
						<div class="container-4">
						<form action="">
							<input type="search" id="search" placeholder="답변 검색 중..." name=""/>
							<button class="icon" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<div class="container" id="myDIV">
		<c:set var="name" value="${name}" />
		<c:if test="${name eq '관리자'}">
			<br>
			<div>
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" title="도움말 추가" name="help_insert">도움말
					추가</button>
			</div>
		</c:if>
		<div>
			<section class="section">
				<c:forEach var="dto" items="${list }">
					<hr>
					<div>
						<img alt="로고" src="img/camel.png"
							style="width: 150px; height: 100px;">
					</div>
					<div id="wrapper">
						<div id="title_div">
							<h3>
								<a>${dto.help_title }</a>
							</h3>
						</div>
						<div id="title_detail">
							<h5>
								<a>${dto.help_title_detail}</a>
							</h5>
						</div>
						<div id="list_size_div">
							<div>
								<div>
									<a>작성자: ${dto.members_name}</a>
								</div>
							</div>
						</div>
					</div>
					<c:set var="name" value="${name}" />
					<c:if test="${name eq '관리자'}">
						<div id="button">
							<button id="update_group" data-toggle="modal"
								data-target="#myModal_up" onclick="group_seq(${dto.help_seq })">수정</button>
							<button id="delete_group"
								onclick="button_event(${dto.help_seq })">삭제</button>
						</div>
					</c:if>
				</c:forEach>
			</section>
		</div>
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
					<div align="center">
						<h3>
							<strong>고객에게 도움을!</strong>
						</h3>
						<p>최대한 쉽고 간결하게 전해요.</p>
					</div>
					<div class="modal-body">
						<br>
						<c:set var="name" value="${name}" />
						<c:if test="${name eq '관리자'}">
							<form action="help_insert.do?email=${email}" name="group_form_up"
								method="post">
								<div class="form-group">
									<label class="control-label"><b>도움말 제목</b></label><br> <input
										class="form-control" id="title" name="help_title" type="text"
										required="required" />
								</div>
								<div class="form-group">
									<label class="control-label"><b>도움말 상세내용</b></label><br> <input
										class="form-control" id="title_detail"
										name="help_title_detail" type="text" required="required" />
								</div>
								<div style="padding-bottom: 0px;"></div>
								<hr>
								<div>
									<button class="btn btn-primary btn-block login-button"
										id="help_insert" type="submit" title="등록" name="group_insert">등록</button>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- update도움말 -->
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
					<div align="center">
						<h3>
							<strong>더 좋은 글을 써보세요!</strong>
						</h3>
						<p>최대한 쉽고 간결하게 전해요.</p>
					</div>
					<div class="modal-body">
						<br>
						<c:set var="name" value="${name}" />
						<c:if test="${name eq '관리자'}">
							<form action="help_update.do?email=${email}" name="group_form_up"
								method="post">
								<div class="form-group">
									<label class="control-label"><b>도움말 제목</b></label><br> <input
										class="form-control" id="title" name="help_title" type="text"
										required="required" />
								</div>
								<div class="form-group">
									<label class="control-label"><b>도움말 상세내용</b></label><br> <input
										class="form-control" id="title_detail"
										name="help_title_detail" type="text" required="required" />
								</div>
								<input id="group" name="help_seq" type="hidden" />
								<div style="padding-bottom: 0px;"></div>
								<hr>
								<div>
									<button class="btn btn-primary btn-block login-button"
										id="help_update" type="submit" title="수정" name="group_update">수정</button>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="kakaoopenchat.jsp"%>
</body>
</html>