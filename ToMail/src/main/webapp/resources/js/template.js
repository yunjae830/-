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
			
		} 
		formObj.submit();
	});
	
	
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