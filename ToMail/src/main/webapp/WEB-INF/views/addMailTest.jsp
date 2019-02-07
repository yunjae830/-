<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title }</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript">
/* $(document).ready(function(e){
	
	var form = $("#mailForm");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		form.attr("action", "test.do");
		form.submit();
	}); */
	
/* 
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		}); // end .uploadResult ul li 
		formObj.append(str).submit();
	}); // end $("button[type='submit']").on("click")...
	
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("too big");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("invalid file name");
			return false;
		}
		return true;
	} // end checkExtension();
	
	
//	var cloneObj = $(".form-group uploadDiv").clone();
	
	
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
			
		}
		
		$.ajax({
			url: '/board/upload/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				alert("uploaded!");
				console.log(result);
				showUploadResult(result); //업로드 결과 처리 함수
//				$(".form-group uploadDiv").html(cloneObj.html());
			}
		}); // end ajax
	}); // end input[name='file']
	
	
	
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
			//img type
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + 
					obj.uuid + "_" + obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"'";
				str += " data-filename='"+obj.fileName+"'";
				str += " data-type='"+obj.image+"'><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
				str += " class='btn btn-sm'> x </button><br/>";
				str += "<img src='/board/upload/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</li>";
				
			} else {
				var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid+"_"+ obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'";
				str += " data-type='"+obj.image+"'><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
				str += " class='btn btn-sm'> x </button><br/>";
				str += "<img src='/board/resources/attach.jpg'></a>";
				str += "</div>";
				str += "</li>";
				
			}
			
		}); // end $(uploadResultArr)
		
		uploadUL.append(str);
		
	} // end showUploadResult()
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file.")
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		console.log(targetFile);
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/board/upload/deleteFile',
			data: {fileName: targetFile, type: type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		}); // end ajax
	}); // end .uploadResult onclick
	*/
//}); // end $(document).ready(function(){})) 
</script>

<style type="text/css">
	
	.uploadResult{
		width: 100%;
		background-color: gray;
	}
	
	.uploadResult ul{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
	}
	
	.uploadResult ul li img{
		width: 20px;
	}
	
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0.5);
		
	}
	
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img{
		width: 600px;
	}
	
</style>


</head>

<body style="box-sizing: border-box;">

<h1>${title }</h1>

	<h2>CSS Layout Flexbox</h2>
		<p style="font-size: 20px; font-family: verdana;">In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>
		<p>Resize the browser window to see the responsive effect.</p>
		<p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 eand earlier versions.</p>

  <div style="margin-top: 30px;">
  
  	<form id="mailForm" action="/board/tests.do" method="post">
  
  			<label>Recipient</label>
  				<c:forEach items="${email }" var="list" varStatus="status">
					<input type="text" name="email" value="${email[status.index]}" readonly="readonly"/><br/>
				</c:forEach>
  
	
  			<header style="  background-color: #666; padding: 20px; text-align: center; font-size: 30px; color: white;">
  				<label>Title</label>
  				<h2><input type="text" name="title" value="${testDto.title }"/></h2>
  			</header>
  
			<section style="display: -webkit-flex; display: flex;">
  				<nav style="-webkit-flex: 1; -ms-flex: 1; flex: 1; background: #ccc; padding: 20px;">
    				<ul style="list-style-type: none; padding: 0;">
				      <li></li>
				      <li></li>
				      <li></li>
    				</ul>
  				</nav>
  
  				<article style="-webkit-flex: 3; -ms-flex: 3; flex: 3; background-color: #f1f1f1; padding: 10px;">
	    			<h1><label>Text Area</label></h1>
	    			<p><textarea name="content" rows="40" cols="100">${testDto.content }</textarea></p>
  				</article>
			</section>

			<footer style="  background-color: #777; padding: 30px; text-align: center; color: white;">
  				<b style="font-family:sans-serif; font-size: 20px;">Footer</b>
			</footer>
  
		<button type="submit">Post</button>
		<button type="reset" >Reset</button>
  	</form>
  </div>
  
  
  <div>
  	<div>File Attachment</div>
  		<div>
  			<div class="uploadDiv">
  			
  				<input type="file" name="uploadFile" multiple/>
  				<div class="uploadResult">
  					<ul>
  					
  					</ul>
  				</div> 
  			</div>
  		</div>
  </div>