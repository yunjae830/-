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
	function button_event(num,num2) {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href = 'delete_ad.do?customer_seq=' + num + '&group_seq=' + num2;
		} else { //취소
			return;
		}
	}
	function group_seq(num){
		document.getElementById("group").value = num;
	}
$(document).ready(function(){
	var all_value = new Array();
	$("#All_check").click(function(){
        //클릭되었으면
        if($("#All_check").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=addr_check]").prop("checked",true);
            for(var i=0; i<$("input[name=addr_check]").length; i++) {//전체 체크박스의 개수 == 전체 구독자 수(만큼 돌리고 변수에 값을 담음)
            	all_value[i] = $("input[name=addr_check]:checked")[i].value;
        	}
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=addr_check]").prop("checked",false);
        }
    });
	$("input[name=addr_check]").click(function(){
		if($("input[name=addr_check]").length == $("input[name=addr_check]:checked").length){
				$("input[name=all]").prop("checked",true);
		}else{
			$("input[name=all]").prop("checked",false);
			for(var i=0; i<$("input[name=addr_check]").length; i++){
				all_value[i] = $("input[name=addr_check]:checked")[i].value;
			}
		}
	});
	$("#addr_ck").click(function(){
		if($("input[name=addr_check]:checked").length==0){
			alert('구독자를 선택하지 않으셨습니다.');
		}
		else if($("input[name=addr_check]:checked").length>0){
			location.href = 'addr_check.do?all_value=' + all_value + '&group_seq=' + ${group_seq};
		}
	});
	$("#delete_addr_ck").click(function(){
		if($("input[name=addr_check]:checked").length==0){
			alert('구독자를 선택하지 않으셨습니다.');
		}
		else if($("input[name=addr_check]:checked").length>0){
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				location.href = 'delete_addr.do?delete_addr=' + all_value + '&group_seq=' + ${group_seq};
			} else { //취소
				return;
			}
		}
	});
});
</script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div>
			<div>
				<h2>구독자정보</h2>
			</div>
			<div>
					<div align="right">
						<p>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">+ 구독자 새로 만들기</button>
							<button type="button" class="btn btn-primary" id="delete_addr_ck">선택한 구독자 삭제</button>
							<button type="submit" class="btn btn-primary" id="addr_ck">선택한 구독자로 메일 보내기</button>
						</p>
					</div>
				<div>
				<div align="left"><input type="checkbox" id="All_check" name="all"><b>전체 선택 </b></div>
				</div>
			</div>
			<c:forEach var="dto" items="${list }">
				<div id="wrapper">
					<hr>
					<div>
					<input type="checkbox" name="addr_check" value="${dto.customer_seq}"/>
					</div>
					<div id="title_div">
						<h3>
							<a>${dto.customer_name }</a>
						</h3>
						<b>이메일 </b> <a>${dto.customer_email }</a>
					</div>
					<div id="button">
						<button id="update_group" data-toggle="modal" data-target="#myModal_up" onclick="group_seq(${dto.customer_seq })">수정</button>
						<button id="delete_group" onclick="button_event(${dto.customer_seq},${group_seq})">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- insert_addr_modal-->
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
										<img alt="tomail" src="img/logo_tomail.png" width="200px"><br>
									</div>
									<div>
										<h3>
											<strong>다양한 구독자를 많이 만들어보세요</strong>
										</h3>
										<br>
										<p>
											직접 구독자를 추가할 수 있지만 <br>대량으로 넣길 원한다면 엑셀로 넣어보세요.
										</p>
									</div>
								</div>
								<div>
									<form:form action="myaddr_insert.do?members_seq=${members_seq}" name="address" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
										<div>
											<div class="form-group">
												<input class="form-control" type="file" name="files" multiple="multiple">
											</div>
											<label for="name">이름</label> 
											<input id="name" name="customer_name" type="text" placeholder="이름" value="${name_return }" />
											 <label for="email">이메일</label> 
											 <input id="email" name="customer_email" type="email" placeholder="이메일" value="${email_return }" />
											 <input id="group_seq" name="group_seq" type="hidden" value="${group_seq }" />
										</div>
										<p>
											<button onclick="submit" name="address_insert">수신자 등록</button>
											<input type="button" value="취소" onclick="location.href='myaddr_Form.do?group_seq=${group_seq }'">
										</p>
									</form:form>
									<br>
									<div align="center">
										<br>
										<div>
											<img alt="tomail" src="img/logo_tomail_font.png"
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
											<img alt="tomail" src="img/logo_tomail.png" width="200px"
												onclick="location.href='main.do'"><br>
										</div>
										<div>
											<h3>
												<strong>구독자 이름을 바꿔보세요.</strong>
											</h3>
											<br>
											<p>구독자 정보를 정확하고 알아보기 쉽게 저장해보세요.</p>
										</div>
									</div>
									<br>
									<div>
										<form action="addr_update.do" name="group_form_up" method="post">
											<div class="form-group">
												<label class="control-label" for="group_title_up">구독자 이름</label><br>
												<input class="form-control" id="title" name="customer_name"
													type="text" required="required" />
											</div>
											<div style="padding-bottom: 0px;">
												<input name="member_seq" type="hidden" value="${member_seq }">
													<input id="group_seq" name="group_seq" type="hidden" value="${group_seq }"/>
													<input id="group" name="customer_seq" type="hidden">
											</div>
											<hr>
											<div>
												<button class="btn btn-primary btn-block login-button"
													id="group_update" type="submit" title="구독자 이름 수정"
													 name="group_insert">구독자 이름 수정</button>
											</div>

										</form>
										<br>
										<div align="center">
											<br>
											<div>
												<img alt="tomail" src="img/logo_tomail_font.png"
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
		<%@ include file="kakaoopenchat.jsp"  %> 
</body>
</html>