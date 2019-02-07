<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="eg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- 
	<sql:query var="data">
		select content,
		textValue
		from TBL_MAILBOX
		where bno = ?
		<sql:param value="${param['bno']}"/>
	</sql:query> --%>

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
			console.log(jb);
			alert('저장되었습니다');
			document.getElementById("All_code").value = jb;
			
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
		function textInner9(){
			var text = document.getElementById('text9').value;
			document.getElementById('text_content9').innerHTML = text;
		}
		function textInner10(){
			var text = document.getElementById('text10').value;
			document.getElementById('text_content10').innerHTML = text;
		}
		function textInner11(){
			var text = document.getElementById('text11').value;
			document.getElementById('text_content11').innerHTML = text;
		}
		function textInner12(){
			var text = document.getElementById('text12').value;
			document.getElementById('text_content12').innerHTML = text;
		}
		function textInner13(){
			var text = document.getElementById('text13').value;
			document.getElementById('text_content13').innerHTML = text;
		}
		

		function uploadFile(input,num) {   
	if(num==1){
		if (input.files && input.files[0]) {    

		var reader = new FileReader(); 
		$('#img_in').click(function img_change(){
			
		
		reader.onload = function (e) {     
		$('#img1').attr('src', e.target.result).width(100).height(100);    
		};    
		reader.readAsDataURL(input.files[0]);
		});
		}
	}else if(num==2){
		if (input.files && input.files[0]) {    

			var reader = new FileReader(); 
			$('#img_in2').click(function img_change(){
				
			
			reader.onload = function (e) {     
			$('#img2').attr('src', e.target.result).width(100).height(100);    
			};    
			reader.readAsDataURL(input.files[0]);
			});
		}
	}else if (num==3){
		if (input.files && input.files[0]) {    

			var reader = new FileReader(); 
			$('#img_in3').click(function img_change(){
				
			
			reader.onload = function (e) {     
			$('#img3').attr('src', e.target.result).width(100).height(100);    
			};    
			reader.readAsDataURL(input.files[0]);
			});
		}
	}else if(num==4){
		if (input.files && input.files[0]) {    

			var reader = new FileReader(); 
			$('#img_in4').click(function img_change(){
				
			
			reader.onload = function (e) {     
			$('#img4').attr('src', e.target.result).width(100).height(100);    
			};    
			reader.readAsDataURL(input.files[0]);
			});
		}
	}else if(num==5){
		if (input.files && input.files[0]) {    

			var reader = new FileReader(); 
			$('#img_in5').click(function img_change(){
				
			
			reader.onload = function (e) {     
			$('#img5').attr('src', e.target.result).width(100).height(100);    
			};    
			reader.readAsDataURL(input.files[0]);
			});
		}
	}
} 
</script>
<body>
	<%@ include file="EmailBuilder_head.jsp"%>
	<div class="container">
		<jsp:include page="${template}" />
	</div>
	<div class="container">
		${mail.content }
	</div>	
	<button onclick="all_content()">클릭</button>
	<form action="sendMail.do" method="post">
	
	
	<input type="text" name="title">
	<input id="All_code" type="hidden" name="content">
	<input type="hidden" name="template" value="${num}"/>
	<input type="hidden" name="email" value="highkick89@naver.com"/>
	<input type="hidden" name="pageNum" value="1"/>
	<input type="hidden" name="amount" value="10"/>
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
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="uploadFile(this,1);"/>
							</div>
							<div style="border: 1px; float: left;">
								<a id="img_in" href="#" data-dismiss="modal"><img alt="넣기" src="resources/img/suc.png" style="width: 30px;"></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="uploadFile(this,2);"/>
							</div>
							<div style="border: 1px; float: left;">
								<a id="img_in2" href="#" data-dismiss="modal"><img alt="넣기" src="resources/img/suc.png" style="width: 30px;"></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
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
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="uploadFile(this,3);"/>
							</div>
							<div style="border: 1px; float: left;">
								<a id="img_in3" href="#" data-dismiss="modal"><img alt="넣기" src="resources/img/suc.png" style="width: 30px;"></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
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
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="uploadFile(this,4);"/>
							</div>
							<div style="border: 1px; float: left;">
								<a id="img_in4" href="#" data-dismiss="modal"><img alt="넣기" src="resources/img/suc.png" style="width: 30px;"></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
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
							<div class="form-group" style="border: 1px; float: left;">
								<input type="file" name="image_file" id="image_file" size="60" class="inputText" onchange="uploadFile(this,5);"/>
							</div>
							<div style="border: 1px; float: left;">
								<a id="img_in5" href="#" data-dismiss="modal"><img alt="넣기" src="resources/img/suc.png" style="width: 30px;"></a>
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
	
	<div class="modal fade" id="myModalT9" tabindex="-1" role="dialog"
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
								<input id="text9" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner9()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT10" tabindex="-1" role="dialog"
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
								<input id="text10" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner10()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT11" tabindex="-1" role="dialog"
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
								<input id="text11" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner11()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT12" tabindex="-1" role="dialog"
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
								<input id="text12" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner12()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModalT13" tabindex="-1" role="dialog"
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
								<input id="text13" name="content" type="text" placeholder="글을 입력해주세요" class="form-control"/>
							</div>
							<div style="border: 1px; float: left;">
								<button class="btn btn-primary btn-block login-button"
								id="text_insert" onclick="textInner13()" title="글작성"
								 name="text_insert" data-dismiss="modal">글 작성</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>