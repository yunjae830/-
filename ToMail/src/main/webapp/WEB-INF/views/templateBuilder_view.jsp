<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		function all_content(){
			var all_value = new Array();
			var jb = document.getElementById( 'all_content' ).innerHTML;
			alert(jb);
			console.log(jb);
			document.getElementById("All_code").value = jb;
			
		}
		//이미지 미리보기
		function previewImage(targetObj, View_area) {
			var preview = document.getElementById(View_area); //div id
			var ua = window.navigator.userAgent;

		  //ie일때(IE8 이하에서만 작동)
			if (ua.indexOf("MSIE") > -1) {
				targetObj.select();
				try {
					var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
					var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


					if (ie_preview_error) {
						preview.removeChild(ie_preview_error); //error가 있으면 delete
					}

					var img = document.getElementById(View_area); //이미지가 뿌려질 곳

					//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
					img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
				} catch (e) {
					if (!document.getElementById("ie_preview_error_" + View_area)) {
						var info = document.createElement("<p>");
						info.id = "ie_preview_error_" + View_area;
						info.innerHTML = e.name;
						preview.insertBefore(info, null);
					}
				}
		  //ie가 아닐때(크롬, 사파리, FF)
			} else {
				var files = targetObj.files;
				for ( var i = 0; i < files.length; i++) {
					var file = files[i];
					var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
					if (!file.type.match(imageType))
						continue;
					var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
					if (prevImg) {
						preview.removeChild(prevImg);
					}
					var img = document.createElement("img"); 
					img.id = "prev_" + View_area;
					img.classList.add("obj");
					img.file = file;
					img.style.width = '100px'; 
					img.style.height = '100px';
					preview.appendChild(img);
					if (window.FileReader) { // FireFox, Chrome, Opera 확인.
						var reader = new FileReader();
						reader.onloadend = (function(aImg) {
							return function(e) {
								aImg.src = e.target.result;
							};
						})(img);
						reader.readAsDataURL(file);
					} else { // safari is not supported FileReader
						//alert('not supported FileReader');
						if (!document.getElementById("sfr_preview_error_"
								+ View_area)) {
							var info = document.createElement("p");
							info.id = "sfr_preview_error_" + View_area;
							info.innerHTML = "not supported FileReader";
							preview.insertBefore(info, null);
						}
					}
				}
			}
		}
		
		function textInner(){
			var text = document.getElementById('text').value;
			document.getElementById('text_content').innerHTML = text;
		}
		function textInner2(){
			var text = document.getElementById('text2').value;
			document.getElementById('text_content2').innerHTML = text;
		}
		function textInner3(){
			var text = document.getElementById('text3').value;
			document.getElementById('text_content3').innerHTML = text;
		}
		function textInner4(){
			var text = document.getElementById('text4').value;
			document.getElementById('text_content4').innerHTML = text;
		}
		function textInner5(){
			var text = document.getElementById('text5').value;
			document.getElementById('text_content5').innerHTML = text;
		}
		function textInner6(){
			var text = document.getElementById('text6').value;
			document.getElementById('text_content6').innerHTML = text;
		}
		function textInner7(){
			var text = document.getElementById('text7').value;
			document.getElementById('text_content7').innerHTML = text;
		}
		function textInner8(){
			var text = document.getElementById('text8').value;
			document.getElementById('text_content8').innerHTML = text;
		}
		
		function reviewUploadImg(fileObj)
		  {
		   var filePath = fileObj.value;
		   var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		   var fileKind = fileName.split(".")[1];
		   alert(filePath);
		  }
		
		
		
</script>
<body>
	<%@ include file="EmailBuilder_head.jsp"%>
	<div class="container">
		<jsp:include page="${template}" />
	</div>
	<button onclick="all_content()">클릭</button>
	<form action="sendMail.do" method="post">
	
	<input type="text" name="email_list">
	<input type="text" name="title">
	<input id="All_code" type="hidden" name="content">
	<input type="hidden" name="template" value="${num }"/>
	<input type="hidden" name="email" value="${email }"/>
	<button type="submit">보내기</button>
	</form>
	<div id="hed"></div>
	<div id="hedT"></div>
	<div id="body"></div>
	<div id="footer"></div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>이미지를 넣어주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="reviewUploadImg(this);" />
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="img_insert" title="이미지 넣기"
								 name="img_insert">이미지 넣기</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text2" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner2()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text3" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner3()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text4" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner4()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT5" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text5" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner5()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT6" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text6" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner6()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT7" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text7" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner7()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT8" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3><b>글을 입력해주세요</b></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
							<div class="form-group" style="border: 1px; float: left;">
								<input id="text8" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner8()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>