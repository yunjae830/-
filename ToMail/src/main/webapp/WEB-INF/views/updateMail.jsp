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

$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'deleteMail') {
			formObj.attr("action", "/board/mailbox/deleteMail");
		} else if(operation === 'getList') {
			formObj.attr("action", "/board/mailbox/getList").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
			
		} else if(operation === 'updateBoard'){
			console.log("submit clicked.");
			
			var str ="";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
			});
			formObj.append(str).submit();
		}
		formObj.submit();
	});
});	
	
</script>


<script type="text/javascript">
$(document).ready(function(){
	(function(){
		
		var bno = "<c:out value='${mail.bno}'/>";
		
		$.getJSON("/board/mailbox/getAttachList", {bno: bno}, function(arr){
			
			console.log(arr);
			
			var str ="";
			
			$(arr).each(function(i, attach){
				
				//image type
				if(attach.fileType){
					
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<span>"+attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
					str += " class='btn btn-sm'> x </button><br/>";
					str += "<img src='/board/upload/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
					
				} else {
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<span>"+attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
					str += " class='btn btn-sm'> x </button><br/>";
					str += "<img src='/board/resources/attach.jpg'/>";
					str += "</div>";
					str += "</li>";
				}
				
			}); // end each
			$(".uploadResult ul").html(str);
		}); // end getJSON
	})(); // end function()
	
	
	
	
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		if(confirm("Are you sure you want to delete this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
		
	}); // end uploadResutl onclick
	
	
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("too big");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("invalid file name");
			return false
		}
		return true;
	} // end checkExtension();
	
	
	
	
	
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
			url:'/board/upload/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				alert("uploaded!");
				console.log(result);
				showUploadResult(result);
			}
		}); // end ajax
	}); // end input[name='file']
	
	
	
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0) {
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
	
}); 
//end $(document).ready(function(){})
</script>

<style type="text/css">
.uploadResult{
	width:100%;
	background-color: gray;
}
.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: ceter;
}
.uploadResult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}
.uploadResult ul li img{
	width: 100px;
}
.uploadResult ul li span{
	color: white;
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
<body>

<div class="jumbotron jumbotron-fluid" style="margin-top:100px;">
  <div class="container">
  
  <form role="form" action="/board/mailbox/updateMail" method="post">
  
  <div class="form-group">
  	<label>Board Number</label>
  	<input class="form-control" name="bno" value='<c:out value="${mail.bno }"/>' readonly="readonly"/>
  </div>
  
  <div class="form-group">
  	<label>Writer</label>
  	<input class="form-control" name="recipient" value='<c:out value="${mail.recipient }"/>'/>
  </div>
  
  <div class="form-group">
  	<label>Title</label>
  	<input class="form-control" name="title" value='<c:out value="${mail.title }"/>'/>
  </div>
  
  <div class="form-group">
  	<label>Text Area</label>
  	<textarea class="form-control" name="content"><c:out value="${mail.content }"/></textarea>
  </div>
  
  <div class="form-group">
  	<label>Date</label>
  	<label><fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/></label>
  	
  </div>
  
  <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>"/>
  <input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>"/>
  <input type="hidden" name="type" value="<c:out value="${cri.type }"/>"/>
  <input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>"/>
  
  <button type="submit" data-oper="updateMail" class="btn btn-default">Update</button>
  <button type="submit" data-oper="deleteMail" class="btn btn-danger">Delete</button>
  <button type="submit" data-oper="getList" class="btn btn-primary">To List</button>
  	
  </form>
  
  </div>
</div>

<div class="container">
	<div class="panel panel-default">
		<!-- panel-heading -->
		<div class="panel-heading">Files</div>
		<!-- panel-body -->
		<div class="panel-body">
			<div class="form-group uploadDiv">
				<input type="file" name="uploadFile" multiple="multiple"/>
			</div>
		
			<div class="uploadResult">
				<ul>
				</ul>
			</div>
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel-heading -->
</div>

<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>

</body>
</html>