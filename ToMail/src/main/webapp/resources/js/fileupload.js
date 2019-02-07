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
				title2: table.find("textarea[name='title2']").val(),
				text1: table.find("textarea[name='text1']").val(),
				text2: table.find("textarea[name='text2']").val(),
				text3: table.find("textarea[name='text3']").val(),
				link1: table.find("input[name='link1']").val(),
				link2: table.find("input[name='link2']").val(),
				link3: table.find("input[name='link3']").val()
				
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
	
	
	var table = $("table");

	function showPreview(){
		var bno = "<c:out value='${mail.bno}'/>";
		var mno = "<c:out value='${mail.mno}'/>";
		var title1 = $("input[name='title1']").val();
		var title2 = $("input[name='title2'").val();
		var text1 = $("textarea[name='text1']").val();
		var text2 = $("textarea[name='text2']").val();
		var text3 = $("textarea[name='text3']").val();
		var link1 = $("input[name='link1']").val();
		var link2 = $("input[name='link2']").val();
		var link3 = $("input[name='link3']").val();
		
		$.getJSON("/board/mailbox/showPreview",{bno:bno, mno:mno},
		function(){
			console.log("showPreview");
			$(".title1").text(title1);
			$(".title2").text(title2);
			$(".text1").text(text1);
			$(".text2").text(text2);
			$(".text3").text(text3);
			$(".link1").attr('href', link1);
			$(".link2").attr('href', link2);
			$(".link3").attr('href', link3);
		});
		
	};
	
	
});