<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	
	$(".html").hide();
	
	function afterText(){
		var txt1 = "<input type='text'/>";
		var txt2 = $("<i></i>").text("love");
		var txt3 = document.createElement("strong");
		txt3.innerHTML = "jQuery";
		$(".showView").after(txt1, txt2, txt3);
	}
	
	$(".textField").on("click", function(){
		afterText();
	});

});// end $(document).ready(function(){})

</script>
</head>
<body>

<div class="buttonDiv">
	<button class="textField">TextField</button>
</div>

<div class="showView">
	
</div>

<div class="html">
	<form id="mailForm" action="">
		<textarea rows="10" cols="10">
	
		</textarea>
	</form>	
</div>



</body>
</html>