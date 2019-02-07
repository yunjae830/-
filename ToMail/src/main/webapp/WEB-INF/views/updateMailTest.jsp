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
			
			if(confirm("Are you sure you want to delete this email?")){
			formObj.attr("action", "/board/mailbox/deleteMail");
			} else {
				return;
			}
			
		} else if(operation === 'getList') {
			formObj.attr("action", "/board/mailbox/getList").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var mnoTag = $("input[name='mno']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(mnoTag)
			
		} else if(operation === 'updateMail') {
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
	
	$("#previewBtn").on("click", function(preview, callback, error){
		
		console.log("preview btn clicked")
		
		var formObj = $("form");
		var bno = "<c:out value='${mail.bno}'/>";
		var mno = "<c:out value='${mail.mno}'/>";
		var table = $("table");
		
		var preview = {
				title1: table.find("input[name='title1']").val(),
				text1: table.find("textarea[name='text1']").val(),
				text2: table.find("input[name='text2']").val(),
				link1: table.find("input[name='link1']").val()
		}
		
		
		$.ajax({
			type: 'put',
			url:"/board/mailbox/preview?bno="+bno+"&mno="+mno,
			data: JSON.stringify(preview),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				alert("updated!");
				console.log(result);
				showPreview();
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
		
	});
	
	
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
				str += "<input type='hidden' name='img1' value='<img src=\'/board/upload/display?fileName="+fileCallPath+"'/>";
				
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

var table = $("table");

function showPreview(){
	var bno = "<c:out value='${mail.bno}'/>";
	var mno = "<c:out value='${mail.mno}'/>";
	var title1 = $("input[name='title1']").val();
	var text1 = $("textarea[name='text1']").val();
	var text2 = $("input[name='text2']").val();
	var link1 = $("input[name='link1']").val();
	
	$.getJSON("/board/mailbox/showPreview",{bno:bno, mno:mno},
	function(){
		console.log("showPreview");
		$(".title1").text(title1);
		console.log(title1);
		$(".text1").text(text1);
		$(".text2").text(text2);
		$(".link1").attr('href', link1);
	});
	
};

</script>

</head>
<body style="box-sizing: border-box;">

  <div class="container-fluid">
  	<div class="row"> 
  		  
  		<h2>CSS Layout Flexbox</h2>
		<p style="font-size: 20px; font-family: verdana;">In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>
		<p>Resize the browser window to see the responsive effect.</p>
		<p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 eand earlier versions.</p>
  	
  	
  		<div class="col-sm-6" style="margin-top: 30px; align:center">
  		<form role="form" action="/board/mailbox/updateMail" method="post">


  		<table style="font-family:'Times New Roman', Times, serif; background-color: #F5F5F5; width:600px">
  			<tr>
  				<td style="background-color: #F5F5F5;">
				</td>
  			</tr>
  			
  			<tr>
  				<td style="background-color: #F5F5F5;">
		  			<header style="text-align: center; font-size: 50px;">
		  				<p><input type="text" name="title1" value="${mail.title1 }"/></p>
		  			</header>
  				</td>
  			</tr>
  			
  			<tr>
				<td style="background-color: #F5F5F5; height: 500px">
					<div><textarea style="width: 600px; height: 500px; font-size:30px;" name="text1">${mail.text1 }</textarea></div>
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
					<footer style="background-color: #F5F5F5; text-align: center; color: white;">
		  				<div style="font-family:sans-serif; font-size: 20px; text-align: center;">
		  				<input type="text" name="text2" value="${mail.text2 }"/>
		  				<input type="text" name="link1" value="${mail.link1 }"/>
		  				</div>
					</footer>
				</td>
			</tr>
  		</table>
  
  
  	<label>Date</label>
  	<label><fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/></label>
  	
  
  <input type="hidden" name="bno" value="<c:out value="${mail.bno }"/>"/>
  <input type="hidden" name="pageNum" value="<c:out value="1"/>"/>
  <input type="hidden" name="amount" value="<c:out value="10"/>"/>
  <input type="hidden" name="mno" value="<c:out value="${mno }"/>"/>
  <input type="hidden" name="template" value="1"/>
  
  <input type="button" id="previewBtn" class="btn btn-default" value="Preview"/>
  <button type="submit" data-oper="updateMail" class="btn btn-default">Update</button>
  <button type="submit" data-oper="deleteMail" class="btn btn-danger">Delete</button>
  <button type="submit" data-oper="getList" class="btn btn-primary">To List</button>
  <input type="file" name="uploadFile" multiple="multiple"/>
  </form>
  
  		</div>
  		
	  	<div class="col-sm-6" style="margin-top: 30px; align:center;">
		
			
	  		<table style="font-family:'Times New Roman', Times, serif; background-color: #F5F5F5; width: 600px;">
	  			<tr>
	  				<td style="background-color: #F5F5F5;">
	  			</tr>
	  			
	  			<tr>
	  				<td style="background-color: #F5F5F5;">
			  			<header style="text-align: center; font-size: 50px;">
			  				<p class="title1">${mail.title1 }</p>
			  			</header>
	  				</td>
	  			</tr>
	  			
	  			<tr>
					<td style="background-color: #F5F5F5; height: 500px; align:center; padding: 50px;">
						<div class="text1" style="column-count:2; width: 600px; word-wrap: break-word; font-size: 30px;">
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
			  				<b class="text2" style="font-family:sans-serif; font-size: 20px;">${mail.text2 }</b>
			  				<b style="font-size: 19px;"><a class="link1" href="${mail.link1 }">Go to our page!</a></b>
						</footer>
					</td>
				</tr>
	  		</table>
  		</div>
  	</div>
  </div>

</body>
</html>