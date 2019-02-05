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

</head>

<body>

	  <div style="margin-top: 30px;" align="center">
	  
		<h2>CSS Layout Flexbox</h2>
		<p style="font-size: 20px; font-family: verdana;">In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>
		<p>Resize the browser window to see the responsive effect.</p>
		<p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 eand earlier versions.</p>
		
  		<table style="font-family:'Times New Roman', Times, serif; background-color: #F5F5F5;">
  			<tr>
  				<td style="background-color: #F5F5F5;">
  			</tr>
  			
  			<tr>
  				<td style="background-color: #F5F5F5;">
		  			<header style="text-align: center; font-size: 30px;">
		  				<p>${mail.title1 }</p>
		  			</header>
  				</td>
  			</tr>
  			
  			<tr>
				<td style="background-color: #F5F5F5; height: 500px">
					<div style="column-count:2; width: 500px; word-wrap: break-word; font-size: 20px">
					${mail.text1 }
					</div>
				</td>
	  				
			</tr>
			<tr>
				<td style="height: 200px; background-color: #F5F5F5;" class="uploadResult">
					<ul>
					</ul>
				</td>
			</tr>
			
			<tr>
				<td style="height: 200px;">
					<footer style="background-color: #F5F5F5; text-align: center;">
		  				<b style="font-family:sans-serif; font-size: 20px;">${mail.text2 }</b>
		  				<b style="font-size: 19px;"><a href="${mail.link1 }">Go to our page!</a></b>
					</footer>
				</td>
			</tr>
  		</table>
  		<button class="btn btn-default" data-oper="updateMail">Update</button>
  		<button class="btn btn-primary" data-oper="getList">To List</button>
  			
  			
  				<form id='operForm' method="get">
  					<input type="hidden" id="bno" name="bno" value='<c:out value="${mail.bno }"/>'/>
  					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>"/>
  					<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>"/>
  					<input type="hidden" name="mno" value="<c:out value="${mno }"/>"/>
  				</form>

	  </div>

<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>

</body>
</html>