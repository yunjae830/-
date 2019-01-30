<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz])$");
			var maxSize = 5242880; //5MB
			
			function checkExtension(fileName, fileSize){
				
					if(fileSize >= maxSize){
						alert("too big");
						return false;
					}	
			
					if(regex.test(fileName)){
						alert("your file is banned.");
					return false;
				}
				return true;
			}
		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//add filedate to formdate
			for(var i = 0; i < files.length; i++){
				
				if(!checkExtension(file[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction.do',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				success: function(result){
					alert("Uploaded")
				}
			
			}); // ajax
			
		});
	});

</script>


<title>Upload with Ajax</title>
</head>
<body>

	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>

	<button id="uploadBtn">Upload</button>

</body>
</html>