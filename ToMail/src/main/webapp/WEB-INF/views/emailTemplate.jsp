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

.card{
 border: 1px solid white;
}

.page {
  padding: 15px 0 0;
}

.bmd-modalButton {
  display: block;
  margin: 15px auto;
  padding: 5px 15px;
}

.close-button {
  overflow: hidden;
}

.bmd-modalContent {
  box-shadow: none;
  background-color: transparent;
  border: 0;
}
  
.bmd-modalContent .close {
  font-size: 30px;
  line-height: 30px;
  padding: 7px 4px 7px 13px;
  text-shadow: none;
  opacity: .7;
  color:#fff;
}

.bmd-modalContent .close span {
  display: block;
}

.bmd-modalContent .close:hover,
.bmd-modalContent .close:focus {
  opacity: 1;
  outline: none;
}

.bmd-modalContent iframe {
  display: block;
  margin: 0 auto;
}
</style>
</head>
<script language="javascript"> 
jQuery(document).ready(function(){
	  jQuery("#myModal").bmdIframe();
	});
	
(function($) {
    
    $.fn.bmdIframe = function( options ) {
        var self = this;
        var settings = $.extend({
            classBtn: '.bmd-modalButton',
            defaultW: 800,
            defaultH: 800
        }, options );
      
        $(settings.classBtn).on('click', function(e) {
          var allowFullscreen = $(this).attr('data-bmdVideoFullscreen') || false;
          
          var dataVideo = {
            'src': $(this).attr('data-bmdSrc'),
            'height': $(this).attr('data-bmdHeight') || settings.defaultH,
            'width': $(this).attr('data-bmdWidth') || settings.defaultW
          };
          
          if ( allowFullscreen ) dataVideo.allowfullscreen = "";
          
          // stampiamo i nostri dati nell'iframe
          $(self).find("iframe").attr(dataVideo);
        });
      
        // se si chiude la modale resettiamo i dati dell'iframe per impedire ad un video di continuare a riprodursi anche quando la modale è chiusa
        this.on('hidden.bs.modal', function(){
          $(this).find('iframe').html("").attr("src", "");
        });
      
        return this;
    };
  
})(jQuery);
</script>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div>
			<h3><strong>템플릿을 선택하세요</strong></h3>
		</div>
		<hr>
		<div>
			<h5 class="editor-templates-title odd" style="margin-bottom: 30px;"><strong>테마별 템플릿</strong></h5>
		</div>
		<div class="row justify-content-center">
			<div class="card col-sm" align="center">
				<div class="img">
					<a class="bmd-modalButton" data-toggle="modal" data-bmdSrc="tem.do?num=1" data-bmdWidth="600" data-bmdHeight="450" data-target="#myModal"><img src="resources/img/tem1.png" onmouseover="this.src='resources/img/write.png';" onmouseout="this.src='resources/img/tem1.png';" alt="템플릿사용하기" title="템플릿사용하기"  style="width: 180px; height: 180px; cursor:pointer" class="img-thumbnail"/></a>
		 		</div>
		 		<div><b>뉴스레터 1</b></div>
			</div>
			<div class="card col-sm" align="center">
				<div class="img">
					<a class="bmd-modalButton" data-toggle="modal" data-bmdSrc="tem.do?num=2" data-bmdWidth="600" data-bmdHeight="450" data-target="#myModal"><img src="resources/img/tem2.png" onmouseover="this.src='resources/img/write2.png';" onmouseout="this.src='resources/img/tem2.png';" alt="템플릿사용하기" title="템플릿사용하기"  style="width: 180px; height: 180px; cursor:pointer" class="img-thumbnail"/></a>
		 		</div>
		 		<div><b>뉴스레터 2</b></div>
			</div>
			<div class="card col-sm" align="center">
				<div class="img">
					<a class="bmd-modalButton" data-toggle="modal" data-bmdSrc="tem.do?num=3" data-bmdWidth="600" data-bmdHeight="450" data-target="#myModal"><img src="resources/img/tem3.png" onmouseover="this.src='resources/img/write3.png';" onmouseout="this.src='resources/img/tem3.png';" alt="템플릿사용하기" title="템플릿사용하기"  style="width: 180px; height: 180px; cursor:pointer" class="img-thumbnail"/></a>
		 		</div>
		 		<div><b>뉴스레터 3</b></div>
			</div>
			<div class="card col-sm" align="center">
				<div class="img">
					<a class="bmd-modalButton" data-toggle="modal" data-bmdSrc="tem.do?num=4" data-bmdWidth="600" data-bmdHeight="450" data-target="#myModal"><img src="resources/img/tem4.png" onmouseover="this.src='resources/img/write4.png';" onmouseout="this.src='resources/img/tem4.png';" alt="템플릿사용하기" title="템플릿사용하기"  style="width: 180px; height: 180px; cursor:pointer" class="img-thumbnail"/></a>
		 		</div>
		 		<div><b>뉴스레터 4</b></div>
			</div>
			<div class="card col-sm" align="center">
				<div class="img">
					<a class="bmd-modalButton" data-toggle="modal" data-bmdSrc="tem.do?num=5" data-bmdWidth="600" data-bmdHeight="450" data-target="#myModal"><img src="resources/img/tem5.png" onmouseover="this.src='resources/img/write5.png';" onmouseout="this.src='resources/img/tem5.png';" alt="템플릿사용하기" title="템플릿사용하기"  style="width: 180px; height: 180px; cursor:pointer" class="img-thumbnail"/></a>
		 		</div>
		 		<div><b>뉴스레터 5</b></div>
			</div>
		</div>
	</div>
	
	<footer>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content bmd-modalContent">

				<div class="modal-body">
          
          <div class="close-button">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="embed-responsive embed-responsive-16by9">
					            <iframe class="embed-responsive-item" frameborder="0"></iframe>
          </div>
				</div>
				<div>
				<form action="tem_sel.do">
				<input id="templateTitle" name="build_content" type="text" placeholder="탬플릿 제목을 적어주세요" class="form-control"/>
					<button class="btn btn-primary btn-block login-button" id="template_select" title="템플릿선택"
													 name="group_insert">템플릿 사용하기</button>
				</form>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
      </footer>
</body>
</html>