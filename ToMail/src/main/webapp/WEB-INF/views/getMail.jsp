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
	
	var operForm = $("#operForm");
	
	$("button[data-oper='updateMail']").on("click", function(e){
		operForm.attr("action", "/board/mailbox/updateMail").submit();
	});
	
	$("button[data-oper='getList']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/mailbox/getList");
		operForm.submit();
	});
	
	
	(function(){
		var bno = "<c:out value='${mail.bno}'/>";
		
		$.getJSON("/board/mailbox/getAttachList", {bno: bno}, function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				// image type
				if(attach.fileType){
					
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<img src='/board/upload/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
					
				} else {
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<span>" +attach.fileName+ "</span><br/>";
					str += "<img src='/board/resources/attach.jpg'>";
					str += "</div>";
					str += "</li>";
					
				}
				
			}); // end each
			
			$(".uploadResult ul").html(str);
			
		}); // end getJSON
	})(); // end function
	
	$(".uploadResult").on("click", "li", function(e){
		
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		} else {
			//download
			self.location = "/board/upload/download?fileName="+path;
		}
	});
	
}); // end $(document).ready(function({}))
function showImage(fileCallPath){
	
	alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display", "flex").show();
	
	$(".bigPicture").html("<img src='/board/upload/display?fileName="+fileCallPath+"'>").animate({width:'100%', height:'100%'}, 1000);
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		}, 1000);
	});
}
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
  	<div class="panel panel-default">
  		<div class="panel-heading">Board Read Page</div>
  				<!-- start panel body -->
  			<div class="panel-body">
  				
  				<div class="form-group">
  					<label>Board Number</label>
  					<input class="form-control" name="bno" value='<c:out value="${mail.bno}"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">			
  					<label>Recipient</label>
  					<input class="form-control" name="name" value='<c:out value="${mail.recipient }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Title</label>
  					<input class="form-control" name="title" value='<c:out value="${mail.title}"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Text Area</label>
  					<textarea class="form-control" name="content" readonly="readonly"><c:out value="${mail.content}"/></textarea>
				</div>	
  
  				<div class="form-group">
  					<label>Date</label>
  					<input class="form-control" name="regdate" value='<fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly"/>
  	
  				</div>
  				
  			</div>
  			
  			  		<button class="btn btn-default" data-oper="updateMail">Update</button>
  					<button class="btn btn-primary" data-oper="getList">To List</button>
  			
  				<form id='operForm' method="get">
  					<input type="hidden" id="bno" name="bno" value='<c:out value="${mail.bno }"/>'/>
  					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>"/>
  					<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>"/>
					<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>"/>
					<input type="hidden" name="type" value="<c:out value="${cri.type }"/>"/>
  				</form>
  				<!-- end panel-body -->
  	</div>
  <!-- end panel -->
  </div>
  <!-- end container -->
</div>
<!-- end jumbo -->


<div class="container">
	<div class="panel panel-default">
		<!-- panel-heading -->
		<div class="panel-heading">Files</div>
		<!-- panel-body -->
		<div class="panel-body">
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