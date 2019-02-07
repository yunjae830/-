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

/* $(document).ready(function(){
	
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
} */
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

<body style="box-sizing: border-box;">

	<h2>CSS Layout Flexbox</h2>
	<p style="font-size: 20px; font-family: verdana;">In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>
	<p>Resize the browser window to see the responsive effect.</p>
	<p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 eand earlier versions.</p>

  <div>
	
  <header style="background-color: #666; padding: 20px; text-align: center; font-size: 30px; color: white;">
  		<h2><!-- title!! --></h2>
  </header>
  
<section style="display: -webkit-flex; display: flex;">
  <nav style="-webkit-flex: 1; -ms-flex: 1; flex: 1; background: #ccc; padding: 20px;">
    <ul style="list-style-type: none; padding: 0;">
      <li><a href="#">London</a></li>
      <li><a href="#">Paris</a></li>
      <li><a href="#">Tokyo</a></li>
    </ul>
  </nav>
  
  <article style="-webkit-flex: 3; -ms-flex: 3; flex: 3; background-color: #f1f1f1; padding: 10px;">
    <h1><!-- content title --></h1>
    	<p><!-- content --></p>
  		</article>
</section>

<footer style="background-color: #777; padding: 30px; text-align: center; color: white;">
  <b style="font-family:sans-serif; font-size: 20px;">Footer</b>
</footer>
  
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