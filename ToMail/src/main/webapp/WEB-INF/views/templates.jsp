<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("#template1").on("click", function(e){
		e.preventDefault();
		operForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		operForm.append("<input type='hidden' name='template' value='1'/>");
		operForm.attr("action", "/board/mailbox/updateMail");
		operForm.submit();
	});
	
	$("#template2").on("click", function(e){
		e.preventDefault();
		operForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		operForm.append("<input type='hidden' name='template' value='2'/>");
		operForm.attr("action", "/board/mailbox/updateMail");
		operForm.submit();
	});
	
	$("#template3").on("click", function(e){
		e.preventDefault();
		operForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		operForm.append("<input type='hidden' name='template' value='3'/>");
		operForm.attr("action", "/board/mailbox/updateMail");
		operForm.submit();
	});
	
	$("#template4").on("click", function(e){
		e.preventDefault();
		operForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		operForm.append("<input type='hidden' name='template' value='4'/>");
		operForm.attr("action", "/board/mailbox/updateMail");
		operForm.submit();
	});
	
	$("#template5").on("click", function(e){
		e.preventDefault();
		operForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		operForm.append("<input type='hidden' name='template' value='5'/>");
		operForm.attr("action", "/board/mailbox/updateMail");
		operForm.submit();
	});
	
	$("button[data-oper='getList']").on("click", function(e){
		operForm.attr("action", "/board/mailbox/deleteMail");
		operForm.attr("action", "/board/mailbox/getList");
		operForm.find("#bno").remove();
		operForm.submit();
	});
	
});


</script>
<style type="text/css">
.card{
	width:200px;
	height: 500px;
}
</style>

</head>
<body>

 <%@ include file="header.jsp"  %> 

<div class="container mt-3">
<br/>

<br/>

  <h2>Wrap</h2>
  <p>Control how flex items wrap in a flex container with .flex-nowrap (default), .flex-wrap or .flex-wrap-reverse.</p>
  <p></p>
  <div class="d-flex flex-wrap bg-light">
    <c:forEach items="${template }" var="template" begin="0" end="0">
    <div class="p-2 border">
    <div class="card">
	    		<img class="card-img-top" src="/board/resources/img/template1.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">News letter theme</h4>
	      				<p class="card-text">Looks like newspaper<br/></p>
	      				<a id="template1" href="${template.bno }" class="btn btn-primary">Choose</a>
	      			</div>
	      	</div>
    </div>
    </c:forEach>
    
     <c:forEach items="${template }" var="template" begin="0" end="0">
    <div class="p-2 border">
    <div class="card">
	    		<img class="card-img-top" src="/board/resources/img/template1.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">Resume theme</h4>
	      				<p class="card-text">Looks like a resume<br/></p>
	      				<a id="template2" href="${template.bno }" class="btn btn-primary">Choose</a>
	      			</div>
	      	</div>
    </div>
    </c:forEach>
    
     <c:forEach items="${template }" var="template" begin="0" end="0">
    <div class="p-2 border">
    <div class="card">
	    		<img class="card-img-top" src="/board/resources/img/template1.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">Mysterious</h4>
	      				<p class="card-text">Looks weird<br/></p>
	      				<a id="template3" href="${template.bno }" class="btn btn-primary">Choose</a>
	      			</div>
	      	</div>
    </div>
    </c:forEach>
    
     <c:forEach items="${template }" var="template" begin="0" end="0">
    <div class="p-2 border">
    <div class="card">
	    		<img class="card-img-top" src="/board/resources/img/template1.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">Theme #4</h4>
	      				<p class="card-text">Looks like #4<br/></p>
	      				<a id="template4" href="${template.bno }" class="btn btn-primary">Choose</a>
	      			</div>
	      	</div>
    </div>
    </c:forEach>
    
     <c:forEach items="${template }" var="template" begin="0" end="0">
    <div class="p-2 border">
    <div class="card">
	    		<img class="card-img-top" src="/board/resources/img/template1.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">Theme #5</h4>
	      				<p class="card-text">Looks like #5<br/></p>
	      				<a id="template5" href="${template.bno }" class="btn btn-primary">Choose</a>
	      			</div>
	      	</div>
    </div>
    </c:forEach>
  </div>
</div>

	<div class="container">
	
  			<form id="operForm" action="/board/mailbox/getList" method="get">
  				<input type="hidden" name="bno" value="${mail.bno }">
  				<input type="hidden" name="pageNum" value="1"/>
  				<input type="hidden" name="amount" value="5"/>
  				<input type="hidden" name="mno" value="${mno}"/>
  			</form>
  			<br>
  			<br>
  		<button class="btn btn-primary" type="submit" data-oper="getList">To list</button>
	</div>
	
	


</body>
</html>